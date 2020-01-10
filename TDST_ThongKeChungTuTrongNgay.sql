/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [Ngay_kbac]
      , COUNT(distinct(Khct_soct)) SoLuongChungTu
      , Ma_cqthu
  FROM [TDST].[dbo].[DsGiaoDich]
  where Ma_chuong=554
  group by Ngay_kbac,Ma_cqthu
  order by Ngay_kbac
  
  
--  select makhoa 'Mã khoa','Mã sinh viên'=count(masv)
-- from dmsv
-- groupby makhoa
