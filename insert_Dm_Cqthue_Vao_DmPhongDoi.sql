INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('KHH','Cục Thuế tỉnh Khánh Hòa','KHH','0','0')

Declare @ID_KHH int
set @ID_KHH =@@Identity

INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('VPC',N'Văn phòng Cục Thuế','VPC',@ID_KHH,'1')
INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('NTR',N'Chi cục Thuế TP. Nha Trang','NTR',@ID_KHH,'1')
INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('CRA',N'Chi cục Thuế TP. Cam Ranh','CRA',@ID_KHH,'1')
INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('NHO',N'Chi cục Thuế TX. Ninh Hòa','NHO',@ID_KHH,'1')
INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('VNI',N'Chi cục Thuế huyện Vạn Ninh','VNI',@ID_KHH,'1')
INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('DKH',N'Chi cục Thuế huyện Diên Khánh','DKH',@ID_KHH,'1')
INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('KVI',N'Chi cục Thuế huyện Khánh Vĩnh','KVI',@ID_KHH,'1')
INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('KSO',N'Chi cục Thuế huyện Khánh Sơn','KSO',@ID_KHH,'1')
INSERT INTO [LichHopCongTac].[dbo].[DmPhongDoiCC]  ([TenVietTat],[TenDayDu],[MaCqThue],IdCha,[Cap])VALUES ('CLA',N'Chi cục Thuế huyện Cam Lâm','CLA',@ID_KHH,'1')

SELECT [Id] ,[IdCha],[TenVietTat],[TenDayDu] ,[MaCqThue] ,Cap     
  FROM [LichHopCongTac].[dbo].[DmPhongDoiCC]
  where Cap =1

