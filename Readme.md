Prerequisites:

1.  Ensure you have docker CE installed and running.
2.  Active internet connection (at least on 1st built).
3.  pip install docker
4.  pip install -U python-dotenv
https://docker-py.readthedocs.io/en/stable/


------------


## How to setup:

Go to the project directory.

By default all container will sync with the "src" folder in this repo.
You can update this with path of your project.

Also path for the Mysql "datadir" needs to the update. This can be found in the docker-sync.yml [docker-sync-mysql]

> todo: PHP level extensions can be added.

> todo: PHP settings can be added.

Apache conf setting can be customized.

Update required variable in .env file.

Once all configs are in place run below command in this project directory.

> Start OR Restart all containers:

`$ docker-compose up -d --build`

> View container status:

`$ docker-compose ps`

> Enter container bash mode:

`$ docker-compose exec [php|web] [bash|sh]`

------------

## To change PHP version set:

PHP_TAG=7.1-fpm

OR

PHP_TAG=7.2-fpm

then restart all containers.

------------
## File structure:
![alt text](https://raw.githubusercontent.com/dsouza-rohan/docker-stacks/lamp_stack/images/Screen%20Shot%202019-08-01%20at%201.10.15%20PM.png)
