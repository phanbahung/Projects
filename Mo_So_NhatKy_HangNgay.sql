USE VanHanhCNTT
GO
/****** Object:  StoredProcedure [dbo].[spDuToan_Create_DuToan]    Script Date: 07/18/2019 09:33:25 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
alter PROCEDURE [dbo].[spNhatKy_Create_Diary_By_Day]	
	@MaCqThue char(3),
	@NgayNhatKy datetime

WITH EXECUTE AS CALLER
AS
BEGIN

--IF OBJECT_ID('tempdb..#Table_NoiDungBaoCao', 'U') IS NOT NULL
--		DROP TABLE #Table_NoiDungBaoCao;
		
		
DECLARE @TempTable_DmCongViec TABLE
( IdCongViec int, TenCongViec nVARCHAR(200),CanCu char(10))	
	
 -- Đưa Dm ccông việc vào bảng ạm tùy theo capThuHien
	INSERT INTO @TempTable_DmCongViec
				(IdCongViec,	TenCongViec,    CanCu)
	SELECT		dmcv.IdCongViec, dmcv.TenCongViec, dmcv.CanCu
	FROM  CongViecs dmcv  	
	Where CapThucHien ='CUC'
	
	
DECLARE @IdCongViec int
DECLARE @TenCongViec nVARCHAR(100)
DECLARE @CanCu char(20)

DECLARE @SQL NVARCHAR(500)
Declare @IdDuToan_New int
Declare @Quy_Count int
Set @Quy_Count =1

--- Tạo dự toán mới và trả về IdDuToan


----Duyệt qua bảng Dmcong viêc
While (Select Count(*) From @TempTable_DmCongViec) > 0
Begin
	Select Top 1 @IdCongViec=IdCongViec, @TenCongViec=TenCongViec, @CanCu=CanCu From @TempTable_DmCongViec
	
	--Do some processing here - BGIN DonVi
	
			INSERT INTO NhatKys(CanCu,IdCongViec,TenCongViec,NgayNhatKy,MaCqThue,KetQua)
			(
				SELECT 
					@CanCu as CanCu,@IdCongViec as IdCongViec, @TenCongViec as TenCongViec
				, @NgayNhatKy as NgayNhatKy ,@MaCqThue as MaCqThue, '0' as KetQua  
				FROM @TempTable_DmCongViec 
				
			)
			
    --Do some processing here - END	DonVi
		
	-- Xóa ID vừa dùng xong
	Delete @TempTable_DmCongViec Where IdCongViec = @IdCongViec	
End -- End while DmCongViec


END
