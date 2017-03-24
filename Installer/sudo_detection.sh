#!/bin/bash

if [ $EUID -ne 0 ]; then
    echo "Error: please execute this script with sudo privilege."
    exit -1
fi

USER_HOME=$(eval "cd ~$SUDO_USER; pwd")

