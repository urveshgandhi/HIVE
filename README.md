# HIVE and It's commands
========================================
In Apache Hive, there are several types of tables that can be created:
========================================

--> Internal Tables:
				These are tables where data is stored in the Hive warehouse directory. When you drop an internal table, the data is also deleted.

--> External Tables:
				These tables are linked to data that is stored outside of the Hive warehouse directory. When you drop an external table, the data remains intact.

--> Managed Tables: These are tables that are created using the "CREATE TABLE" command. The metadata for these tables is stored in the Hive metastore, and the data is stored in the Hive warehouse directory.

--> Unmanaged Tables: These tables are created using the "CREATE EXTERNAL TABLE" command. The metadata for these tables is stored in the Hive metastore, but the data is stored outside of the Hive warehouse directory.

--> Partitioned Tables: These tables are partitioned based on a specific column or set of columns. The data is physically stored in different directories based on the partitioning criteria.

--> Bucketed Tables: These tables are organized based on a hash function applied to one or more columns. The data is physically stored in different files based on the hash values.

--> Virtual Tables: These tables are created using Hive's Virtual View feature. They do not actually contain any data themselves but provide a virtual view of data stored in other tables.

=======================================================                                          
   HQL
=======================================================						
--> Structured, semi- strutured
--> Data warehouse on HDFS
--> ELT purpose (Extract Load Transform)
--> Query time parsing
--> Schema on read
--> good for large data
--> good for large data (not good for small data)
========================================================
   SQL
========================================================
--> Handle onky strutured data	
--> Structured Query Language 
--> Database (Not good for large data)	
--> ETL purpose (Extract Transform Load) 
--> Good for small data 
--> Load time parsing
--> Schema on write
