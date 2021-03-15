#!/bin/bash

if [ -e $HOME/.yourflag ]
then
    echo "No steps required"
else
    sudo /usr/pgadmin4/bin/setup-web.sh
    touch $HOME/.yourflag
fi
