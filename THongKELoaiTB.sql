 SELECT hstb.MaTB, hstb.SoHieuTb
       
       ,right(convert(Varchar(10),hstb.NgayCap,103),7) as NgayCap, rtrim(hdct.MaLoaiTB) as MaLoaiTB
       ,right(convert(Varchar(10),dc.NgayBDSD,103),7) as NgayBDSD
       , dept.MaPhongDoi, dept.TenVietTat,dept.TenPhongDoi
       , dmtb.TenThietBi,dmtb.MaLoaiTB
       , dmhd.CapTrangBi, dmhd.SoHieuHD
       , dvcc.TenDonViCC
       , cqthue.TenCqThue, cqThue.District
       ,hdct.Model
       

        FROM HOSOTHIETBI	    as	hstb 

        JOIN DICHUYEN 		as	dc 	    on (dc.MaTB = hstb.MaTB)and (dc.Status =1)            
      
        JOIN DMPHONGDOI 		as 	dept    on (dept.MaPhongDoi=dc.MaPhongDoi)and (dept.IsThanhLy= 0)
        -- and (dc.MaPhongDoi = CASE ' + maPhongDoi.Trim() ' WHEN '0' THEN dc.MaPhongDoi ELSE  + maPhongDoi  END)
       --  and (dept.MaCqThue = CASE ' + maCqThue.Trim() ' when 'KHH' THEN dept.MaCqThue ELSE ' + maCqThue.Trim() ' END) 
        JOIN DMCOQUANTHUE		as	cqthue	on (cqthue.MaCqThue=dept.MaCqThue)
        JOIN HOPDONGCHITIET 	as 	hdct 	on (hdct.MaModel=hstb.MaModel) 
        --and (dc.NgayBDSD>='')
        --and (dc.NgayBDSD<=' + denNgay ')
        JOIN DMTHIETBI  	as	dmtb	on (dmtb.MaLoaiTB=hdct.MaLoaiTB)       
        JOIN DMHOPDONG	as	dmhd	on (dmhd.MaHD=hdct.MaHD)    and (dmhd.SoHieuHD=N'57/2015/HĐKT/TCT-CMC-ETC')
         
       -- and (dmhd.MaHD = CASE ' + maHD ' WHEN '0' THEN dmhd.MaHD ELSE  + maHD  END)
        JOIN DMDONVICC	as	dvcc	on (dmhd.MaDonViCC=dvcc.MaDonViCC)
        ORDER BY dmtb.MaLoaiTB;
       