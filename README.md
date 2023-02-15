# polkacli noderunner
polkacli is tool for running polkadot nodes from .yaml configuration files. It's purpose is to 
simplify running nodes to drive decentralization of the network even further.
Ansible is great, but comes with unnecessary high learning curve and its fucking slow.

## Requirements
Root access to debian based distro or rhel based distro

## Install polkacli
```bash
git clone https://github.com/kusamaxi/polkacli && cd polkacli && chmod +x install.sh && ./install.sh
```
## Getting started
reload  
download  
shotdl  
shotupdate  
shotdel  
update  
logsnow  

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
- **epochauthorship** = command to check if your node is active block producer

## Coming up next
- Add secure firewall setup
- Add secure SSH ruling
- Monitoring
- nginx reverse proxy
- Create proper CLI tool instead of bashing with aliases

## polkacli v2
- rework script into combination of ansible book
