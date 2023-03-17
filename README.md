# Polkacli

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
    **list**                   - Print the current configuration options  
  
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
