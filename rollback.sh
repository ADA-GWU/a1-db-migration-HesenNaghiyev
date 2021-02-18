#!/bin/bash
psql -U postgres -d hw1 -v "ON_ERROR_STOP=1" -f rollbackStudent.sql
STATUS_1=$?
if [[ $STATUS_1 -eq 0  ]]
then 
	psql -U postgres -d hw1  -v "ON_ERROR_STOP=1" -f rollbackInterests.sql
	STATUS_2=$?
	if [[ $STATUS_2 -gt 0 ]]
	then
		psql -U postgres -d hw1 -v "ON_ERROR_STOP=1" -f studentsMigrate.sql
		psql -U postgres -d hw1 -v "ON_ERROR_STOP=1" -f interestMigrate.sql
		echo 'Error'
	fi
else
		psql -U postgres -d hw1 -v "ON_ERROR_STOP=1" -f studentsMigrate.sql
		echo "Error"
fi
