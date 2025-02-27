Use TDST
DECLARE @TenVietTat VARCHAR(100)
DECLARE @SQL NVARCHAR(200)
DECLARE @KetQua NVARCHAR(MAX)
SET @KetQua =''

CREATE TABLE #Table_NoiDungBaoCao ( STT int, IdCTBC int, TenChiTieu nvarchar(100))

DECLARE @TempTable_DmDonVi TABLE
(  Id VARCHAR(100))				

-- Đưa vào bảng tạm các ID con (Lãnh đọa) của ID Cha trên
	INSERT INTO @TempTable_DmDonVi(Id)
	SELECT dv.TenVietTat1 FROM DmDonVi dv order by dv.STT
	
	
	--Duyệt qua bảng tạm và tạo tên cột là các đơn vị
	While (Select Count(*) From @TempTable_DmDonVi) > 0
	Begin
		Select Top 1 @TenVietTat=Id From @TempTable_DmDonVi
		
		--Do some processing here
		SET @SQL = 'ALTER TABLE #Table_NoiDungBaoCao ADD '+ @TenVietTat + ' VARCHAR(50) NULL '		
		EXEC sys.sp_executesql @SQL;
		-- Xóa ID vừa chèn
		Delete @TempTable_DmDonVi Where Id = @TenVietTat
	End				
	
	----- Thống kê số thu theo từng chỉ tiêu CH-TM theo từng đơn vị (cq thuế)
	
	----- Đưa số liệu từng chỉ tiêu vào bảng BaoCao						
	INSERT INTO #Table_NoiDungBaoCao
	values('1','2','DNNN ','9994','6','7','8','9','0','3','3','3','3','3','3','3','3','3')
	
	
	Select * from #Table_NoiDungBaoCao
	
	IF OBJECT_ID('tempdb..#Table_NoiDungBaoCao', 'U') IS NOT NULL
		DROP TABLE #Table_NoiDungBaoCao;