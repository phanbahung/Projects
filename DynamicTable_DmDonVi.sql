Use TDST
DECLARE @TenVietTat VARCHAR(100)
DECLARE @SQL NVARCHAR(200)
DECLARE @KetQua NVARCHAR(MAX)
SET @KetQua =''

CREATE TABLE #Table_NoiDungBaoCao ( STT int, IdBCCT int, TenChiTieu nvarchar(100))

DECLARE @TempTable_DmDonVi TABLE
(  Id VARCHAR(100))				

-- Đưa vào bảng tạm các ID con (Lãnh đọa) của ID Cha trên
	INSERT INTO @TempTable_DmDonVi(Id)
	SELECT dv.TenVietTat1 FROM DmDonVi dv order by dv.STT
	
	
	--Duyệt qua bảng tạm
	While (Select Count(*) From @TempTable_DmDonVi) > 0
	Begin
		Select Top 1 @TenVietTat=Id From @TempTable_DmDonVi
		
		--Do some processing here
		SET @SQL = 'ALTER TABLE #Table_NoiDungBaoCao ADD '+ @TenVietTat + ' VARCHAR(50) NULL '
		
		EXEC sys.sp_executesql @SQL;
		
			
		-- Xóa ID vừa chèn
		Delete @TempTable_DmDonVi Where Id = @TenVietTat
	End
			
			
	Select * from #Table_NoiDungBaoCao
	
	IF OBJECT_ID('tempdb..#Table_NoiDungBaoCao', 'U') IS NOT NULL
    DROP TABLE #Table_NoiDungBaoCao;