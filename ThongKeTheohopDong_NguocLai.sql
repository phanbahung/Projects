Use ThietBi
SELECT distinct dmhd.SoHieuHD, dmhd.NamDuToan,dmhd.NgayHD
                  FROM hopdongchitiet hdct 
                 join DMHOPDONG dmhd on (hdct.MaHD= dmhd.MaHD)                 
                  AND ((hdct.maLoaiTB='PC') OR (hdct.maLoaiTB='LAP') OR (hdct.maLoaiTB='PRI1') 
                OR (hdct.maLoaiTB='PRI2') OR (hdct.maLoaiTB='SWI1') OR (hdct.maLoaiTB='ROU') )                       
                   and (dmhd.NgayHD>='01/01/2012')AND (dmhd.CapTrangBi= 'TCT')   
             Order by dmhd.NgayHD ASC                
