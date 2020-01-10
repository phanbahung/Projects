

DECLARE @pathName NVARCHAR(512) 
--SET @pathName = 'D:\Users\pbhung.khh\Documents\Visual Studio 2010\Websites\QLTB\QLTB_DB_Backup_' + 
SET @pathName = 'C:\bkQLTB\QLTB_DB_Backup_' + 
	   
       replace(
       replace(
       replace(convert(varchar(16), getdate(), 126),
       '-',''),
       'T',' '),
       ':','h') 

+ '.bak' 
BACKUP DATABASE THIETBI TO  DISK = @pathName WITH NOFORMAT, NOINIT,  NAME = N'QLTB_DB_Backup_', SKIP, NOREWIND, NOUNLOAD,  STATS = 10

