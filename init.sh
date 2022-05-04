git clone https://github.com/laravel/laravel.git

cp ./laravel/.env.example ./laravel/.env

docker-compose up -d --build

docker-compose run --rm composer install

docker-compose run --rm composer dump-autoload

docker exec php-fpm chmod -R 777 storage/ /bin/bash

#docker exec php-fpm php artisan migrate --seed

docker exec php-fpm php artisan key:generate