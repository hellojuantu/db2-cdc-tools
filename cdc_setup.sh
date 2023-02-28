#/bin/bash

echo "Begin Setup CDC Tools ..."
DBNAME=$1

if [ ! -n "$DBNAME" ]; then
  echo "Error, Setup CDC Tools Error: The param "DBNAME" is empty."
  exit 0
fi

cd ./src

DB2DIR=`db2level | grep "Product is installed at" |  awk -F 'Product is installed at ' '{print $2}' | awk -F \" '{print $2}'`

$DB2DIR/samples/c/bldrtn asncdc

rc=1
echo "Waiting for DB2 start ( $DBNAME ) ."
while [ "$rc" -ne 0 ]
do
   sleep 5
   db2 connect to $DBNAME
   rc=$?
   echo '.'
done

# enable metacatalog read via JDBC
cd $HOME/sqllib/bnd
db2 bind db2schema.bnd blocking all grant public sqlerror continue 

# do a backup and restart the db
db2 backup db $DBNAME to /dev/null
db2 restart db $DBNAME

db2 connect to $DBNAME

cp ~/cdc_tools/src/asncdc /database/config/db2inst1/sqllib/function
chmod 777 /database/config/db2inst1/sqllib/function

# add UDF / start stop asncap
db2 -tvmf ~/cdc_tools/src/asncdc_UDF.sql

# create asntables
db2 -tvmf ~/cdc_tools/src/asncdc_tables.sql

# add UDF / add remove asntables

db2 -tvmf ~/cdc_tools/src/asncdc_add_remove_switch.sql

echo "Success, Setup CDC Tools Finished !!!"

