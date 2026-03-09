'USEUNIT DBGrids
'USEUNIT Db
'USEUNIT DBTables
'USEUNIT StdCtrls

dim SDreamCaption


sub WordButClick(Sender)

  Set v = CreateOleObject("Word.Application")
  if not IsObject(v) then
    showmessage("Can't start MSWord")
    exit sub
  end if
  v.Visible = true
  v.WordBasic.filenew("normal")
  v.WordBasic.editselectall
  v.selection.Font.name = "Times New Roman"
  v.selection.Font.size = 20
  v.WordBasic.Insert(SDreamCaption)
  for i = 1 to 3
    v.WordBasic.Insert(chr(13) + chr(10))
  next

  v.selection.Font.size = 10
  Set myTable = v.ActiveDocument.Tables.Add(v.Selection.Range, Table1.RecordCount,Table1.FieldCount)
  Table1.First
  for i = 0 to Table1.RecordCount-1
    for j = 0 to  Table1.FieldCount-1
      myTable.Cell(i+1,j+1).Range.InsertAfter(Table1.Fields(j).AsString)
    next
    Table1.Next
  next
end sub

sub ExcelButClick(Sender)
  set v = CreateOleObject("Excel.Application")
  if not isObject(v) then
    showmessage("Can't start MSExcel")
    exit sub
  end if
  v.visible = true
  v.WorkBooks.Add
  v.ActiveSheet.Cells(1,1).Font.Size = 20
  v.ActiveSheet.Cells(1,1) = SDreamCaption
  Table1.First
  s = ""
  while not (Table1.eof)
    for j = 0  to Table1.FieldCount-1
      s = s + Table1.Fields(j).AsString + chr(9)
    next
    s = s+ chr(13)+chr(10)
    Table1.Next
  wend
  v.ActiveSheet.Cells(3,1).Select
  Clipboard.AsText = s
  v.ActiveSheet.Paste
  v.ActiveSheet.Cells(3,1).Select
end sub

Sub FormCreate(Sender)
  SDreamCaption = "Dream Scripter - the power of Active scripting"
End Sub