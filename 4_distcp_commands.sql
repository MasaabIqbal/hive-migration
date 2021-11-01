
use hive;
SET @SCHEMA_TO_MIGRATE = '%default%';

SELECT 
    CONCAT('hadoop distcp hdfs://54.201.22.32:8020//warehouse/tablespace/managed/hive/',
            T.TBL_NAME,
            ' hdfs://54.190.34.250:8020//warehouse/tablespace/managed/hive/',T.TBL_NAME,
        ) AS SHOW_CT_STATEMENTS
FROM
    TBLS T
        INNER JOIN
    DBS D ON D.DB_ID = T.DB_ID
WHERE
    T.TBL_TYPE != 'INDEX_TABLE'
        AND D.NAME LIKE @SCHEMA_TO_MIGRATE INTO OUTFILE '/var/lib/mysql/tmp/5_Distcp.sh';
	
	
