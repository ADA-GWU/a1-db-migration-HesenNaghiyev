#!/bin/bash
psql -U postgres -d hw1 -v "ON_ERROR_STOP=1" -f studentsMigrate.sql; echo $?
if [[ $? -eq 0  ]]
then 
	psql -U postgres -d hw1  -v "ON_ERROR_STOP=1" -f interestsMigrate.sql
	STATUS=$?
	if [[ $STATUS -gt 0 ]]
	then
		echo 'aaa'
		psql -U postgres -d hw1 -v "ON_ERROR_STOP=1" -f rollbackInterests.sql
		psql -U postgres -d hw1 -v "ON_ERROR_STOP=1" -f rollbackStudent.sql
		echo 'Rollingback'
	fi
else
		psql -U postgres -d hw1 -v "ON_ERROR_STOP=1" -f rollbackStudent.sql
		echo "Error in migrate student"
fi
