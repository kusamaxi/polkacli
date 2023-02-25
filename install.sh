#!/bin/bash

# Create the polkacli config directory
mkdir -p ~/.config/polkacli

# Copy the polkacli config file to the config directory
cp config ~/.config/polkacli

# Copy the polkacli completion script to the config directory
cp completion ~/.config/polkacli
# Add the completion script to the bashrc/zshrc file if it doesn't already exist
grep -qxF 'source ~/.config/polkacli/completion' ~/.bashrc || echo "source ~/.config/polkacli/completion" >> ~/.bashrc
grep -qxF 'source ~/.config/polkacli/completion' ~/.zshrc || echo "source ~/.config/polkacli/completion" >> ~/.zshrc

# Copy the polkacli logo file to the config directory
cp logo.ansi ~/.config/polkacli

# Copy the usage file to the config directory
cp usage ~/.config/polkacli

# Copy the polkacli binary to the /usr/local/bin directory
sudo cp polkacli /usr/local/bin

# Print a success message
cat ~/.config/polkacli/logo.ansi
echo "Expect chaos."
echo "Polkacli has been installed successfully."
