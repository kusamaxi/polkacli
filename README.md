# polkacli
Bash CLI tool for easy installation of polkadot node for Kusama, Polkadot and Westend networks.

Planned logic --->
cron every hour latest info from github notifications api if polkadot has released new update. -> if update released call download and update functions
```
curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/notifications
```

~/.bash_aliases
```
#current bash script requires installation of micro and jq. -> sudo apt install jq micro -y
#commands: edit, stop, start, status, reload, restart, logs, version, download, update, sessionkeys
alias edit="sudo micro /etc/systemd/system/westend-validator.service"
alias stop="sudo systemctl stop westend-validator.service"
alias start="sudo systemctl start westend-validator.service"
alias status="sudo systemctl status westend-validator.service"
alias reload="sudo systemctl daemon-reload"
alias restart="sudo systemctl restart westend-validator.service"
alias logs="sudo tail -f /var/log/syslog"
alias version="polkadot --version"
alias download="curl -s https://api.github.com/repos/paritytech/polkadot/releases/latest | jq -r '.assets[] | select(.name | endswith(\"polkadot\")) | .browser_download_url' | xargs sudo curl -L -o polkadot_latest && sudo chmod +x polkadot_latest"
alias update="stop && sudo cp polkadot_latest /usr/local/bin/polkadot && start"
alias sessionkeys='curl -H "Content-Type: application/json" -d '\''{"id":1, "jsonrpc":"2.0", "method": "author_rotateKeys", "params":[]}'\'' http://localhost:9933'
```
source ~/.bashrc
​
4
​
5
Features will be including seamless updates to the latest version available in github. 
