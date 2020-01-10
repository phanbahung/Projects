use ThuNghiem
Select 
Sanpham
, COUNT(sanpham) as SoLuongDonHang
, SUM(gia)as TongGiaTriCacDonHang
, SUM(gia)/COUNT(sanpham) as GiaTriTBDonHang_1MatHang

, (SELECT isnull(Count(dh.SanPham),0) 	FROM  DonHang  dh ) as TongSoDonHang

from DonHang

Group by SanPham
