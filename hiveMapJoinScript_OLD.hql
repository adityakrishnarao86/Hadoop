!echo "==============================================================================";
!echo "BASE TABLE CREATION - BY REMOVING 'HEADER' FROM INPUT FILE";
!echo "==============================================================================";

use gkdb;
set hive.cli.print.current.db=true;
set hive.cli.print.header=true;

create table IF NOT EXISTS basetab(id int,
           first_name string,
           last_name string,
           email_address string,
           gender string,
           ip_address string)
     row format delimited 
     fields terminated by ','
     tblproperties("skip.header.line.count"="1");


!echo "==============================================================================";
!echo "                         DATA LOADING INTO BASE TABLE                         ";
!echo "==============================================================================";

LOAD DATA LOCAL INPATH 'basetab_data.csv' OVERWRITE INTO TABLE gkdb.basetab;

!echo "==============================================================================";
!echo "                         EXTRACTING DATA FROM BASE TABLE                      ";
!echo "==============================================================================";

select * from gkdb.basetab LIMIT 10;

!echo "==============================================================================";
!echo "CHILD TABLE CREATION - BY REMOVING 'HEADER' FROM INPUT FILE";
!echo "==============================================================================";

create table IF NOT EXISTS childtab(id int,first_name string,last_name string)
       row format delimited 
       fields terminated by ','
       tblproperties("skip.header.line.count"="1");

!echo "==============================================================================";
!echo "                         DATA LOADING INTO CHILD TABLE                         ";
!echo "==============================================================================";

LOAD DATA LOCAL INPATH 'childtab_data.csv' OVERWRITE INTO TABLE childtab;

!echo "==============================================================================";
!echo "                        EXTRACTING DATA FROM CHILD TABLE                      ";
!echo "==============================================================================";

select * from gkdb.childtab LIMIT 10;

!echo "==============================================================================";
!echo "   TO PERFORM MAP JOIN on both BASETAB & CHILD TAB                            ";
!echo "==============================================================================";

SET hive.auto.convert.join=false;
SELECT /*+ MAPJOIN(childtab)*/ basetab.first_name, basetab.id,childtab.id FROM basetab JOIN childtab ON basetab.first_name = childtab.first_name LIMIT 10;

