use TDST

DECLARE @SQL NVARCHAR(max)

Declare @Column_CHTM varchar(50)
Set @Column_CHTM='CH_TM_1_1'

Declare @CH varchar(10)
Set @CH='1'

Declare @TM varchar(10)
Set @TM='1'

SET @SQL = 'SELECT   [TenDonVi] ,[MaCqThu]
      ,dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(dv.MaCqThu,'+@CH+',+'+@TM+') as '+@Column_CHTM+'
	FROM DmDonVi dv	where MaCqThu is not null	Order By STT'	
	
EXEC sys.sp_executesql @SQL;

	--SELECT   [TenDonVi] ,[MaCqThu]
 --     ,ISNULL(dbo.fu_TDST_TongHopSoThue_Theo_NhomCH_TM_DonVi(dv.MaCqThu,1,1),0) as CH_TM_1_1
	--FROM DmDonVi dv
	--where MaCqThu is not null
	--Order By STT
	
		
		
		
		
		
	--Select * from #Table_NoiDungBaoCao
	
	--IF OBJECT_ID('tempdb..#Table_NoiDungBaoCao', 'U') IS NOT NULL
	--	DROP TABLE #Table_NoiDungBaoCao;