!echo ==========================================================;
!echo DISABLING ALL RESERVED KEYWORDS IN HIVE;
!echo ==========================================================;

SET hive.support.sql11.reserved.keywords=false;

!echo ==========================================================;
!echo USING VECTORIZATION TO IMPROVE PERFORMANCE(It will Fetch 1024 Rows at a time);
!echo ==========================================================;

set hive.vectorized.execution.enabled=true;
set hive.vectorized.execution.reduce.enabled=true;

drop table tweetstable;

SET hive.cli.print.header=true;
SET hive.cli.print.current.db=true;

!echo ==========================================================;
!echo              TWEETS TABLE CREATION;
!echo ==========================================================;


CREATE EXTERNAL TABLE tweetstable( 
id BIGINT, 
created_at STRING, 
source STRING, 
favorited BOOLEAN, 
retweet_count INT, 
retweeted_status STRUCT< 
text:STRING, 
user:STRUCT<screen_name:STRING,name:STRING>>, 
entities STRUCT< 
urls:ARRAY<STRUCT<expanded_url:STRING>>, 
user_mentions:ARRAY<STRUCT<screen_name:STRING,name:STRING>>, 
hashtags:ARRAY<STRUCT<text:STRING>>>, 
text STRING, 
user STRUCT< 
screen_name:STRING, 
name:STRING, 
friends_count:INT, 
followers_count:INT, 
statuses_count:INT, 
verified:BOOLEAN, 
utc_offset:INT, 
time_zone:STRING>, 
in_reply_to_screen_name STRING ) 
ROW FORMAT SERDE 'com.cloudera.hive.serde.JSONSerDe' 
LOCATION '/user/WEEK31_FLUMEDATA';

!echo ==========================================================;
!echo               DESCRIPTION OF  TWEETS TABLE;
!echo ==========================================================;

describe formatted tweetstable;

!echo ==========================================================;
!echo               SELECTING FIRST 5 RECORDS OF TWEETS TABLE;
!echo ==========================================================;

add jar /home/gopalkrishna/PRAC/HIVE/hive-serdes-1.0-SNAPSHOT.jar;

select * from tweetstable LIMIT 5;

!echo ==================================================================================================;
!echo                      USER DETAILS  WHO HAS MORE NUMBER OF FOLLOWERS                                      ;
!echo ===================================================================================================;


select user.screen_name, user.followers_count c from tweetstable order by c desc;

!echo ==================================================================================================;
!echo                      USER DETAILS  WHO HAS MORE THAN 100 FOLLOWERS                                ;
!echo ===================================================================================================;

select id,user.screen_name,user.statuses_count from tweetstable WHERE user.followers_count > 100;
