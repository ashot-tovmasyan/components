{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
unit dcDBFilter;

{$I dc.inc}
interface
Uses
  Windows, SysUtils, Classes, DB, DBCommon{$IFNDEF D5},bde{$ENDIF}
  {$IFDEF D6}, Variants {$ENDIF}
  ;

const
//dcInfoDB
  SErrInFilter='Error in filter.';

function ParseFilter(DataSet : TDataSet; const Expr: string; Options : TFilterOptions) : TExprParser;
function EvaluateFilter(DataSet : TDataSet; Parser : TExprParser) : boolean;
Function MatchesMaskEx(const Text,Mask:String;MultiChar,SingleChar:Char;CaseSensitive:Boolean):Boolean;
Function MatchesMask(const Text,Mask:String;CaseSensitive:Boolean):Boolean;

implementation


Function MatchesMaskEx(const Text,Mask:String;MultiChar,SingleChar:Char;CaseSensitive:Boolean):Boolean;
  Function StrIScan(Data:PChar;Chr:Char):PChar;
  Var
    NextCh:Char;
  Begin
    Result:=Data;
    If Not CaseSensitive Then
      Chr:=UpCase(Chr);

    While True Do
    Begin
      If CaseSensitive Then
        NextCh:=Result^
      Else
        NextCh:=UpCase(Result^);
      If NextCh In [#0,Chr] Then
        Break;
      Inc(Result);
    End;
    If Result^=#0 Then
      Result:=Nil;
  End;

  Function _DoIt(Var DataText,DataMask:PChar):Boolean;
  Var
    TempDataText,TempDataMask:PChar;
  Begin
    While True Do
    Begin
      If DataMask^=MultiChar Then
      Begin
        Repeat
          Inc(DataMask);
        Until DataMask^<>MultiChar;
        If DataMask^=#0 Then
        Begin
          Result:=True;
          Exit;
        End
        Else
        Begin
          If DataMask^=SingleChar Then
          Begin
            TempDataText:=DataText;
            TempDataMask:=DataMask;
            While Not _DoIt(TempDataText,TempDataMask) Do
            Begin
              Inc(DataText);
              If DataText^=#0 Then
              Begin
                Result:=False;
                Exit;
              End;
            End;
          End
          Else
          Begin
            Repeat
              DataText:=StrIScan(DataText,DataMask^);
              If DataText=Nil Then
              Begin
                Result:=False;
                Exit
              End;
              TempDataText:=DataText;
              TempDataMask:=DataMask;
              If Not _DoIt(TempDataText,TempDataMask) Then
                Inc(DataText)
              Else
                Break;
            Until False;
          End;
          DataText:=TempDataText;
          DataMask:=TempDataMask;
          Result:=True;
          If DataMask^=#0 Then
            Exit;
        End;
      End
      Else
      Begin
        If DataMask^=SingleChar Then
          Result:=DataText^<>#0
        Else
        Begin
          If CaseSensitive Then
            Result:=DataText^=DataMask^
          Else
            Result:=UpCase(DataText^)=UpCase(DataMask^);
          If Result And (DataText^=#0) Then
            Exit;
        End;
        If Not Result Then
          Exit;
        Inc(DataText);
        Inc(DataMask);
      End
    End;
  End;
Var
  DataText:PChar;
  DataMask:PChar;
Begin
  DataText:=PChar(Text);
  DataMask:=PChar(Mask);
  Result:=_DoIt(DataText,DataMask);
End;

Function MatchesMask(const Text,Mask:String;CaseSensitive:Boolean):Boolean;
Begin
  Result:=MatchesMaskEx(Text,Mask,'*','?',CaseSensitive);
End;

{$IFDEF D5} // Declarations from BDE.INT to avoid BDE usage
{$Z+}
const
  fldUNKNOWN         = 0;
  fldZSTRING         = 1;               { Null terminated string }
  fldDATE            = 2;               { Date     (32 bit) }
  fldBLOB            = 3;               { Blob }
  fldBOOL            = 4;               { Boolean  (16 bit) }
  fldINT16           = 5;               { 16 bit signed number }
  fldINT32           = 6;               { 32 bit signed number }
  fldFLOAT           = 7;               { 64 bit floating point }
  fldBCD             = 8;               { BCD }
  fldBYTES           = 9;               { Fixed number of bytes }
  fldTIME            = 10;              { Time        (32 bit) }
  fldTIMESTAMP       = 11;              { Time-stamp  (64 bit) }
  fldUINT16          = 12;              { Unsigned 16 bit integer }
  fldUINT32          = 13;              { Unsigned 32 bit integer }
  fldFLOATIEEE       = 14;              { 80-bit IEEE float }
  fldVARBYTES        = 15;              { Length prefixed var bytes }
  fldLOCKINFO        = 16;              { Look for LOCKINFO typedef }
  fldCURSOR          = 17;              { For Oracle Cursor type }
  fldINT64           = 18;              { 64 bit signed number }
  fldUINT64          = 19;              { Unsigned 64 bit integer }
  fldADT             = 20;              { Abstract datatype (structure) }
  fldARRAY           = 21;              { Array field type }
  fldREF             = 22;              { Reference to ADT }
  fldTABLE           = 23;              { Nested table (reference) }

const
  FldTypeMap: TFieldMap = (
    fldUNKNOWN, fldZSTRING, fldINT16, fldINT32, fldUINT16, fldBOOL,
    fldFLOAT, fldFLOAT, fldBCD, fldDATE, fldTIME, fldTIMESTAMP, fldBYTES,
    fldVARBYTES, fldINT32, fldBLOB, fldBLOB, fldBLOB, fldBLOB, fldBLOB,
    fldBLOB, fldBLOB, fldCURSOR, fldZSTRING, fldZSTRING, fldINT64, fldADT,
    fldArray, fldREF, fldTABLE, fldBLOB, fldBLOB, fldUNKNOWN, fldUNKNOWN,
    fldUNKNOWN, fldZSTRING {$IFDEF D6}, fldTIME, fldUNKNOWN{$ENDIF}
    );

type
  pCANOp = ^CANOp;
  CANOp  = (
    canNOTDEFINED,                      {                                  (*) }
    canISBLANK,                         { CANUnary;  is operand blank.     (*) }
    canNOTBLANK,                        { CANUnary;  is operand not blank. (*) }
    canEQ,                              { CANBinary, CANCompare; equal.    (*) }
    canNE,                              { CANBinary; NOT equal.            (*) }
    canGT,                              { CANBinary; greater than.         (*) }
    canLT,                              { CANBinary; less than.            (*) }
    canGE,                              { CANBinary; greater or equal.     (*) }
    canLE,                              { CANBinary; less or equal.        (*) }
    canNOT,                             { CANUnary; NOT                    (*) }
    canAND,                             { CANBinary; AND                   (*) }
    canOR,                              { CANBinary; OR                    (*) }
    canTUPLE2,                          { CANUnary; Entire record is operand. }
    canFIELD2,                          { CANUnary; operand is field       (*) }
    canCONST2,                          { CANUnary; operand is constant    (*) }
    canMINUS,                           { CANUnary;  minus. }
    canADD,                             { CANBinary; addition. }
    canSUB,                             { CANBinary; subtraction. }
    canMUL,                             { CANBinary; multiplication. }
    canDIV,                             { CANBinary; division. }
    canMOD,                             { CANBinary; modulo division. }
    canREM,                             { CANBinary; remainder of division. }
    canSUM,                             { CANBinary, accumulate sum of. }
    canCOUNT,                           { CANBinary, accumulate count of. }
    canMIN,                             { CANBinary, find minimum of. }
    canMAX,                             { CANBinary, find maximum of. }
    canAVG,                             { CANBinary, find average of. }
    canCONT,                            { CANBinary; provides a link between two }
    canUDF2,                            { CANBinary; invokes a User defined fn }
    canCONTINUE2,                       { CANUnary; Stops evaluating records }
    canLIKE,                            { CANCompare, extended binary compare       (*) }
    canIN,                              { CANBinary field in list of values }
    canLIST2,                           { List of constant values of same type }
    canUPPER,                           { CANUnary: upper case }
    canLOWER,                           { CANUnary: lower case }
    canFUNC2,                           { CANFunc: Function }
    canLISTELEM2,                       { CANListElem: List Element }
    canASSIGN                           { CANBinary: Field assignment }
  );

  NODEClass = (                         { Node Class }
    nodeNULL,                           { Null node                  (*) }
    nodeUNARY,                          { Node is a unary            (*) }
    nodeBINARY,                         { Node is a binary           (*) }
    nodeCOMPARE,                        { Node is a compare          (*) }
    nodeFIELD,                          { Node is a field            (*) }
    nodeCONST,                          { Node is a constant         (*) }
    nodeTUPLE,                          { Node is a record }
    nodeCONTINUE,                       { Node is a continue node    (*) }
    nodeUDF,                            { Node is a UDF node }
    nodeLIST,                           { Node is a LIST node }
    nodeFUNC,                           { Node is a Function node }
    nodeLISTELEM                        { Node is a List Element node }
  );

{ NODE definitions including misc data structures }
{-------------------------------------------------}

type
  pCANHdr = ^CANHdr;
  CANHdr = packed record                { Header part common to all     (*) }
    nodeClass       : NODEClass;
    canOp           : CANOp;
  end;

  pCANUnary = ^CANUnary;
  CANUnary = packed record              { Unary Node                    (*) }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iOperand1       : Word;             { Byte offset of Operand node }
  end;

  pCANBinary = ^CANBinary;
  CANBinary = packed record             { Binary Node                   (*) }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iOperand1       : Word;             { Byte offset of Op1 }
    iOperand2       : Word;             { Byte offset of Op2 }
  end;

  pCANField = ^CANField;
  CANField = packed record              { Field }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iFieldNum       : Word;
    iNameOffset     : Word;             { Name offset in Literal pool }
  end;

  pCANConst = ^CANConst;
  CANConst = packed record              { Constant }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iType           : Word;             { Constant type. }
    iSize           : Word;             { Constant size. (in bytes) }
    iOffset         : Word;             { Offset in the literal pool. }
  end;

  pCANTuple = ^CANTuple;
  CANTuple = packed record              { Tuple (record) }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iSize           : Word;             { Record size. (in bytes) }
  end;

  pCANContinue = ^CANContinue;
  CANContinue = packed record           { Break Node                    (*) }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iContOperand    : Word;             { Continue if operand is true. }
  end;

  pCANCompare = ^CANCompare;
  CANCompare = packed record            { Extended compare Node (text fields) (*) }
    nodeClass       : NODEClass;
    canOp           : CANOp;            { canLIKE, canEQ }
    bCaseInsensitive : WordBool;        { 3 val: UNKNOWN = "fastest", "native" }
    iPartialLen     : Word;             { Partial fieldlength (0 is full length) }
    iOperand1       : Word;             { Byte offset of Op1 }
    iOperand2       : Word;             { Byte offset of Op2 }
  end;

  pCANFunc = ^CANFunc;
  CANFunc = packed record               { Function }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iNameOffset     : Word;             { Name offset in Literal pool }
    iElemOffset     : Word;             { Offset of first List Element in Node pool }
  end;

  pCANListElem = ^CANListElem;
  CANListElem = packed record           { List Element }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iOffset         : Word;             { Arg offset in Node pool }
    iNextOffset     : Word;             { Offset in Node pool of next ListElem or 0 if end of list }
  end;

{This is the node to be used to pass User defined functions }
const
  iLangSQL           = 0;               { Common SQL dialect }
  iDbaseExpr         = 2;               { This is also the driver ID for dBASE }

type
  pCANUdf = ^CANUdf;
  CANUdf = packed record                { A user defined function }
    nodeClass       : NODEClass;
    canOp           : CANOp;
    iOffSzFuncName  : Word;             { Offset in literal pool to Function Name string(0 terminated) }
    iOperands       : Word;             { Byte offset of Operands (concatenated using canCONT) }
    iDrvDialect     : Word;             { Driver Dialect ID for UDF string supplied }
    iOffSzUDF       : Word;             { Offset in literal pool to UDF string (0 terminated) }
  end;

  pCANList = ^CANList;
  CANList = packed record           { List of Constants }
    nodeClass       : NODEClass; 
    canOp           : CANOp;
    iType           : Word;            { Constant type. }
    iTotalSize      : Word;            { Total list size; }
    iElemSize       : Word;            { Size of each elem for fix-width types }
    iElems          : Word;            { Number of elements in list }
    iOffset         : Word;            { Offset in the literal pool to first elem. }
  end;

  pCANNode = ^CANNode;
  CANNode = packed record
    case Integer of
      0: (canHdr      : CANHdr);
      1: (canUnary    : CANUnary);
      2: (canBinary   : CANBinary);
      3: (canField    : CANField);
      4: (canConst    : CANConst);
      5: (canTuple    : CANTuple);
      6: (canContinue : CANContinue);
      7: (canCompare  : CANCompare);
      8: (canList     : CANList);
      9: (canFunc     : CANFunc);
     10: (canListElem : CANListElem);
  end;

{ Linear exression tree}
{----------------------}

const
  CANEXPRVERSION     = 2;

type
  ppCANExpr = ^pCANExpr;
  pCANExpr  = ^CANExpr;
  CANExpr   = packed record             { Expression Tree }
    iVer            : Word;             { Version tag of expression. }
    iTotalSize      : Word;             { Size of this structure }
    iNodes          : Word;             { Number of nodes }
    iNodeStart      : Word;             { Starting offet of Nodes in this }
    iLiteralStart   : Word;             { Starting offset of Literals in this }
  end;
{$Z-}
{$ENDIF}

function _ParseFilter(DataSet : TDataSet; const Expr: string; Options : TFilterOptions) : TExprParser;
begin
    result := TExprParser.Create(DataSet, Expr, Options{$IFDEF D4}, [], '', nil{$ENDIF}{$IFDEF D5}, FldTypeMap{$ENDIF});
end;

function ParseFilter(DataSet : TDataSet; const Expr: string; Options : TFilterOptions) : TExprParser;
var
  msg : string;
begin
  Try
    result := _ParseFilter(DataSet, Expr, Options);
  Except
    msg := SErrInFilter+#13#10 + Exception(ExceptObject).Message;
    raise Exception.Create(msg);
  End;
end;

type
  TFilterEvaluator = class
  private
    fDataSet : TDataSet;
    fParser  : TExprParser;
    fLiteralStart : integer;
    fNodeStart    : integer;
    fFltData      : integer;
  public
    constructor Create(Dataset : TDataSet; Parser : TExprParser);

    function GetNodeByOffset(offset : integer) : PCanNode;
    function CalculateOffset(offset : integer) : Variant;
    function CalculateNode(node : PCanNode) : Variant;
    function CalculateOperator(Operator : CANOp; Op1, Op2 : Variant) : Variant;
    function CalculateUnary(node : PCANUnary) : Variant;
    function CalculateBinary(node : PCANBinary) : Variant;
    function CalculateCompare(node : PCANCompare) : Variant;
    function CalculateField(node : pCANField) : Variant;
    function CalculateConst(node : pCANConst) : Variant;

    property DataSet : TDataSet read fDataSet write fDataSet;
    property Parser  : TExprParser read fParser write fParser;
    property LiteralStart : integer read fLiteralStart;
    property NodeStart    : integer read fNodeStart;
    property FltData : integer read fFltData;
  end;


constructor TFilterEvaluator.Create(Dataset : TDataSet; Parser : TExprParser);
begin
  inherited Create;
  fDataSet := DataSet;
  fParser := Parser;
  with Parser do
    begin
      fLiteralStart := PCANExpr(FilterData).iLiteralStart;
      fFltData := integer(FilterData);
      fNodeStart := PCANExpr(FilterData).iNodeStart;
    end;
end;

{------------------------------------------------------------------}

function TFilterEvaluator.CalculateOperator(Operator : CANOp; Op1, Op2 : Variant) : Variant;
begin
  case Operator of
    canNOTDEFINED : result := NULL;
    canISBLANK    : result := VarIsNull(Op1);
    canNOTBLANK   : result := not VarIsNull(Op1);
    canEQ         : result := Op1 = Op2;
    canNE         : result := Op1 <> Op2;
    canGT         : result := Op1 > Op2;
    canLT         : result := Op1 < Op2;
    canGE         : result := Op1 >= Op2;
    canLE         : result := Op1 <= Op2;
    canNOT        : result := not Op1;
    canAND        : result := Op1 and Op2;
    canOR         : result := Op1 or Op2;
    canTUPLE2     : result := NULL;                     { CANUnary; Entire record is operand. }
    canFIELD2     : result := NULL;                     { CANUnary; operand is field        }
    canCONST2     : result := Op1;
    canMINUS      : result := - Op1;                     { CANUnary;  minus. }
    canADD        : result := Op1 + Op2;
    canSUB        : result := Op1 - Op2;
    canMUL        : result := Op1 * Op2;
    canDIV        : result := Op1 / Op2;
    canMOD        : result := Op1 mod Op2;
    canREM        : result := Op1 mod Op2;
    canSUM        : result := NULL;                     { CANBinary accumulate sum of. }
    canCOUNT      : result := NULL;                     { CANBinary accumulate count of. }
    canMIN        : result := NULL;                     { CANBinary find minimum of. }
    canMAX        : result := NULL;                     { CANBinary find maximum of. }
    canAVG        : result := NULL;                     { CANBinary find average of. }
    canCONT       : result := NULL;                     { CANBinary; provides a link between two }
    canUDF2       : result := NULL;                     { CANBinary; invokes a User defined fn }
    canCONTINUE2  : result := NULL;                     { CANUnary; Stops evaluating records }
    canLIKE       : result := MatchesMaskEx(Op1,Op2,'%','_',False);                     { CANCompare extended binary compare }
    canIN         : result := NULL;                     { CANBinary field in list of values }
    canLIST2      : result := NULL;                     { List of constant values of same type }
    canUPPER      : result := AnsiUpperCase(Op1);
    canLOWER      : result := AnsiLowerCase(Op1);
    canFUNC2      : result := NULL;                     { CANFunc: Function }
    canLISTELEM2  : result := NULL;                     { CANListElem: List Element }
    canASSIGN     : result := NULL;                     { CANBinary: Field assignment }
  end;
end;

{------------------------------------------------------------------}

function TFilterEvaluator.GetNodeByOffset(offset : integer) : PCanNode;
begin
  result := PCanNode(FltData + offset);
end;

{------------------------------------------------------------------}

function TFilterEvaluator.CalculateUnary(node : PCANUnary) : Variant;
begin
  with node^ do
    result := CalculateOperator(canOp, CalculateOffset(iOperand1), UnAssigned);
end;

{------------------------------------------------------------------}

function TFilterEvaluator.CalculateBinary(node : PCANBinary) : Variant;
begin
  with node^ do
    result := CalculateOperator(canOp, CalculateOffset(iOperand1), CalculateOffset(iOperand2));
end;

{------------------------------------------------------------------}

function TFilterEvaluator.CalculateCompare(node : PCANCompare) : Variant;
begin

end;

{------------------------------------------------------------------}

function TFilterEvaluator.CalculateField(node : pCANField) : Variant;
var
  FieldName : string;
  Field     : TField;
begin
  FieldName := PChar(FltData + LiteralStart + node.iNameOffset);
  Field := DataSet.FieldByName(FieldName);
  result := Field.Value;
end;

{------------------------------------------------------------------}

function TFilterEvaluator.CalculateConst(node : pCANConst) : Variant;
type
  PWordBool = ^WordBool;
  PSmallInt = ^SmallInt;
var
  offs : integer;
  TimeStamp : TTimeStamp;
  DateData  : double;
begin
  with node^ do
    begin
      offs := FltData + LiteralStart + iOffset;

      case iType of
        fldUNKNOWN   : result := NULL;

        fldZSTRING   : result := StrPas(PChar(offs));

        fldDATE      : begin
                         DWORD(TimeStamp.Date) := PDWORD(offs)^;
                         TimeStamp.Time := 0;
                         result := TimeStampToDateTime(TimeStamp);
                       end;

        fldBLOB      : result := NULL;               { Blob }

        fldBOOL      : result := PWordBool(offs)^;   { Boolean  (16 bit) }

        fldINT16     : result := PSmallInt(offs)^;

        fldINT32     : result := PInteger(offs)^;               { 32 bit signed number }

        fldFLOAT     : result := PDouble(offs)^;               

        fldBCD       : result := NULL;               { BCD }

        fldBYTES     : result := NULL;               { Fixed number of bytes }

        fldTIME      : begin
                         DWORD(TimeStamp.Time) := PDWORD(offs)^;
                         TimeStamp.Date := 0;
                         result := TimeStampToDateTime(TimeStamp);
                       end;

        fldTIMESTAMP : begin
                         DateData := PDouble(offs)^;
                         result := TimeStampToDateTime(MSecsToTimeStamp(DateData));
                       end;

        fldUINT16    : result := PWord(offs)^;

        fldUINT32    : result := PInteger(offs)^;     { Unsigned 32 bit integer }

        fldFLOATIEEE : result := NULL;              { 80-bit IEEE float }

        fldVARBYTES  : result := NULL;              { Length prefixed var bytes }

        fldLOCKINFO  : result := NULL;              { Look for LOCKINFO typedef }

        fldCURSOR    : result := NULL;              { For Oracle Cursor type }

        {$IFDEF D4}
        fldINT64     : result := NULL;              { 64 bit signed number }

        fldUINT64    : result := NULL;              { Unsigned 64 bit integer }

        fldADT       : result := NULL;              { Abstract datatype (structure) }

        fldARRAY     : result := NULL;              { Array field type }

        fldREF       : result := NULL;              { Reference to ADT }

        fldTABLE     : result := NULL;              { Nested table (reference) }
        {$ENDIF}
      end;
    end;
end;


{------------------------------------------------------------------}

function TFilterEvaluator.CalculateNode(node : PCanNode) : Variant;
begin
  case PCanHdr(node).nodeClass of
    nodeNULL     : result := NULL;
    nodeUNARY    : result := CalculateUnary(PCANUnary(node));
    nodeBINARY   : result := CalculateBinary(PCANBinary(node));
    nodeCOMPARE  : result := CalculateCompare(pCANCompare(node));
    nodeFIELD    : result := CalculateField(pCANField(node));
    nodeCONST    : result := CalculateConst(pCANConst(node));
    nodeTUPLE    : result := NULL;
    nodeCONTINUE : result := NULL;
    nodeUDF      : result := NULL;
    nodeLIST     : result := NULL;
    nodeFUNC     : result := NULL;
    nodeLISTELEM : result := NULL;
  end;
end;

{------------------------------------------------------------------}

function TFilterEvaluator.CalculateOffset(offset : integer) : Variant;
begin
  result := CalculateNode(GetNodeByOffset(NodeStart + offset));
end;

{******************************************************************}

function EvaluateFilter(DataSet : TDataSet; Parser : TExprParser) : boolean;
var
  pRoot      : PCanNode;
begin
  with TFilterEvaluator.Create(Dataset, Parser) do
    try
      pRoot := GetNodeByOffset(PCANExpr(Parser.FilterData).iNodeStart);
      result := CalculateNode(pRoot);
    finally
      Free;
    end;
end;

end. 
