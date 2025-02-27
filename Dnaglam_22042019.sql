USE [TDST]
GO
/****** Object:  StoredProcedure [dbo].[spBaoCao_TongHopSoThucHien]    Script Date: 04/22/2019 09:56:39 ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
alter PROCEDURE [dbo].[spBaoCao_TongHopSoThucHien_DuToan]
	@IdDuToan int,
	@MaDonVi char(10),
	@Quy int
	
WITH EXECUTE AS CALLER
AS
BEGIN	
	Declare @IdBoChiTieu int
	Declare @IdNhomChuong int
	Declare @IdNhomTieuMuc int
	
	Set @IdBoChiTieu= (select top 1 IdBoChiTieu from dbo.DuToans where IdDuToan=@IdDuToan) 
	
	SELECT ct.IdChiTieu
      ,ct.TenChiTieu
      ,bct.STT
      ,IdNhomChuong
      ,IdNhomTieuMuc
      ,IdBoChiTieu
      ,dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(@MaDonVi,IdNhomChuong,IdNhomTieuMuc,@Quy) as SoTien
      
FROM ChiTieus ct
join ChiTietDuToan ctdt on (ct.IdChiTieu =ct.IdChiTieu )
join BoChiTieus bct on (ct.IdBoChiTieu=bct.IdBoChiTieu)
where IdBoChiTieu =@IdBoChiTieu



END
