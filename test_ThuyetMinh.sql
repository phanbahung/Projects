SELECT
 cqthue.MaCqThue, cqthue.TenCqThue,
-------   Số lượng cán bộ thanh tra thuế tại Văn phòng Cục Thuế:  CT[0]

---      + Số lượng cán bộ tại đơn vị dự kiến đến tháng 9/2017 [2]:  CT[2]
dbo.fu_DmPhongDoi_Count_CBCC(cqthue.MaCqThue,'0') as SoLuongCBCC -- Giá trị MaPhongDoi bang 0 để đêm stoanf bộ cơ quan thuế

------      + Số lượng thiết bị còn khấu hao [3]:  CT[3] PC
, dbo.fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','PC','01/01/2017','con','TCT') as ct3_PC_ConKhauHao_TCT_Cap

------      + Số lượng Cục Thuế tự trang bị còn khấu hao [4]:  CT[4]
,'0' as ct4_PC_ConKhauHao_Cuc_Cap
, dbo.fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','PC','01/01/2017','con','CUC') as ct4_PC_ConKhauHao_TCT_Cap

------   + Số lượng thiết bị phục vụ bộ phận 1 cửa:  CT
, '0' as ct61_PC_1_Cua

------   +Số lượng thiết bị phục vụ giám sát hệ thống ATPMC
, '1' as ct62_PC_ATPMC

------   +Số lượng thiết bị phục vụ công tác bảo mật:  CT
, '0' as ct63_PC_BaoMat

------   +Số lượng thiết bị phục vụ đào tạo:  CT
, '0' as ct64_PC_DaoTao

------   +Số lượng thiết bị phục vụ công tác thanh tra, kiểm tra Thuế:  CT
, '0' as ct65_PC_ThanhTraThue

------   +Số lượng thiết bị phục vụ công tác quản lý hệ thống ứng dụng CNTT:  CT
, 'O' as ct66_PC_QuanLyHeThongCNTT

--- Số lượng máy in đáp ứng nhu cầu Cục trưởng, Chi cục trưởng các đơn vị [9]:
, '4' as ct8_PRI_LanhDao

--- Số lượng máy in đáp ứng nhu cầu của cán bộ: [10]:
---, [dbo].fu_NhuCauMayInDapUng07Nguoi1May(dbo.fu_DmPhongDoi_Count_CBCC(cqthue.MaCqThue),dept.SoPhongVatLy)  as ct8_PRI_NhuCauCanBo
,'100' as ct8_PRI_NhuCauCanBo

--- Số lượng máy in đáp ứng nhu cầu dùng chung: [11]:


--- Số lượng máy in còn khấu hao: [12]: 
,( [dbo].fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','PRI1','01/01/2017','con','TCT')
  + [dbo].fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','PRI4','01/01/2017','con','TCT')
)  as ct12_Pri_ConKhauHao

------   +  Số lượng node mạng đáp ứng nhu cầu của cán bộ: [14]:  CT[14]
,dbo.fu_DmPhongDoi_Count_CBCC(cqthue.MaCqThue, '0') as ct14_NodeMang_CBCCz

------   +  Số lượng node mạng đáp ứng số lượng máy in, accesspoint, ip phone: [15]  CT[15]
--,(Select SoPhongVatLy from DMCOQUANTHUE where MaCqThue=cqthue.MaCqThue) as ct15_NodeMang_DungChung
,'10000' as ct15_NodeMang_DungChung

------   +  Số lượng switch còn khấu hao: [18]:  CT[18]
,dbo.fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','SWI','01/01/2017','con','TCT')as ct18_SWI_ConKhauHao

------- Nhu cầu thiết bị router để thay thế thiết bị hết khấu hao [23]:   CT[23]
,dbo.fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','ROU','01/01/2017','het','TCT')as ct23_ROU_ConKhauHao

--- Số lượng máy in A4 còn khấu hao: [26]:	[26]
,dbo.fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','PRI4','01/01/2017','con','TCT')	as ct26_PriA4_ConKhauHao

--- Số lượng máy in A3 còn khấu hao: [27]:	[27]
,dbo.fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','PRI1','01/01/2017','con','TCT')	as ct27_Pri_A3_ConKhauHao

---- Số lượng máy tính còn khấu hao: [32]

,dbo.fu_DmPhongDoi_Count_ThietBi(cqthue.MaCqThue,'0','PC','01/01/2017','con','TCT')	as ct28_PC_ConKhauHao

 
 
 

       
FROM DmCoQuanThue cqthue 

Order by cqthue.SoThuTu