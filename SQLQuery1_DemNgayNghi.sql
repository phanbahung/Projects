/****** Script for SelectTopNRows command from SSMS  ******/
use QLVanBan
SELECT Count(NgayNghi), NgayNghi
      
  FROM [QLVanBan].[dbo].[DmNgayNghi]
  where (NgayNghi > '16/09/2016') and (NgayNghi < '25/09/2016')