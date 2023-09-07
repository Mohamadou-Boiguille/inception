#!/bin/bash

# Dossier contenant les fichiers de configuration
# echo "[client]" > /etc/mysql/mariadb.conf.d/50-client.cnf
# echo "socket = /run/mysqld/mysqld.sock" >> /etc/mysql/mariadb.conf.d/50-client.cnf

# find "$dossier_config" -type f -name "*.cnf" -exec sed -i 's/\/var\/run\/mysqld\/mysqld.sock/\/run\/mysqld\/mysqld.sock/g' {} +
