/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [MaDiChuyen]
      ,[MaTB]
      ,[MaPhongDoi]
      ,TenphongDoi     
      ,[MaNSD]
      ,[NguoiSD]
      ,[Status]
       ,[NgayBDSD]
      ,[NguoiCapNhat]
      ,[NgayCapNhat]
      ,[MaTepThanhLy]      
      ,[MaLD]
      
  FROM [ThietBi].[dbo].[DICHUYEN]
  --where [MaNSD]= 965
  where MaTB= 9044
  order by MaTB