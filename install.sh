#!/bin/bash

# Create the polkacli config directory
mkdir -p ~/.config/polkacli

# Copy the polkacli config file to the config directory
cp config ~/.config/polkacli

# Copy the polkacli completion script to the config directory
cp completion.sh ~/.config/polkacli

# Copy the polkacli logo file to the config directory
cp logo.ansi ~/.config/polkacli

# Copy the polkacli binary to the /usr/local/bin directory
sudo cp polkacli /usr/local/bin

# Print a success message
cat ~/.config/polkacli/logo.ansi
echo "Expect chaos."
echo "Polkacli has been installed successfully."
