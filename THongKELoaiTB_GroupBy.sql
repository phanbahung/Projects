 SELECT hdct.MaLoaiTB, dmtb.TenThietBi, count(hdct.MaLoaiTB) as SoLuong
     
       FROM HOSOTHIETBI	    as	hstb 

       JOIN DICHUYEN 		as	dc 	    on (dc.MaTB = hstb.MaTB)and (dc.Status =1)

       JOIN DMPHONGDOI 		as 	dept    on (dept.MaPhongDoi=dc.MaPhongDoi)and (dept.IsThanhLy= 0)
       and (dept.MaCQThue='VP')
       --and (dc.MaPhongDoi = CASE ' + maPhongDoi.Trim() ' WHEN '0' THEN dc.MaPhongDoi ELSE  + maPhongDoi  END)
       --and (dept.MaCqThue = CASE ' + maCqThue.Trim() ' when 'KHH' THEN dept.MaCqThue ELSE ' + maCqThue.Trim() ' END) 
       JOIN DMCOQUANTHUE		as	cqthue	on (cqthue.MaCqThue=dept.MaCqThue)
       JOIN HOPDONGCHITIET 	as 	hdct 	on (hdct.MaModel=hstb.MaModel) 
      --// and (dc.NgayBDSD>=' + tuNgay ')
      --// and (dc.NgayBDSD<=' + denNgay ')
       JOIN DMTHIETBI  	as	dmtb	on (dmtb.MaLoaiTB=hdct.MaLoaiTB)
       JOIN DMHOPDONG	as	dmhd	on (dmhd.MaHD=hdct.MaHD) and (dmhd.MaHD='152')
       
       --and (dmhd.MaHD = CASE ' + maHD ' WHEN '0' THEN dmhd.MaHD ELSE  + maHD  END)
       
       JOIN DMDONVICC	as	dvcc	on (dmhd.MaDonViCC=dvcc.MaDonViCC)
       GROUP BY hdct.MaLoaiTB, dmtb.TenThietBi ORDER BY hdct.MaLoaiTB;