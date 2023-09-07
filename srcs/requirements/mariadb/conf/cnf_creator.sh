#!/bin/bash

cat << EOF > "/etc/my.cnf"
[mysqld]
datadir = /var/lib/mysql
socket  = /tmp/mysqld.sock
bind_address = 0.0.0.0
port = 3306
user = mysql

[client]
datadir = /var/lib/mysql
socket  = /tmp/mysqld.sock
port = 3306

[client-mariadb]
EOF
