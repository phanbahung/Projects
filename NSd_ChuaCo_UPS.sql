SELECT hstb.MaTB, hstb.Monitor, rtrim(hstb.SoHieuTB) as SoHieuTB	
		, dept.TenPhongDoi ,dept.MaCqThue, dept.TenViettat 
		, hdct.MaLoaiTB, hdct.Model	
		, nsd.TenDayDu
		,dmhd.SoHieuHD

from 

HOSOTHIETBI hstb 

join DICHUYEN	dc on	(dc.MaTB=hstb.MaTB)	 and (dc.Status=1)
join NGUOISUDUNG nsd on	(nsd.MaNSD=dc.MaNSD)


join LUANCHUYEN lc on (lc.MaNSD=nsd.MaNSD) and (lc.Status=1)

inner join DMPHONGDOI dept on	(lc.MaPhongDoi=dept.MaPhongDoi)

AND  (dept.MaPhongDoi= CASE @MaPhongDoi when 0 THEN dept.MaPhongDoi ELSE @MaPhongDoi END)
AND  (dept.MaCqThue= CASE @MaCqThue when 'KHH' THEN dept.MaCqThue ELSE @MaCqThue END)
AND  (dept.IsThanhLy=0)-- không phải phòng thanh lý

INNER JOIN HOPDONGCHITIET as hdct ON  (hstb.MaModel=hdct.MaModel)
AND (hdct.MaLoaiTB= 'UPS')  
AND (hdct.MaHD= CASE  @MaHD  when '0' THEN hdct.MaHD ELSE @MaHD END) 

join DMHOPDONG dmhd on (hdct.MaHd=dmhd.MaHD)