# polkacli
Bash CLI tool for easy installation of polkadot node for Kusama, Polkadot and Westend networks using systemd.

## Requirements
Script uses micro as terminal based text-editor and jq for downloading latest version of polkadot.

```
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin
sudo apt-get install jq # ubuntu/debian - other OS check https://stedolan.github.io/jq/download/
```
## Install
To install current script into .bash_aliases of polkadot/kusama/westend user:
```
wget https://raw.githubusercontent.com/kusamaxi/polkacli/main/.bash_aliases -O ~/.bash_aliases && source .bashrc
```

## Usage

Script contains shorter commands for controlling systemd service for polkadot as well as methods to download and update latest client, show sessionkey of the node for validating and update the script to latest version in github.
```
edit = "sudo micro /etc/systemd/system/ksm-validator.service"
stop = "sudo systemctl stop ksm-validator.service"
start = "sudo systemctl start ksm-validator.service"
enable = "sudo systemctl enable ksm-validator.service"
disable = "sudo systemctl disable ksm-validator.service"
status = "sudo systemctl status ksm-validator.service"
reload = "sudo systemctl daemon-reload"
restart = "sudo systemctl restart ksm-validator.service"
logs = "sudo tail -f /var/log/syslog"
version = "polkadot --version"
download = "curl -s https://api.github.com/repos/paritytech/polkadot/releases/latest | jq -r '.assets[] | select(.name | endswith(\"polkadot\")) | .browser_download_url' | xargs sudo curl -L -o polkadot_latest && sudo chmod +x polkadot_latest && ./polkadot_latest --version"
update = "stop && sudo cp polkadot_latest /usr/local/bin/polkadot && start"
scriptupdate = 'wget https://raw.githubusercontent.com/kusamaxi/polkacli/main/.bash_aliases -O ~/.bash_aliases && source .bashrc'
```

## Coming up next
- Create installer script including options to install for parachains
- Add secure firewall setup
- Add secure SSH ruling
- Create proper CLI tool instead of bashing with aliases
- https://github.com/google/zx -> upgrade into js scripting
