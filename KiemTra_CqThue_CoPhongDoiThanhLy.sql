-- Mục đích là Kiêm tra Văn Phòng cục, các CCT có Phòng/ đội lưu thiết bị thanh lý hay chưa?
-- Căn cứ vào MaCqThue: MaCqThue nào không có trong này thì chưa có thì phải tạo liền
-- Trường IsThanhLy= True (1), các Phòng Đội khác là False (!!!!!!!!!!!!!!!)
Select MaPhongDoi, TenVietTat, TenPhongDoi, NgayThanhLap, MaCQThue, NgayHetHieuLuc, IsThanhLy
from DMPHONGDOI
where DMPHONGDOI.IsThanhLy=1----'ThanhLy'

-- Có tài khoản người sử dụng Lưu thiết bị Thanh lý chưa (Tài khoản thuộc Phòng/ Đội LƯU THIẾT BỊ THANH LÝ)

Select dmpd.MaPhongDoi, dmpd.TenVietTat, dmpd.TenPhongDoi, nsd.TenDayDu, dmpd.MaCQThue
from DMPHONGDOI dmpd
join LUANCHUYEN lc on (dmpd.MaPhongDoi=lc.MaPhongDoi)
join NGUOISUDUNG nsd on (nsd.MaNSD= lc.MaNSD)
join NGUOISUDUNG_THANHLY nsd_tl ON (nsd_tl.MaNSD=nsd.MaNSD)



