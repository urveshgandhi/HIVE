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


hadoop dfsadmin -safemode leave
cd
echo 1,sai>tfile
echo 2,zeyo>>tfile
hadoop fs -put tfile /user/cloudera/
hive (type and enter)
create database if not exists hdb;
use hdb;
create table ztab(id int,name string) row format delimited fields terminated by ',';
load data inpath '/user/cloudera/tfile' into table ztab;
select * from ztab;
!hadoop fs -ls /user/cloudera/;      

hadoop dfsadmin -safemode leave
cd
echo 1,sai>file1
echo 2,zeyo>>file1
hadoop fs -rmr /user/cloudera/adir
hadoop fs -mkdir /user/cloudera/adir
hadoop fs -put file1 /user/cloudera/adir/
hive (type and enter)
create database if not exists mdb;
use mdb;
create table atab(id int,name string) row format delimited fields terminated by ',' location '/user/cloudera/adir';
select * from atab;
describe formatted atab;

Task 2 ----

hadoop dfsadmin -safemode leave
cd
echo 1,sai>file1
echo 2,zeyo>>file1
echo 3,anil>file2
echo 4,rita>>file2
hadoop fs -rmr /user/cloudera/dir1
hadoop fs -mkdir /user/cloudera/dir1
hadoop fs -rmr /user/cloudera/dir2
hadoop fs -mkdir /user/cloudera/dir2
hadoop fs -put file1 /user/cloudera/dir1/
hadoop fs -put file2 /user/cloudera/dir2/
hive (type and enter)
create database if not exists adb;
use adb;
drop table tab1;
drop table tab2;
create table tab1(id int,name string) row format delimited fields terminated by ',' location '/user/cloudera/dir1';
create table tab2(id int,name string) row format delimited fields terminated by ',' location '/user/cloudera/dir2';
insert into tab1 select * from tab2;
!hadoop fs -ls /user/cloudera/dir1;

### Types of Tables ###

cd
echo 1,sai>data.csv
echo 2,zeyo>>data.csv
hadoop fs -mkdir /user/cloudera/mdir
hadoop fs -mkdir /user/cloudera/edir
hadoop fs -put data.csv /user/cloudera/mdir
hadoop fs -put data.csv /user/cloudera/edir

hive

create table mtab(id int,name string) row format delimited fields terminated by ',' location '/user/cloudera/mdir';

select * from mtab;

create external table etab(id int,name string) row format delimited fields terminated by ',' location '/user/cloudera/edir';

select * from etab;

!hadoop fs -ls /user/cloudera/;
drop table mtab;
drop table etab;
!hadoop fs -ls /user/cloudera/;

cd
echo 1,Sai,I>INDTxns.csv
echo 2,zeyo,I>>INDTxns.csv
echo 3,Hema,K>UKTxns.csv
echo 4,ravi,K>>UKTxns.csv
echo 5,Jai,S>USTxns.csv
echo 6,Swathi,S>>USTxns.csv


hive

create database if not exists pdb;
use pdb;
create table parttab(id int,name string,chk string) partitioned by (country string) row format delimited fields terminated by ',' location '/user/cloudera/pdir';


load data local inpath '/home/cloudera/INDTxns.csv' into table parttab partition(country='INDIA');
load data local inpath '/home/cloudera/USTxns.csv' into table parttab partition(country='USA');
load data local inpath '/home/cloudera/UKTxns.csv' into table parttab partition(country='UK');

select * from parttab;

!hadoop fs -ls /user/cloudera/pdir/;

!hadoop fs -ls /user/cloudera/pdir/country=INDIA;
!hadoop fs -ls /user/cloudera/pdir/country=USA;
!hadoop fs -ls /user/cloudera/pdir/country=UK;








