--UPDATE 
--     t1
--SET 
--     t1.column = t2.column
--FROM 
--     Table1 t1 
--     INNER JOIN Table2 t2 
--     ON t1.id = t2.id;
     
use TDST

--UPDATE  t1
--SET		t1.MaDonVi = t2.MaDonVi
--FROM   GiaoDichs t1 
--INNER JOIN NguoiNopThues t2   ON t1.Tin = t2.MST

update GiaoDichs
set MaDonVi=
(	Select top 1 MaDonVi from NguoiNopThues 
	where GiaoDichs.Tin= NguoiNopThues.MST
	and (GiaoDichs.Ngay_kbac>=NguoiNopThues.TuNgay)
	order by NguoiNopThues.TuNgay desc
)

Select tin , madonvi,Ngay_kbac from GiaoDichs where tin ='0100101072-012 '

Select MSt, madonvi, TuNgay , DenNgay from NguoiNopThues where mst ='0100101072-012'
order by TuNgay desc
     
     