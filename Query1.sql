Create database fashion;

use fashion;

Create Table dress(
Dress_ID int,
Style Varchar (30),
Price Varchar (30),
Rating decimal(10,5),
Size Varchar (30),
Season Varchar (30),
NeckLine Varchar (30),
SleeveLength Varchar (30),
waiseline Varchar (30),
Material Varchar (30),
FabricType Varchar (30),
Decoration Varchar (30),
Pattern_Type Varchar (30),
Recommendation int);

Load Data local Infile
"C:/datasets/AttributeDataSet.csv"
into table dress
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 rows;

SHOW GLOBAL VARIABLES LIKE 'LOCAL_INFILE';
set global local_infile = 1;

SELECT * FROM DRESS;

