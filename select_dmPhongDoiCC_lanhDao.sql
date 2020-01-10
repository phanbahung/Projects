/****** Script for SelectTopNRows command from SSMS  ******/
SELECT  [Id]
      ,[IdCha]
      ,[TenVietTat]
      ,[TenDayDu]      
      ,[ChucVu]
      ,[DienThoai]
      ,Count(Id) as SoLuong_LanhDao_PhongDoi
      
  FROM [LichHopCongTac].[dbo].[DMPhongDoiCC]
  where  Id=
  (
  
  SELECT DISTINCT Id FROM [LichHopCongTac].[dbo].DMPhongDoiCC WHERE (cap=2 and MaCQThue='vp')
  
  ) 
  
  -- cap=2 and MaCQThue='vp'
  --GROUP BY [Id]      ,[IdCha]      ,[TenVietTat]      ,[TenDayDu]            ,[ChucVu]      ,[DienThoai],SoThuTu
  --Order by SoThuTu
  
--  SELECT 
--[ID],[SKU],[PRODUCT]
--FROM [TestData] 
--WHERE ([PRODUCT] = 
--(SELECT DISTINCT [PRODUCT] FROM [TestData] WHERE ([SKU] LIKE 'FOO-%')) 
--ORDER BY [ID]