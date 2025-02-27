USE [TDST]
GO
/****** Object:  UserDefinedFunction [dbo].[fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi]    Script Date: 02/20/2019 13:05:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER FUNCTION [dbo].[fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi]
(
      @DonVi int,
      @NhomChuong int,
      @NhomTieuMuc int  
            
)

-- Input  id thành phần
-- Output: iDCha của thành phần trên

RETURNS nvarchar(max)
AS
BEGIN   


DECLARE @KetQua NVARCHAR(MAX)
SET @KetQua = ''

Set @KetQua=
(
  SELECT sum(So_tien) as TongTien
  FROM [TDST].[dbo].[DsGiaoDich] gd
  
  where
  ( 
	Ma_chuong in (Select ch.MaChuong from DmChuong ch where ch.NhomChuong_BC=@NhomChuong ))   
		and 
	(Ma_tmuc  in (Select tm.TieuMuc from DmTieuMuc tm where tm.NhomTieuMuc_BC=@NhomTieuMuc ))
	and 
	(gd.Ma_cqthu=@DonVi	)
  
  
  )
  






Return @KetQua
   
END
