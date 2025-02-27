use TDST

--==================================================================


DECLARE @Table_TMCanLay TABLE
( TieuMuc char(10),MaDonVi char(10),MaCqThu char(7)  )	

Declare @Id int
Declare @NhomTieuMuc char(255)
Declare @MaDonVi char(10)
Declare @MaCqThu char(7)


--Select NhomTieuMuc from DonVis 
--where IsNull(NhomTieuMuc, '') <> '' -- empty and null

IF OBJECT_ID('tempdb..#Temp', 'U') IS NOT NULL
		DROP TABLE #Temp;

--========== Lay các Nhóm Tiêu muc do các don vi quan lý
Select *
Into  #Temp
From  DonVis
where IsNull(NhomTieuMuc, '') <> '' -- empty and null

--Select * from #Temp

-- Tách các Nhóm TM vào bang [@Table_TMCanLay] : 1 record tuong ung (TM,MaDonVi)
While (Select Count(*) From #Temp) > 0
Begin
    Select Top 1 @Id = Id , @NhomTieuMuc=NhomTieuMuc, @MaDonVi=MaDonVi, @MaCqThu = MaCqThu From #Temp

    --Do some processing here
    INSERT INTO @Table_TMCanLay(TieuMuc,MaDonVi,MaCqThu)
			(
				SELECT ColumnXX as TieuMuc,@MaDonVi as MaDonVi, @MaCqThu as MaCqThu  FROM dbo.fu_String_To_Table(@NhomTieuMuc)
			)
    
    --Do some processing here
    Delete #Temp Where Id = @Id
End


--Select TieuMuc, MaDonVi, MaCqThu from @Table_TMCanLay 
--Select * from GiaoDichs 
--where Ma_tmuc 
--in
--(Select TieuMuc from @Table_TMCanLay)

--======= Cap nhat MaDonVi cua GiaoDich có TM =@Table_TMCanLay
UPDATE  t1
SET     t1.MaDonVi= t2.MaDonVi
FROM    GiaoDichs t1 
INNER JOIN @Table_TMCanLay t2 
ON t1.Ma_tmuc = t2.TieuMuc
and (t1.Ma_cqthu =t2.MaCqThu) ;




update GiaoDichs
set MaDonVi=  -- Cập nhật GiaoDich.MaDonVi =
(	
	-- Select 1 bản ghi bảng NguoiNopThue(MaDonVi) có TuNgay gần nhất
	Select top 1 MaDonVi from NguoiNopThues 
	where NguoiNopThues.MST=GiaoDichs.Tin
	and (GiaoDichs.Ngay_kbac>=NguoiNopThues.TuNgay)
	order by NguoiNopThues.TuNgay desc
)
----- và các GiaDich này có TM không thuộc phòng nào quản lý
where (Ma_tmuc not in (Select TieuMuc from @Table_TMCanLay))



--== Select ra xxem     
Select tin, Ma_tmuc, MaDonVi, Ma_cqthu from GiaoDichs
 --where Ma_tmuc in (Select TieuMuc from @Table_TMCanLay)
 where  Ma_cqthu='1056198'

