use TDST

IF OBJECT_ID('tempdb..#T', 'U') IS NOT NULL
    DROP TABLE #T;
    
DECLARE
    @ColumnName01 VARCHAR(50)
  , @ColumnName02 VARCHAR(50)
  , @ColumnName03 VARCHAR(50)
  , @ColumnName04 VARCHAR(50);
 
SELECT
    @ColumnName01 = '[Sales Person]'
  , @ColumnName02 = '[' + DATENAME(MONTH, GETDATE()) + ' Sales]'
  , @ColumnName03 = '[' + DATENAME(MONTH, DATEADD(MONTH, -1, GETDATE())) + ' Sales]'
  , @ColumnName04 = '[' + DATENAME(MONTH, DATEADD(MONTH, -2, GETDATE())) + ' Sales]';
 
/*
 You cannot create a temp table with 
 dynamic SQL because it will not be 
 available outside the scope of the 
 dynamic SQL call.  
*/
CREATE TABLE #T ( TempColumn INT );
 
/*
 But you can ALTER an existing 
 temp table with Dynamic SQL.
*/
DECLARE @SQL NVARCHAR(200);
 
SET @SQL = 'ALTER TABLE #T ADD ';
SET @SQL += @ColumnName01 + ' VARCHAR(50) NULL, ';
SET @SQL += @ColumnName02 + ' MONEY NULL, ';
SET @SQL += @ColumnName03 + ' MONEY NULL, ';
SET @SQL += @ColumnName04 + ' MONEY NULL ';
 
EXEC sys.sp_executesql @SQL;
 
/*
 Optionally, you can remove any 
 static columns after you've 
 appended the dynamic columns.
*/
ALTER TABLE #T DROP COLUMN TempColumn;
 
INSERT  INTO #T
VALUES
        ( 'Eric', '120.01', '200.32', '345.00' )
 ,      ( 'Ralph', '132.03', '33.3', '341.13' ),
        ( 'David', '987.3', '30.77', '879.00' );
 
SELECT * FROM #T;
 
IF OBJECT_ID('tempdb..#T', 'U') IS NOT NULL
    DROP TABLE #T;