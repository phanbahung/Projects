SELECT [IdChiTieu]
      ,[TenChiTieu]
      ,[STT]
      ,[IdNhomChuong]
      ,[IdNhomTieuMuc]
      ,[IdBoChiTieu]
      ,dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(4,IdNhomChuong,IdNhomTieuMuc) as SoTien
      
FROM [TDST].[dbo].[ChiTieus]
where IdBoChiTieu =1