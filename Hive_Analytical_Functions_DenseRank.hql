use gkdb;
SET hive.cli.print.header=true;
SET hive.cli.print.current.db=true;

!echo ===================================================================;
!echo ********************** RANK TABLE CREATION ************************;
!echo ===================================================================;

create table IF NOT EXISTS ranktab(name string,id int,amt int)
row format delimited 
fields terminated by ','
lines terminated by '\n'
stored as textfile ;

!echo ===================================================================;
!echo ***************DATA LOADING INTO RANK TABLE************************;
!echo ===================================================================;

LOAD DATA LOCAL INPATH 'window_rankData.csv' OVERWRITE INTO TABLE ranktab;

!echo ===================================================================;
!echo *****************SELECTING DATA FROM RANK TABLE********************;
!echo ===================================================================;

SELECT * FROM ranktab;

!echo ===================================================================;
!echo *********   DENSE_RANK() FUNCTION RESULTS              ************;
!echo ===================================================================;
 
select name, volume as amount , dense_rank() over (order by V.volume desc) as denserank from 
 (select name,sum(amt) as volume from ranktab group by name) V;


