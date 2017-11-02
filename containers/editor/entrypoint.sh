#!/bin/bash

if [ -d /sudoers.d ]
then
    cp /sudoers.d/* /etc/sudoers.d/
fi

mkdir /home/$USER_NAME
chown $USER_NAME:$USER_NAME /home/$USER_NAME
su $USER_NAME -c "/launch-tmux-nvim.sh"

