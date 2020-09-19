#!/bin/sh
cd /app
chmod 777 -R storage

if [ ! -f ".env" ]; then
    cp .env.example .env
fi
chmod 775 .env
# . .env
# Initialize
composer install
# php artisan key:generate
php artisan migrate
# php artisan db:seed --class=DatabaseSeeder
php-fpm