#!/bin/bash
clear

echo "=================================================="
echo "                Mr.Artit Kiuwilai"
echo " https://github.com/first087/GitLab-Update-Script"
echo "=================================================="
echo

if [ "$1" = "" ]; then
        echo "Enter install filename into parameter 1"
        exit 0
fi

echo "1. Stop Service"

gitlab-ctl stop unicorn
gitlab-ctl stop sidekiq
gitlab-ctl stop nginx

echo
echo "2. Create Backup"

gitlab-rake gitlab:backup:create

echo
echo "3. Install Package [" $1 "]"

dpkg -i $1

echo
echo "4. Reconfig & Restart"

gitlab-ctl reconfigure
gitlab-ctl restart

echo
echo "Finish!"
exit 1
