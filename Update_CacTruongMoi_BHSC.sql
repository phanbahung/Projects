
Use ThietBi
UPDATE  BAOHANHSUACHUA 
   SET MaPhongDoi = dept.MaPhongDoi,
		TenPhongDoi = dept.TenPhongDoi,
		MaCqThue = dept.MaCQThue,
		TenVietTat = dept.TenVietTat,
		NguoiSD = nsd.TenDayDu
		
		
   
from  HoSoThietBi hstb
			join HopDongChiTiet hdct on (hstb.MaModel=hdct.MaModel) 
		join DMTHIETBI dmtb on (dmtb.MaLoaiTB=hdct.MaLoaiTB)
		join DMHopDong dmhd on (dmhd.MaHD=hdct.MaHD)

		join DICHUYEN dc on (dc.MaTb=hstb.MaTB)and (dc.Status=1)
		join NGUOISUDUNG nsd on (nsd.MaNSD=dc.MaNSD)
		join LuanCHUYEN lc on (lc.MaNSD = nsd.MaNSD)and (lc.Status=1)
		join DMPHONGDOI dept on (lc.MaPhongDoi=dept.MaPhongDoi)
		join DMCOQUANTHUE cqthue on (dept.MaCQThue=cqthue.MaCqThue)
where BAOHANHSUACHUA.MaTB= hstb.MaTB		






