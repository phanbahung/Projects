Use LichHopCongTac





------------------- Lấy Mã CBCC có trong phòng đội ở thành phần tra cứu
select Id into #temp from dbo.DmPhongDoiCC where IdCha = 11 and Cap =4 and ChucVu<>'nhanvien'

declare @Id char(10)
Select * from #temp
Declare @KetQua nvarchar(max)
Set @KetQua=''

while exists (select * from #temp)
begin
	-- Lấy từng bản ghi
    select @ID = (select top 1 Id  from #temp order by Id asc)
	-- Ghép vô
    If(@KetQua!='')
		Set @KetQua=@KetQua+ ','+rtrim(@ID)
    else
		Set @KetQua=rtrim(@Id)
	--- Xóa bản ghi đó
    delete from #temp where Id = @Id
    

end
drop table #temp
Select rtrim(@KetQua)