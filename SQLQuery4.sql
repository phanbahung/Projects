

USE [LichHopCongTac]

DECLARE @KetQua NVARCHAR(MAX)
SET @KetQua = ''

DECLARE @Id_Cha NVARCHAR(MAX)
SET @Id_Cha = ''

DECLARE @Id_Cha_Con NVARCHAR(MAX)
SET @Id_Cha_Con = ''

DECLARE @Id NVARCHAR(MAX)
SET @Id = '127'

Set @Id_Cha=(SELECT top 1 IdCha FROM DmPhongDoiCC WHERE Id=@Id)

if(rtrim(@Id_Cha)=rtrim(@Id))--Select N'Phòng' as KetQua	
	SET @Id_Cha_Con = @Id_Cha
else
 	SET @Id_Cha_Con = @Id_Cha +','+ @Id

if (@KetQua!='') 
	SET @KetQua = @KetQua+', ' + @Id_Cha_Con
else 	
	SET @KetQua = @Id_Cha_Con
	
	Set @Id_Cha_Con=''		
 	
	
	
	
	
Select @KetQua

