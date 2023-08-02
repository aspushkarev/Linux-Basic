#!/bin/bash

# MySQL backup script without binlog

DBNAME=my_db
DATE=`date +"%Y%m%d"`
SQLFILE=$DBNAME-${DATE}.sql

/usr/bin/mysqldump --opt --user=root --password --all-databases > /home/aspushkarev/$SQLFILE | gzip -1 > ./$SQLFILE.gz

