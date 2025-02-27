use TDST


DECLARE @TempTable_DmDonVi TABLE
( Id int, TenVietTat VARCHAR(100), MaCqThu char(7))				

-- Đưa vào bảng tạm các ID con (Lãnh đọa) của ID Cha trên
	INSERT INTO @TempTable_DmDonVi(Id,TenVietTat,MaCqThu)
	SELECT dv.Id,dv.TenVietTat1, dv.MaCqThu FROM DmDonVi dv order by dv.STT
	
	

SELECT 
 ctbc.IdCTBC,ctbc.TenChiTieu, ctbc.NhomCH, ctbc.NhomTM
 , nhomCH.TenNhomChuong
 , nhomTM.TenNhomTieuMuc 

 ,ISNULL(dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(1056198,ctbc.NhomCH,ctbc.NhomTM),0) as VPCuc
FROM ChiTieuBaoCao ctbc
join DmNhomChuong nhomCH on (nhomCH.id=ctbc.NhomCH)
join DmNhomtieuMuc nhomTM on (nhomTM.id=ctbc.NhomTM)
order by STT




IF OBJECT_ID('tempdb..#TempTable_DmDonVi', 'U') IS NOT NULL
		DROP TABLE #TempTable_DmDonVi;

--SELECT   [TenDonVi] ,[MaCqThu]
-- ,ISNULL(dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(dv.MaCqThu,1,1),0) as CH_TM_1_1
--FROM DmDonVi dv
--where MaCqThu is not null
--Order By STT