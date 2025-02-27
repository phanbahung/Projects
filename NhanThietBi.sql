SELECT hstb.MaTB, hstb.SoHieuTb
           , (right(convert(Varchar(10),hstb.NgayCap,103),7)) as NgayCap, rtrim(hdct.MaLoaiTB) as MaLoaiTB
          
           , dept.TenVietTat, dept.TenPhongDoi
           , (rtrim(dmtb.TenThietBi) + ' ' + rtrim(hdct.Model)) as TenThietBi ,dmtb.MaLoaiTB
           , dmhd.SoHieuHD
          
           , dc.NguoiSD
           
           , '' as ThoiGianKeKhai , '' as MaTaiSan
from
       HOSOTHIETBI hstb 

join DICHUYEN	dc on	(dc.MaTB=hstb.MaTB)	 and (dc.Status=1)
join NGUOISUDUNG nsd on	(nsd.MaNSD=dc.MaNSD)

join LUANCHUYEN lc on (lc.MaNSD=nsd.MaNSD) and (lc.Status=1)

inner join DMPHONGDOI dept on	(lc.MaPhongDoi=dept.MaPhongDoi) and (dept.MaPhongDoi=77)

--AND  (dept.MaPhongDoi= CASE @MaPhongDoi when 0 THEN dept.MaPhongDoi ELSE @MaPhongDoi END)
--AND  (dept.MaCqThue= CASE @MaCqThue when 'KHH' THEN dept.MaCqThue ELSE @MaCqThue END)
AND  (dept.IsThanhLy=0)-- không phải phòng thanh lý

INNER JOIN HOPDONGCHITIET as hdct ON  (hstb.MaModel=hdct.MaModel)
--AND (hdct.MaLoaiTB= CASE  @MaLoaiTB  when '' THEN hdct.MaLoaiTB ELSE @MaLoaiTB END)  
--AND (hdct.MaHD= CASE  @MaHD  when '0' THEN hdct.MaHD ELSE @MaHD END) 

join DMHOPDONG dmhd on (hdct.MaHd=dmhd.MaHD)
join DMTHIETBI dmtb on (dmtb.MaLoaiTB=hdct.MaLoaiTB)
