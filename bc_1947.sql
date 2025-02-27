Use ThietBi

Declare @MaCqThue char(3)
Set @MaCqThue='VP'

Declare	@CapTrangBi char(3)
set @CapTrangBi='TCT'

SELECT  dmhd.SoHieuHD, hdct.Model,hdct.MaHD, hdct.MaLoaiTB, dept.MaCQThue,dmtb.STT
, COUNT(hstb.MaTB) as SoLuong
, dbo.fu_Get_NgayCap_Cua_HopDong(hdct.MaHD) as NgayCap

from 

HOSOTHIETBI hstb 
join DICHUYEN	dc on	(dc.MaTB=hstb.MaTB)	 and (dc.Status=1)
join NGUOISUDUNG nsd on	(nsd.MaNSD=dc.MaNSD)
join LUANCHUYEN lc on (lc.MaNSD=nsd.MaNSD) and (lc.Status=1)
join DMPHONGDOI dept on	(lc.MaPhongDoi=dept.MaPhongDoi)


-- Tắt mở - LƯU KHO
--and (dept.TenVietTat='KHO')

-- Tắt mở - ĐANG SỬ DỤNG
and (dept.TenVietTat<>'KHO')

join DMCOQUANTHUE cqthue on (cqthue.MaCqThue=dept.MaCQThue)

AND (dept.MacQThue= CASE @MacQThue when 'KHH' THEN dept.MacQThue ELSE @MacQThue END)

AND  (dept.IsThanhLy=0)-- không phải phòng thanh lý
right JOIN HOPDONGCHITIET as hdct ON  (hstb.MaModel=hdct.MaModel)
right join DMTHIETBI dmtb on (dmtb.MaLoaiTB=hdct.MaLoaiTB)
 

join DMHOPDONG dmhd on (hdct.MaHd=dmhd.MaHD)and (dmhd.NgayHD>='2007-01-01')
AND (dmhd.CapTrangBi= CASE @CapTrangBi when 'ALL' THEN dmhd.CapTrangBi ELSE @CapTrangBi END)


group by dmhd.SoHieuHD,hdct.Model,hdct.MaHD, dmhd.NgayHD,dmhd.MaHD,  hdct.MaLoaiTB, hdct.MaModel,dept.MaCQThue,dmtb.STT 

order by  dmhd.NgayHD  ,dmhd.MaHD, dmtb.STT , hdct.MaModel ASC 