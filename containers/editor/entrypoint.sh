#!/bin/bash

# Create group
echo "- Create group $USER_GID"
groupadd --force --gid $USER_GID $USER_NAME

# Create user
echo "- Create user \"$USER_NAME\", UID=$USER_UID, GID=$USER_GID"
useradd $USER_NAME --uid $USER_UID --gid $USER_GID --home /home/$USER_NAME

# Add the user to sudoers
echo "- Add the user \"$USER_NAME\" to sudoers"
echo "$USER_NAME  ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USER_NAME
chmod 440 /etc/sudoers.d/$USER_NAME

# Setup home permission
echo "- Setup home permission: /home/$USER_NAME"
mkdir -p /home/$USER_NAME/.config
chown -R $USER_NAME:$USER_NAME /home/$USER_NAME > /dev/null 2>&1
chsh -s /bin/zsh $USER_NAME

# Launch
if [ -n "$LAUNCHER" ]
then
    su $USER_NAME --preserve-environment --session-command "$LAUNCHER"
else
    su $USER_NAME --preserve-environment --session-command "zsh"
fi

