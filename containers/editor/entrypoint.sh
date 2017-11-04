#!/bin/bash

# Add the user to sudoers
echo "$USER_NAME  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER_NAME
chmod 440 /etc/sudoers.d/$USER_NAME

# Setup home permission
mkdir -p /home/$USER_NAME/.config
chown -R $USER_NAME:$USER_NAME /home/$USER_NAME

# Launch
if [ -n "$LAUNCHER" ]
then
    su $USER_NAME --preserve-environment -c "$LAUNCHER"
else
    su $USER_NAME --preserve-environment -c "zsh"
fi

