Use THIETBi
Select nsd.TenDayDu, dmpd.TenPhongDoi
from dbo.NGUOISUDUNG nsd
join LUANCHUYEN lc on (lc.MaNSD=nsd.MaNSD)
join DMPHONGDOI dmpd on (dmpd.MaPhongDoi=lc.MaPhongDoi)
and (nsd.CongChuc=1)