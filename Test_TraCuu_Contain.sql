
	Declare @ThanhPhan int
	Set @ThanhPhan =7
	
	Declare @IdCha_Cua_ThanhPhan int
	Declare @Cap_Cua_ThanhPhan int
	
	Set @IdCha_Cua_ThanhPhan =(	SELECT top 1 IdCha  FROM DmPhongDoiCC where Id=@ThanhPhan)
	Set @Cap_Cua_ThanhPhan =(	SELECT top 1 Cap  FROM DmPhongDoiCC where Id=@ThanhPhan)
	
	
	

if(@Cap_Cua_ThanhPhan=4)--  là CongChuc
Begin	
    SELECT	IdLich,NoiDung ,ThanhPhan,Ten_ThanhPhan ,ThoiGianHop ,DiaDiem
	  ,CongVan	  ,GhiChu
      ,convert(Varchar(17),[ThoiGianHop],113) as ThoiGianHop
      , Tuan_ThoiGianHop , Thu_ThoiGianHop
      
        
	FROM [LichHopCongTac].[dbo].[Lich]
	
	where
	(
	--Input: Phòng; Output: Liệt kê phòng và các thành viên của phòng
	(ThanhPhan_Cha like rtrim(@ThanhPhan)+',%') 
	or (ThanhPhan_Cha like '%,'+rtrim(@ThanhPhan))
	or (ThanhPhan_Cha like '%,'+rtrim(@ThanhPhan)+',%')	
		
 ) 
 End -- phòng