USE [TDST]
	
	SELECT sum(So_tien) as TongTien
  FROM [TDST].[dbo].[DsGiaoDich] gd
  
  where
  ( Ma_chuong in (Select ch.MaChuong from DmChuong ch where ch.NhomChuong_BC=2 )) 
  
  and (Ma_tmuc  in (Select tm.TieuMuc from DmTieuMuc tm where tm.NhomTieuMuc_BC=1 ))
  

