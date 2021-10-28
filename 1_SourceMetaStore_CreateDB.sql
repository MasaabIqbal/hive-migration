-- Schemas to Migrate (This is used in like to fetch the DB names to migrate)

USE hive; -- Source MySQL MetaStore Schema

set @SCHEMA_TO_MIGRATE = '%default%';

-- Query for creating databases
SELECT 
    CONCAT('CREATE DATABASE IF NOT EXISTS ',
            D.NAME,
            '\;') AS CREATE_DB_STATEMENTS
FROM
    DBS D
WHERE
    D.NAME LIKE @SCHEMA_TO_MIGRATE INTO OUTFILE '/var/lib/mysql/tmp/3.hql';
	
	
