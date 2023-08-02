#!/bin/bash

# MySQL backup script
sudo rm -rf mysql/

MYSQL='mysql --skip-column-names'

for s in mysql `$MYSQL -e "SHOW DATABASES LIKE '%\_db'"`;
	do
	mkdir $s;
	/usr/bin/mysqldump --all-databases --add-drop-table --add-locks --create-options --disable-keys --extended-insert --single-transaction --quick --events --routines --triggers --source-data=2
	$s | gzip -1 > ./$s.gz;
done

#### Second version - is completed ##########
#DBNAME=my_db
#DATE=`date +"%Y%m%d"`
#SQLFILE=$DBNAME-${DATE}.sql
#mysqldump --opt --user=root --password $DBNAME > /home/aspushkarev/$SQLFILE | gzip -1 > ./$SQLFILE.gz
