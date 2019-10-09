# EWU APE Website Deployment

## Assumed installed: Apache, PHP, MariaDB

1.	Extract the zip file.
2.	Cd into the extracted directory. You should see this files and directory:
```bash
> ls
ape/
ape_crob_jobs
script.sh
ape_database.sql
```

3.	Give execute permission to script.sh
`chmod +x script.sh`
4.	Run script.sh. The script will do the followings:
- Install PHP CURL
- Install PHP Pear
- Install Pear Mail
- Create database ape_database, user ape_user, and import data
- Copy APE website to Apache HTML directory
- Add APE cron jobs

## Running Developement Server:

Run the following in root directory:
```bash
php -S localhost:<port number>
```
Navigate to `http://localhost:<port number>/ape/view/home`


This is my contribution!!
Another Contribution
