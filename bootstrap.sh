#!/bin/bash

# Create a user in the start up if NEW_USER environment variable is given
# EX: docker run  -e NEW_USER=kmucs RSA_PUBLIC_KEY=  ...
if [[ ! -z $NEW_USER ]];
then
    adduser --disabled-password --gecos ""  "$NEW_USER" > /dev/null
    usermod -aG sudo "$NEW_USER" > /dev/null
    sudo -u "$NEW_USER" mkdir /home/"$NEW_USER"/.ssh
    sudo -u "$NEW_USER" chmod 700 /home/"$NEW_USER"/.ssh
    sudo -u "$NEW_USER" touch /home/"$NEW_USER"/.ssh/authorized_keys

    if [[ ! -z $RSA_PUBLIC_KEY ]];
    then
        sudo -u "$NEW_USER" echo "$RSA_PUBLIC_KEY" >> /home/"$NEW_USER"/.ssh/authorized_keys
    else
        sudo -u "$NEW_USER" cat /tmp/id_rsa.pub >> /home/"$NEW_USER"/.ssh/authorized_keys
    fi
    sudo -u "$NEW_USER" chmod 600 /home/"$NEW_USER"/.ssh/authorized_keys
fi

CMD=${1:-"exit 0"}
if [[ "$CMD" == "-d" ]];
then
    service sshd stop
    /usr/sbin/sshd -D -d
else
    /bin/bash -c "$*"
fi
