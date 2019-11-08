drop table datetab;
!echo ----------------------------------------------------------------------;
!echo * ********       DATE TABLE CREATION                ******************;
!echo - --------------------------------------------------------------------;
create table datetab(empid int,ename string,jdate date,rdate date)
row format delimited 
fields terminated by '\t'
stored as textfile ;

!echo ----------------------------------------------------------------------;
!echo * ********       DATA LOADING INTO DATE TABLE       ******************;
!echo - --------------------------------------------------------------------;

load data local inpath '/home/gopalkrishna/PRAC/HIVE/dateData.log' into table datetab;

!echo ----------------------------------------------------------------------;
!echo * ********       DATA FROM DATETAB               ******************;
!echo - --------------------------------------------------------------------;

SET hive.cli.print.header=true;

select * from datetab;

drop table newdatetab;

!echo ----------------------------------------------------------------------;
!echo ** CREATION OF NEW TABLE FROM DATETABLE BASED ON EMP EXPERIENCE IN ORG **;
!echo - --------------------------------------------------------------------;

create table newdatetab as select empid,ename, jdate, rdate , floor(datediff(rdate,jdate)/365) AS yrsofexp from datetab;

drop table casetab;

!echo ----------------------------------------------------------------------;
!echo *********** CALCULATING "GRATUITY" BASED ON EMP EXP IN ORG ***********;
!echo - --------------------------------------------------------------------;

create table casetab
row format delimited 
fields terminated by '\t'
lines terminated by '\n'
stored as textfile 
as select empid , ename, jdate , rdate ,yrsofexp ,
case when yrsofexp > 2 and yrsofexp < 4
       then 'Eligible For 80% Gratuity'
     when yrsofexp >= 4 and yrsofexp < 7
       then 'Eligible For 100% Gratuity'
     when yrsofexp > 7 and yrsofexp <9
       then 'Eligible For 120% Gratuity'
    else 'NOT ELIGIBLE'
       end as Gratuity
from newdatetab;
!echo ----------------------------------------------------------------------;
!echo * ******** DATA FROM CASE TABLE WITH ELIGIBLE GRATUITY ******************;
!echo - --------------------------------------------------------------------;
select * from casetab;
