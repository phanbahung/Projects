UPDATE   t1
SET t1.SoThucHien =DBO.fu_TDST_TongHopSoThueThucHien_Theo_NhomCH_TM_DonVi(t1.MaDonVi,t2.IdNhomChuong,t2.IdNhomTieuMuc,1)
FROM DuToanChiTiets  t1
INNER JOIN BoChiTieuChiTiets t2
on (t1.IdChiTieu = t2.IdChitieu)
and( t1.IdDuToan =2) and (t1.Quy=1)