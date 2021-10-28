-- Query for Creating Show CT Statements to be run in the Source Hive Installation

SET @SCHEMA_TO_MIGRATE = '%default%';

SELECT 
    CONCAT('SHOW CREATE TABLE ',
            D.NAME,
            '.',
            T.TBL_NAME,
            '\;') AS SHOW_CT_STATEMENTS
FROM
    TBLS T
        INNER JOIN
    DBS D ON D.DB_ID = T.DB_ID
WHERE
    T.TBL_TYPE != 'INDEX_TABLE'
        AND D.NAME LIKE @SCHEMA_TO_MIGRATE INTO OUTFILE '/var/lib/mysql/tmp/3_CT.hql';
		
