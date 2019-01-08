#!/usr/bin/env bash

cat > /root/.my.cnf << EOF
[client]
user = wordpress
password = secret
host = localhost
EOF

cp /root/.my.cnf /home/vagrant/.my.cnf

mysql -e "CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8mb4 DEFAULT COLLATE utf8mb4_unicode_ci";
