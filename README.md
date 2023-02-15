# Polkacli Noderunner

Polkacli is a command-line tool for running Polkadot nodes from .yaml configuration files. Its purpose is to simplify the process of running nodes. True decentralization means that you should not know linux by heart to participate.

## Requirements

sudo rights to linux operating system running either debian, redhat or arch linux -like distro.

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

## Usage

#### Usage: polkacli [OPTIONS] COMMAND [ARGS]  
  
#### Options:  
  **-h, --help**                - Show this help message and exit  
  **-v, --version**             - Show version information and exit  
  
#### Commands:  
  **client**  
    **version**                 - Show the version of the Polkadot client  
    **download**                - Download the latest Polkadot client binary  
    **update**                  - Update the Polkadot client to the latest version  
  
  **config**  
    **get** **KEY**             - Get the value of a configuration option  
    **set** **KEY** **VALUE**   - Set the value of a configuration option  
    **print**                   - Print the current configuration options  
  
  **setup**                     - Set up the polkacli configuration  
  **rpc**  
    **rotatekeys**              - Rotate the session keys  
    **epochauthorship**         - Get the current epoch authorship information  
  
  **service**  
    **enable**                  - Enable the Polkadot service  
    **disable**                 - Disable the Polkadot service  
    **start**                   - Start the Polkadot service  
    **stop**                    - Stop the Polkadot service  
    **status**                  - Show the status of the Polkadot service  
    **reload**                  - Reload the Polkadot service configuration  
    **restart**                 - Restart the Polkadot service  
  
  **shots**  
    **download**                - Download the latest snapshot  
    **update**                  - Update to the latest downloaded snapshot  
    **delete**                  - Delete the downloaded snapshot  
