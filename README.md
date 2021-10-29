# polkacli
Bash CLI tool for easy installation of polkadot node for Kusama network

## Requirements
Install 7zz, curl, git, jq, micro, wget
```
curl https://getmic.ro | bash
sudo mv micro /usr/local/bin && cp /usr/local/bin/micro /usr/local/sbin/
wget https://www.7-zip.org/a/7z2102-linux-x64.tar.xz && tar -xf 7z2102-linux-x64.tar.xz 7zz && cp 7zz /usr/share/bin/
sudo apt-get install git jq curl wget  #ubuntu/debian
sudo yum install git jq curl wget      #centos/rocky
```

## Install polkacli
```
touch ~/sessionkeys.txt
git clone https://github.com/kusamaxi/polkacli ~/polkacli && bash ~/polkacli/installer.sh
```
## installer.sh



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

#Installing polkashots(https://ksm-rocksdb.polkashots.io/)
shotload = Download latest polkashot
shotdate = Stop the node & Extract database & Start the node 

#RPC-commands(advanced - be careful)
rotatekeys = Rotates your Validator node sessionkey, prints and appends the new sessionkey to sessionkeys.txt

```

#Current script
```
#Validator serice
alias edit="sudo micro /etc/systemd/system/ksm-validator.service"
alias enable="sudo service ksm-validator.service enable"
alias disable="sudo service ksm-validator.service disable"
alias start="sudo service ksm-validator.service start"
alias stop="sudo service ksm-validator.service stop"
alias status="sudo service ksm-validator.service status"
alias reload="sudo systemctl daemon-reload"
alias restart="sudo service ksm-validator.service restart"

#Logs CentOS/Rocky
alias logsnow="sudo tail -f /var/log/messages"
alias logs="sudo tail -1000 /var/log/messages"

#Updating polkadot client
alias version="polkadot --version"
alias download="curl -s https://api.github.com/repos/paritytech/polkadot/releases/latest | jq -r '.assets[] | select(.name | endswith(\"polkadot\")) | .browser_download_url' | xargs sudo curl -L -o polkadot_latest && sudo chmod +x polkadot_latest && ./polkadot_latest --version"
alias update="stop && sudo cp polkadot_latest /usr/local/bin/polkadot && start"
alias scriptupdate='wget https://raw.githubusercontent.com/kusamaxi/polkacli/main/.bash_aliases -O ~/.bash_aliases && source .bashrc'

#Installing polkashots(https://ksm-rocksdb.polkashots.io/)
shotload = "wget https://ksm-rocksdb.polkashots.io/snapshot -O kusama.RocksDb.7z"
shotdate = "stop && mv ~/.local/share/polkadot ~/.local/share/ && 7zz x kusama.RocksDb.7z -o/home/kusama/.local/share/polkadot/chains/ksmcc3 && start"

#RPC-commands(advanced)
alias rotatekeys='curl -H "Content-Type: application/json" -d '\''{"id":1, "jsonrpc":"2.0", "method": "author_rotateKeys", "params":[]}'\'' http://localhost:9933" >> sessionkeys.txt && tail -1 sessionkeys.txt'
```






## Coming up next
- Create installer script including options to install for parachains
- Add secure firewall setup
- Add secure SSH ruling
- Create proper CLI tool instead of bashing with aliases
- https://github.com/google/zx -> upgrade into js scripting
- Make script to support CentOS / Ubuntu
