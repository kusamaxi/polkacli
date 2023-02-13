#!/bin/bash

# Ask for the environment variables
#
# Set the default network to kusama

# Ask for the network
PS3="Enter the network: "
options=("kusama" "westend" "polkadot")
select network in "${options[@]}"; do
  case $network in
    kusama|westend|polkadot)
      export NETWORK=$network
      export HOME_PATH=/home/$NETWORK
      break
      ;;
    *)
      echo "Invalid option, please choose again."
      ;;
  esac
done

# Ask for the database to be used
options=("rocksdb" "paritydb")
prompt="Enter the database (default: rocksdb): "
default_database="rocksdb"
PS3="$prompt"
select database in "${options[@]}"; do
    case "$REPLY" in
        1|2) database=$database; break;;
        *) database=$default_database; break;;
    esac
done
export DATABASE=$database

# Ask for the node name
read -p "Enter the node name (defaults to im.kusamaxi.com): " NODE_NAME
export NODE_NAME=${NODE_NAME:-im.kusamaxi.com}

# if user with networks name doesnt exist, create it
if ! id -u "$NETWORK" >/dev/null 2>&1; then
  sudo useradd -m "$NETWORK"
  sudo passwd "$NETWORK"
fi

# Add sudo rights to the new user and install dependencies
echo "Installing dependencies..."
if [ -f /etc/debian_version ]; then
  echo "for debianlike distros..."
  sudo usermod -aG sudo "$NETWORK"
  sudo apt-get install -y curl git lz4 jq tar wget
elif [ -f /etc/redhat-release ]; then
  echo "for redhatlike distros..."
  sudo usermod -aG wheel "$NETWORK"
  sudo yum install -y curl git lz4 jq tar wget
elif [ -f /etc/arch-release ]; then
  echo "for archlike distros..."
  sudo usermod -aG wheel "$NETWORK"
  sudo pacman -S --noconfirm curl git lz4 jq tar wget
else
  echo "Unsupported distro. Exiting..."
  exit 1
fi
curl https://getmic.ro | GETMICRO_REGISTER=y sudo sh &&
sudo cp micro /usr/local/bin && sudo mv micro /usr/sbin

# Login to the new user and change to the home directory
echo "Switching to $NETWORK user..."
sudo su $NETWORK && cd $HOME_PATH || exit

# Clone the polkacli repository and source the polkacli script
git clone https://github.com/kusamaxi/polkacli $HOME_PATH &&
mv $HOME_PATH/polkacli/polkacli $HOME_PATH/.polkacli && rm -rf $HOME_PATH/polkacli &&
echo "source $HOME_PATH/.polkacli" >> $HOME_PATH/.profile &&
source $HOME_PATH/.profile

# Create the validator service file
if [ ! -f "/etc/systemd/system/$NETWORK.service" ]; then
sudo bash -c "cat > /etc/systemd/system/$NETWORK.service << EOF
[Unit]
Description=$NETWORK Validator - $NODE_NAME

[Service]
User=$NETWORK
Group=$NETWORK
WorkingDirectory=/usr/local/bin/
ExecStart=/usr/local/bin/polkadot
--database=$DATABASE
--pruning 1000 --chain $NETWORK --validator
--telemetry-url 'wss://telemetry-backend.w3f.community/submit 1'
--port 30333 --ws-port 9944 --rpc-port 9933 --name $NODE_NAME
Restart=always
RestartSec=120

[Install]
WantedBy=multi-user.target
EOF"
else
echo "$NETWORK.service already exists. Use micro to edit /etc/systemd/system/$NETWORK.service"
fi

# Start the validator service on startup
systemctl enable "$NETWORK" && echo "$NETWORK service enabled on startup."
systemctl start "$NETWORK" && echo "$NETWORK service started."
