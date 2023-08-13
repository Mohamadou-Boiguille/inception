#!/bin/bash

service mysql start

mysql < /conf/db_creator_script.sql

service mysql stop
