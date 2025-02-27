USE LichHopCongTac
GO
/****** Object:  Trigger [dbo].[trigThayDoiHOSOTHIETBI]    Script Date: 02/01/2018 11:15:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER TRIGGER [dbo].[trigThayDoi_Table_Lich]
   ON [dbo].[Lich]
  for  UPDATE, Insert , Delete
AS 
BEGIN
	Declare @TableName char(20)
	Declare @FieldName char(50)
	Declare @OldValue nvarchar(200)
	Declare @NewValue nvarchar(200)
	Declare @UserUpdate char(30)
	Declare @IDValue int
	Declare @MaCqThue char(3)

	If (update(NoiDung))
	Begin
		Set @TableName = 'Lich'
		Set @FieldName ='NoiDung'
		Set @OldValue =(Select NoiDung from deleted)
		Set @NewValue = (Select NoiDung from inserted)
		Set @UserUpdate =(Select NguoiCapNhat from inserted)
		Set @IDValue =(Select IdLich from inserted)
		
		Set @MaCqThue = (Select top 1 MaCqThue from Lich where (IdLich=@IDValue)
		)
		
		if(@OldValue<>@NewValue)
		insert into dbo.NHATKY_THAYDOI 
			(IDValue,TableName,FieldName, TimeUpdate,OldValue, NewValue , UserUpdate ,MaCqThue) 
		values	(@IDValue, @TableName, @FieldName, getdate(),@OldValue,@NewValue,@UserUpdate, @MaCqThue)		
	End
	
	
	If (update(Ten_ThanhPhan))
	Begin
		Set @TableName = 'Lich'
		Set @FieldName ='Monitor'
		Set @OldValue =(Select Ten_ThanhPhan from deleted)
		Set @NewValue = (Select Ten_ThanhPhan from inserted)
		Set @UserUpdate =(Select NguoiCapNhat from inserted)
		Set @IDValue =(Select Ten_ThanhPhan from inserted)
		
		Set @MaCqThue = (Select top 1 MaCqThue from Lich where (IdLich=@IDValue)
		
		if(@OldValue<>@NewValue)
		insert into dbo.NHATKY_THAYDOI 
			(IDValue,TableName,FieldName, TimeUpdate,OldValue, NewValue,UserUpdate ,MaCqThue) 
		values	(@IDValue, @TableName, @FieldName, getdate(),@OldValue,@NewValue,@UserUpdate, @MaCqThue)
		
	End

	If (update(NgayCap))
	Begin
		Set @TableName = 'Lich'
		Set @FieldName ='NgayCap'
		Set @OldValue =(Select NgayCap from deleted)
		Set @NewValue =(Select NgayCap from inserted)
		Set @UserUpdate =(Select NguoiCapNhat from inserted)
		Set @IDValue =(Select MaTB from inserted)

		Set @MaCqThue = (Select top 1 MaCqThue from Lich where (IdLich=@IDValue))

		if(@OldValue<>@NewValue)
		insert into dbo.NHATKY_THAYDOI 
			(IDValue,TableName,FieldName, TimeUpdate,OldValue, NewValue,UserUpdate ,MaCqThue) 
		values	(@IDValue, @TableName, @FieldName, getdate(),@OldValue,@NewValue,@UserUpdate, @MaCqThue)	
		
	End

	If (update(TinhTrangTB))
	Begin
		Set @TableName = 'Lich'
		Set @FieldName ='TinhTrangTB'
		Set @OldValue =(Select TinhTrangTB from deleted)
		Set @NewValue =(Select TinhTrangTB from inserted)
		Set @UserUpdate =(Select NguoiCapNhat from inserted)
		Set @IDValue =(Select MaTB from inserted)	
		
		Set @MaCqThue = (Select top 1 MaCqThue from Lich where (IdLich=@IDValue)

		if(@OldValue<>@NewValue)
		insert into dbo.NHATKY_THAYDOI 
			(IDValue,TableName,FieldName, TimeUpdate,OldValue, NewValue,UserUpdate ,MaCqThue) 
		values	(@IDValue, @TableName, @FieldName, getdate(),@OldValue,@NewValue,@UserUpdate, @MaCqThue)
	
	End

If (update(GhiChu))
	Begin
		Set @TableName = 'Lich'
		Set @FieldName ='GhiChu'
		Set @OldValue =(Select GhiChu from deleted)
		Set @NewValue =(Select GhiChu from inserted)
		Set @UserUpdate =(Select NguoiCapNhat from inserted)
		Set @IDValue =(Select MaTB from inserted)

		Set @MaCqThue = (Select top 1 MaCqThue from Lich where (IdLich=@IDValue)

		if(@OldValue<>@NewValue)
		insert into dbo.NHATKY_THAYDOI 
			(IDValue,TableName,FieldName, TimeUpdate,OldValue, NewValue,UserUpdate ,MaCqThue) 
		values	(@IDValue, @TableName, @FieldName, getdate(),@OldValue,@NewValue,@UserUpdate, @MaCqThue)	
		
	End

If (update(MaModel))
	Begin
		Set @TableName = 'Lich'
		Set @FieldName ='MaModel'
		Set @OldValue =(Select MaModel from deleted)
		Set @NewValue =(Select MaModel from inserted)
		Set @UserUpdate =(Select NguoiCapNhat from inserted)
		Set @IDValue =(Select MaTB from inserted)

		Set @MaCqThue = (Select top 1 MaCqThue from Lich where (IdLich=@IDValue)

		if(@OldValue<>@NewValue)
		insert into dbo.NHATKY_THAYDOI 
			(IDValue,TableName,FieldName, TimeUpdate,OldValue, NewValue,UserUpdate ,MaCqThue) 
		values	(@IDValue, @TableName, @FieldName, getdate(),@OldValue,@NewValue,@UserUpdate, @MaCqThue)	
		
	End

--	Set @MaCqThue = 
--	(
--		Select top 1 dept.MaCqThue from HOSOTHIETBI hstb join DICHUYEN dc ON (hstb.MaTB= dc.MaTB) and (dc.Status=1)
--		join DMPHONGDOI dept on (dept.MaPhongDoi=dc.MaPhongDoi) and (hstb.MaTB=@IDValue)
--	)

--	if(@OldValue<>@NewValue)
--		insert into dbo.NHATKY_THAYDOI 
--			(IDValue,TableName,FieldName, TimeUpdate,OldValue, NewValue,UserUpdate)-- ,MaCqThue) 
--		values	(@IDValue, @TableName, @FieldName, getdate(),@OldValue,@NewValue,@UserUpdate)--, @MaCqThue)

		
END

