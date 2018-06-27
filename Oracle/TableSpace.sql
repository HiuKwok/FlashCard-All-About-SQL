

--TABLE SPACE construction:
Create Tablespace EXAMPLE
DATAFILE 'path'
SIZE 100M

--ADD extra file FOR existing TABLE SPACE:
Alter Database
ADD DATAFILE 'path'
SIZE 20M

--Expand existing file SIZE
Alter Database
DATAFILE 'path'
RESIZE 20M

--Lowering space (Resize which mentioned above / drop file):
Alter Tablespace EXAMPLE
DropDATAFILE 'path'

--Dynamic resize: 
Create Tablespace EXAMPLE
Datafile'path'
AUTOEXTEND ON
SIZE 100M

--Drop table SPACE
Drop tablespace EXAMPLE
 INCLUDING CONTENTS
  CASCADE CONSTRAINTS
  AND DATAFILES
  
--Local managed table-SPACE

--Auto 
Create Tablespace TBSAUTO
   Extent Managment Local AUTOALLOCATE
   DATAFILE 'path'
      Size 5M AUTOEXTEND OFF
      
--Manual
Create Tablespace TBSAUTO
   Extent Managment Local AUTOALLOCATE
      Uniform Size 16K
   DATAFILE 'path'
      Size 5M AUTOEXTEND OFF
      
      
--Segment space (Auto):
Create Tablespace TBSAUTO
   Extent Managment Local AUTOALLOCATE Uniform Size 16K
    SEGMENT SPACE MANAGEMENT AUTO
   DATAFILE 'path'
      Size 5M AUTOEXTEND OFF
      
--Segment space (Manual):
Create Tablespace TBSAUTO
   Extent Managment Local AUTOALLOCATE Uniform Size 16K
    SEGMENT SPACE MANAGEMENT MANUAL
   DATAFILE 'path'
      Size 5M AUTOEXTEND OFF;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  