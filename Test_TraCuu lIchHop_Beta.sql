USE [LichHopCongTac]

	Declare @ThanhPhan int
	Set @ThanhPhan = 145
	
	Declare @IdCha_Cua_ThanhPhan int
	Declare @Cap_Cua_ThanhPhan int
	
	Set @IdCha_Cua_ThanhPhan =(	SELECT top 1 IdCha  FROM DmPhongDoiCC where (Id=@ThanhPhan))
	Set @Cap_Cua_ThanhPhan =(	SELECT top 1 Cap    FROM DmPhongDoiCC   where Id=@ThanhPhan)
	

 
if(@Cap_Cua_ThanhPhan=4)-- Input là công chức
 Begin	
    SELECT	IdLich,NoiDung ,ThanhPhan,Ten_ThanhPhan ,ThoiGianHop ,DiaDiem
	  ,ThanhPhan_Cha,ThanhPhan_Con   
	  ,CongVan	  ,GhiChu
      ,convert(Varchar(17),[ThoiGianHop],113) as ThoiGianHop
      ,Tuan_ThoiGianHop , Thu_ThoiGianHop
      
        
	FROM [LichHopCongTac].[dbo].[Lich]
	where	 
	(
		--Input: Phòng Output: Liệt kê và phòng và các thành viên của phòng
		
		(ThanhPhan_Con like rtrim('145')+'%') 
		or (ThanhPhan_Con like rtrim('145')+',%') 
		or (ThanhPhan_Con like '%,'+rtrim('145'))
		or (ThanhPhan_Con like '%,'+rtrim('145')+',%')
		
		
		--(ThanhPhan_Con like rtrim(@ThanhPhan)+',%') 
		--or (ThanhPhan_Con like '%,'+rtrim(@ThanhPhan))
		--or (ThanhPhan_Con like '%,'+rtrim(@ThanhPhan)+',%') 				
		--or	
			
		-- (ThanhPhan_Cha like rtrim(@IdCha_Cua_ThanhPhan)+'%') 
		--OR (ThanhPhan_Cha like rtrim(@IdCha_Cua_ThanhPhan)+',%') 
		--or (ThanhPhan_Cha like '%,'+rtrim(@IdCha_Cua_ThanhPhan))
		--or (ThanhPhan_Cha like '%,'+rtrim(@IdCha_Cua_ThanhPhan)+',%')
	
	) 
 End -- cá nhân

 



