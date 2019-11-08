use gkdb;
SET hive.cli.print.header=true;
SET hive.cli.print.current.db=true;

create table IF NOT EXISTS texttab(id int,name string,sal int)
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as textfile;

LOAD DATA LOCAL INPATH 'data*' OVERWRITE INTO TABLE texttab;

SELECT * FROM texttab;
