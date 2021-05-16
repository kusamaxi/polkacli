# polkacli
To install current script to .bash_aliases:
```
wget https://raw.githubusercontent.com/kusamaxi/polkacli/main/.bash_aliases -O ~/.bash_aliases && source .bashrc
```

Bash CLI tool for easy installation of polkadot node for Kusama, Polkadot and Westend networks.

Planned logic --->
cron every hour latest info from github notifications api if polkadot has released new update. -> if update released call download and update functions
```
curl \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/notifications
```
