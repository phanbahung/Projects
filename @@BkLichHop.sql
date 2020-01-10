
DECLARE @pathName NVARCHAR(512) 
SET @pathName = 'D:\bk\LichHop_DB_Backup_' + 
	   
       replace(
       replace(
       replace(convert(varchar(16), getdate(), 126),
       '-',''),
       'T','_'),
       ':','h') 

+ '.bak' 

BACKUP DATABASE LichHopCongTac TO  DISK = @pathName WITH NOFORMAT, NOINIT,  NAME = N'LichHop_DB_Backup_', SKIP, NOREWIND, NOUNLOAD,  STATS = 10