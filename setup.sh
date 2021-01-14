#!/bin/bash

: '
Setup dotfiles and custom shell scripts
'

echo "Setup start..."
echo

echo "Setting execute permission for setup scripts..."

# Make the setup commands executable
chmod +x dotfiles_setup.sh
chmod +x shell_scripts_setup.sh

echo "Setting execute permission done."

echo "Running setup scripts..."
echo

# Run the setup commands
./dotfiles_setup.sh
./shell_scripts_setup.sh shell_scripts

echo
echo "Setup complete."