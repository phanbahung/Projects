--Select DateName(WEEKDAY,'2017-12-15') as Thu -- Friday DW tiang Anh
--Select DatePart(dw,'2017-12-17') as ThuTuNgayTrongTuan -- Thứ tự ngáy trng tuần theo số

---- Chế lại: Thứ 2: Đầu tuần; Cuối Tuần : là ngày thứ 6
--Select DATEADD(dd, -(DATEPART(dw, GetDate())-2),GetDate() ) [WeekStart_HanhChinh]
--Select DATEADD(dd, 7-(DATEPART(dw, GetDate()))-1, GetDate() ) [WeekEnd_HanhChinh]

-- Chế lại: Thứ 2: Đầu tuần; Cuối Tuần : là ngày thứ 6
Select DATEADD(dd, -(DATEPART(dw, '2017-12-22')-2),'2017-12-22' ) [WeekStart_HanhChinh]
Select DATEADD(dd, 7-(DATEPART(dw, '2017-12-22'))-1, '2017-12-22') [WeekEnd_HanhChinh]


