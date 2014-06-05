USER=sphere
PASSWORD=spherepass
BASE=task1

mysql -u $USER -p$PASSWORD -e "drop database if exists $BASE; create database $BASE"
mysql $BASE -u $USER -p$PASSWORD --local-infile < init.sql
