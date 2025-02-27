Use ThietBi

UPDATE [ThietBi].[dbo].[HOSOTHIETBI]
SET 
      [SoHieuTB] = SoHieuTB_Old
         
from HOSOTHIETBI hstb1 


-- Cho PC(Monitor ='' va SoHeiuTb='')
UPDATE [ThietBi].[dbo].[HOSOTHIETBI]
SET 
      [SoHieuTB] = ''
      ,[Monitor] =''      
from HOSOTHIETBI hstb1 
join HOPDONGCHITIET hdct  on (hstb1.MaModel = hdct.MaModel) and (hdct.MaLoaiTb='PC') 


-- Cpa nhat Monitor tu SoHieuTb
UPDATE [ThietBi].[dbo].[HOSOTHIETBI]
SET   Monitor = (  

 RIGHT(
		Rtrim(hstb1.SoHieuTB_Old),LEN(Rtrim(hstb1.SoHieuTB_Old))
		-  ( Case CHARINDEX('(',Rtrim(hstb1.SoHieuTB_Old),0) 
			 When 0 Then LEN(Rtrim(hstb1.SoHieuTB_Old))
		 Else  CHARINDEX('(',Rtrim(hstb1.SoHieuTB_Old),0)  End  )				
  )  -- End Right
   ) 
from HOSOTHIETBI hstb1 
join HOPDONGCHITIET hdct  on (hstb1.MaModel = hdct.MaModel) and (hdct.MaLoaiTb='PC') 
 
 
  -- Bỏ dấu ngoạc cuối trong Monitor
 UPDATE [ThietBi].[dbo].[HOSOTHIETBI]
SET Monitor =    REPLACE(hstb2.Monitor,')','')
from HOSOTHIETBI hstb2 
join HOPDONGCHITIET hdct  on (hstb2.MaModel = hdct.MaModel) and (hdct.MaLoaiTb='PC')
 
   --Cpa nhat lại SoHieuTB tu SoHieuTb_Old 
UPDATE [ThietBi].[dbo].[HOSOTHIETBI]
SET   SoHieuTB = REPLACE(hstb3.SoHieuTB_Old,hstb3.Monitor,'')
from HOSOTHIETBI hstb3 
join HOPDONGCHITIET hdct  on (hstb3.MaModel = hdct.MaModel) and (hdct.MaLoaiTb='PC') 
 
   --Cpa nhat lại SoHieuTB tu SoHieuTb_Old 
UPDATE [ThietBi].[dbo].[HOSOTHIETBI]
SET   SoHieuTB = REPLACE(hstb3.SoHieuTB,'()','')
from HOSOTHIETBI hstb3 
join HOPDONGCHITIET hdct  on (hstb3.MaModel = hdct.MaModel) and (hdct.MaLoaiTb='PC') 
	
		
		
Select MaTB ,SoHieuTB_Old ,SoHieuTB,Monitor, CHARINDEX('(',SoHieuTB,0) as ViTri		
from HOSOTHIETBI hstb3 




