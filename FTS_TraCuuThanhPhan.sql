/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [IdLich]
      ,[NoiDung]
      ,[ThanhPhan]
      ,[ThanhPhan_De_TraCuu]     
      ,[TrangThai]
      ,[GuiEmail_Lan]
      ,[GuiEmail_ThoiGian]
      ,[Email_ThanhPhan]
  FROM [LichHopCongTac].[dbo].[Lich]
  WHERE CONTAINS(ThanhPhan_De_TraCuu, '7')
  
  
--SELECT Description   
--FROM Production.ProductDescription   
--WHERE CONTAINS(Description, @SearchWord); 