!echo "==================================================================";
!echo "TABLE CREATION STARTS HERE";
!echo "==================================================================";
use gkdb;
create table IF NOT EXISTS mantab(id int,name string,sal int,yearsofexp int,skillset string,deptname string,deptloc string,epan string,eaadhar string)
row format delimited
fields terminated by ','
lines terminated by '\n'
stored as textfile
tblproperties("skip.header.line.count"="1");
!echo "==================================================================";
!echo " LOADING DATA STARTS HERE";
!echo "==================================================================";
LOAD DATA LOCAL INPATH 'EmpInputFile.csv' overwrite into table gkdb.mantab;
!echo "==================================================================";
!echo "SELECTING THE DATA FROM TABLE  TABLE";
!echo "==================================================================";
select * from gkdb.mantab;
!echo "==================================================================";
!echo "TABLE RECORD COUNT";
!echo "==================================================================";

select COUNT(*) from gkdb.mantab;
