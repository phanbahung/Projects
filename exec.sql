declare @t table(col1 varchar(10))
insert @t exec spChuong_GetChs_By_NhomCh @NhomCH =3
select * from @t



