use ThuNghiem
Select 
Sanpham
, COUNT(sanpham) as SoLuongDonHang
, SUM(gia)as TongGiaTriCacDonHang
, SUM(gia)/COUNT(sanpham) as GiaTriTbDonHang

from DonHang

Group by SanPham
