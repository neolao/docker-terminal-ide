#!/bin/bash

# Add the user to sudoers
echo "- Add the user \"$$USER_NAME\" to sudoers"
echo "$USER_NAME  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER_NAME
chmod 440 /etc/sudoers.d/$USER_NAME

# Setup home permission
echo "- Setup home permission: /home/$USER_NAME"
mkdir -p /home/$USER_NAME/.config
chown -R $USER_NAME:$USER_NAME /home/$USER_NAME > /dev/null 2>&1

# Launch
if [ -n "$LAUNCHER" ]
then
    su $USER_NAME --preserve-environment -c "$LAUNCHER"
else
    su $USER_NAME --preserve-environment -c "zsh"
fi

