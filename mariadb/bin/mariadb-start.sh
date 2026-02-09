#!/bin/bash

# if the /data/mariadb directory doesn't contain anything, then initialise it
directory="/data/mariadb/data"
if [ ! "$(ls -A $directory)" ]; then
    /usr/bin/mariadb-install-db --datadir=/data/mariadb/data --user=mysql
    /usr/bin/mariadbd-safe --defaults-file=/data/mariadb/etc/my.cnf --init-file=/data/mariadb/bin/badstore-setup.sql
else
    /usr/bin/mysqld_safe --defaults-file=/data/mariadb/etc/my.cnf
fi
