
SELECT 
      [Ngay_kbac]
      ,[Ngay_kb]
      ,[Tin]
      ,[Ma_cqthu]
      ,[Ten_nnthue]
      ,[Ma_chuong]
      ,[Ma_tmuc]
      ,[So_tien]
      ,[Tk_co_dtl]
      ,[NgayCapNhat]
  FROM [TDST].[dbo].[DsGiaoDich]
  where Ma_chuong=755
  --and (Ma_tmuc=4254 or Ma_tmuc= 1701)
  AND (Ma_tmuc in 
  (Select TieuMuc from DmTieuMuc dmtm where NhomMTM_BC='GTGT' )
  )