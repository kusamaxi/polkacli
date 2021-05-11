#current bash script requires installation of micro and jq. -> sudo apt install jq micro -y
#commands: edit, stop, start, status, reload, restart, logs, version, download, update, sessionkeys
alias edit="sudo micro /etc/systemd/system/ksm-validator.service"
alias stop="sudo systemctl stop ksm-validator.service"
alias start="sudo systemctl start ksm-validator.service"
alias status="sudo systemctl status ksm-validator.service"
alias reload="sudo systemctl daemon-reload"
alias restart="sudo systemctl restart ksm-validator.service"
alias logs="sudo tail -f /var/log/syslog"
alias version="polkadot --version"
alias download="curl -s https://api.github.com/repos/paritytech/polkadot/releases/latest | jq -r '.assets[] | select(.name | endswith(\"polkadot\")) | .browser_download_url' | xargs sudo curl -L -o polkadot_latest && sudo chmod +x polkadot_latest"
alias update="stop && sudo cp polkadot_latest /usr/local/bin/polkadot && start"
alias sessionkeys='curl -H "Content-Type: application/json" -d '\''{"id":1, "jsonrpc":"2.0", "method": "author_rotateKeys", "params":[]}'\'' http://localhost:9933'
alias scriptupdate='wget https://raw.githubusercontent.com/kusamaxi/polkacli/main/.bash_aliases -O ~/.bash_aliases && source .bashrc'
