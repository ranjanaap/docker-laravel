# docker-laravel
Laravel Dockerfile based on docker-php docker image

## Build
You need to build docker-php first:
```bash
git clone https://github.com/ranjanaap/docker-php.git
cd docker-php
docker build -t base .
```
After that build docker-laravel:
```bash
cd ..
git clone https://github.com/ranjanaap/docker-laravel.git
cd docker-laravel
docker build -t laravel .
```

## Running
```bash
docker run -d -p 80:80 laravel
```
With custom `laravel` folder:
```bash
docker run -d -p 80:80 -v (your laravel's folder):/var/www/laravel/ laravel
```
You can also mount laravel folders separately:
```bash
docker run -d -p 80:80 -v (your laravel app's folder):/var/www/laravel/app/ -v (your laravel public's folder):/var/www/laravel/public/ -v (your laravel resources' folder):/var/www/laravel/resources/ laravel
```
