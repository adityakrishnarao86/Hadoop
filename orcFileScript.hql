use gkdb;
SET hive.cli.print.header=true;
SET hive.cli.print.current.db=true;

drop table orctab;

create table orctab(id int,name string,sal int)
row format delimited
fields terminated by '\t'
lines terminated by '\n'
stored as orcfile;

INSERT OVERWRITE TABLE orctab SELECT * FROM texttab;

DESCRIBE FORMATTED orctab;

SELECT * FROM orctab;
