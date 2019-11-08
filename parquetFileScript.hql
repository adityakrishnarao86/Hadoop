use gkdb;
SET hive.cli.print.header=true;
SET hive.cli.print.current.db=true;

create table IF NOT EXISTS parquettab(id int,name string,sal int)
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as parquetfile;

INSERT OVERWRITE TABLE parquettab SELECT * FROM texttab;

DESCRIBE FORMATTED parquettab;

SELECT * FROM parquettab;
