SELECT dmhd.SoHieuHD ,dmtb.MaLoaiTB	,dmtb.TenThietBi   
  FROM DMHOPDONG dmhd
  join HOPDONGCHITIET hdct on (hdct.MaHD=dmhd.MaHD)
  and (dmhd.SoHieuHD=N'59/2015/HĐKT/TCT-FPT')
  join DMTHIETBI dmtb on (dmtb.MaLoaiTB=hdct.MaLoaiTB)
  AND ((dmtb.maLoaiTB='PC') OR (dmtb.maLoaiTB='LAP') OR (dmtb.maLoaiTB='PRI1') OR (dmtb.maLoaiTB='PRI2') OR (dmtb.maLoaiTB='SWI1') OR (dmtb.maLoaiTB='ROU') ) 
  order by dmtb.STT asc 
  
  
  
GO


