use gkdb;
SET hive.cli.print.header=true;
SET hive.cli.print.current.db=true;

create table IF NOT EXISTS rctab(id int,name string,sal int)
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as rcfile;

INSERT OVERWRITE TABLE rctab SELECT * FROM texttab;

DESCRIBE FORMATTED rctab;

SELECT * FROM rctab;
