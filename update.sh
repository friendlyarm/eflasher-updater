#!/bin/bash

BINFILE=/opt/eflasher-gui
if [ -f ${BINFILE} ]; then
    PID=`ps --no-headers -C eflasher-gui -o pid`
    if [ ! -z $PID ]; then
        echo "kill eflasher-gui"
        kill $PID
    fi
    sleep 2
    cp bin/eflasher-gui ${BINFILE}
    chmod 755 ${BINFILE}
    echo "Finished."
    while true; do
        read -p "Reboot now?" yn
        case $yn in
            [Yy]* ) reboot; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
else
    echo "not found ${BINFILE}"
fi
