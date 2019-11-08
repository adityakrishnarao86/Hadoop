!echo ===============================================================================================================================;
!echo TO CREATE A TABLE WITH COLLECTION DATA TYPES IN HIVE;
!echo ===============================================================================================================================;

use gkdb;

SET hive.cli.print.current.db=true;
SET hive.cli.print.header=true;

create table IF NOT EXISTS CollectManTab(
companyId bigint,
companyName struct<actualName:string , aliasName:string>,
companyAddress struct<roadnum:int,street:string,city:string,state:string>,
PreviousYrs_Revenues array<smallint>,
growth_Preferences map<string , boolean>
 )
row format delimited
fields terminated by '|'
collection items terminated by ',' --this shows how the elements of Struct,Array and Map are saparated
map keys terminated by ':' --tells about how KEY & VALUE has been saparated in map only 
lines terminated by '\n'
stored as textfile;

!echo ==============================================================================================================================;
!echo DESCRIPTION OF COLLECTMANTAB TABLE;
!echo ==============================================================================================================================;

describe formatted collectmantab;

!echo ==============================================================================================================================;
!echo DATA LOADING INTO COLLECTMANTAB TABLE;            
!echo ==============================================================================================================================;

LOAD DATA LOCAL INPATH 'CompanyData1.log' OVERWRITE INTO TABLE collectmantab;

!echo ==============================================================================================================================;
!echo SELECTING THE TOP 5 RECORDS FROM COLLECTMANTAB TABLE;            
!echo ==============================================================================================================================;

select * from collectmantab LIMIT 5;

!echo ==============================================================================================================================;
!echo RETRIVING THE DATA FROM COLLECTION DATATYPES OF COLLECTMANTAB;
!echo ==============================================================================================================================;

select companyName.aliasname from collectmantab; -- SELECTING Company Alias Names from CompanyName (struct field)

select companyAddress.state , companyAddress.city from collectmantab; -- SELECTING state & city information from CompanyAddess (struct field)

select PreviousYrs_Revenues[2] from collectmantab; -- SELECTING 3rd Year Revenue Growth from PreviousYrs_Revenues(Array Field)

select growth_Preferences['China'] from collectmantab;
