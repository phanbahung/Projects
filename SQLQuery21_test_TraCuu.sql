  
  declare @Tuan int
  declare @ThanhPhan char(5)
  
  set @Tuan =0
  Set @ThanhPhan ='145'
  
   SELECT
		IdLich,   
		[NoiDung]
	  ,[ThanhPhan]
	  ,Ten_ThanhPhan
	  ,[ThoiGianHop]
	  ,[DiaDiem]     
	  ,CongVan
	  ,[GhiChu]
      ,convert(Varchar(17),[ThoiGianHop],113) as ThoiGianHop
      , Tuan_ThoiGianHop
      , Thu_ThoiGianHop
      --, ( convert(Varchar(10),[ThoiGianHop],103)  +' ' +  convert(Varchar(5),[ThoiGianHop],108)) as ThoiGianHop
      --  , REPLACE(left(convert(Varchar(10),[ThoiGianHop],108),5),':','h') as ThoiGianHop_HHmm
      --- REPLACE('abcdefghicde','cde','xxx');
    
     
  FROM [LichHopCongTac].[dbo].[Lich]
 where (Nam= '2018')
 and (Tuan_ThoiGianHop= CASE  @Tuan  when '0' THEN Tuan_ThoiGianHop ELSE @Tuan END)
 and 
 (
	--	(ThanhPhan_De_TraCuu like rtrim(@ThanhPhan)+',%') or (Thanhphan like '%,'+rtrim(@ThanhPhan))or (Thanhphan like '%,'+rtrim(@ThanhPhan)+',%')
		(ThanhPhan_De_TraCuu like '145'+',%') or (Thanhphan like '%,'+rtrim(@ThanhPhan))or (Thanhphan like '%,'+rtrim(@ThanhPhan)+',%')
	
 )
 