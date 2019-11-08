!echo ==================================================================;
!echo TABLE CREATION STARTS HERE;
!echo ==================================================================;

use gkdb;
SET hive.cli.print.header=true;
SET hive.cli.print.current.db=true;

create table IF NOT EXISTS headertab(id int,name string,course string,fee int)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile
tblproperties("skip.header.line.count"="1","skip.footer.line.count"="1");

!echo ==================================================================;
!echo  LOADING DATA STARTS HERE;
!echo ==================================================================;

LOAD DATA LOCAL INPATH 'header.log' overwrite into table headertab;

!echo ==================================================================;
!echo SELECTING THE DATA FROM TABLE  TABLE;
!echo ==================================================================;

select * from headertab;

!echo ==================================================================;
!echo TABLE RECORD COUNT;
!echo ==================================================================;

select COUNT(*) from headertab;
