USE [QLVanBan]
GO
/****** Object:  StoredProcedure [dbo].[spQLVB_DoiMatKhau]    Script Date: 09/15/2016 13:37:38 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO

ALter PROCEDURE [dbo].[spTDKT_TinhNgayKetThucKiemTra]
@NgayBD datetime
,@SoNgayKT int


AS
BEGIN


Declare @SoNgayNghi1 int
Declare @SoNgayNghi2 int
Declare @NgayKT_Tam datetime
Set @SoNgayNghi1=0
Set @SoNgayNghi2=0
Set @NgayKT_Tam=@NgayBD

 DATEADD(@SoNgayKT,@NgayKT_Tam)

while (@SoNgayNghi2<>@SoNgayNghi1)or(@SoNgayNghi2=0)
BeGin
	
	SELECT @SoNgayNghi1 =isnull(Count(dmNghi.NgayNghi),0)  	
	FROM  DmNgayNghi  dmNghi WHERE (NgayNghi >= @NgayBD )and (NgayNghi <= @NgayKT_Tam)
	-- Cộng thêm ngày nghỉ
	--@NgayKT_Tam= DATE_ADD(@NgayKT_Tam,@SoNgayNghi1 )
	
	SELECT @SoNgayNghi2 =isnull(Count(dmNghi.NgayNghi),0)  	
	FROM  DmNgayNghi  dmNghi WHERE (NgayNghi >= @NgayBD) and (NgayNghi <= @NgayKT_Tam)

	--@NgayKT_Tam= DATE_ADD(@NgayBD,@SoNgayNghi2)	
End

		Select @NgayKT_Tam as NgayKT






END




