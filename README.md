# EWU APE Website Deployment

## Build Status

### Master
[![Build Status](https://travis-ci.org/ashermancinelli/ape.svg?branch=master)](https://travis-ci.org/ashermancinelli/ape)
[![CircleCI](https://circleci.com/gh/ashermancinelli/ape/tree/master.svg?style=svg)](https://circleci.com/gh/ashermancinelli/ape/tree/master)

### Dev
[![Build Status](https://travis-ci.org/ashermancinelli/ape.svg?branch=dev)](https://travis-ci.org/ashermancinelli/ape)

Contributors:
- Asher Mancinelli
- Robert Moreno
- Chaz Hurd
- Jose Garcia

## Running Developement Server:

If it's all php/frontend specific, run the following in root directory:
```bash
> php -S localhost:<port number>
```

Or if you have docker you could run:
```bash
> docker build -t ape-local -f .docker/Dockerfile.ape .
> docker run -p <port number>:80 ape-local
```

Or with docker-compose if you need database functionality:
```bash
> docker-compose build
> docker-compose up
```
Note: if you use `docker-compose`, you will have to run `docker-compose down -v` after every run so the database is re-initialized correctly on startup.
The `-v` flag resets the volumes so the init scripts are ran correctly.

And then navigate to `http://localhost:<port number>/ape/view/home`

## Docs from previous team
> ## Assumed installed: Apache, PHP, MariaDB
> 
> 1.	Extract the zip file.
> 2.	Cd into the extracted directory. You should see this files and directory:
> ```bash
> > ls
> ape/
> ape_crob_jobs
> script.sh
> ape_database.sql
> ```
> 
> 3.	Give execute permission to script.sh
> `chmod +x script.sh`
> 4.	Run script.sh. The script will do the followings:
> - Install PHP CURL
> - Install PHP Pear
> - Install Pear Mail
> - Create database ape_database, user ape_user, and import data
> - Copy APE website to Apache HTML directory
> - Add APE cron jobs

