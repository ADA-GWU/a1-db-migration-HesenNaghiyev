# Postgres DB Migration 


## Configuration

You can create a docker container and run a Postgres image on top of it.


For manual migration and rollback, you need to use the following commands. 
```bash
psql -U postgres -d {DB_NAME} -v "ON_ERROR_STOP=1" -f studentsMigrate.sql
```
```bash
psql -U postgres -d {DB_NAME} -v "ON_ERROR_STOP=1" -f rollbackStudent.sql
```
```bash
psql -U postgres -d {DB_NAME} -v "ON_ERROR_STOP=1" -f interestMigrate.sql
```
```bash
psql -U postgres -d {DB_NAME}  -v "ON_ERROR_STOP=1" -f rollbackInterests.sql
```

## Automation of process with bash script

```
chmood 777 ./migrate.sh
chmood 777 ./rollback.sh
```
In above, as shown in the above two commands, you need to give write, read, and execute access to specified files such as rollback.sh and migrate.sh



## Running with bash script
```
./migrate.sh
./rollback.sh
```

## Note
In bash way, everything is automated with if and else logic. If any problem occur in any state, it automatically rollback to previous state.
If you look at the inside of bash file, l have implemented a logic that, if migrateStudent migrated successfully, then  migrateInterest happens, otherwise, l rolleback.

Same logic implemeneted in both bash files , migrate.sh and roollback.sh but in reverse way. 

