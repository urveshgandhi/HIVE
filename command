create database zeyodb;
!hadoop fs -ls /user/hive/warehouse/;
use zeyodb;
create table ztab(id int);
!hadoop fs -ls /user/hive/warehouse/zeyodb.db/;
TASK 1
hadoop dfsadmin -safemode leave
cd
echo 1,sai>tfile
echo 2,zeyo>>tfile
hive    (enter)
create database if not exists cdb;
use cdb;
create table ztab(id int,name string) row format delimited fields terminated by ',' stored as textfile;
load data local inpath '/home/cloudera/tfile' into table ztab;
select * from ztab;
!hadoop fs -ls /user/hive/warehouse/cdb.db/ztab/;
