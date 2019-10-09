#!/bin/bash

#Install PHP CURL
echo ""
echo ""
echo "*------------------------------------*"
echo "Install PHP CURL"
echo ""
sudo apt-get --assume-yes install php-curl

#Install PHP Pear
echo ""
echo ""
echo "*------------------------------------*"
echo "Install PHP Pear"
echo ""
sudo apt-get --assume-yes install php-pear

#Install Pear Mail
echo ""
echo ""
echo "*------------------------------------*"
echo "Install PHP Pear Mail"
echo ""
sudo pear install --alldeps Mail 

#Create database ape_database, user ape_user, and import data
echo ""
echo ""
echo "*------------------------------------*"
echo "Create database ape_database, and user ape_user, and import data"
echo ""
PASSWDDB="X5mlOhMZyTKheq1Q"
MAINDB="ape_database"
USER="ape_user"

# If /root/.my.cnf exists then it won't ask for root password
if [ -f /root/.my.cnf ]; then

    mysql -e "CREATE DATABASE ${MAINDB};"
    mysql -e "CREATE USER ${USER}@localhost IDENTIFIED BY '${PASSWDDB}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${USER}'@'localhost';"
    mysql -e "FLUSH PRIVILEGES;"
	
	mysql ${MAINDB} < ./ape_database.sql

# If /root/.my.cnf doesn't exist then it'll ask for root password   
else
	echo "*------------------------------------*"
    echo "Please enter root user MySQL password!"
    read rootpasswd
    mysql -uroot -p${rootpasswd} -e "CREATE DATABASE ${MAINDB};"
    mysql -uroot -p${rootpasswd} -e "CREATE USER ${USER}@localhost IDENTIFIED BY '${PASSWDDB}';"
    mysql -uroot -p${rootpasswd} -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${USER}'@'localhost';"
    mysql -uroot -p${rootpasswd} -e "FLUSH PRIVILEGES;"
	
	mysql -uroot -p${rootpasswd} ${MAINDB} < ./ape_database.sql
fi

#Copy APE website to Apache HTML directory
echo ""
echo ""
echo "*------------------------------------*"
echo "Copy APE website to Apache HTML directory"
echo ""
cp -r ./ape /var/www/html/ape

#Add APE cron jobs
echo ""
echo ""
echo "*------------------------------------*"
echo "Add APE cron jobs"
echo ""
crontab -l >> ape_cron_jobs
crontab ape_cron_jobs