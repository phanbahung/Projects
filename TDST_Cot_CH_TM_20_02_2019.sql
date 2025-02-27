use TDST


DECLARE @TempTable_DmDonVi TABLE
( TenVietTat VARCHAR(100), MaCqThu char(7))	
	
-- Đưa vào bảng tạm các ID con (Lãnh đọa) của ID Cha trên
	--INSERT INTO @TempTable_DmDonVi(TenVietTat,MaCqThu)
	--SELECT dv.TenVietTat1, dv.MaCqThu FROM DmDonVi dv 
	--where dv.MaCqThu is not null order by dv.STT
	
	
--- Tạo 1 bảng chưa cá số liệu tổng hợp theo CHTM Don vi	
CREATE TABLE #Table_NoiDungBaoCao ( IdCTBC int, TenChiTieu nvarchar(100))				
	-- Chèn các dòng IdCTBC, Ten Cot TieuChi vao trước
	INSERT INTO #Table_NoiDungBaoCao(IdCTBC,TenChiTieu)
	SELECT ctbc.IdCTBC,ctbc.TenChiTieu from ChiTieuBaoCao ctbc Order by STT
	

DECLARE @ColumnName VARCHAR(100)
DECLARE @MaCqThu char(7)
DECLARE @SQL NVARCHAR(500)
Set @ColumnName = 'VPC'
Set @MaCqThu = '1056198'

----Duyệt qua bảng DonVi
While (Select Count(*) From @TempTable_DmDonVi) > 0
Begin
	Select Top 1 @ColumnName=TenVietTat, @MaCqThu=MaCqThu From @TempTable_DmDonVi
	
	--Do some processing here - BGIN
	
	-- Tạo cột mới = TenViettat1
SET @SQL = 'ALTER TABLE #Table_NoiDungBaoCao ADD '+ @ColumnName + ' VARCHAR(50) NULL '		
		EXEC sys.sp_executesql @SQL;
		
----- Điền dữ liệu vào cột vừa tạo
SET @SQL = 'UPDATE t1  SET  t1.'+@ColumnName+' = t2.SoThue '
SET @SQL=  @SQL+ ' FROM  #Table_NoiDungBaoCao  t1 '
SET @SQL=  @SQL+ ' INNER JOIN  '
SET @SQL=  @SQL + ' (Select dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi('+@MaCqThu+',ctbc.NhomCH,ctbc.NhomTM) as SoThue, IdCTBC'
SET @SQL=  @SQL + ' FROM ChiTieuBaoCao ctbc join DmNhomChuong nhomCH on (nhomCH.id=ctbc.NhomCH)'
SET @SQL=  @SQL + ' join DmNhomtieuMuc nhomTM on (nhomTM.id=ctbc.NhomTM)) as t2'
SET @SQL=  @SQL + ' ON t1.IdCTBC = t2.IdCTBC'
EXEC sys.sp_executesql @SQL;
	
	--Do some processing here - END
	
		
	-- Xóa ID vừa dùng xong
	Delete @TempTable_DmDonVi Where MaCqThu = @MaCqThu	
End




		
Select * from #Table_NoiDungBaoCao

----Select @SQL
IF OBJECT_ID('tempdb..#Table_NoiDungBaoCao', 'U') IS NOT NULL
		DROP TABLE #Table_NoiDungBaoCao;



--UPDATE t1  SET  t1.VPC = t2.SoThue 
-- FROM  #Table_NoiDungBaoCao  t1 
-- INNER JOIN  
--(
--Select dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(1056198,ctbc.NhomCH,ctbc.NhomTM) as SoThue, IdCTBC
--FROM ChiTieuBaoCao ctbc join DmNhomChuong nhomCH on (nhomCH.id=ctbc.NhomCH)
-- join DmNhomtieuMuc nhomTM on (nhomTM.id=ctbc.NhomTM)
-- ) as t2 ON t1.IdCTBC = t2.IdCTBC


--SELECT 
-- ctbc.IdCTBC,ctbc.TenChiTieu, ctbc.NhomCH, ctbc.NhomTM
-- , nhomCH.TenNhomChuong
-- , nhomTM.TenNhomTieuMuc 

-- ,ISNULL(dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(1056198,ctbc.NhomCH,ctbc.NhomTM),0) as VPCuc
--FROM ChiTieuBaoCao ctbc
--join DmNhomChuong nhomCH on (nhomCH.id=ctbc.NhomCH)
--join DmNhomtieuMuc nhomTM on (nhomTM.id=ctbc.NhomTM)
--order by STT