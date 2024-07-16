#!/bin/bash

NAME_PREFIX="$1"

WINPTY=''
if [[ -n ${WINDIR} ]]
then
   echo "WINDIR is defined"
   WINPTY='winpty '
fi

# ensure that old containers are removed
docker compose -p $NAME_PREFIX stop
docker compose -p $NAME_PREFIX rm -f

# start application
docker compose -p $NAME_PREFIX build --pull
docker compose -p $NAME_PREFIX up -d --force-recreate

# up application
$WINPTY docker compose -p $NAME_PREFIX  exec php-fpm sh -c "cd /var/www; composer install"
