


Declare @MaDonVi char(10)
Declare @Quy int
Declare @IdDuToan int

Set @MaDonVi='5110011'
Set @Quy=2
Set @IdDuToan=12


SELECT dt.IdDuToan
     , dtct.IdChiTieu
     , bctct.TenChiTieu,bctct.IdNhomChuong , bctct.IdNhomTieuMuc      
      , bctct.STT
      , dtct.SoThue as SoDuToanGiao    
      ,dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(@MaDonVi,IdNhomChuong,IdNhomTieuMuc,@Quy) as SoThucHien
      
     --,ct.STT
     --,bct.IdBoChiTieu, bct.TenBoChiTieu
      
FROM  DuToans dt
join DuToanChiTiets dtct on (dt.IdDuToan =dtct.IdDuToan)
and (dt.IdDuToan=@IdDuToan) and (dtct.MaDonvi=@MaDonVi) and (dtct.Quy=@Quy)
left join BoChiTieuChiTiets bctct on (dtct.IdChiTieu=bctct.IdChiTieu)

order by bctct.STT

--