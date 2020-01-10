
declare @Quy int
set @Quy =1


UPDATE   dt
SET dt.SoThucHien =DBO.fu_TDST_TongHopSoThueThucHien_Theo_NhomCH_TM_MaCqThu(dv.MaCqThu,bctct.IdNhomChuong,bctct.IdNhomTieuMuc,@Quy,'2019')
FROM DuToanChiTiets  dt
INNER JOIN BoChiTieuChiTiets bctct on (dt.IdChiTieu = bctct.IdChitieu)
inner join DonVis dv on (dv.MaDonVi = dt.MaDonVi)
and (dv.Cap=2)and( dt.IdDuToan = 4) and (dt.Quy=@Quy) 

--select dt.*, dv.TenVietTat1, dv.Cap
----SET dt.SoThucHien =DBO.fu_TDST_TongHopSoThueThucHien_Theo_NhomCH_TM_MaCqThu(dv.MaCqThu,bctct.IdNhomChuong,bctct.IdNhomTieuMuc,@Quy,'2019')
--FROM DuToanChiTiets  dt
--INNER JOIN BoChiTieuChiTiets bctct on (dt.IdChiTieu = bctct.IdChitieu)
--inner join DonVis dv on (dv.MaDonVi = dt.MaDonVi)
--and (dv.Cap=2)
--and (dt.IdDuToan = 4) and (dt.Quy=@Quy) 

