DECLARE @DBName NVARCHAR(512) 
DECLARE @pathName NVARCHAR(512) 
DECLARE @Name NVARCHAR(512) 


Set @DBName='TDST'


Set @Name =@DBName+'_DB_Backup'
SET @pathName = 'D:\bk\'+@DBName+'_DB_Backup_' + 
	   
       replace(
       replace(
       replace(convert(varchar(18), getdate(), 113),
       '-',''),
       'T','_'),
       ':','h') 

+ '.bak' 

BACKUP DATABASE @DBName TO  DISK = @pathName WITH NOFORMAT, NOINIT,  NAME = @Name, SKIP, NOREWIND, NOUNLOAD,  STATS = 10