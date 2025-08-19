#!/bin/bash

# Set up environment - adjust these variables as needed
HOME_EMAIL="andre@anundsson.net"
WORK_EMAIL="andre@anundio.com"
HOME_KEY_NAME="home_rsa"
WORK_KEY_NAME="work_rsa"

# Ensure .ssh directory exists
mkdir -p ~/.ssh

# Function to create an SSH key if it doesn't already exist
generate_key() {
    local key_path=$1
    local email=$2

    if [ -f "$key_path" ]; then
        echo "SSH key at $key_path already exists. Skipping creation."
    else
        echo "Generating SSH key for $email..."
        ssh-keygen -t rsa -b 4096 -f "$key_path" -C "$email" -N ""
        echo "Adding SSH key at $key_path to SSH agent..."
        ssh-add "$key_path"
    fi
}

# Generate SSH keys with secure passwords, checking if they exist first
generate_key ~/.ssh/$HOME_KEY_NAME "$HOME_EMAIL"
generate_key ~/.ssh/$WORK_KEY_NAME "$WORK_EMAIL"

echo "SSH key setup complete. Created keys are located at:"
[ -f ~/.ssh/$HOME_KEY_NAME ] && echo " - ~/.ssh/$HOME_KEY_NAME"
[ -f ~/.ssh/$WORK_KEY_NAME ] && echo " - ~/.ssh/$WORK_KEY_NAME"
