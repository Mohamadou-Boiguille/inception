#!/bin/bash

cp /conf/my.cnf /etc/mysql/my.cnf

service mysql start

mysql < /conf/db_creator_script.sql

service mysql stop

exec mysqld
