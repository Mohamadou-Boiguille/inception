#!/bin/bash

my_cnf_file="my.cnf"

cat << EOF > "$my_cnf_file"
[client]
host = wordpress
user = ${SQL_USER}
password = ${SQL_PASS}
port = 3306
socket = /var/run/mysqld/mysqld.sock
EOF
