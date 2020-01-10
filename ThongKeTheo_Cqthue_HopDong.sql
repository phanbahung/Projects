SELECT  dmhd.SoHieuHD, hdct.MaLoaiTB, dept.MaCQThue,dmtb.STT, COUNT(hstb.MaTB) as SoLuong

from 

HOSOTHIETBI hstb 
join DICHUYEN	dc on	(dc.MaTB=hstb.MaTB)	 and (dc.Status=1)
join NGUOISUDUNG nsd on	(nsd.MaNSD=dc.MaNSD)
join LUANCHUYEN lc on (lc.MaNSD=nsd.MaNSD) and (lc.Status=1)
join DMPHONGDOI dept on	(lc.MaPhongDoi=dept.MaPhongDoi)
join DMCOQUANTHUE cqthue on (cqthue.MaCqThue=dept.MaCQThue)
and (dept.MacQThue='VP')

AND  (dept.IsThanhLy=0)-- không ph?i phòng thanh lý
 JOIN HOPDONGCHITIET as hdct ON  (hstb.MaModel=hdct.MaModel)
 join DMTHIETBI dmtb on (dmtb.MaLoaiTB=hdct.MaLoaiTB)
AND ((dmtb.maLoaiTB='PC') OR (dmtb.maLoaiTB='LAP') OR (dmtb.maLoaiTB='PRI1') OR (dmtb.maLoaiTB='PRI2') OR (dmtb.maLoaiTB='SWI1') OR (dmtb.maLoaiTB='ROU') ) 
join DMHOPDONG dmhd on (hdct.MaHd=dmhd.MaHD)and (dmhd.NgayHD>='01/01/2013')
and (dmhd.CapTrangBi='TCT')


group by dmhd.SoHieuHD, dmhd.NgayHD,  hdct.MaLoaiTB,dept.MaCQThue,dmtb.STT

order by  dmhd.NgayHD asc ,dmtb.STT asc