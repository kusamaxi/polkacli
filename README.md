# polkacli
Simple bash aliases for easy installation of polkadot node for Kusama network

## Requirements
1. Add new user, set password, add sudo rights and login to that user
```
adduser kusama
passwd kusama
usermod -aG sudo kusama # Ubuntu/Debian
usermod -aG wheel kusama # Centos/Rocky
su kusama && cd ~
```
2. Once logged in to user running node, install lz4, curl, git, jq, micro, tar and wget
```
sudo apt-get install curl git lz4 jq tar wget  #ubuntu/debian
sudo yum install curl git lz4 jq tar wget      #centos/rocky
curl https://getmic.ro | GETMICRO_REGISTER=y sudo sh
sudo mv micro /usr/local/bin && cp /usr/local/bin/micro /usr/local/sbin/
```

## Install polkacli
```
git clone https://github.com/kusamaxi/polkacli ~/polkacli && 
mv ~/polkacli/.polkacli ~/ && rm -rf ~/polkacli &&
echo "# source polkacli
. ~/.polkacli" >> ~/.bashrc &&
. ~/.bashrc
```

## Commands
### Validator service
- **edit** = Edit the validator service with micro terminal  
- **stop** = Stop the validator service  
- **start** = Start the validator service  
- **enable** = Enable the validator service to be booted on startup  
- **disable** = Disable the validator service not to be booted on startup  
- **status** = Check the status of the validator  
- **reload** = Reload the daemon after changes made in the service  
- **restart** = Restart the validator service  

### Logs
- **logsnow** = Shows realtime logs  
- **logs** = Shows last 1000 logs  

### Updating polkadot client
- **version** = Shows your polkadot client version  
- **download** = Download latest polkadot client from github, give execution rights and name it polkadot_latest  
- **update** = Stop node, update client, start node  
- **scriptupdate** = Updates the latest version of the script  

### Fast sync with polkashots using rocksdb
- **shotdl** = Download latest polkashot  
- **shotupdate** = Stop the node & delete old database & extract new database & start the node   
- **shotdel** = Delete downloaded database

### RPC-commands(advanced - be careful)
- **rotatekeys** = Rotates your Validator node sessionkey, prints and appends the new sessionkey to sessionkeys.log  

## Coming up next
- Create installer script including options to install for parachains
- Add secure firewall setup
- Add secure SSH ruling
- Create proper CLI tool instead of bashing with aliases
- Make script to support CentOS / Ubuntu
