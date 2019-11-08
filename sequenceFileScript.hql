use gkdb;
SET hive.cli.print.header=true;
SET hive.cli.print.current.db=true;

create table IF NOT EXISTS seqtab(id int,name string,sal int)
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as sequencefile;

INSERT OVERWRITE TABLE seqtab SELECT * FROM texttab;

DESCRIBE FORMATTED seqtab;

SELECT * FROM seqtab;
