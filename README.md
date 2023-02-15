
Here's an updated version of the .md file to make it more official and professional:

# Polkacli Noderunner

Polkacli is a command-line tool for running Polkadot nodes from .yaml configuration files. Its purpose is to simplify the process of running nodes and to help drive decentralization of the network even further.

## Requirements

You need root access to a Debian-based or RHEL-based Linux distribution.

## Installation

To install Polkacli, follow these steps:

1.  Clone the Polkacli repository:

bashCopy code

`git clone https://github.com/kusamaxi/polkacli` 

2.  Navigate to the Polkacli directory:

bashCopy code

`cd polkacli` 

3.  Make the installation script executable:

bashCopy code

`chmod +x install.sh` 

4.  Run the installation script:

bashCopy code

`./install.sh` 

## Getting Started

You can use the following commands to start running your Polkadot node:

-   **reload** = Reload the validator service
-   **download** = Download the latest Polkadot client from GitHub, give it execution rights, and name it polkadot_latest
-   **shotdl** = Download the latest Polkashot
-   **shotupdate** = Stop the node, delete the old database, extract the new database, and start the node
-   **shotdel** = Delete the downloaded database
-   **update** = Stop the node, update the client, and start the node
-   **logsnow** = Show real-time logs
-   **logs** = Show the last 1000 logs

## Commands

### Validator Service

-   **edit** = Edit the validator service with the Micro terminal
-   **stop** = Stop the validator service
-   **start** = Start the validator service
-   **enable** = Enable the validator service to be booted on startup
-   **disable** = Disable the validator service not to be booted on startup
-   **status** = Check the status of the validator
-   **reload** = Reload the daemon after changes made in the service
-   **restart** = Restart the validator service

### Updating Polkadot Client

-   **version** = Show your Polkadot client version
-   **download** = Download the latest Polkadot client from GitHub, give it execution rights, and name it polkadot_latest
-   **update** = Stop the node, update the client, and start the node
-   **scriptupdate** = Update the latest version of the script

### RPC Commands (Advanced - Be Careful)

-   **rotatekeys** = Rotate your Validator node session key, print and append the new session key to sessionkeys.log
-   **epochauthorship** = Command to check if your node is an active block producer

Note: Be careful when using advanced RPC commands, as they can have a significant impact on the node's behavior. Always use them with caution.
