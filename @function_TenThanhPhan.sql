Use LichHopCongTac

DECLARE @INSTR as VARCHAR(MAX)
DECLARE @KetQua as NVARCHAR(MAX)
DECLARE @KetQua1 as NVARCHAR(MAX)

SET @INSTR = '14,15,16,'
DECLARE @SEPERATOR as VARCHAR(1)
DECLARE @SP INT
DECLARE @VALUE VARCHAR(1000)
SET @SEPERATOR = ','
CREATE TABLE #tempTab (id int not null)
WHILE PATINDEX('%' + @SEPERATOR + '%', @INSTR ) <> 0 
BEGIN
   SELECT  @SP = PATINDEX('%' + @SEPERATOR + '%',@INSTR)
   SELECT  @VALUE = LEFT(@INSTR , @SP - 1)
   SELECT  @INSTR = STUFF(@INSTR, 1, @SP, '')
   
   SELECT @KetQua = (Select TenDayDu FROM DmPhongDoiCC WHERE id =@Value)
   Set @KetQua1=@KetQua
   
   INSERT INTO #tempTab (id) VALUES (@VALUE)
   
END
SELECT * FROM DmPhongDoiCC WHERE id IN (SELECT id FROM #tempTab)
SELECT @KetQua
SELECT @KetQua1

DROP TABLE #tempTab
