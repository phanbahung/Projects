USE [ThietBi]
GO
/****** Object:  StoredProcedure [dbo].[rptSoTheoDoiBaoHanhSuaChua_Beta]    Script Date: 12/09/2016 07:19:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[rptBM01_02_BanGiaoThietBi_Beta] 

@MaCqThue char(3),
@TuNgayBDSD datetime,
@DenNgayBDSD datetime


as 

SELECT hstb.MaTB, hstb.SoHieuTb
           , hstb.Mainboard, hstb.Ram, hstb.HDD, hstb.PSU, hstb.Keyboard, hstb.Mouse, hstb.Processor, hstb.Adapter, hstb.Monitor      
           , right(convert(Varchar(10),hstb.NgayCap,103),7) as NgayCap, rtrim(hdct.MaLoaiTB) as MaLoaiTB
           , right(convert(Varchar(10),dc.NgayBDSD,103),7) as NgayBDSD
           , dept.MaPhongDoi, dept.TenVietTat, dept.TenPhongDoi
           , dmtb.TenThietBi,dmtb.MaLoaiTB            
           , dmhd.CapTrangBi, dmhd.SoHieuHD
           , dvcc.TenDonViCC
           , cqthue.TenCqThue, cqThue.District
           , hdct.Model
           , '' as KiTen, '' as GhiChu , dept.TenPhongDoi as DonViSuDung,  dc.NguoiSD as NguoiSuDung// các tên trường GIẢ để tiền thông tin lên báo cáo

            FROM HOSOTHIETBI	    as	hstb 

            JOIN DICHUYEN 		as	dc 	    on (dc.MaTB = hstb.MaTB)and (dc.Status =1)
     
            JOIN DMPHONGDOI 		as 	dept    on (dept.MaPhongDoi=dc.MaPhongDoi)and (dept.IsThanhLy= 0)
            and (dc.MaPhongDoi = CASE ' + maPhongDoi.Trim()' WHEN '0' THEN dc.MaPhongDoi ELSE  + maPhongDoi END)
            and (dept.MaCqThue = CASE ' + maCqThue.Trim()' when 'KHH' THEN dept.MaCqThue ELSE ' + maCqThue.Trim()' END) 
            JOIN DMCOQUANTHUE		as	cqthue	on (cqthue.MaCqThue=dept.MaCqThue)
            JOIN HOPDONGCHITIET 	as 	hdct 	on (hdct.MaModel=hstb.MaModel) 
            and (dc.NgayBDSD>=(CASE ' + @TuNgayBDSD' WHEN '' THEN dc.NgayBDSD ELSE ' + @TuNgayBDSD' END))
            and (dc.NgayBDSD<=(CASE ' + @DenNgayBDSD' WHEN '' THEN dc.NgayBDSD ELSE ' + @DenNgayBDSD' END))
           
            JOIN DMTHIETBI  	as	dmtb	on (dmtb.MaLoaiTB=hdct.MaLoaiTB)
            JOIN DMHOPDONG	as	dmhd	on (dmhd.MaHD=hdct.MaHD)
            and (dmhd.MaHD = CASE ' + maHD' WHEN '0' THEN dmhd.MaHD ELSE  + maHD END)       
            JOIN DMDONVICC	as	dvcc	on (dmhd.MaDonViCC=dvcc.MaDonViCC)
            ORDER BY hdct.MaLoaiTB;




