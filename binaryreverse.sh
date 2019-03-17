#!/bin/bash


# b|n4ryR3v3rs3 + shell by c0deninja 
# gotr00t security team
# shoutout to colossus for helping me out!
# Discord: http://discord.gg/JV6pu5q


# b|n4ryR3v3rs3 was made for the hackthebox Curling machine.
# this will help you retrieve the password in /home/floris/password_backup

# Make sure you have sshpass installed for the ssh shell
# sudo apt-get install sshpass

user=$(whoami)

echo "I hope you enjoy b|n4ryR3v3rs3 $user"
echo

echo -n "Enter file name to reverse: "
read filename

sleep 1s

xxd -r $filename > $filename.fixed

echo "Checking file type, please wait..."
sleep 1s

file $filename.fixed

cp $filename.fixed password.bz2

bzip2 -d password.bz2

file password

cp password password2.gz

gunzip password2.gz

file password2

cp password2 password3.bz2

bzip2 -d password3.bz2

file password3

cp password3 password4.tar

tar -xvf password4.tar

password=$(cat password.txt)

echo "The password is: $password"

# SSH Login

echo "SHELL: Creating a ssh session, please wait...."
echo

sshpass -p $password ssh floris@10.10.10.150
