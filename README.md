# Hello World!
Hi, my name is Marina and I'm thankful to be here making this challenge. This is the documentation for the developed software, and instructions for testing.

Normally, I use to make english modeling, code and documentation. I have no problem in make this in portuguese, if needed.

Let's go!

---
# FH Challenge Bank ENVIRONMENT DOCKER

## Required

+ Docker
+ Docker Compose

## Installation

1) First of all, you must se if you have Docker and Docker Compose on your machine.

2) Clone this repo using recursive method because the REST API is coming as a submodule.
``` 
git clone --recursive git@github.com:marinapelosi/fh-challenge-bank.git
``` 

3) Make the .env.example copy and create your .env file, inside the root path of the environment
``` 
cp .env.example .env
``` 

4) Make sure you have the mysql_data folder. If you don't, create it and let it empty.
```
mkdir mysql_data
``` 

5) Build the environment
```
docker-compose up --build
``` 

After the build you must have these 3 containers on `docker ps`

``` 
fh-challenge-bank_nginx
fh-challenge-bank_php-fpm
fh-challenge-bank_mysql
``` 


To up, after build
```
docker-compose up // use -d param if you don't wanna see the logs
``` 

To down, after build
``` 
docker-compose down
``` 

6) Ok. You have the environment built. So you must config the REST API.
```
cd app
``` 

``` 
cp .env.example .env
``` 

7) Now to continue the REST API config, you must get inside the following container and execute some commands

Getting inside the container
```
docker exec -it fh-challenge-bank_php-fpm bash
```

Give some permissions
```
php artisan storage:link
``` 

```
chmod -R 777 storage
``` 

```
chmod -R 777 storage/logs
``` 

Updating the compose
```
composer update
``` 

```
composer dump-autoload
``` 

Creating the database tables and data because there are necessary to test the API
```
php artisan migrate:fresh --seed
``` 

Refreshing cache
```
php artisan config:cache
``` 

```
php artisan route:cache
``` 

## Other commands you must need

To run the TDD, you must be inside of the container fh-challenge-bank_php-fpm

``` 
php artisan test
``` 

You must see these following tests

<img src="https://tech.marinapelosi.com/fh-challenge-bank/tdd.png" alt="TDD img">

## URLs

The API URL in your local machine is gonna be: http://localhost:7778/

The API URL working on Digital Ocean: http://157.245.88.105:7778/

REST API Repo: https://github.com/marinapelosi/fh-challenge-bank-api