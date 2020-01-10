Select
dc.MaNSD,nsd.TenDayDu

,dept.TenPhongDoi, dept.MaCqThue, dept.MaPhongDoi, dept.TenVietTat



 from HoSoThietBi hstb


join DICHUYEN dc on (dc.MaTb=hstb.MaTB)and (dc.Status=1) and(hstb.SoHieuTB= '')
join NGUOISUDUNG nsd on (nsd.MaNSD=dc.MaNSD)
join LuanCHUYEN lc on (lc.MaNSD = nsd.MaNSD)and (lc.Status=1)
join DMPHONGDOI dept on (lc.MaPhongDoi=dept.MaPhongDoi)