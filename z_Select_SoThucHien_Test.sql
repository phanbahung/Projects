
SELECT [IdChiTieu]
      ,[TenChiTieu]
      ,[STT]
      ,[IdNhomChuong]
      ,[IdNhomTieuMuc]
      ,[IdBoChiTieu]
      ,dbo.fu_TDST_TongHopSoThueThucHien_Theo_NhomCH_TM_DonVi('5110023',IdNhomChuong,IdNhomTieuMuc,0) as SoTien
      
FROM [TDST].[dbo].[BoChiTieuChiTiets]
where IdBoChiTieu =1
-------------------------


select    t1.*
FROM DuToanChiTiets  t1
INNER JOIN BoChiTieuChiTiets t2
on (t1.IdChiTieu = t2.IdChitieu)
and( t1.IdDuToan =2) and (t1.Quy=0)and (t1.MaDonVi='5110023')

