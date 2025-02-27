Use TDST

----Select @SQL
IF OBJECT_ID('tempdb..#Table_NoiDungBaoCao', 'U') IS NOT NULL
		DROP TABLE #Table_NoiDungBaoCao;
----- 
DECLARE @TempTable_BoChiTieu TABLE
( IdCTBC int, TenChiTieu nvarchar(255), TenNhomCH_TM nvarchar(20),NhomCH int, NhomTM int, STT_ChiTieu int)	

INSERT INTO @TempTable_BoChiTieu(IdCTBC , TenChiTieu ,TenNhomCH_TM,NhomCH , NhomTM,STT_ChiTieu )
						 (SELECT btc.IdCTBC , btc.TenChiTieu,(nhomCH.TenNhomChuong +'-'+nhomTM.TenNhomTieuMuc),  btc.NhomCH, btc.NhomTM , btc.STT 
						FROM dbo.BoChiTieu btc
						join DmNhomChuong nhomCH on (nhomCH.Id= btc.NhomCH)
						join DmNhomTieuMuc nhomTM on (nhomTM.Id= btc.NhomTM) 

	 )
	 

--- Tạo 1 bảng chưa cá số liệu tổng hợp theo CHTM Don vi	
CREATE TABLE #Table_NoiDungBaoCao ( IdCTBC int, NhomCH int, NhomTM int, TenChiTieu nvarchar(100),TenNhomCH_TM nvarchar(50), MaCqThu int, SoThue nvarchar(100), TenDonVi nvarchar(200),STT_ChiTieu int )	

Declare @NhomCH int
Declare @NhomTM int
Declare @STT_ChiTieu int
Declare @TenChiTieu nvarchar(255)
Declare @TenNhomCH_TM nvarchar(50)
Set @TenChiTieu=''

Declare @IdCTBC int
Set @IdCTBC='1'

----Duyệt qua bảng DonVi
While (Select Count(*) From @TempTable_BoChiTieu) > 0
Begin
	Select Top 1 @IdCTBC=IdCTBC ,@TenChiTieu= TenChiTieu,@NhomCH=NhomCH ,
				@NhomTM=NhomTM ,@STT_ChiTieu=STT_ChiTieu, @TenNhomCH_TM=TenNhomCH_TM
	From @TempTable_BoChiTieu
	
	--Do some processing here - BGIN	
	
	Insert into #Table_NoiDungBaoCao (IdCTBC,TenChiTieu,TenNhomCH_TM,TenDonVi,MaCqThu,NhomCH,NhomTM,SoThue,STT_ChiTieu)	
		(SELECT
			@IdCTBC as IdCTBC 
		  , @TenChiTieu as TenChiTieu
		  , @TenNhomCH_TM as TenNhomCH_TM
		  , TenVietTat1 
		  , MaCqThu
		  , @NhomCH as NhomCH
		  , @NhomTM as NhomTM       
		  , dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(dv.MaCqThu,@NhomCH,@NhomTM) as SoThue
		  , @STT_ChiTieu as STT_ChiTieu
		FROM DmDonVi dv where MaCqThu is not null
		)
	
	--Do some processing here - END	
		
	-- Xóa Id vừa dùng xong
	Delete @TempTable_BoChiTieu Where IdCTBC = @IdCTBC	
End  -- End while

-- Select bảng ra 
	Select IdCTBC,TenChiTieu,TenNhomCH_TM,NhomCH,NhomTM,TenDonVi , MaCqThu,SoThue,STT_ChiTieu
	from #Table_NoiDungBaoCao Order by MaCqThu, STT_ChiTieu
----Select @SQL
IF OBJECT_ID('tempdb..#Table_NoiDungBaoCao', 'U') IS NOT NULL
		DROP TABLE #Table_NoiDungBaoCao;