Use ThietBi

SELECT DISTINCT dmhd.SoHieuHD, hdct.MaLoaiTB,dmtb.TenThietBi, dmhd.SohieuHD, dmhd.NamDuToan
                  FROM DMHopDong dmhd
                
                 
                 join hopdongchitiet hdct on (hdct.MaHD= dmhd.MaHD)
                   and (dmhd.NgayHD>='01/01/2012')AND (dmhd.CapTrangBi= 'TCT')
                   join DMTHIETBI dmtb on (dmtb. MaLoaiTB=hdct.MaLoaiTB)
                 
                AND ((hdct.maLoaiTB='PC') OR (hdct.maLoaiTB='LAP') OR (hdct.maLoaiTB='PRI1') 
                OR (hdct.maLoaiTB='PRI2') OR (hdct.maLoaiTB='SWI1') OR (hdct.maLoaiTB='ROU') ) 
               --Group by dmhd.MaHD, hdct.MaLoaiTB, dmtb.TenThietBi, dmhd.SohieuHD, dmhd.NamDuToan
             Order by dmhd.NgayHD ASC                
