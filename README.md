# polkacli
Bash CLI tool for easy installation of polkadot node for Kusama network

## Requirements
Install lz4, curl, git, jq, micro, wget
```
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin && cp /usr/local/bin/micro /usr/local/sbin/
sudo apt-get install lz4 git jq curl wget  #ubuntu/debian
sudo yum install lz4 git jq curl wget      #centos/rocky
```

## Install polkacli
```
git clone https://github.com/kusamaxi/polkacli ~/polkacli && 
sudo mv ~/polkacli/polkacli ~/ && rm ~/polkacli &&
echo "# source polkacli
. ~/polkacli" >> ~/.bashrc
```

## alias commands manual
```
#Validator service
edit = Edit the validator service with micro terminal
stop = Stop the validator service
start = Start the validator service
enable = Enable the validator service to be booted on startup
disable = Disable the validator service not to be booted on startup
status = Check the status of the validator
reload = Reload the daemon after changes made in the service
restart = Restart the validator service

#Logs
logsnow = Shows realtime logs
logs = Shows last 1000 logs

#Updating polkadot client
version = Shows your polkadot client version
download = Download latest polkadot client from github, give execution rights and name it polkadot_latest
update = Stop node, update client, start node
scriptupdate = Updates the latest version of the script

#Installing polkashots(https://ksm-rocksdb.polkashots.io/) with rocksdb
shotload = Download latest polkashot
shotdate = Stop the node & Extract database & Start the node 

#RPC-commands(advanced - be careful)
rotatekeys = Rotates your Validator node sessionkey, prints and appends the new sessionkey to sessionkeys.log
```

## Coming up next
- Create installer script including options to install for parachains
- Add secure firewall setup
- Add secure SSH ruling
- Create proper CLI tool instead of bashing with aliases
- Make script to support CentOS / Ubuntu
