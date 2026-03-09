{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit RICHEDIT_D4;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  activex,
  classes,
  dcscript,
  dcsystem,
  dcdreamlib,
  Messages,
  Windows,
  RichEdit;
function Convert_charrangeToVariant(var R : _charrange) : OleVariant;
function ConvertVariantTo_charrange(const V : OleVariant) : _charrange;
function Convert_compcolorToVariant(var R : _compcolor) : OleVariant;
function ConvertVariantTo_compcolor(const V : OleVariant) : _compcolor;
function Convert_editstreamToVariant(var R : _editstream) : OleVariant;
function ConvertVariantTo_editstream(const V : OleVariant) : _editstream;
function Convert_encorrecttextToVariant(var R : _encorrecttext) : OleVariant;
function ConvertVariantTo_encorrecttext(const V : OleVariant) : _encorrecttext;
function Convert_enprotectedToVariant(var R : _enprotected) : OleVariant;
function ConvertVariantTo_enprotected(const V : OleVariant) : _enprotected;
function Convert_ensaveclipboardToVariant(var R : _ensaveclipboard) : OleVariant;
function ConvertVariantTo_ensaveclipboard(const V : OleVariant) : _ensaveclipboard;
function Convert_formatrangeToVariant(var R : _formatrange) : OleVariant;
function ConvertVariantTo_formatrange(const V : OleVariant) : _formatrange;
function Convert_msgfilterToVariant(var R : _msgfilter) : OleVariant;
function ConvertVariantTo_msgfilter(const V : OleVariant) : _msgfilter;
function Convert_paraformatToVariant(var R : _paraformat) : OleVariant;
function ConvertVariantTo_paraformat(const V : OleVariant) : _paraformat;
function Convert_punctuationToVariant(var R : _punctuation) : OleVariant;
function ConvertVariantTo_punctuation(const V : OleVariant) : _punctuation;
function Convert_repastespecialToVariant(var R : _repastespecial) : OleVariant;
function ConvertVariantTo_repastespecial(const V : OleVariant) : _repastespecial;
function Convert_selchangeToVariant(var R : _selchange) : OleVariant;
function ConvertVariantTo_selchange(const V : OleVariant) : _selchange;
function ConvertCHARRANGEToVariant(var R : CHARRANGE) : OleVariant;
function ConvertVariantToCHARRANGE(const V : OleVariant) : CHARRANGE;
function ConvertCOMPCOLORToVariant(var R : COMPCOLOR) : OleVariant;
function ConvertVariantToCOMPCOLOR(const V : OleVariant) : COMPCOLOR;
function ConvertEDITSTREAMToVariant(var R : EDITSTREAM) : OleVariant;
function ConvertVariantToEDITSTREAM(const V : OleVariant) : EDITSTREAM;
function ConvertENCORRECTTEXTToVariant(var R : ENCORRECTTEXT) : OleVariant;
function ConvertVariantToENCORRECTTEXT(const V : OleVariant) : ENCORRECTTEXT;
function ConvertENPROTECTEDToVariant(var R : ENPROTECTED) : OleVariant;
function ConvertVariantToENPROTECTED(const V : OleVariant) : ENPROTECTED;
function ConvertENSAVECLIPBOARDToVariant(var R : ENSAVECLIPBOARD) : OleVariant;
function ConvertVariantToENSAVECLIPBOARD(const V : OleVariant) : ENSAVECLIPBOARD;
function ConvertFORMATRANGEToVariant(var R : FORMATRANGE) : OleVariant;
function ConvertVariantToFORMATRANGE(const V : OleVariant) : FORMATRANGE;
function ConvertMSGFILTERToVariant(var R : MSGFILTER) : OleVariant;
function ConvertVariantToMSGFILTER(const V : OleVariant) : MSGFILTER;
function ConvertPARAFORMATToVariant(var R : PARAFORMAT) : OleVariant;
function ConvertVariantToPARAFORMAT(const V : OleVariant) : PARAFORMAT;
function ConvertPUNCTUATIONToVariant(var R : PUNCTUATION) : OleVariant;
function ConvertVariantToPUNCTUATION(const V : OleVariant) : PUNCTUATION;
function ConvertREPASTESPECIALToVariant(var R : REPASTESPECIAL) : OleVariant;
function ConvertVariantToREPASTESPECIAL(const V : OleVariant) : REPASTESPECIAL;
function ConvertSELCHANGEToVariant(var R : SELCHANGE) : OleVariant;
function ConvertVariantToSELCHANGE(const V : OleVariant) : SELCHANGE;
function ConvertTCharFormatToVariant(var R : TCharFormat) : OleVariant;
function ConvertVariantToTCharFormat(const V : OleVariant) : TCharFormat;
function ConvertTCharFormat2ToVariant(var R : TCharFormat2) : OleVariant;
function ConvertVariantToTCharFormat2(const V : OleVariant) : TCharFormat2;
function ConvertTCharFormat2AToVariant(var R : TCharFormat2A) : OleVariant;
function ConvertVariantToTCharFormat2A(const V : OleVariant) : TCharFormat2A;
function ConvertTCharFormat2WToVariant(var R : TCharFormat2W) : OleVariant;
function ConvertVariantToTCharFormat2W(const V : OleVariant) : TCharFormat2W;
function ConvertTCharFormatAToVariant(var R : TCharFormatA) : OleVariant;
function ConvertVariantToTCharFormatA(const V : OleVariant) : TCharFormatA;
function ConvertTCharFormatWToVariant(var R : TCharFormatW) : OleVariant;
function ConvertVariantToTCharFormatW(const V : OleVariant) : TCharFormatW;
function ConvertTCharRangeToVariant(var R : TCharRange) : OleVariant;
function ConvertVariantToTCharRange(const V : OleVariant) : TCharRange;
function ConvertTCompColorToVariant(var R : TCompColor) : OleVariant;
function ConvertVariantToTCompColor(const V : OleVariant) : TCompColor;
function ConvertTEditStreamToVariant(var R : TEditStream) : OleVariant;
function ConvertVariantToTEditStream(const V : OleVariant) : TEditStream;
function ConvertTENCorrectTextToVariant(var R : TENCorrectText) : OleVariant;
function ConvertVariantToTENCorrectText(const V : OleVariant) : TENCorrectText;
function ConvertTEndDropFilesToVariant(var R : TEndDropFiles) : OleVariant;
function ConvertVariantToTEndDropFiles(const V : OleVariant) : TEndDropFiles;
function ConvertTENLinkToVariant(var R : TENLink) : OleVariant;
function ConvertVariantToTENLink(const V : OleVariant) : TENLink;
function ConvertTENOleOpFailedToVariant(var R : TENOleOpFailed) : OleVariant;
function ConvertVariantToTENOleOpFailed(const V : OleVariant) : TENOleOpFailed;
function ConvertTENProtectedToVariant(var R : TENProtected) : OleVariant;
function ConvertVariantToTENProtected(const V : OleVariant) : TENProtected;
function ConvertTENSaveClipboardToVariant(var R : TENSaveClipboard) : OleVariant;
function ConvertVariantToTENSaveClipboard(const V : OleVariant) : TENSaveClipboard;
function ConvertTFindTextToVariant(var R : TFindText) : OleVariant;
function ConvertVariantToTFindText(const V : OleVariant) : TFindText;
function ConvertTFindTextAToVariant(var R : TFindTextA) : OleVariant;
function ConvertVariantToTFindTextA(const V : OleVariant) : TFindTextA;
function ConvertTFindTextExAToVariant(var R : TFindTextExA) : OleVariant;
function ConvertVariantToTFindTextExA(const V : OleVariant) : TFindTextExA;
function ConvertTFindTextExWToVariant(var R : TFindTextExW) : OleVariant;
function ConvertVariantToTFindTextExW(const V : OleVariant) : TFindTextExW;
function ConvertTFindTextWToVariant(var R : TFindTextW) : OleVariant;
function ConvertVariantToTFindTextW(const V : OleVariant) : TFindTextW;
function ConvertTFormatRangeToVariant(var R : TFormatRange) : OleVariant;
function ConvertVariantToTFormatRange(const V : OleVariant) : TFormatRange;
function ConvertTGetTextExToVariant(var R : TGetTextEx) : OleVariant;
function ConvertVariantToTGetTextEx(const V : OleVariant) : TGetTextEx;
function ConvertTGetTextLengthExToVariant(var R : TGetTextLengthEx) : OleVariant;
function ConvertVariantToTGetTextLengthEx(const V : OleVariant) : TGetTextLengthEx;
function ConvertTMsgFilterToVariant(var R : TMsgFilter) : OleVariant;
function ConvertVariantToTMsgFilter(const V : OleVariant) : TMsgFilter;
function ConvertTObjectPositionsToVariant(var R : TObjectPositions) : OleVariant;
function ConvertVariantToTObjectPositions(const V : OleVariant) : TObjectPositions;
function ConvertTParaFormatToVariant(var R : TParaFormat) : OleVariant;
function ConvertVariantToTParaFormat(const V : OleVariant) : TParaFormat;
function ConvertTParaFormat2ToVariant(var R : TParaFormat2) : OleVariant;
function ConvertVariantToTParaFormat2(const V : OleVariant) : TParaFormat2;
function ConvertTPunctuationToVariant(var R : TPunctuation) : OleVariant;
function ConvertVariantToTPunctuation(const V : OleVariant) : TPunctuation;
function ConvertTRepasteSpecialToVariant(var R : TRepasteSpecial) : OleVariant;
function ConvertVariantToTRepasteSpecial(const V : OleVariant) : TRepasteSpecial;
function ConvertTReqSizeToVariant(var R : TReqSize) : OleVariant;
function ConvertVariantToTReqSize(const V : OleVariant) : TReqSize;
function ConvertTSelChangeToVariant(var R : TSelChange) : OleVariant;
function ConvertVariantToTSelChange(const V : OleVariant) : TSelChange;
function ConvertTTextRangeToVariant(var R : TTextRange) : OleVariant;
function ConvertVariantToTTextRange(const V : OleVariant) : TTextRange;
function ConvertTTextRangeAToVariant(var R : TTextRangeA) : OleVariant;
function ConvertVariantToTTextRangeA(const V : OleVariant) : TTextRangeA;
function ConvertTTextRangeWToVariant(var R : TTextRangeW) : OleVariant;
function ConvertVariantToTTextRangeW(const V : OleVariant) : TTextRangeW;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type ___charrange__Wrapper = class(TDCRecordWrapper)
private
fR : _charrange;
public
function GetRecordPtr : pointer; override;
published
procedure setcpMin(const val : Longint);
function getcpMin : Longint;
property cpMin : Longint read getcpMin write setcpMin;
procedure setcpMax(const val : Longint);
function getcpMax : Longint;
property cpMax : Longint read getcpMax write setcpMax;
end;
type ___compcolor__Wrapper = class(TDCRecordWrapper)
private
fR : _compcolor;
public
function GetRecordPtr : pointer; override;
published
procedure setcrText(const val : TColorRef);
function getcrText : TColorRef;
property crText : TColorRef read getcrText write setcrText;
procedure setcrBackground(const val : TColorRef);
function getcrBackground : TColorRef;
property crBackground : TColorRef read getcrBackground write setcrBackground;
procedure setdwEffects(const val : Longint);
function getdwEffects : Longint;
property dwEffects : Longint read getdwEffects write setdwEffects;
end;
type ___editstream__Wrapper = class(TDCRecordWrapper)
private
fR : _editstream;
public
function GetRecordPtr : pointer; override;
published
procedure setdwCookie(const val : Longint);
function getdwCookie : Longint;
property dwCookie : Longint read getdwCookie write setdwCookie;
procedure setdwError(const val : Longint);
function getdwError : Longint;
property dwError : Longint read getdwError write setdwError;
end;
type ___encorrecttext__Wrapper = class(TDCRecordWrapper)
private
fR : _encorrecttext;
public
function GetRecordPtr : pointer; override;
published
procedure setseltyp(const val : Word);
function getseltyp : Word;
property seltyp : Word read getseltyp write setseltyp;
end;
type ___enprotected__Wrapper = class(TDCRecordWrapper)
private
fR : _enprotected;
public
function GetRecordPtr : pointer; override;
published
procedure setmsg(const val : UINT);
function getmsg : UINT;
property msg : UINT read getmsg write setmsg;
procedure setwParam(const val : wParam);
function getwParam : wParam;
property wParam : wParam read getwParam write setwParam;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
end;
type ___ensaveclipboard__Wrapper = class(TDCRecordWrapper)
private
fR : _ensaveclipboard;
public
function GetRecordPtr : pointer; override;
published
procedure setcObjectCount(const val : Longint);
function getcObjectCount : Longint;
property cObjectCount : Longint read getcObjectCount write setcObjectCount;
procedure setcch(const val : Longint);
function getcch : Longint;
property cch : Longint read getcch write setcch;
end;
type ___formatrange__Wrapper = class(TDCRecordWrapper)
private
fR : _formatrange;
public
function GetRecordPtr : pointer; override;
published
end;
type ___msgfilter__Wrapper = class(TDCRecordWrapper)
private
fR : _msgfilter;
public
function GetRecordPtr : pointer; override;
published
procedure setmsg(const val : UINT);
function getmsg : UINT;
property msg : UINT read getmsg write setmsg;
procedure setwParam(const val : wParam);
function getwParam : wParam;
property wParam : wParam read getwParam write setwParam;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
end;
type ___paraformat__Wrapper = class(TDCRecordWrapper)
private
fR : _paraformat;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : DWORD);
function getdwMask : DWORD;
property dwMask : DWORD read getdwMask write setdwMask;
procedure setwNumbering(const val : Word);
function getwNumbering : Word;
property wNumbering : Word read getwNumbering write setwNumbering;
procedure setwReserved(const val : Word);
function getwReserved : Word;
property wReserved : Word read getwReserved write setwReserved;
procedure setdxStartIndent(const val : Longint);
function getdxStartIndent : Longint;
property dxStartIndent : Longint read getdxStartIndent write setdxStartIndent;
procedure setdxRightIndent(const val : Longint);
function getdxRightIndent : Longint;
property dxRightIndent : Longint read getdxRightIndent write setdxRightIndent;
procedure setdxOffset(const val : Longint);
function getdxOffset : Longint;
property dxOffset : Longint read getdxOffset write setdxOffset;
procedure setwAlignment(const val : Word);
function getwAlignment : Word;
property wAlignment : Word read getwAlignment write setwAlignment;
procedure setcTabCount(const val : SmallInt);
function getcTabCount : SmallInt;
property cTabCount : SmallInt read getcTabCount write setcTabCount;
end;
type ___punctuation__Wrapper = class(TDCRecordWrapper)
private
fR : _punctuation;
public
function GetRecordPtr : pointer; override;
published
procedure setiSize(const val : UINT);
function getiSize : UINT;
property iSize : UINT read getiSize write setiSize;
end;
type ___repastespecial__Wrapper = class(TDCRecordWrapper)
private
fR : _repastespecial;
public
function GetRecordPtr : pointer; override;
published
procedure setdwAspect(const val : DWORD);
function getdwAspect : DWORD;
property dwAspect : DWORD read getdwAspect write setdwAspect;
procedure setdwParam(const val : DWORD);
function getdwParam : DWORD;
property dwParam : DWORD read getdwParam write setdwParam;
end;
type ___selchange__Wrapper = class(TDCRecordWrapper)
private
fR : _selchange;
public
function GetRecordPtr : pointer; override;
published
procedure setseltyp(const val : Word);
function getseltyp : Word;
property seltyp : Word read getseltyp write setseltyp;
end;
type __CHARRANGE__Wrapper = class(TDCRecordWrapper)
private
fR : CHARRANGE;
public
function GetRecordPtr : pointer; override;
published
procedure setcpMin(const val : Longint);
function getcpMin : Longint;
property cpMin : Longint read getcpMin write setcpMin;
procedure setcpMax(const val : Longint);
function getcpMax : Longint;
property cpMax : Longint read getcpMax write setcpMax;
end;
type __COMPCOLOR__Wrapper = class(TDCRecordWrapper)
private
fR : COMPCOLOR;
public
function GetRecordPtr : pointer; override;
published
procedure setcrText(const val : TColorRef);
function getcrText : TColorRef;
property crText : TColorRef read getcrText write setcrText;
procedure setcrBackground(const val : TColorRef);
function getcrBackground : TColorRef;
property crBackground : TColorRef read getcrBackground write setcrBackground;
procedure setdwEffects(const val : Longint);
function getdwEffects : Longint;
property dwEffects : Longint read getdwEffects write setdwEffects;
end;
type __EDITSTREAM__Wrapper = class(TDCRecordWrapper)
private
fR : EDITSTREAM;
public
function GetRecordPtr : pointer; override;
published
procedure setdwCookie(const val : Longint);
function getdwCookie : Longint;
property dwCookie : Longint read getdwCookie write setdwCookie;
procedure setdwError(const val : Longint);
function getdwError : Longint;
property dwError : Longint read getdwError write setdwError;
end;
type __ENCORRECTTEXT__Wrapper = class(TDCRecordWrapper)
private
fR : ENCORRECTTEXT;
public
function GetRecordPtr : pointer; override;
published
procedure setseltyp(const val : Word);
function getseltyp : Word;
property seltyp : Word read getseltyp write setseltyp;
end;
type __ENPROTECTED__Wrapper = class(TDCRecordWrapper)
private
fR : ENPROTECTED;
public
function GetRecordPtr : pointer; override;
published
procedure setmsg(const val : UINT);
function getmsg : UINT;
property msg : UINT read getmsg write setmsg;
procedure setwParam(const val : wParam);
function getwParam : wParam;
property wParam : wParam read getwParam write setwParam;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
end;
type __ENSAVECLIPBOARD__Wrapper = class(TDCRecordWrapper)
private
fR : ENSAVECLIPBOARD;
public
function GetRecordPtr : pointer; override;
published
procedure setcObjectCount(const val : Longint);
function getcObjectCount : Longint;
property cObjectCount : Longint read getcObjectCount write setcObjectCount;
procedure setcch(const val : Longint);
function getcch : Longint;
property cch : Longint read getcch write setcch;
end;
type __FORMATRANGE__Wrapper = class(TDCRecordWrapper)
private
fR : FORMATRANGE;
public
function GetRecordPtr : pointer; override;
published
end;
type __MSGFILTER__Wrapper = class(TDCRecordWrapper)
private
fR : MSGFILTER;
public
function GetRecordPtr : pointer; override;
published
procedure setmsg(const val : UINT);
function getmsg : UINT;
property msg : UINT read getmsg write setmsg;
procedure setwParam(const val : wParam);
function getwParam : wParam;
property wParam : wParam read getwParam write setwParam;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
end;
type __PARAFORMAT__Wrapper = class(TDCRecordWrapper)
private
fR : PARAFORMAT;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : DWORD);
function getdwMask : DWORD;
property dwMask : DWORD read getdwMask write setdwMask;
procedure setwNumbering(const val : Word);
function getwNumbering : Word;
property wNumbering : Word read getwNumbering write setwNumbering;
procedure setwReserved(const val : Word);
function getwReserved : Word;
property wReserved : Word read getwReserved write setwReserved;
procedure setdxStartIndent(const val : Longint);
function getdxStartIndent : Longint;
property dxStartIndent : Longint read getdxStartIndent write setdxStartIndent;
procedure setdxRightIndent(const val : Longint);
function getdxRightIndent : Longint;
property dxRightIndent : Longint read getdxRightIndent write setdxRightIndent;
procedure setdxOffset(const val : Longint);
function getdxOffset : Longint;
property dxOffset : Longint read getdxOffset write setdxOffset;
procedure setwAlignment(const val : Word);
function getwAlignment : Word;
property wAlignment : Word read getwAlignment write setwAlignment;
procedure setcTabCount(const val : SmallInt);
function getcTabCount : SmallInt;
property cTabCount : SmallInt read getcTabCount write setcTabCount;
end;
type __PUNCTUATION__Wrapper = class(TDCRecordWrapper)
private
fR : PUNCTUATION;
public
function GetRecordPtr : pointer; override;
published
procedure setiSize(const val : UINT);
function getiSize : UINT;
property iSize : UINT read getiSize write setiSize;
end;
type __REPASTESPECIAL__Wrapper = class(TDCRecordWrapper)
private
fR : REPASTESPECIAL;
public
function GetRecordPtr : pointer; override;
published
procedure setdwAspect(const val : DWORD);
function getdwAspect : DWORD;
property dwAspect : DWORD read getdwAspect write setdwAspect;
procedure setdwParam(const val : DWORD);
function getdwParam : DWORD;
property dwParam : DWORD read getdwParam write setdwParam;
end;
type __SELCHANGE__Wrapper = class(TDCRecordWrapper)
private
fR : SELCHANGE;
public
function GetRecordPtr : pointer; override;
published
procedure setseltyp(const val : Word);
function getseltyp : Word;
property seltyp : Word read getseltyp write setseltyp;
end;
type __TCharFormat__Wrapper = class(TDCRecordWrapper)
private
fR : TCharFormat;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : Longint);
function getdwMask : Longint;
property dwMask : Longint read getdwMask write setdwMask;
procedure setdwEffects(const val : Longint);
function getdwEffects : Longint;
property dwEffects : Longint read getdwEffects write setdwEffects;
procedure setyHeight(const val : Longint);
function getyHeight : Longint;
property yHeight : Longint read getyHeight write setyHeight;
procedure setyOffset(const val : Longint);
function getyOffset : Longint;
property yOffset : Longint read getyOffset write setyOffset;
procedure setcrTextColor(const val : TColorRef);
function getcrTextColor : TColorRef;
property crTextColor : TColorRef read getcrTextColor write setcrTextColor;
procedure setbCharSet(const val : Byte);
function getbCharSet : Byte;
property bCharSet : Byte read getbCharSet write setbCharSet;
procedure setbPitchAndFamily(const val : Byte);
function getbPitchAndFamily : Byte;
property bPitchAndFamily : Byte read getbPitchAndFamily write setbPitchAndFamily;
end;
type __TCharFormat2__Wrapper = class(TDCRecordWrapper)
private
fR : TCharFormat2;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : DWORD);
function getdwMask : DWORD;
property dwMask : DWORD read getdwMask write setdwMask;
procedure setdwEffects(const val : DWORD);
function getdwEffects : DWORD;
property dwEffects : DWORD read getdwEffects write setdwEffects;
procedure setyHeight(const val : Longint);
function getyHeight : Longint;
property yHeight : Longint read getyHeight write setyHeight;
procedure setyOffset(const val : Longint);
function getyOffset : Longint;
property yOffset : Longint read getyOffset write setyOffset;
procedure setcrTextColor(const val : TColorRef);
function getcrTextColor : TColorRef;
property crTextColor : TColorRef read getcrTextColor write setcrTextColor;
procedure setbCharSet(const val : Byte);
function getbCharSet : Byte;
property bCharSet : Byte read getbCharSet write setbCharSet;
procedure setbPitchAndFamily(const val : Byte);
function getbPitchAndFamily : Byte;
property bPitchAndFamily : Byte read getbPitchAndFamily write setbPitchAndFamily;
procedure setwWeight(const val : Word);
function getwWeight : Word;
property wWeight : Word read getwWeight write setwWeight;
procedure setsSpacing(const val : SmallInt);
function getsSpacing : SmallInt;
property sSpacing : SmallInt read getsSpacing write setsSpacing;
procedure setcrBackColor(const val : TColorRef);
function getcrBackColor : TColorRef;
property crBackColor : TColorRef read getcrBackColor write setcrBackColor;
procedure setlid(const val : LCID);
function getlid : LCID;
property lid : LCID read getlid write setlid;
procedure setdwReserved(const val : DWORD);
function getdwReserved : DWORD;
property dwReserved : DWORD read getdwReserved write setdwReserved;
procedure setsStyle(const val : SmallInt);
function getsStyle : SmallInt;
property sStyle : SmallInt read getsStyle write setsStyle;
procedure setwKerning(const val : Word);
function getwKerning : Word;
property wKerning : Word read getwKerning write setwKerning;
procedure setbUnderlineType(const val : Byte);
function getbUnderlineType : Byte;
property bUnderlineType : Byte read getbUnderlineType write setbUnderlineType;
procedure setbAnimation(const val : Byte);
function getbAnimation : Byte;
property bAnimation : Byte read getbAnimation write setbAnimation;
procedure setbRevAuthor(const val : Byte);
function getbRevAuthor : Byte;
property bRevAuthor : Byte read getbRevAuthor write setbRevAuthor;
procedure setbReserved1(const val : Byte);
function getbReserved1 : Byte;
property bReserved1 : Byte read getbReserved1 write setbReserved1;
end;
type __TCharFormat2A__Wrapper = class(TDCRecordWrapper)
private
fR : TCharFormat2A;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : DWORD);
function getdwMask : DWORD;
property dwMask : DWORD read getdwMask write setdwMask;
procedure setdwEffects(const val : DWORD);
function getdwEffects : DWORD;
property dwEffects : DWORD read getdwEffects write setdwEffects;
procedure setyHeight(const val : Longint);
function getyHeight : Longint;
property yHeight : Longint read getyHeight write setyHeight;
procedure setyOffset(const val : Longint);
function getyOffset : Longint;
property yOffset : Longint read getyOffset write setyOffset;
procedure setcrTextColor(const val : TColorRef);
function getcrTextColor : TColorRef;
property crTextColor : TColorRef read getcrTextColor write setcrTextColor;
procedure setbCharSet(const val : Byte);
function getbCharSet : Byte;
property bCharSet : Byte read getbCharSet write setbCharSet;
procedure setbPitchAndFamily(const val : Byte);
function getbPitchAndFamily : Byte;
property bPitchAndFamily : Byte read getbPitchAndFamily write setbPitchAndFamily;
procedure setwWeight(const val : Word);
function getwWeight : Word;
property wWeight : Word read getwWeight write setwWeight;
procedure setsSpacing(const val : SmallInt);
function getsSpacing : SmallInt;
property sSpacing : SmallInt read getsSpacing write setsSpacing;
procedure setcrBackColor(const val : TColorRef);
function getcrBackColor : TColorRef;
property crBackColor : TColorRef read getcrBackColor write setcrBackColor;
procedure setlid(const val : LCID);
function getlid : LCID;
property lid : LCID read getlid write setlid;
procedure setdwReserved(const val : DWORD);
function getdwReserved : DWORD;
property dwReserved : DWORD read getdwReserved write setdwReserved;
procedure setsStyle(const val : SmallInt);
function getsStyle : SmallInt;
property sStyle : SmallInt read getsStyle write setsStyle;
procedure setwKerning(const val : Word);
function getwKerning : Word;
property wKerning : Word read getwKerning write setwKerning;
procedure setbUnderlineType(const val : Byte);
function getbUnderlineType : Byte;
property bUnderlineType : Byte read getbUnderlineType write setbUnderlineType;
procedure setbAnimation(const val : Byte);
function getbAnimation : Byte;
property bAnimation : Byte read getbAnimation write setbAnimation;
procedure setbRevAuthor(const val : Byte);
function getbRevAuthor : Byte;
property bRevAuthor : Byte read getbRevAuthor write setbRevAuthor;
procedure setbReserved1(const val : Byte);
function getbReserved1 : Byte;
property bReserved1 : Byte read getbReserved1 write setbReserved1;
end;
type __TCharFormat2W__Wrapper = class(TDCRecordWrapper)
private
fR : TCharFormat2W;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : DWORD);
function getdwMask : DWORD;
property dwMask : DWORD read getdwMask write setdwMask;
procedure setdwEffects(const val : DWORD);
function getdwEffects : DWORD;
property dwEffects : DWORD read getdwEffects write setdwEffects;
procedure setyHeight(const val : Longint);
function getyHeight : Longint;
property yHeight : Longint read getyHeight write setyHeight;
procedure setyOffset(const val : Longint);
function getyOffset : Longint;
property yOffset : Longint read getyOffset write setyOffset;
procedure setcrTextColor(const val : TColorRef);
function getcrTextColor : TColorRef;
property crTextColor : TColorRef read getcrTextColor write setcrTextColor;
procedure setbCharSet(const val : Byte);
function getbCharSet : Byte;
property bCharSet : Byte read getbCharSet write setbCharSet;
procedure setbPitchAndFamily(const val : Byte);
function getbPitchAndFamily : Byte;
property bPitchAndFamily : Byte read getbPitchAndFamily write setbPitchAndFamily;
procedure setwWeight(const val : Word);
function getwWeight : Word;
property wWeight : Word read getwWeight write setwWeight;
procedure setsSpacing(const val : SmallInt);
function getsSpacing : SmallInt;
property sSpacing : SmallInt read getsSpacing write setsSpacing;
procedure setcrBackColor(const val : TColorRef);
function getcrBackColor : TColorRef;
property crBackColor : TColorRef read getcrBackColor write setcrBackColor;
procedure setlid(const val : LCID);
function getlid : LCID;
property lid : LCID read getlid write setlid;
procedure setdwReserved(const val : DWORD);
function getdwReserved : DWORD;
property dwReserved : DWORD read getdwReserved write setdwReserved;
procedure setsStyle(const val : SmallInt);
function getsStyle : SmallInt;
property sStyle : SmallInt read getsStyle write setsStyle;
procedure setwKerning(const val : Word);
function getwKerning : Word;
property wKerning : Word read getwKerning write setwKerning;
procedure setbUnderlineType(const val : Byte);
function getbUnderlineType : Byte;
property bUnderlineType : Byte read getbUnderlineType write setbUnderlineType;
procedure setbAnimation(const val : Byte);
function getbAnimation : Byte;
property bAnimation : Byte read getbAnimation write setbAnimation;
procedure setbRevAuthor(const val : Byte);
function getbRevAuthor : Byte;
property bRevAuthor : Byte read getbRevAuthor write setbRevAuthor;
procedure setbReserved1(const val : Byte);
function getbReserved1 : Byte;
property bReserved1 : Byte read getbReserved1 write setbReserved1;
end;
type __TCharFormatA__Wrapper = class(TDCRecordWrapper)
private
fR : TCharFormatA;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : Longint);
function getdwMask : Longint;
property dwMask : Longint read getdwMask write setdwMask;
procedure setdwEffects(const val : Longint);
function getdwEffects : Longint;
property dwEffects : Longint read getdwEffects write setdwEffects;
procedure setyHeight(const val : Longint);
function getyHeight : Longint;
property yHeight : Longint read getyHeight write setyHeight;
procedure setyOffset(const val : Longint);
function getyOffset : Longint;
property yOffset : Longint read getyOffset write setyOffset;
procedure setcrTextColor(const val : TColorRef);
function getcrTextColor : TColorRef;
property crTextColor : TColorRef read getcrTextColor write setcrTextColor;
procedure setbCharSet(const val : Byte);
function getbCharSet : Byte;
property bCharSet : Byte read getbCharSet write setbCharSet;
procedure setbPitchAndFamily(const val : Byte);
function getbPitchAndFamily : Byte;
property bPitchAndFamily : Byte read getbPitchAndFamily write setbPitchAndFamily;
end;
type __TCharFormatW__Wrapper = class(TDCRecordWrapper)
private
fR : TCharFormatW;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : Longint);
function getdwMask : Longint;
property dwMask : Longint read getdwMask write setdwMask;
procedure setdwEffects(const val : Longint);
function getdwEffects : Longint;
property dwEffects : Longint read getdwEffects write setdwEffects;
procedure setyHeight(const val : Longint);
function getyHeight : Longint;
property yHeight : Longint read getyHeight write setyHeight;
procedure setyOffset(const val : Longint);
function getyOffset : Longint;
property yOffset : Longint read getyOffset write setyOffset;
procedure setcrTextColor(const val : TColorRef);
function getcrTextColor : TColorRef;
property crTextColor : TColorRef read getcrTextColor write setcrTextColor;
procedure setbCharSet(const val : Byte);
function getbCharSet : Byte;
property bCharSet : Byte read getbCharSet write setbCharSet;
procedure setbPitchAndFamily(const val : Byte);
function getbPitchAndFamily : Byte;
property bPitchAndFamily : Byte read getbPitchAndFamily write setbPitchAndFamily;
end;
type __TCharRange__Wrapper = class(TDCRecordWrapper)
private
fR : TCharRange;
public
function GetRecordPtr : pointer; override;
published
procedure setcpMin(const val : Longint);
function getcpMin : Longint;
property cpMin : Longint read getcpMin write setcpMin;
procedure setcpMax(const val : Longint);
function getcpMax : Longint;
property cpMax : Longint read getcpMax write setcpMax;
end;
type __TCompColor__Wrapper = class(TDCRecordWrapper)
private
fR : TCompColor;
public
function GetRecordPtr : pointer; override;
published
procedure setcrText(const val : TColorRef);
function getcrText : TColorRef;
property crText : TColorRef read getcrText write setcrText;
procedure setcrBackground(const val : TColorRef);
function getcrBackground : TColorRef;
property crBackground : TColorRef read getcrBackground write setcrBackground;
procedure setdwEffects(const val : Longint);
function getdwEffects : Longint;
property dwEffects : Longint read getdwEffects write setdwEffects;
end;
type __TEditStream__Wrapper = class(TDCRecordWrapper)
private
fR : TEditStream;
public
function GetRecordPtr : pointer; override;
published
procedure setdwCookie(const val : Longint);
function getdwCookie : Longint;
property dwCookie : Longint read getdwCookie write setdwCookie;
procedure setdwError(const val : Longint);
function getdwError : Longint;
property dwError : Longint read getdwError write setdwError;
end;
type __TENCorrectText__Wrapper = class(TDCRecordWrapper)
private
fR : TENCorrectText;
public
function GetRecordPtr : pointer; override;
published
procedure setseltyp(const val : Word);
function getseltyp : Word;
property seltyp : Word read getseltyp write setseltyp;
end;
type __TEndDropFiles__Wrapper = class(TDCRecordWrapper)
private
fR : TEndDropFiles;
public
function GetRecordPtr : pointer; override;
published
procedure sethDrop(const val : THandle);
function gethDrop : THandle;
property hDrop : THandle read gethDrop write sethDrop;
procedure setcp(const val : Longint);
function getcp : Longint;
property cp : Longint read getcp write setcp;
procedure setfProtected(const val : Bool);
function getfProtected : Bool;
property fProtected : Bool read getfProtected write setfProtected;
end;
type __TENLink__Wrapper = class(TDCRecordWrapper)
private
fR : TENLink;
public
function GetRecordPtr : pointer; override;
published
procedure setmsg(const val : UINT);
function getmsg : UINT;
property msg : UINT read getmsg write setmsg;
procedure setwParam(const val : wParam);
function getwParam : wParam;
property wParam : wParam read getwParam write setwParam;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
end;
type __TENOleOpFailed__Wrapper = class(TDCRecordWrapper)
private
fR : TENOleOpFailed;
public
function GetRecordPtr : pointer; override;
published
procedure setiob(const val : Longint);
function getiob : Longint;
property iob : Longint read getiob write setiob;
procedure setlOper(const val : Longint);
function getlOper : Longint;
property lOper : Longint read getlOper write setlOper;
end;
type __TENProtected__Wrapper = class(TDCRecordWrapper)
private
fR : TENProtected;
public
function GetRecordPtr : pointer; override;
published
procedure setmsg(const val : UINT);
function getmsg : UINT;
property msg : UINT read getmsg write setmsg;
procedure setwParam(const val : wParam);
function getwParam : wParam;
property wParam : wParam read getwParam write setwParam;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
end;
type __TENSaveClipboard__Wrapper = class(TDCRecordWrapper)
private
fR : TENSaveClipboard;
public
function GetRecordPtr : pointer; override;
published
procedure setcObjectCount(const val : Longint);
function getcObjectCount : Longint;
property cObjectCount : Longint read getcObjectCount write setcObjectCount;
procedure setcch(const val : Longint);
function getcch : Longint;
property cch : Longint read getcch write setcch;
end;
type __TFindText__Wrapper = class(TDCRecordWrapper)
private
fR : TFindText;
public
function GetRecordPtr : pointer; override;
published
end;
type __TFindTextA__Wrapper = class(TDCRecordWrapper)
private
fR : TFindTextA;
public
function GetRecordPtr : pointer; override;
published
end;
type __TFindTextExA__Wrapper = class(TDCRecordWrapper)
private
fR : TFindTextExA;
public
function GetRecordPtr : pointer; override;
published
end;
type __TFindTextExW__Wrapper = class(TDCRecordWrapper)
private
fR : TFindTextExW;
public
function GetRecordPtr : pointer; override;
published
end;
type __TFindTextW__Wrapper = class(TDCRecordWrapper)
private
fR : TFindTextW;
public
function GetRecordPtr : pointer; override;
published
end;
type __TFormatRange__Wrapper = class(TDCRecordWrapper)
private
fR : TFormatRange;
public
function GetRecordPtr : pointer; override;
published
end;
type __TGetTextEx__Wrapper = class(TDCRecordWrapper)
private
fR : TGetTextEx;
public
function GetRecordPtr : pointer; override;
published
procedure setcb(const val : DWORD);
function getcb : DWORD;
property cb : DWORD read getcb write setcb;
procedure setflags(const val : DWORD);
function getflags : DWORD;
property flags : DWORD read getflags write setflags;
procedure setcodepage(const val : UINT);
function getcodepage : UINT;
property codepage : UINT read getcodepage write setcodepage;
end;
type __TGetTextLengthEx__Wrapper = class(TDCRecordWrapper)
private
fR : TGetTextLengthEx;
public
function GetRecordPtr : pointer; override;
published
procedure setflags(const val : DWORD);
function getflags : DWORD;
property flags : DWORD read getflags write setflags;
procedure setcodepage(const val : UINT);
function getcodepage : UINT;
property codepage : UINT read getcodepage write setcodepage;
end;
type __TMsgFilter__Wrapper = class(TDCRecordWrapper)
private
fR : TMsgFilter;
public
function GetRecordPtr : pointer; override;
published
procedure setmsg(const val : UINT);
function getmsg : UINT;
property msg : UINT read getmsg write setmsg;
procedure setwParam(const val : wParam);
function getwParam : wParam;
property wParam : wParam read getwParam write setwParam;
procedure setlParam(const val : lParam);
function getlParam : lParam;
property lParam : lParam read getlParam write setlParam;
end;
type __TObjectPositions__Wrapper = class(TDCRecordWrapper)
private
fR : TObjectPositions;
public
function GetRecordPtr : pointer; override;
published
procedure setcObjectCount(const val : Longint);
function getcObjectCount : Longint;
property cObjectCount : Longint read getcObjectCount write setcObjectCount;
end;
type __TParaFormat__Wrapper = class(TDCRecordWrapper)
private
fR : TParaFormat;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : DWORD);
function getdwMask : DWORD;
property dwMask : DWORD read getdwMask write setdwMask;
procedure setwNumbering(const val : Word);
function getwNumbering : Word;
property wNumbering : Word read getwNumbering write setwNumbering;
procedure setwReserved(const val : Word);
function getwReserved : Word;
property wReserved : Word read getwReserved write setwReserved;
procedure setdxStartIndent(const val : Longint);
function getdxStartIndent : Longint;
property dxStartIndent : Longint read getdxStartIndent write setdxStartIndent;
procedure setdxRightIndent(const val : Longint);
function getdxRightIndent : Longint;
property dxRightIndent : Longint read getdxRightIndent write setdxRightIndent;
procedure setdxOffset(const val : Longint);
function getdxOffset : Longint;
property dxOffset : Longint read getdxOffset write setdxOffset;
procedure setwAlignment(const val : Word);
function getwAlignment : Word;
property wAlignment : Word read getwAlignment write setwAlignment;
procedure setcTabCount(const val : SmallInt);
function getcTabCount : SmallInt;
property cTabCount : SmallInt read getcTabCount write setcTabCount;
end;
type __TParaFormat2__Wrapper = class(TDCRecordWrapper)
private
fR : TParaFormat2;
public
function GetRecordPtr : pointer; override;
published
procedure setcbSize(const val : UINT);
function getcbSize : UINT;
property cbSize : UINT read getcbSize write setcbSize;
procedure setdwMask(const val : DWORD);
function getdwMask : DWORD;
property dwMask : DWORD read getdwMask write setdwMask;
procedure setwNumbering(const val : Word);
function getwNumbering : Word;
property wNumbering : Word read getwNumbering write setwNumbering;
procedure setwReserved(const val : Word);
function getwReserved : Word;
property wReserved : Word read getwReserved write setwReserved;
procedure setdxStartIndent(const val : Longint);
function getdxStartIndent : Longint;
property dxStartIndent : Longint read getdxStartIndent write setdxStartIndent;
procedure setdxRightIndent(const val : Longint);
function getdxRightIndent : Longint;
property dxRightIndent : Longint read getdxRightIndent write setdxRightIndent;
procedure setdxOffset(const val : Longint);
function getdxOffset : Longint;
property dxOffset : Longint read getdxOffset write setdxOffset;
procedure setwAlignment(const val : Word);
function getwAlignment : Word;
property wAlignment : Word read getwAlignment write setwAlignment;
procedure setcTabCount(const val : SmallInt);
function getcTabCount : SmallInt;
property cTabCount : SmallInt read getcTabCount write setcTabCount;
procedure setdySpaceBefore(const val : Longint);
function getdySpaceBefore : Longint;
property dySpaceBefore : Longint read getdySpaceBefore write setdySpaceBefore;
procedure setdySpaceAfter(const val : Longint);
function getdySpaceAfter : Longint;
property dySpaceAfter : Longint read getdySpaceAfter write setdySpaceAfter;
procedure setdyLineSpacing(const val : Longint);
function getdyLineSpacing : Longint;
property dyLineSpacing : Longint read getdyLineSpacing write setdyLineSpacing;
procedure setsStyle(const val : SmallInt);
function getsStyle : SmallInt;
property sStyle : SmallInt read getsStyle write setsStyle;
procedure setbLineSpacingRule(const val : Byte);
function getbLineSpacingRule : Byte;
property bLineSpacingRule : Byte read getbLineSpacingRule write setbLineSpacingRule;
procedure setbCRC(const val : Byte);
function getbCRC : Byte;
property bCRC : Byte read getbCRC write setbCRC;
procedure setwShadingWeight(const val : Word);
function getwShadingWeight : Word;
property wShadingWeight : Word read getwShadingWeight write setwShadingWeight;
procedure setwShadingStyle(const val : Word);
function getwShadingStyle : Word;
property wShadingStyle : Word read getwShadingStyle write setwShadingStyle;
procedure setwNumberingStart(const val : Word);
function getwNumberingStart : Word;
property wNumberingStart : Word read getwNumberingStart write setwNumberingStart;
procedure setwNumberingStyle(const val : Word);
function getwNumberingStyle : Word;
property wNumberingStyle : Word read getwNumberingStyle write setwNumberingStyle;
procedure setwNumberingTab(const val : Word);
function getwNumberingTab : Word;
property wNumberingTab : Word read getwNumberingTab write setwNumberingTab;
procedure setwBorderSpace(const val : Word);
function getwBorderSpace : Word;
property wBorderSpace : Word read getwBorderSpace write setwBorderSpace;
procedure setwBorderWidth(const val : Word);
function getwBorderWidth : Word;
property wBorderWidth : Word read getwBorderWidth write setwBorderWidth;
procedure setwBorders(const val : Word);
function getwBorders : Word;
property wBorders : Word read getwBorders write setwBorders;
end;
type __TPunctuation__Wrapper = class(TDCRecordWrapper)
private
fR : TPunctuation;
public
function GetRecordPtr : pointer; override;
published
procedure setiSize(const val : UINT);
function getiSize : UINT;
property iSize : UINT read getiSize write setiSize;
end;
type __TRepasteSpecial__Wrapper = class(TDCRecordWrapper)
private
fR : TRepasteSpecial;
public
function GetRecordPtr : pointer; override;
published
procedure setdwAspect(const val : DWORD);
function getdwAspect : DWORD;
property dwAspect : DWORD read getdwAspect write setdwAspect;
procedure setdwParam(const val : DWORD);
function getdwParam : DWORD;
property dwParam : DWORD read getdwParam write setdwParam;
end;
type __TReqSize__Wrapper = class(TDCRecordWrapper)
private
fR : TReqSize;
public
function GetRecordPtr : pointer; override;
published
end;
type __TSelChange__Wrapper = class(TDCRecordWrapper)
private
fR : TSelChange;
public
function GetRecordPtr : pointer; override;
published
procedure setseltyp(const val : Word);
function getseltyp : Word;
property seltyp : Word read getseltyp write setseltyp;
end;
type __TTextRange__Wrapper = class(TDCRecordWrapper)
private
fR : TTextRange;
public
function GetRecordPtr : pointer; override;
published
end;
type __TTextRangeA__Wrapper = class(TDCRecordWrapper)
private
fR : TTextRangeA;
public
function GetRecordPtr : pointer; override;
published
end;
type __TTextRangeW__Wrapper = class(TDCRecordWrapper)
private
fR : TTextRangeW;
public
function GetRecordPtr : pointer; override;
published
end;
function ___charrange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___charrange__Wrapper.setcpMin(const val : Longint);
begin
_charrange(GetRecordPtr^).cpMin := val;
end;
function ___charrange__Wrapper.getcpMin : Longint;
begin
result := _charrange(GetRecordPtr^).cpMin;
end;
procedure ___charrange__Wrapper.setcpMax(const val : Longint);
begin
_charrange(GetRecordPtr^).cpMax := val;
end;
function ___charrange__Wrapper.getcpMax : Longint;
begin
result := _charrange(GetRecordPtr^).cpMax;
end;
function ___compcolor__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___compcolor__Wrapper.setcrText(const val : TColorRef);
begin
_compcolor(GetRecordPtr^).crText := val;
end;
function ___compcolor__Wrapper.getcrText : TColorRef;
begin
result := _compcolor(GetRecordPtr^).crText;
end;
procedure ___compcolor__Wrapper.setcrBackground(const val : TColorRef);
begin
_compcolor(GetRecordPtr^).crBackground := val;
end;
function ___compcolor__Wrapper.getcrBackground : TColorRef;
begin
result := _compcolor(GetRecordPtr^).crBackground;
end;
procedure ___compcolor__Wrapper.setdwEffects(const val : Longint);
begin
_compcolor(GetRecordPtr^).dwEffects := val;
end;
function ___compcolor__Wrapper.getdwEffects : Longint;
begin
result := _compcolor(GetRecordPtr^).dwEffects;
end;
function ___editstream__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___editstream__Wrapper.setdwCookie(const val : Longint);
begin
_editstream(GetRecordPtr^).dwCookie := val;
end;
function ___editstream__Wrapper.getdwCookie : Longint;
begin
result := _editstream(GetRecordPtr^).dwCookie;
end;
procedure ___editstream__Wrapper.setdwError(const val : Longint);
begin
_editstream(GetRecordPtr^).dwError := val;
end;
function ___editstream__Wrapper.getdwError : Longint;
begin
result := _editstream(GetRecordPtr^).dwError;
end;
function ___encorrecttext__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___encorrecttext__Wrapper.setseltyp(const val : Word);
begin
_encorrecttext(GetRecordPtr^).seltyp := val;
end;
function ___encorrecttext__Wrapper.getseltyp : Word;
begin
result := _encorrecttext(GetRecordPtr^).seltyp;
end;
function ___enprotected__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___enprotected__Wrapper.setmsg(const val : UINT);
begin
_enprotected(GetRecordPtr^).msg := val;
end;
function ___enprotected__Wrapper.getmsg : UINT;
begin
result := _enprotected(GetRecordPtr^).msg;
end;
procedure ___enprotected__Wrapper.setwParam(const val : wParam);
begin
_enprotected(GetRecordPtr^).wParam := val;
end;
function ___enprotected__Wrapper.getwParam : wParam;
begin
result := _enprotected(GetRecordPtr^).wParam;
end;
procedure ___enprotected__Wrapper.setlParam(const val : lParam);
begin
_enprotected(GetRecordPtr^).lParam := val;
end;
function ___enprotected__Wrapper.getlParam : lParam;
begin
result := _enprotected(GetRecordPtr^).lParam;
end;
function ___ensaveclipboard__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___ensaveclipboard__Wrapper.setcObjectCount(const val : Longint);
begin
_ensaveclipboard(GetRecordPtr^).cObjectCount := val;
end;
function ___ensaveclipboard__Wrapper.getcObjectCount : Longint;
begin
result := _ensaveclipboard(GetRecordPtr^).cObjectCount;
end;
procedure ___ensaveclipboard__Wrapper.setcch(const val : Longint);
begin
_ensaveclipboard(GetRecordPtr^).cch := val;
end;
function ___ensaveclipboard__Wrapper.getcch : Longint;
begin
result := _ensaveclipboard(GetRecordPtr^).cch;
end;
function ___formatrange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function ___msgfilter__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___msgfilter__Wrapper.setmsg(const val : UINT);
begin
_msgfilter(GetRecordPtr^).msg := val;
end;
function ___msgfilter__Wrapper.getmsg : UINT;
begin
result := _msgfilter(GetRecordPtr^).msg;
end;
procedure ___msgfilter__Wrapper.setwParam(const val : wParam);
begin
_msgfilter(GetRecordPtr^).wParam := val;
end;
function ___msgfilter__Wrapper.getwParam : wParam;
begin
result := _msgfilter(GetRecordPtr^).wParam;
end;
procedure ___msgfilter__Wrapper.setlParam(const val : lParam);
begin
_msgfilter(GetRecordPtr^).lParam := val;
end;
function ___msgfilter__Wrapper.getlParam : lParam;
begin
result := _msgfilter(GetRecordPtr^).lParam;
end;
function ___paraformat__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___paraformat__Wrapper.setcbSize(const val : UINT);
begin
_paraformat(GetRecordPtr^).cbSize := val;
end;
function ___paraformat__Wrapper.getcbSize : UINT;
begin
result := _paraformat(GetRecordPtr^).cbSize;
end;
procedure ___paraformat__Wrapper.setdwMask(const val : DWORD);
begin
_paraformat(GetRecordPtr^).dwMask := val;
end;
function ___paraformat__Wrapper.getdwMask : DWORD;
begin
result := _paraformat(GetRecordPtr^).dwMask;
end;
procedure ___paraformat__Wrapper.setwNumbering(const val : Word);
begin
_paraformat(GetRecordPtr^).wNumbering := val;
end;
function ___paraformat__Wrapper.getwNumbering : Word;
begin
result := _paraformat(GetRecordPtr^).wNumbering;
end;
procedure ___paraformat__Wrapper.setwReserved(const val : Word);
begin
_paraformat(GetRecordPtr^).wReserved := val;
end;
function ___paraformat__Wrapper.getwReserved : Word;
begin
result := _paraformat(GetRecordPtr^).wReserved;
end;
procedure ___paraformat__Wrapper.setdxStartIndent(const val : Longint);
begin
_paraformat(GetRecordPtr^).dxStartIndent := val;
end;
function ___paraformat__Wrapper.getdxStartIndent : Longint;
begin
result := _paraformat(GetRecordPtr^).dxStartIndent;
end;
procedure ___paraformat__Wrapper.setdxRightIndent(const val : Longint);
begin
_paraformat(GetRecordPtr^).dxRightIndent := val;
end;
function ___paraformat__Wrapper.getdxRightIndent : Longint;
begin
result := _paraformat(GetRecordPtr^).dxRightIndent;
end;
procedure ___paraformat__Wrapper.setdxOffset(const val : Longint);
begin
_paraformat(GetRecordPtr^).dxOffset := val;
end;
function ___paraformat__Wrapper.getdxOffset : Longint;
begin
result := _paraformat(GetRecordPtr^).dxOffset;
end;
procedure ___paraformat__Wrapper.setwAlignment(const val : Word);
begin
_paraformat(GetRecordPtr^).wAlignment := val;
end;
function ___paraformat__Wrapper.getwAlignment : Word;
begin
result := _paraformat(GetRecordPtr^).wAlignment;
end;
procedure ___paraformat__Wrapper.setcTabCount(const val : SmallInt);
begin
_paraformat(GetRecordPtr^).cTabCount := val;
end;
function ___paraformat__Wrapper.getcTabCount : SmallInt;
begin
result := _paraformat(GetRecordPtr^).cTabCount;
end;
function ___punctuation__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___punctuation__Wrapper.setiSize(const val : UINT);
begin
_punctuation(GetRecordPtr^).iSize := val;
end;
function ___punctuation__Wrapper.getiSize : UINT;
begin
result := _punctuation(GetRecordPtr^).iSize;
end;
function ___repastespecial__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___repastespecial__Wrapper.setdwAspect(const val : DWORD);
begin
_repastespecial(GetRecordPtr^).dwAspect := val;
end;
function ___repastespecial__Wrapper.getdwAspect : DWORD;
begin
result := _repastespecial(GetRecordPtr^).dwAspect;
end;
procedure ___repastespecial__Wrapper.setdwParam(const val : DWORD);
begin
_repastespecial(GetRecordPtr^).dwParam := val;
end;
function ___repastespecial__Wrapper.getdwParam : DWORD;
begin
result := _repastespecial(GetRecordPtr^).dwParam;
end;
function ___selchange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure ___selchange__Wrapper.setseltyp(const val : Word);
begin
_selchange(GetRecordPtr^).seltyp := val;
end;
function ___selchange__Wrapper.getseltyp : Word;
begin
result := _selchange(GetRecordPtr^).seltyp;
end;
function __CHARRANGE__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __CHARRANGE__Wrapper.setcpMin(const val : Longint);
begin
CHARRANGE(GetRecordPtr^).cpMin := val;
end;
function __CHARRANGE__Wrapper.getcpMin : Longint;
begin
result := CHARRANGE(GetRecordPtr^).cpMin;
end;
procedure __CHARRANGE__Wrapper.setcpMax(const val : Longint);
begin
CHARRANGE(GetRecordPtr^).cpMax := val;
end;
function __CHARRANGE__Wrapper.getcpMax : Longint;
begin
result := CHARRANGE(GetRecordPtr^).cpMax;
end;
function __COMPCOLOR__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __COMPCOLOR__Wrapper.setcrText(const val : TColorRef);
begin
COMPCOLOR(GetRecordPtr^).crText := val;
end;
function __COMPCOLOR__Wrapper.getcrText : TColorRef;
begin
result := COMPCOLOR(GetRecordPtr^).crText;
end;
procedure __COMPCOLOR__Wrapper.setcrBackground(const val : TColorRef);
begin
COMPCOLOR(GetRecordPtr^).crBackground := val;
end;
function __COMPCOLOR__Wrapper.getcrBackground : TColorRef;
begin
result := COMPCOLOR(GetRecordPtr^).crBackground;
end;
procedure __COMPCOLOR__Wrapper.setdwEffects(const val : Longint);
begin
COMPCOLOR(GetRecordPtr^).dwEffects := val;
end;
function __COMPCOLOR__Wrapper.getdwEffects : Longint;
begin
result := COMPCOLOR(GetRecordPtr^).dwEffects;
end;
function __EDITSTREAM__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __EDITSTREAM__Wrapper.setdwCookie(const val : Longint);
begin
EDITSTREAM(GetRecordPtr^).dwCookie := val;
end;
function __EDITSTREAM__Wrapper.getdwCookie : Longint;
begin
result := EDITSTREAM(GetRecordPtr^).dwCookie;
end;
procedure __EDITSTREAM__Wrapper.setdwError(const val : Longint);
begin
EDITSTREAM(GetRecordPtr^).dwError := val;
end;
function __EDITSTREAM__Wrapper.getdwError : Longint;
begin
result := EDITSTREAM(GetRecordPtr^).dwError;
end;
function __ENCORRECTTEXT__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __ENCORRECTTEXT__Wrapper.setseltyp(const val : Word);
begin
ENCORRECTTEXT(GetRecordPtr^).seltyp := val;
end;
function __ENCORRECTTEXT__Wrapper.getseltyp : Word;
begin
result := ENCORRECTTEXT(GetRecordPtr^).seltyp;
end;
function __ENPROTECTED__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __ENPROTECTED__Wrapper.setmsg(const val : UINT);
begin
ENPROTECTED(GetRecordPtr^).msg := val;
end;
function __ENPROTECTED__Wrapper.getmsg : UINT;
begin
result := ENPROTECTED(GetRecordPtr^).msg;
end;
procedure __ENPROTECTED__Wrapper.setwParam(const val : wParam);
begin
ENPROTECTED(GetRecordPtr^).wParam := val;
end;
function __ENPROTECTED__Wrapper.getwParam : wParam;
begin
result := ENPROTECTED(GetRecordPtr^).wParam;
end;
procedure __ENPROTECTED__Wrapper.setlParam(const val : lParam);
begin
ENPROTECTED(GetRecordPtr^).lParam := val;
end;
function __ENPROTECTED__Wrapper.getlParam : lParam;
begin
result := ENPROTECTED(GetRecordPtr^).lParam;
end;
function __ENSAVECLIPBOARD__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __ENSAVECLIPBOARD__Wrapper.setcObjectCount(const val : Longint);
begin
ENSAVECLIPBOARD(GetRecordPtr^).cObjectCount := val;
end;
function __ENSAVECLIPBOARD__Wrapper.getcObjectCount : Longint;
begin
result := ENSAVECLIPBOARD(GetRecordPtr^).cObjectCount;
end;
procedure __ENSAVECLIPBOARD__Wrapper.setcch(const val : Longint);
begin
ENSAVECLIPBOARD(GetRecordPtr^).cch := val;
end;
function __ENSAVECLIPBOARD__Wrapper.getcch : Longint;
begin
result := ENSAVECLIPBOARD(GetRecordPtr^).cch;
end;
function __FORMATRANGE__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __MSGFILTER__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __MSGFILTER__Wrapper.setmsg(const val : UINT);
begin
MSGFILTER(GetRecordPtr^).msg := val;
end;
function __MSGFILTER__Wrapper.getmsg : UINT;
begin
result := MSGFILTER(GetRecordPtr^).msg;
end;
procedure __MSGFILTER__Wrapper.setwParam(const val : wParam);
begin
MSGFILTER(GetRecordPtr^).wParam := val;
end;
function __MSGFILTER__Wrapper.getwParam : wParam;
begin
result := MSGFILTER(GetRecordPtr^).wParam;
end;
procedure __MSGFILTER__Wrapper.setlParam(const val : lParam);
begin
MSGFILTER(GetRecordPtr^).lParam := val;
end;
function __MSGFILTER__Wrapper.getlParam : lParam;
begin
result := MSGFILTER(GetRecordPtr^).lParam;
end;
function __PARAFORMAT__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __PARAFORMAT__Wrapper.setcbSize(const val : UINT);
begin
PARAFORMAT(GetRecordPtr^).cbSize := val;
end;
function __PARAFORMAT__Wrapper.getcbSize : UINT;
begin
result := PARAFORMAT(GetRecordPtr^).cbSize;
end;
procedure __PARAFORMAT__Wrapper.setdwMask(const val : DWORD);
begin
PARAFORMAT(GetRecordPtr^).dwMask := val;
end;
function __PARAFORMAT__Wrapper.getdwMask : DWORD;
begin
result := PARAFORMAT(GetRecordPtr^).dwMask;
end;
procedure __PARAFORMAT__Wrapper.setwNumbering(const val : Word);
begin
PARAFORMAT(GetRecordPtr^).wNumbering := val;
end;
function __PARAFORMAT__Wrapper.getwNumbering : Word;
begin
result := PARAFORMAT(GetRecordPtr^).wNumbering;
end;
procedure __PARAFORMAT__Wrapper.setwReserved(const val : Word);
begin
PARAFORMAT(GetRecordPtr^).wReserved := val;
end;
function __PARAFORMAT__Wrapper.getwReserved : Word;
begin
result := PARAFORMAT(GetRecordPtr^).wReserved;
end;
procedure __PARAFORMAT__Wrapper.setdxStartIndent(const val : Longint);
begin
PARAFORMAT(GetRecordPtr^).dxStartIndent := val;
end;
function __PARAFORMAT__Wrapper.getdxStartIndent : Longint;
begin
result := PARAFORMAT(GetRecordPtr^).dxStartIndent;
end;
procedure __PARAFORMAT__Wrapper.setdxRightIndent(const val : Longint);
begin
PARAFORMAT(GetRecordPtr^).dxRightIndent := val;
end;
function __PARAFORMAT__Wrapper.getdxRightIndent : Longint;
begin
result := PARAFORMAT(GetRecordPtr^).dxRightIndent;
end;
procedure __PARAFORMAT__Wrapper.setdxOffset(const val : Longint);
begin
PARAFORMAT(GetRecordPtr^).dxOffset := val;
end;
function __PARAFORMAT__Wrapper.getdxOffset : Longint;
begin
result := PARAFORMAT(GetRecordPtr^).dxOffset;
end;
procedure __PARAFORMAT__Wrapper.setwAlignment(const val : Word);
begin
PARAFORMAT(GetRecordPtr^).wAlignment := val;
end;
function __PARAFORMAT__Wrapper.getwAlignment : Word;
begin
result := PARAFORMAT(GetRecordPtr^).wAlignment;
end;
procedure __PARAFORMAT__Wrapper.setcTabCount(const val : SmallInt);
begin
PARAFORMAT(GetRecordPtr^).cTabCount := val;
end;
function __PARAFORMAT__Wrapper.getcTabCount : SmallInt;
begin
result := PARAFORMAT(GetRecordPtr^).cTabCount;
end;
function __PUNCTUATION__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __PUNCTUATION__Wrapper.setiSize(const val : UINT);
begin
PUNCTUATION(GetRecordPtr^).iSize := val;
end;
function __PUNCTUATION__Wrapper.getiSize : UINT;
begin
result := PUNCTUATION(GetRecordPtr^).iSize;
end;
function __REPASTESPECIAL__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __REPASTESPECIAL__Wrapper.setdwAspect(const val : DWORD);
begin
REPASTESPECIAL(GetRecordPtr^).dwAspect := val;
end;
function __REPASTESPECIAL__Wrapper.getdwAspect : DWORD;
begin
result := REPASTESPECIAL(GetRecordPtr^).dwAspect;
end;
procedure __REPASTESPECIAL__Wrapper.setdwParam(const val : DWORD);
begin
REPASTESPECIAL(GetRecordPtr^).dwParam := val;
end;
function __REPASTESPECIAL__Wrapper.getdwParam : DWORD;
begin
result := REPASTESPECIAL(GetRecordPtr^).dwParam;
end;
function __SELCHANGE__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __SELCHANGE__Wrapper.setseltyp(const val : Word);
begin
SELCHANGE(GetRecordPtr^).seltyp := val;
end;
function __SELCHANGE__Wrapper.getseltyp : Word;
begin
result := SELCHANGE(GetRecordPtr^).seltyp;
end;
function __TCharFormat__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCharFormat__Wrapper.setcbSize(const val : UINT);
begin
TCharFormat(GetRecordPtr^).cbSize := val;
end;
function __TCharFormat__Wrapper.getcbSize : UINT;
begin
result := TCharFormat(GetRecordPtr^).cbSize;
end;
procedure __TCharFormat__Wrapper.setdwMask(const val : Longint);
begin
TCharFormat(GetRecordPtr^).dwMask := val;
end;
function __TCharFormat__Wrapper.getdwMask : Longint;
begin
result := TCharFormat(GetRecordPtr^).dwMask;
end;
procedure __TCharFormat__Wrapper.setdwEffects(const val : Longint);
begin
TCharFormat(GetRecordPtr^).dwEffects := val;
end;
function __TCharFormat__Wrapper.getdwEffects : Longint;
begin
result := TCharFormat(GetRecordPtr^).dwEffects;
end;
procedure __TCharFormat__Wrapper.setyHeight(const val : Longint);
begin
TCharFormat(GetRecordPtr^).yHeight := val;
end;
function __TCharFormat__Wrapper.getyHeight : Longint;
begin
result := TCharFormat(GetRecordPtr^).yHeight;
end;
procedure __TCharFormat__Wrapper.setyOffset(const val : Longint);
begin
TCharFormat(GetRecordPtr^).yOffset := val;
end;
function __TCharFormat__Wrapper.getyOffset : Longint;
begin
result := TCharFormat(GetRecordPtr^).yOffset;
end;
procedure __TCharFormat__Wrapper.setcrTextColor(const val : TColorRef);
begin
TCharFormat(GetRecordPtr^).crTextColor := val;
end;
function __TCharFormat__Wrapper.getcrTextColor : TColorRef;
begin
result := TCharFormat(GetRecordPtr^).crTextColor;
end;
procedure __TCharFormat__Wrapper.setbCharSet(const val : Byte);
begin
TCharFormat(GetRecordPtr^).bCharSet := val;
end;
function __TCharFormat__Wrapper.getbCharSet : Byte;
begin
result := TCharFormat(GetRecordPtr^).bCharSet;
end;
procedure __TCharFormat__Wrapper.setbPitchAndFamily(const val : Byte);
begin
TCharFormat(GetRecordPtr^).bPitchAndFamily := val;
end;
function __TCharFormat__Wrapper.getbPitchAndFamily : Byte;
begin
result := TCharFormat(GetRecordPtr^).bPitchAndFamily;
end;
function __TCharFormat2__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCharFormat2__Wrapper.setcbSize(const val : UINT);
begin
TCharFormat2(GetRecordPtr^).cbSize := val;
end;
function __TCharFormat2__Wrapper.getcbSize : UINT;
begin
result := TCharFormat2(GetRecordPtr^).cbSize;
end;
procedure __TCharFormat2__Wrapper.setdwMask(const val : DWORD);
begin
TCharFormat2(GetRecordPtr^).dwMask := val;
end;
function __TCharFormat2__Wrapper.getdwMask : DWORD;
begin
result := TCharFormat2(GetRecordPtr^).dwMask;
end;
procedure __TCharFormat2__Wrapper.setdwEffects(const val : DWORD);
begin
TCharFormat2(GetRecordPtr^).dwEffects := val;
end;
function __TCharFormat2__Wrapper.getdwEffects : DWORD;
begin
result := TCharFormat2(GetRecordPtr^).dwEffects;
end;
procedure __TCharFormat2__Wrapper.setyHeight(const val : Longint);
begin
TCharFormat2(GetRecordPtr^).yHeight := val;
end;
function __TCharFormat2__Wrapper.getyHeight : Longint;
begin
result := TCharFormat2(GetRecordPtr^).yHeight;
end;
procedure __TCharFormat2__Wrapper.setyOffset(const val : Longint);
begin
TCharFormat2(GetRecordPtr^).yOffset := val;
end;
function __TCharFormat2__Wrapper.getyOffset : Longint;
begin
result := TCharFormat2(GetRecordPtr^).yOffset;
end;
procedure __TCharFormat2__Wrapper.setcrTextColor(const val : TColorRef);
begin
TCharFormat2(GetRecordPtr^).crTextColor := val;
end;
function __TCharFormat2__Wrapper.getcrTextColor : TColorRef;
begin
result := TCharFormat2(GetRecordPtr^).crTextColor;
end;
procedure __TCharFormat2__Wrapper.setbCharSet(const val : Byte);
begin
TCharFormat2(GetRecordPtr^).bCharSet := val;
end;
function __TCharFormat2__Wrapper.getbCharSet : Byte;
begin
result := TCharFormat2(GetRecordPtr^).bCharSet;
end;
procedure __TCharFormat2__Wrapper.setbPitchAndFamily(const val : Byte);
begin
TCharFormat2(GetRecordPtr^).bPitchAndFamily := val;
end;
function __TCharFormat2__Wrapper.getbPitchAndFamily : Byte;
begin
result := TCharFormat2(GetRecordPtr^).bPitchAndFamily;
end;
procedure __TCharFormat2__Wrapper.setwWeight(const val : Word);
begin
TCharFormat2(GetRecordPtr^).wWeight := val;
end;
function __TCharFormat2__Wrapper.getwWeight : Word;
begin
result := TCharFormat2(GetRecordPtr^).wWeight;
end;
procedure __TCharFormat2__Wrapper.setsSpacing(const val : SmallInt);
begin
TCharFormat2(GetRecordPtr^).sSpacing := val;
end;
function __TCharFormat2__Wrapper.getsSpacing : SmallInt;
begin
result := TCharFormat2(GetRecordPtr^).sSpacing;
end;
procedure __TCharFormat2__Wrapper.setcrBackColor(const val : TColorRef);
begin
TCharFormat2(GetRecordPtr^).crBackColor := val;
end;
function __TCharFormat2__Wrapper.getcrBackColor : TColorRef;
begin
result := TCharFormat2(GetRecordPtr^).crBackColor;
end;
procedure __TCharFormat2__Wrapper.setlid(const val : LCID);
begin
TCharFormat2(GetRecordPtr^).lid := val;
end;
function __TCharFormat2__Wrapper.getlid : LCID;
begin
result := TCharFormat2(GetRecordPtr^).lid;
end;
procedure __TCharFormat2__Wrapper.setdwReserved(const val : DWORD);
begin
TCharFormat2(GetRecordPtr^).dwReserved := val;
end;
function __TCharFormat2__Wrapper.getdwReserved : DWORD;
begin
result := TCharFormat2(GetRecordPtr^).dwReserved;
end;
procedure __TCharFormat2__Wrapper.setsStyle(const val : SmallInt);
begin
TCharFormat2(GetRecordPtr^).sStyle := val;
end;
function __TCharFormat2__Wrapper.getsStyle : SmallInt;
begin
result := TCharFormat2(GetRecordPtr^).sStyle;
end;
procedure __TCharFormat2__Wrapper.setwKerning(const val : Word);
begin
TCharFormat2(GetRecordPtr^).wKerning := val;
end;
function __TCharFormat2__Wrapper.getwKerning : Word;
begin
result := TCharFormat2(GetRecordPtr^).wKerning;
end;
procedure __TCharFormat2__Wrapper.setbUnderlineType(const val : Byte);
begin
TCharFormat2(GetRecordPtr^).bUnderlineType := val;
end;
function __TCharFormat2__Wrapper.getbUnderlineType : Byte;
begin
result := TCharFormat2(GetRecordPtr^).bUnderlineType;
end;
procedure __TCharFormat2__Wrapper.setbAnimation(const val : Byte);
begin
TCharFormat2(GetRecordPtr^).bAnimation := val;
end;
function __TCharFormat2__Wrapper.getbAnimation : Byte;
begin
result := TCharFormat2(GetRecordPtr^).bAnimation;
end;
procedure __TCharFormat2__Wrapper.setbRevAuthor(const val : Byte);
begin
TCharFormat2(GetRecordPtr^).bRevAuthor := val;
end;
function __TCharFormat2__Wrapper.getbRevAuthor : Byte;
begin
result := TCharFormat2(GetRecordPtr^).bRevAuthor;
end;
procedure __TCharFormat2__Wrapper.setbReserved1(const val : Byte);
begin
TCharFormat2(GetRecordPtr^).bReserved1 := val;
end;
function __TCharFormat2__Wrapper.getbReserved1 : Byte;
begin
result := TCharFormat2(GetRecordPtr^).bReserved1;
end;
function __TCharFormat2A__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCharFormat2A__Wrapper.setcbSize(const val : UINT);
begin
TCharFormat2A(GetRecordPtr^).cbSize := val;
end;
function __TCharFormat2A__Wrapper.getcbSize : UINT;
begin
result := TCharFormat2A(GetRecordPtr^).cbSize;
end;
procedure __TCharFormat2A__Wrapper.setdwMask(const val : DWORD);
begin
TCharFormat2A(GetRecordPtr^).dwMask := val;
end;
function __TCharFormat2A__Wrapper.getdwMask : DWORD;
begin
result := TCharFormat2A(GetRecordPtr^).dwMask;
end;
procedure __TCharFormat2A__Wrapper.setdwEffects(const val : DWORD);
begin
TCharFormat2A(GetRecordPtr^).dwEffects := val;
end;
function __TCharFormat2A__Wrapper.getdwEffects : DWORD;
begin
result := TCharFormat2A(GetRecordPtr^).dwEffects;
end;
procedure __TCharFormat2A__Wrapper.setyHeight(const val : Longint);
begin
TCharFormat2A(GetRecordPtr^).yHeight := val;
end;
function __TCharFormat2A__Wrapper.getyHeight : Longint;
begin
result := TCharFormat2A(GetRecordPtr^).yHeight;
end;
procedure __TCharFormat2A__Wrapper.setyOffset(const val : Longint);
begin
TCharFormat2A(GetRecordPtr^).yOffset := val;
end;
function __TCharFormat2A__Wrapper.getyOffset : Longint;
begin
result := TCharFormat2A(GetRecordPtr^).yOffset;
end;
procedure __TCharFormat2A__Wrapper.setcrTextColor(const val : TColorRef);
begin
TCharFormat2A(GetRecordPtr^).crTextColor := val;
end;
function __TCharFormat2A__Wrapper.getcrTextColor : TColorRef;
begin
result := TCharFormat2A(GetRecordPtr^).crTextColor;
end;
procedure __TCharFormat2A__Wrapper.setbCharSet(const val : Byte);
begin
TCharFormat2A(GetRecordPtr^).bCharSet := val;
end;
function __TCharFormat2A__Wrapper.getbCharSet : Byte;
begin
result := TCharFormat2A(GetRecordPtr^).bCharSet;
end;
procedure __TCharFormat2A__Wrapper.setbPitchAndFamily(const val : Byte);
begin
TCharFormat2A(GetRecordPtr^).bPitchAndFamily := val;
end;
function __TCharFormat2A__Wrapper.getbPitchAndFamily : Byte;
begin
result := TCharFormat2A(GetRecordPtr^).bPitchAndFamily;
end;
procedure __TCharFormat2A__Wrapper.setwWeight(const val : Word);
begin
TCharFormat2A(GetRecordPtr^).wWeight := val;
end;
function __TCharFormat2A__Wrapper.getwWeight : Word;
begin
result := TCharFormat2A(GetRecordPtr^).wWeight;
end;
procedure __TCharFormat2A__Wrapper.setsSpacing(const val : SmallInt);
begin
TCharFormat2A(GetRecordPtr^).sSpacing := val;
end;
function __TCharFormat2A__Wrapper.getsSpacing : SmallInt;
begin
result := TCharFormat2A(GetRecordPtr^).sSpacing;
end;
procedure __TCharFormat2A__Wrapper.setcrBackColor(const val : TColorRef);
begin
TCharFormat2A(GetRecordPtr^).crBackColor := val;
end;
function __TCharFormat2A__Wrapper.getcrBackColor : TColorRef;
begin
result := TCharFormat2A(GetRecordPtr^).crBackColor;
end;
procedure __TCharFormat2A__Wrapper.setlid(const val : LCID);
begin
TCharFormat2A(GetRecordPtr^).lid := val;
end;
function __TCharFormat2A__Wrapper.getlid : LCID;
begin
result := TCharFormat2A(GetRecordPtr^).lid;
end;
procedure __TCharFormat2A__Wrapper.setdwReserved(const val : DWORD);
begin
TCharFormat2A(GetRecordPtr^).dwReserved := val;
end;
function __TCharFormat2A__Wrapper.getdwReserved : DWORD;
begin
result := TCharFormat2A(GetRecordPtr^).dwReserved;
end;
procedure __TCharFormat2A__Wrapper.setsStyle(const val : SmallInt);
begin
TCharFormat2A(GetRecordPtr^).sStyle := val;
end;
function __TCharFormat2A__Wrapper.getsStyle : SmallInt;
begin
result := TCharFormat2A(GetRecordPtr^).sStyle;
end;
procedure __TCharFormat2A__Wrapper.setwKerning(const val : Word);
begin
TCharFormat2A(GetRecordPtr^).wKerning := val;
end;
function __TCharFormat2A__Wrapper.getwKerning : Word;
begin
result := TCharFormat2A(GetRecordPtr^).wKerning;
end;
procedure __TCharFormat2A__Wrapper.setbUnderlineType(const val : Byte);
begin
TCharFormat2A(GetRecordPtr^).bUnderlineType := val;
end;
function __TCharFormat2A__Wrapper.getbUnderlineType : Byte;
begin
result := TCharFormat2A(GetRecordPtr^).bUnderlineType;
end;
procedure __TCharFormat2A__Wrapper.setbAnimation(const val : Byte);
begin
TCharFormat2A(GetRecordPtr^).bAnimation := val;
end;
function __TCharFormat2A__Wrapper.getbAnimation : Byte;
begin
result := TCharFormat2A(GetRecordPtr^).bAnimation;
end;
procedure __TCharFormat2A__Wrapper.setbRevAuthor(const val : Byte);
begin
TCharFormat2A(GetRecordPtr^).bRevAuthor := val;
end;
function __TCharFormat2A__Wrapper.getbRevAuthor : Byte;
begin
result := TCharFormat2A(GetRecordPtr^).bRevAuthor;
end;
procedure __TCharFormat2A__Wrapper.setbReserved1(const val : Byte);
begin
TCharFormat2A(GetRecordPtr^).bReserved1 := val;
end;
function __TCharFormat2A__Wrapper.getbReserved1 : Byte;
begin
result := TCharFormat2A(GetRecordPtr^).bReserved1;
end;
function __TCharFormat2W__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCharFormat2W__Wrapper.setcbSize(const val : UINT);
begin
TCharFormat2W(GetRecordPtr^).cbSize := val;
end;
function __TCharFormat2W__Wrapper.getcbSize : UINT;
begin
result := TCharFormat2W(GetRecordPtr^).cbSize;
end;
procedure __TCharFormat2W__Wrapper.setdwMask(const val : DWORD);
begin
TCharFormat2W(GetRecordPtr^).dwMask := val;
end;
function __TCharFormat2W__Wrapper.getdwMask : DWORD;
begin
result := TCharFormat2W(GetRecordPtr^).dwMask;
end;
procedure __TCharFormat2W__Wrapper.setdwEffects(const val : DWORD);
begin
TCharFormat2W(GetRecordPtr^).dwEffects := val;
end;
function __TCharFormat2W__Wrapper.getdwEffects : DWORD;
begin
result := TCharFormat2W(GetRecordPtr^).dwEffects;
end;
procedure __TCharFormat2W__Wrapper.setyHeight(const val : Longint);
begin
TCharFormat2W(GetRecordPtr^).yHeight := val;
end;
function __TCharFormat2W__Wrapper.getyHeight : Longint;
begin
result := TCharFormat2W(GetRecordPtr^).yHeight;
end;
procedure __TCharFormat2W__Wrapper.setyOffset(const val : Longint);
begin
TCharFormat2W(GetRecordPtr^).yOffset := val;
end;
function __TCharFormat2W__Wrapper.getyOffset : Longint;
begin
result := TCharFormat2W(GetRecordPtr^).yOffset;
end;
procedure __TCharFormat2W__Wrapper.setcrTextColor(const val : TColorRef);
begin
TCharFormat2W(GetRecordPtr^).crTextColor := val;
end;
function __TCharFormat2W__Wrapper.getcrTextColor : TColorRef;
begin
result := TCharFormat2W(GetRecordPtr^).crTextColor;
end;
procedure __TCharFormat2W__Wrapper.setbCharSet(const val : Byte);
begin
TCharFormat2W(GetRecordPtr^).bCharSet := val;
end;
function __TCharFormat2W__Wrapper.getbCharSet : Byte;
begin
result := TCharFormat2W(GetRecordPtr^).bCharSet;
end;
procedure __TCharFormat2W__Wrapper.setbPitchAndFamily(const val : Byte);
begin
TCharFormat2W(GetRecordPtr^).bPitchAndFamily := val;
end;
function __TCharFormat2W__Wrapper.getbPitchAndFamily : Byte;
begin
result := TCharFormat2W(GetRecordPtr^).bPitchAndFamily;
end;
procedure __TCharFormat2W__Wrapper.setwWeight(const val : Word);
begin
TCharFormat2W(GetRecordPtr^).wWeight := val;
end;
function __TCharFormat2W__Wrapper.getwWeight : Word;
begin
result := TCharFormat2W(GetRecordPtr^).wWeight;
end;
procedure __TCharFormat2W__Wrapper.setsSpacing(const val : SmallInt);
begin
TCharFormat2W(GetRecordPtr^).sSpacing := val;
end;
function __TCharFormat2W__Wrapper.getsSpacing : SmallInt;
begin
result := TCharFormat2W(GetRecordPtr^).sSpacing;
end;
procedure __TCharFormat2W__Wrapper.setcrBackColor(const val : TColorRef);
begin
TCharFormat2W(GetRecordPtr^).crBackColor := val;
end;
function __TCharFormat2W__Wrapper.getcrBackColor : TColorRef;
begin
result := TCharFormat2W(GetRecordPtr^).crBackColor;
end;
procedure __TCharFormat2W__Wrapper.setlid(const val : LCID);
begin
TCharFormat2W(GetRecordPtr^).lid := val;
end;
function __TCharFormat2W__Wrapper.getlid : LCID;
begin
result := TCharFormat2W(GetRecordPtr^).lid;
end;
procedure __TCharFormat2W__Wrapper.setdwReserved(const val : DWORD);
begin
TCharFormat2W(GetRecordPtr^).dwReserved := val;
end;
function __TCharFormat2W__Wrapper.getdwReserved : DWORD;
begin
result := TCharFormat2W(GetRecordPtr^).dwReserved;
end;
procedure __TCharFormat2W__Wrapper.setsStyle(const val : SmallInt);
begin
TCharFormat2W(GetRecordPtr^).sStyle := val;
end;
function __TCharFormat2W__Wrapper.getsStyle : SmallInt;
begin
result := TCharFormat2W(GetRecordPtr^).sStyle;
end;
procedure __TCharFormat2W__Wrapper.setwKerning(const val : Word);
begin
TCharFormat2W(GetRecordPtr^).wKerning := val;
end;
function __TCharFormat2W__Wrapper.getwKerning : Word;
begin
result := TCharFormat2W(GetRecordPtr^).wKerning;
end;
procedure __TCharFormat2W__Wrapper.setbUnderlineType(const val : Byte);
begin
TCharFormat2W(GetRecordPtr^).bUnderlineType := val;
end;
function __TCharFormat2W__Wrapper.getbUnderlineType : Byte;
begin
result := TCharFormat2W(GetRecordPtr^).bUnderlineType;
end;
procedure __TCharFormat2W__Wrapper.setbAnimation(const val : Byte);
begin
TCharFormat2W(GetRecordPtr^).bAnimation := val;
end;
function __TCharFormat2W__Wrapper.getbAnimation : Byte;
begin
result := TCharFormat2W(GetRecordPtr^).bAnimation;
end;
procedure __TCharFormat2W__Wrapper.setbRevAuthor(const val : Byte);
begin
TCharFormat2W(GetRecordPtr^).bRevAuthor := val;
end;
function __TCharFormat2W__Wrapper.getbRevAuthor : Byte;
begin
result := TCharFormat2W(GetRecordPtr^).bRevAuthor;
end;
procedure __TCharFormat2W__Wrapper.setbReserved1(const val : Byte);
begin
TCharFormat2W(GetRecordPtr^).bReserved1 := val;
end;
function __TCharFormat2W__Wrapper.getbReserved1 : Byte;
begin
result := TCharFormat2W(GetRecordPtr^).bReserved1;
end;
function __TCharFormatA__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCharFormatA__Wrapper.setcbSize(const val : UINT);
begin
TCharFormatA(GetRecordPtr^).cbSize := val;
end;
function __TCharFormatA__Wrapper.getcbSize : UINT;
begin
result := TCharFormatA(GetRecordPtr^).cbSize;
end;
procedure __TCharFormatA__Wrapper.setdwMask(const val : Longint);
begin
TCharFormatA(GetRecordPtr^).dwMask := val;
end;
function __TCharFormatA__Wrapper.getdwMask : Longint;
begin
result := TCharFormatA(GetRecordPtr^).dwMask;
end;
procedure __TCharFormatA__Wrapper.setdwEffects(const val : Longint);
begin
TCharFormatA(GetRecordPtr^).dwEffects := val;
end;
function __TCharFormatA__Wrapper.getdwEffects : Longint;
begin
result := TCharFormatA(GetRecordPtr^).dwEffects;
end;
procedure __TCharFormatA__Wrapper.setyHeight(const val : Longint);
begin
TCharFormatA(GetRecordPtr^).yHeight := val;
end;
function __TCharFormatA__Wrapper.getyHeight : Longint;
begin
result := TCharFormatA(GetRecordPtr^).yHeight;
end;
procedure __TCharFormatA__Wrapper.setyOffset(const val : Longint);
begin
TCharFormatA(GetRecordPtr^).yOffset := val;
end;
function __TCharFormatA__Wrapper.getyOffset : Longint;
begin
result := TCharFormatA(GetRecordPtr^).yOffset;
end;
procedure __TCharFormatA__Wrapper.setcrTextColor(const val : TColorRef);
begin
TCharFormatA(GetRecordPtr^).crTextColor := val;
end;
function __TCharFormatA__Wrapper.getcrTextColor : TColorRef;
begin
result := TCharFormatA(GetRecordPtr^).crTextColor;
end;
procedure __TCharFormatA__Wrapper.setbCharSet(const val : Byte);
begin
TCharFormatA(GetRecordPtr^).bCharSet := val;
end;
function __TCharFormatA__Wrapper.getbCharSet : Byte;
begin
result := TCharFormatA(GetRecordPtr^).bCharSet;
end;
procedure __TCharFormatA__Wrapper.setbPitchAndFamily(const val : Byte);
begin
TCharFormatA(GetRecordPtr^).bPitchAndFamily := val;
end;
function __TCharFormatA__Wrapper.getbPitchAndFamily : Byte;
begin
result := TCharFormatA(GetRecordPtr^).bPitchAndFamily;
end;
function __TCharFormatW__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCharFormatW__Wrapper.setcbSize(const val : UINT);
begin
TCharFormatW(GetRecordPtr^).cbSize := val;
end;
function __TCharFormatW__Wrapper.getcbSize : UINT;
begin
result := TCharFormatW(GetRecordPtr^).cbSize;
end;
procedure __TCharFormatW__Wrapper.setdwMask(const val : Longint);
begin
TCharFormatW(GetRecordPtr^).dwMask := val;
end;
function __TCharFormatW__Wrapper.getdwMask : Longint;
begin
result := TCharFormatW(GetRecordPtr^).dwMask;
end;
procedure __TCharFormatW__Wrapper.setdwEffects(const val : Longint);
begin
TCharFormatW(GetRecordPtr^).dwEffects := val;
end;
function __TCharFormatW__Wrapper.getdwEffects : Longint;
begin
result := TCharFormatW(GetRecordPtr^).dwEffects;
end;
procedure __TCharFormatW__Wrapper.setyHeight(const val : Longint);
begin
TCharFormatW(GetRecordPtr^).yHeight := val;
end;
function __TCharFormatW__Wrapper.getyHeight : Longint;
begin
result := TCharFormatW(GetRecordPtr^).yHeight;
end;
procedure __TCharFormatW__Wrapper.setyOffset(const val : Longint);
begin
TCharFormatW(GetRecordPtr^).yOffset := val;
end;
function __TCharFormatW__Wrapper.getyOffset : Longint;
begin
result := TCharFormatW(GetRecordPtr^).yOffset;
end;
procedure __TCharFormatW__Wrapper.setcrTextColor(const val : TColorRef);
begin
TCharFormatW(GetRecordPtr^).crTextColor := val;
end;
function __TCharFormatW__Wrapper.getcrTextColor : TColorRef;
begin
result := TCharFormatW(GetRecordPtr^).crTextColor;
end;
procedure __TCharFormatW__Wrapper.setbCharSet(const val : Byte);
begin
TCharFormatW(GetRecordPtr^).bCharSet := val;
end;
function __TCharFormatW__Wrapper.getbCharSet : Byte;
begin
result := TCharFormatW(GetRecordPtr^).bCharSet;
end;
procedure __TCharFormatW__Wrapper.setbPitchAndFamily(const val : Byte);
begin
TCharFormatW(GetRecordPtr^).bPitchAndFamily := val;
end;
function __TCharFormatW__Wrapper.getbPitchAndFamily : Byte;
begin
result := TCharFormatW(GetRecordPtr^).bPitchAndFamily;
end;
function __TCharRange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCharRange__Wrapper.setcpMin(const val : Longint);
begin
TCharRange(GetRecordPtr^).cpMin := val;
end;
function __TCharRange__Wrapper.getcpMin : Longint;
begin
result := TCharRange(GetRecordPtr^).cpMin;
end;
procedure __TCharRange__Wrapper.setcpMax(const val : Longint);
begin
TCharRange(GetRecordPtr^).cpMax := val;
end;
function __TCharRange__Wrapper.getcpMax : Longint;
begin
result := TCharRange(GetRecordPtr^).cpMax;
end;
function __TCompColor__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCompColor__Wrapper.setcrText(const val : TColorRef);
begin
TCompColor(GetRecordPtr^).crText := val;
end;
function __TCompColor__Wrapper.getcrText : TColorRef;
begin
result := TCompColor(GetRecordPtr^).crText;
end;
procedure __TCompColor__Wrapper.setcrBackground(const val : TColorRef);
begin
TCompColor(GetRecordPtr^).crBackground := val;
end;
function __TCompColor__Wrapper.getcrBackground : TColorRef;
begin
result := TCompColor(GetRecordPtr^).crBackground;
end;
procedure __TCompColor__Wrapper.setdwEffects(const val : Longint);
begin
TCompColor(GetRecordPtr^).dwEffects := val;
end;
function __TCompColor__Wrapper.getdwEffects : Longint;
begin
result := TCompColor(GetRecordPtr^).dwEffects;
end;
function __TEditStream__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TEditStream__Wrapper.setdwCookie(const val : Longint);
begin
TEditStream(GetRecordPtr^).dwCookie := val;
end;
function __TEditStream__Wrapper.getdwCookie : Longint;
begin
result := TEditStream(GetRecordPtr^).dwCookie;
end;
procedure __TEditStream__Wrapper.setdwError(const val : Longint);
begin
TEditStream(GetRecordPtr^).dwError := val;
end;
function __TEditStream__Wrapper.getdwError : Longint;
begin
result := TEditStream(GetRecordPtr^).dwError;
end;
function __TENCorrectText__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TENCorrectText__Wrapper.setseltyp(const val : Word);
begin
TENCorrectText(GetRecordPtr^).seltyp := val;
end;
function __TENCorrectText__Wrapper.getseltyp : Word;
begin
result := TENCorrectText(GetRecordPtr^).seltyp;
end;
function __TEndDropFiles__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TEndDropFiles__Wrapper.sethDrop(const val : THandle);
begin
TEndDropFiles(GetRecordPtr^).hDrop := val;
end;
function __TEndDropFiles__Wrapper.gethDrop : THandle;
begin
result := TEndDropFiles(GetRecordPtr^).hDrop;
end;
procedure __TEndDropFiles__Wrapper.setcp(const val : Longint);
begin
TEndDropFiles(GetRecordPtr^).cp := val;
end;
function __TEndDropFiles__Wrapper.getcp : Longint;
begin
result := TEndDropFiles(GetRecordPtr^).cp;
end;
procedure __TEndDropFiles__Wrapper.setfProtected(const val : Bool);
begin
TEndDropFiles(GetRecordPtr^).fProtected := val;
end;
function __TEndDropFiles__Wrapper.getfProtected : Bool;
begin
result := TEndDropFiles(GetRecordPtr^).fProtected;
end;
function __TENLink__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TENLink__Wrapper.setmsg(const val : UINT);
begin
TENLink(GetRecordPtr^).msg := val;
end;
function __TENLink__Wrapper.getmsg : UINT;
begin
result := TENLink(GetRecordPtr^).msg;
end;
procedure __TENLink__Wrapper.setwParam(const val : wParam);
begin
TENLink(GetRecordPtr^).wParam := val;
end;
function __TENLink__Wrapper.getwParam : wParam;
begin
result := TENLink(GetRecordPtr^).wParam;
end;
procedure __TENLink__Wrapper.setlParam(const val : lParam);
begin
TENLink(GetRecordPtr^).lParam := val;
end;
function __TENLink__Wrapper.getlParam : lParam;
begin
result := TENLink(GetRecordPtr^).lParam;
end;
function __TENOleOpFailed__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TENOleOpFailed__Wrapper.setiob(const val : Longint);
begin
TENOleOpFailed(GetRecordPtr^).iob := val;
end;
function __TENOleOpFailed__Wrapper.getiob : Longint;
begin
result := TENOleOpFailed(GetRecordPtr^).iob;
end;
procedure __TENOleOpFailed__Wrapper.setlOper(const val : Longint);
begin
TENOleOpFailed(GetRecordPtr^).lOper := val;
end;
function __TENOleOpFailed__Wrapper.getlOper : Longint;
begin
result := TENOleOpFailed(GetRecordPtr^).lOper;
end;
function __TENProtected__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TENProtected__Wrapper.setmsg(const val : UINT);
begin
TENProtected(GetRecordPtr^).msg := val;
end;
function __TENProtected__Wrapper.getmsg : UINT;
begin
result := TENProtected(GetRecordPtr^).msg;
end;
procedure __TENProtected__Wrapper.setwParam(const val : wParam);
begin
TENProtected(GetRecordPtr^).wParam := val;
end;
function __TENProtected__Wrapper.getwParam : wParam;
begin
result := TENProtected(GetRecordPtr^).wParam;
end;
procedure __TENProtected__Wrapper.setlParam(const val : lParam);
begin
TENProtected(GetRecordPtr^).lParam := val;
end;
function __TENProtected__Wrapper.getlParam : lParam;
begin
result := TENProtected(GetRecordPtr^).lParam;
end;
function __TENSaveClipboard__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TENSaveClipboard__Wrapper.setcObjectCount(const val : Longint);
begin
TENSaveClipboard(GetRecordPtr^).cObjectCount := val;
end;
function __TENSaveClipboard__Wrapper.getcObjectCount : Longint;
begin
result := TENSaveClipboard(GetRecordPtr^).cObjectCount;
end;
procedure __TENSaveClipboard__Wrapper.setcch(const val : Longint);
begin
TENSaveClipboard(GetRecordPtr^).cch := val;
end;
function __TENSaveClipboard__Wrapper.getcch : Longint;
begin
result := TENSaveClipboard(GetRecordPtr^).cch;
end;
function __TFindText__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TFindTextA__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TFindTextExA__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TFindTextExW__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TFindTextW__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TFormatRange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TGetTextEx__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGetTextEx__Wrapper.setcb(const val : DWORD);
begin
TGetTextEx(GetRecordPtr^).cb := val;
end;
function __TGetTextEx__Wrapper.getcb : DWORD;
begin
result := TGetTextEx(GetRecordPtr^).cb;
end;
procedure __TGetTextEx__Wrapper.setflags(const val : DWORD);
begin
TGetTextEx(GetRecordPtr^).flags := val;
end;
function __TGetTextEx__Wrapper.getflags : DWORD;
begin
result := TGetTextEx(GetRecordPtr^).flags;
end;
procedure __TGetTextEx__Wrapper.setcodepage(const val : UINT);
begin
TGetTextEx(GetRecordPtr^).codepage := val;
end;
function __TGetTextEx__Wrapper.getcodepage : UINT;
begin
result := TGetTextEx(GetRecordPtr^).codepage;
end;
function __TGetTextLengthEx__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGetTextLengthEx__Wrapper.setflags(const val : DWORD);
begin
TGetTextLengthEx(GetRecordPtr^).flags := val;
end;
function __TGetTextLengthEx__Wrapper.getflags : DWORD;
begin
result := TGetTextLengthEx(GetRecordPtr^).flags;
end;
procedure __TGetTextLengthEx__Wrapper.setcodepage(const val : UINT);
begin
TGetTextLengthEx(GetRecordPtr^).codepage := val;
end;
function __TGetTextLengthEx__Wrapper.getcodepage : UINT;
begin
result := TGetTextLengthEx(GetRecordPtr^).codepage;
end;
function __TMsgFilter__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMsgFilter__Wrapper.setmsg(const val : UINT);
begin
TMsgFilter(GetRecordPtr^).msg := val;
end;
function __TMsgFilter__Wrapper.getmsg : UINT;
begin
result := TMsgFilter(GetRecordPtr^).msg;
end;
procedure __TMsgFilter__Wrapper.setwParam(const val : wParam);
begin
TMsgFilter(GetRecordPtr^).wParam := val;
end;
function __TMsgFilter__Wrapper.getwParam : wParam;
begin
result := TMsgFilter(GetRecordPtr^).wParam;
end;
procedure __TMsgFilter__Wrapper.setlParam(const val : lParam);
begin
TMsgFilter(GetRecordPtr^).lParam := val;
end;
function __TMsgFilter__Wrapper.getlParam : lParam;
begin
result := TMsgFilter(GetRecordPtr^).lParam;
end;
function __TObjectPositions__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TObjectPositions__Wrapper.setcObjectCount(const val : Longint);
begin
TObjectPositions(GetRecordPtr^).cObjectCount := val;
end;
function __TObjectPositions__Wrapper.getcObjectCount : Longint;
begin
result := TObjectPositions(GetRecordPtr^).cObjectCount;
end;
function __TParaFormat__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TParaFormat__Wrapper.setcbSize(const val : UINT);
begin
TParaFormat(GetRecordPtr^).cbSize := val;
end;
function __TParaFormat__Wrapper.getcbSize : UINT;
begin
result := TParaFormat(GetRecordPtr^).cbSize;
end;
procedure __TParaFormat__Wrapper.setdwMask(const val : DWORD);
begin
TParaFormat(GetRecordPtr^).dwMask := val;
end;
function __TParaFormat__Wrapper.getdwMask : DWORD;
begin
result := TParaFormat(GetRecordPtr^).dwMask;
end;
procedure __TParaFormat__Wrapper.setwNumbering(const val : Word);
begin
TParaFormat(GetRecordPtr^).wNumbering := val;
end;
function __TParaFormat__Wrapper.getwNumbering : Word;
begin
result := TParaFormat(GetRecordPtr^).wNumbering;
end;
procedure __TParaFormat__Wrapper.setwReserved(const val : Word);
begin
TParaFormat(GetRecordPtr^).wReserved := val;
end;
function __TParaFormat__Wrapper.getwReserved : Word;
begin
result := TParaFormat(GetRecordPtr^).wReserved;
end;
procedure __TParaFormat__Wrapper.setdxStartIndent(const val : Longint);
begin
TParaFormat(GetRecordPtr^).dxStartIndent := val;
end;
function __TParaFormat__Wrapper.getdxStartIndent : Longint;
begin
result := TParaFormat(GetRecordPtr^).dxStartIndent;
end;
procedure __TParaFormat__Wrapper.setdxRightIndent(const val : Longint);
begin
TParaFormat(GetRecordPtr^).dxRightIndent := val;
end;
function __TParaFormat__Wrapper.getdxRightIndent : Longint;
begin
result := TParaFormat(GetRecordPtr^).dxRightIndent;
end;
procedure __TParaFormat__Wrapper.setdxOffset(const val : Longint);
begin
TParaFormat(GetRecordPtr^).dxOffset := val;
end;
function __TParaFormat__Wrapper.getdxOffset : Longint;
begin
result := TParaFormat(GetRecordPtr^).dxOffset;
end;
procedure __TParaFormat__Wrapper.setwAlignment(const val : Word);
begin
TParaFormat(GetRecordPtr^).wAlignment := val;
end;
function __TParaFormat__Wrapper.getwAlignment : Word;
begin
result := TParaFormat(GetRecordPtr^).wAlignment;
end;
procedure __TParaFormat__Wrapper.setcTabCount(const val : SmallInt);
begin
TParaFormat(GetRecordPtr^).cTabCount := val;
end;
function __TParaFormat__Wrapper.getcTabCount : SmallInt;
begin
result := TParaFormat(GetRecordPtr^).cTabCount;
end;
function __TParaFormat2__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TParaFormat2__Wrapper.setcbSize(const val : UINT);
begin
TParaFormat2(GetRecordPtr^).cbSize := val;
end;
function __TParaFormat2__Wrapper.getcbSize : UINT;
begin
result := TParaFormat2(GetRecordPtr^).cbSize;
end;
procedure __TParaFormat2__Wrapper.setdwMask(const val : DWORD);
begin
TParaFormat2(GetRecordPtr^).dwMask := val;
end;
function __TParaFormat2__Wrapper.getdwMask : DWORD;
begin
result := TParaFormat2(GetRecordPtr^).dwMask;
end;
procedure __TParaFormat2__Wrapper.setwNumbering(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wNumbering := val;
end;
function __TParaFormat2__Wrapper.getwNumbering : Word;
begin
result := TParaFormat2(GetRecordPtr^).wNumbering;
end;
procedure __TParaFormat2__Wrapper.setwReserved(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wReserved := val;
end;
function __TParaFormat2__Wrapper.getwReserved : Word;
begin
result := TParaFormat2(GetRecordPtr^).wReserved;
end;
procedure __TParaFormat2__Wrapper.setdxStartIndent(const val : Longint);
begin
TParaFormat2(GetRecordPtr^).dxStartIndent := val;
end;
function __TParaFormat2__Wrapper.getdxStartIndent : Longint;
begin
result := TParaFormat2(GetRecordPtr^).dxStartIndent;
end;
procedure __TParaFormat2__Wrapper.setdxRightIndent(const val : Longint);
begin
TParaFormat2(GetRecordPtr^).dxRightIndent := val;
end;
function __TParaFormat2__Wrapper.getdxRightIndent : Longint;
begin
result := TParaFormat2(GetRecordPtr^).dxRightIndent;
end;
procedure __TParaFormat2__Wrapper.setdxOffset(const val : Longint);
begin
TParaFormat2(GetRecordPtr^).dxOffset := val;
end;
function __TParaFormat2__Wrapper.getdxOffset : Longint;
begin
result := TParaFormat2(GetRecordPtr^).dxOffset;
end;
procedure __TParaFormat2__Wrapper.setwAlignment(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wAlignment := val;
end;
function __TParaFormat2__Wrapper.getwAlignment : Word;
begin
result := TParaFormat2(GetRecordPtr^).wAlignment;
end;
procedure __TParaFormat2__Wrapper.setcTabCount(const val : SmallInt);
begin
TParaFormat2(GetRecordPtr^).cTabCount := val;
end;
function __TParaFormat2__Wrapper.getcTabCount : SmallInt;
begin
result := TParaFormat2(GetRecordPtr^).cTabCount;
end;
procedure __TParaFormat2__Wrapper.setdySpaceBefore(const val : Longint);
begin
TParaFormat2(GetRecordPtr^).dySpaceBefore := val;
end;
function __TParaFormat2__Wrapper.getdySpaceBefore : Longint;
begin
result := TParaFormat2(GetRecordPtr^).dySpaceBefore;
end;
procedure __TParaFormat2__Wrapper.setdySpaceAfter(const val : Longint);
begin
TParaFormat2(GetRecordPtr^).dySpaceAfter := val;
end;
function __TParaFormat2__Wrapper.getdySpaceAfter : Longint;
begin
result := TParaFormat2(GetRecordPtr^).dySpaceAfter;
end;
procedure __TParaFormat2__Wrapper.setdyLineSpacing(const val : Longint);
begin
TParaFormat2(GetRecordPtr^).dyLineSpacing := val;
end;
function __TParaFormat2__Wrapper.getdyLineSpacing : Longint;
begin
result := TParaFormat2(GetRecordPtr^).dyLineSpacing;
end;
procedure __TParaFormat2__Wrapper.setsStyle(const val : SmallInt);
begin
TParaFormat2(GetRecordPtr^).sStyle := val;
end;
function __TParaFormat2__Wrapper.getsStyle : SmallInt;
begin
result := TParaFormat2(GetRecordPtr^).sStyle;
end;
procedure __TParaFormat2__Wrapper.setbLineSpacingRule(const val : Byte);
begin
TParaFormat2(GetRecordPtr^).bLineSpacingRule := val;
end;
function __TParaFormat2__Wrapper.getbLineSpacingRule : Byte;
begin
result := TParaFormat2(GetRecordPtr^).bLineSpacingRule;
end;
procedure __TParaFormat2__Wrapper.setbCRC(const val : Byte);
begin
TParaFormat2(GetRecordPtr^).bCRC := val;
end;
function __TParaFormat2__Wrapper.getbCRC : Byte;
begin
result := TParaFormat2(GetRecordPtr^).bCRC;
end;
procedure __TParaFormat2__Wrapper.setwShadingWeight(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wShadingWeight := val;
end;
function __TParaFormat2__Wrapper.getwShadingWeight : Word;
begin
result := TParaFormat2(GetRecordPtr^).wShadingWeight;
end;
procedure __TParaFormat2__Wrapper.setwShadingStyle(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wShadingStyle := val;
end;
function __TParaFormat2__Wrapper.getwShadingStyle : Word;
begin
result := TParaFormat2(GetRecordPtr^).wShadingStyle;
end;
procedure __TParaFormat2__Wrapper.setwNumberingStart(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wNumberingStart := val;
end;
function __TParaFormat2__Wrapper.getwNumberingStart : Word;
begin
result := TParaFormat2(GetRecordPtr^).wNumberingStart;
end;
procedure __TParaFormat2__Wrapper.setwNumberingStyle(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wNumberingStyle := val;
end;
function __TParaFormat2__Wrapper.getwNumberingStyle : Word;
begin
result := TParaFormat2(GetRecordPtr^).wNumberingStyle;
end;
procedure __TParaFormat2__Wrapper.setwNumberingTab(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wNumberingTab := val;
end;
function __TParaFormat2__Wrapper.getwNumberingTab : Word;
begin
result := TParaFormat2(GetRecordPtr^).wNumberingTab;
end;
procedure __TParaFormat2__Wrapper.setwBorderSpace(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wBorderSpace := val;
end;
function __TParaFormat2__Wrapper.getwBorderSpace : Word;
begin
result := TParaFormat2(GetRecordPtr^).wBorderSpace;
end;
procedure __TParaFormat2__Wrapper.setwBorderWidth(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wBorderWidth := val;
end;
function __TParaFormat2__Wrapper.getwBorderWidth : Word;
begin
result := TParaFormat2(GetRecordPtr^).wBorderWidth;
end;
procedure __TParaFormat2__Wrapper.setwBorders(const val : Word);
begin
TParaFormat2(GetRecordPtr^).wBorders := val;
end;
function __TParaFormat2__Wrapper.getwBorders : Word;
begin
result := TParaFormat2(GetRecordPtr^).wBorders;
end;
function __TPunctuation__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPunctuation__Wrapper.setiSize(const val : UINT);
begin
TPunctuation(GetRecordPtr^).iSize := val;
end;
function __TPunctuation__Wrapper.getiSize : UINT;
begin
result := TPunctuation(GetRecordPtr^).iSize;
end;
function __TRepasteSpecial__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRepasteSpecial__Wrapper.setdwAspect(const val : DWORD);
begin
TRepasteSpecial(GetRecordPtr^).dwAspect := val;
end;
function __TRepasteSpecial__Wrapper.getdwAspect : DWORD;
begin
result := TRepasteSpecial(GetRecordPtr^).dwAspect;
end;
procedure __TRepasteSpecial__Wrapper.setdwParam(const val : DWORD);
begin
TRepasteSpecial(GetRecordPtr^).dwParam := val;
end;
function __TRepasteSpecial__Wrapper.getdwParam : DWORD;
begin
result := TRepasteSpecial(GetRecordPtr^).dwParam;
end;
function __TReqSize__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TSelChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TSelChange__Wrapper.setseltyp(const val : Word);
begin
TSelChange(GetRecordPtr^).seltyp := val;
end;
function __TSelChange__Wrapper.getseltyp : Word;
begin
result := TSelChange(GetRecordPtr^).seltyp;
end;
function __TTextRange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TTextRangeA__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __TTextRangeW__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
function __charrange_ : IDispatch;
begin
  result := ___charrange__Wrapper.Create;
end;
function __compcolor_ : IDispatch;
begin
  result := ___compcolor__Wrapper.Create;
end;
function __editstream_ : IDispatch;
begin
  result := ___editstream__Wrapper.Create;
end;
function __encorrecttext_ : IDispatch;
begin
  result := ___encorrecttext__Wrapper.Create;
end;
function __enprotected_ : IDispatch;
begin
  result := ___enprotected__Wrapper.Create;
end;
function __ensaveclipboard_ : IDispatch;
begin
  result := ___ensaveclipboard__Wrapper.Create;
end;
function __formatrange_ : IDispatch;
begin
  result := ___formatrange__Wrapper.Create;
end;
function __msgfilter_ : IDispatch;
begin
  result := ___msgfilter__Wrapper.Create;
end;
function __paraformat_ : IDispatch;
begin
  result := ___paraformat__Wrapper.Create;
end;
function __punctuation_ : IDispatch;
begin
  result := ___punctuation__Wrapper.Create;
end;
function __repastespecial_ : IDispatch;
begin
  result := ___repastespecial__Wrapper.Create;
end;
function __selchange_ : IDispatch;
begin
  result := ___selchange__Wrapper.Create;
end;
function _CHARRANGE_ : IDispatch;
begin
  result := __CHARRANGE__Wrapper.Create;
end;
function _COMPCOLOR_ : IDispatch;
begin
  result := __COMPCOLOR__Wrapper.Create;
end;
function _EDITSTREAM_ : IDispatch;
begin
  result := __EDITSTREAM__Wrapper.Create;
end;
function _ENCORRECTTEXT_ : IDispatch;
begin
  result := __ENCORRECTTEXT__Wrapper.Create;
end;
function _ENPROTECTED_ : IDispatch;
begin
  result := __ENPROTECTED__Wrapper.Create;
end;
function _ENSAVECLIPBOARD_ : IDispatch;
begin
  result := __ENSAVECLIPBOARD__Wrapper.Create;
end;
function _FORMATRANGE_ : IDispatch;
begin
  result := __FORMATRANGE__Wrapper.Create;
end;
function _MSGFILTER_ : IDispatch;
begin
  result := __MSGFILTER__Wrapper.Create;
end;
function _PARAFORMAT_ : IDispatch;
begin
  result := __PARAFORMAT__Wrapper.Create;
end;
function _PUNCTUATION_ : IDispatch;
begin
  result := __PUNCTUATION__Wrapper.Create;
end;
function _REPASTESPECIAL_ : IDispatch;
begin
  result := __REPASTESPECIAL__Wrapper.Create;
end;
function _SELCHANGE_ : IDispatch;
begin
  result := __SELCHANGE__Wrapper.Create;
end;
function _TCharFormat_ : IDispatch;
begin
  result := __TCharFormat__Wrapper.Create;
end;
function _TCharFormat2_ : IDispatch;
begin
  result := __TCharFormat2__Wrapper.Create;
end;
function _TCharFormat2A_ : IDispatch;
begin
  result := __TCharFormat2A__Wrapper.Create;
end;
function _TCharFormat2W_ : IDispatch;
begin
  result := __TCharFormat2W__Wrapper.Create;
end;
function _TCharFormatA_ : IDispatch;
begin
  result := __TCharFormatA__Wrapper.Create;
end;
function _TCharFormatW_ : IDispatch;
begin
  result := __TCharFormatW__Wrapper.Create;
end;
function _TCharRange_ : IDispatch;
begin
  result := __TCharRange__Wrapper.Create;
end;
function _TCompColor_ : IDispatch;
begin
  result := __TCompColor__Wrapper.Create;
end;
function _TEditStream_ : IDispatch;
begin
  result := __TEditStream__Wrapper.Create;
end;
function _TENCorrectText_ : IDispatch;
begin
  result := __TENCorrectText__Wrapper.Create;
end;
function _TEndDropFiles_ : IDispatch;
begin
  result := __TEndDropFiles__Wrapper.Create;
end;
function _TENLink_ : IDispatch;
begin
  result := __TENLink__Wrapper.Create;
end;
function _TENOleOpFailed_ : IDispatch;
begin
  result := __TENOleOpFailed__Wrapper.Create;
end;
function _TENProtected_ : IDispatch;
begin
  result := __TENProtected__Wrapper.Create;
end;
function _TENSaveClipboard_ : IDispatch;
begin
  result := __TENSaveClipboard__Wrapper.Create;
end;
function _TFindText_ : IDispatch;
begin
  result := __TFindText__Wrapper.Create;
end;
function _TFindTextA_ : IDispatch;
begin
  result := __TFindTextA__Wrapper.Create;
end;
function _TFindTextExA_ : IDispatch;
begin
  result := __TFindTextExA__Wrapper.Create;
end;
function _TFindTextExW_ : IDispatch;
begin
  result := __TFindTextExW__Wrapper.Create;
end;
function _TFindTextW_ : IDispatch;
begin
  result := __TFindTextW__Wrapper.Create;
end;
function _TFormatRange_ : IDispatch;
begin
  result := __TFormatRange__Wrapper.Create;
end;
function _TGetTextEx_ : IDispatch;
begin
  result := __TGetTextEx__Wrapper.Create;
end;
function _TGetTextLengthEx_ : IDispatch;
begin
  result := __TGetTextLengthEx__Wrapper.Create;
end;
function _TMsgFilter_ : IDispatch;
begin
  result := __TMsgFilter__Wrapper.Create;
end;
function _TObjectPositions_ : IDispatch;
begin
  result := __TObjectPositions__Wrapper.Create;
end;
function _TParaFormat_ : IDispatch;
begin
  result := __TParaFormat__Wrapper.Create;
end;
function _TParaFormat2_ : IDispatch;
begin
  result := __TParaFormat2__Wrapper.Create;
end;
function _TPunctuation_ : IDispatch;
begin
  result := __TPunctuation__Wrapper.Create;
end;
function _TRepasteSpecial_ : IDispatch;
begin
  result := __TRepasteSpecial__Wrapper.Create;
end;
function _TReqSize_ : IDispatch;
begin
  result := __TReqSize__Wrapper.Create;
end;
function _TSelChange_ : IDispatch;
begin
  result := __TSelChange__Wrapper.Create;
end;
function _TTextRange_ : IDispatch;
begin
  result := __TTextRange__Wrapper.Create;
end;
function _TTextRangeA_ : IDispatch;
begin
  result := __TTextRangeA__Wrapper.Create;
end;
function _TTextRangeW_ : IDispatch;
begin
  result := __TTextRangeW__Wrapper.Create;
end;

type ___charrange__Wrapper__ = class(___charrange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___charrange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_charrangeToVariant(var R : _charrange) : OleVariant;
var
__rw : ___charrange__Wrapper__;
begin
__rw := ___charrange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_charrange(const V : OleVariant) : _charrange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _charrange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___compcolor__Wrapper__ = class(___compcolor__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___compcolor__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_compcolorToVariant(var R : _compcolor) : OleVariant;
var
__rw : ___compcolor__Wrapper__;
begin
__rw := ___compcolor__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_compcolor(const V : OleVariant) : _compcolor;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _compcolor((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___editstream__Wrapper__ = class(___editstream__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___editstream__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_editstreamToVariant(var R : _editstream) : OleVariant;
var
__rw : ___editstream__Wrapper__;
begin
__rw := ___editstream__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_editstream(const V : OleVariant) : _editstream;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _editstream((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___encorrecttext__Wrapper__ = class(___encorrecttext__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___encorrecttext__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_encorrecttextToVariant(var R : _encorrecttext) : OleVariant;
var
__rw : ___encorrecttext__Wrapper__;
begin
__rw := ___encorrecttext__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_encorrecttext(const V : OleVariant) : _encorrecttext;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _encorrecttext((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___enprotected__Wrapper__ = class(___enprotected__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___enprotected__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_enprotectedToVariant(var R : _enprotected) : OleVariant;
var
__rw : ___enprotected__Wrapper__;
begin
__rw := ___enprotected__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_enprotected(const V : OleVariant) : _enprotected;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _enprotected((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___ensaveclipboard__Wrapper__ = class(___ensaveclipboard__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___ensaveclipboard__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_ensaveclipboardToVariant(var R : _ensaveclipboard) : OleVariant;
var
__rw : ___ensaveclipboard__Wrapper__;
begin
__rw := ___ensaveclipboard__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_ensaveclipboard(const V : OleVariant) : _ensaveclipboard;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _ensaveclipboard((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___formatrange__Wrapper__ = class(___formatrange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___formatrange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_formatrangeToVariant(var R : _formatrange) : OleVariant;
var
__rw : ___formatrange__Wrapper__;
begin
__rw := ___formatrange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_formatrange(const V : OleVariant) : _formatrange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _formatrange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___msgfilter__Wrapper__ = class(___msgfilter__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___msgfilter__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_msgfilterToVariant(var R : _msgfilter) : OleVariant;
var
__rw : ___msgfilter__Wrapper__;
begin
__rw := ___msgfilter__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_msgfilter(const V : OleVariant) : _msgfilter;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _msgfilter((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___paraformat__Wrapper__ = class(___paraformat__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___paraformat__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_paraformatToVariant(var R : _paraformat) : OleVariant;
var
__rw : ___paraformat__Wrapper__;
begin
__rw := ___paraformat__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_paraformat(const V : OleVariant) : _paraformat;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _paraformat((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___punctuation__Wrapper__ = class(___punctuation__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___punctuation__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_punctuationToVariant(var R : _punctuation) : OleVariant;
var
__rw : ___punctuation__Wrapper__;
begin
__rw := ___punctuation__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_punctuation(const V : OleVariant) : _punctuation;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _punctuation((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___repastespecial__Wrapper__ = class(___repastespecial__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___repastespecial__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_repastespecialToVariant(var R : _repastespecial) : OleVariant;
var
__rw : ___repastespecial__Wrapper__;
begin
__rw := ___repastespecial__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_repastespecial(const V : OleVariant) : _repastespecial;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _repastespecial((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type ___selchange__Wrapper__ = class(___selchange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function ___selchange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function Convert_selchangeToVariant(var R : _selchange) : OleVariant;
var
__rw : ___selchange__Wrapper__;
begin
__rw := ___selchange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantTo_selchange(const V : OleVariant) : _selchange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := _selchange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __CHARRANGE__Wrapper__ = class(__CHARRANGE__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __CHARRANGE__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertCHARRANGEToVariant(var R : CHARRANGE) : OleVariant;
var
__rw : __CHARRANGE__Wrapper__;
begin
__rw := __CHARRANGE__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToCHARRANGE(const V : OleVariant) : CHARRANGE;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := CHARRANGE((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __COMPCOLOR__Wrapper__ = class(__COMPCOLOR__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __COMPCOLOR__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertCOMPCOLORToVariant(var R : COMPCOLOR) : OleVariant;
var
__rw : __COMPCOLOR__Wrapper__;
begin
__rw := __COMPCOLOR__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToCOMPCOLOR(const V : OleVariant) : COMPCOLOR;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := COMPCOLOR((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __EDITSTREAM__Wrapper__ = class(__EDITSTREAM__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __EDITSTREAM__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertEDITSTREAMToVariant(var R : EDITSTREAM) : OleVariant;
var
__rw : __EDITSTREAM__Wrapper__;
begin
__rw := __EDITSTREAM__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToEDITSTREAM(const V : OleVariant) : EDITSTREAM;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := EDITSTREAM((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __ENCORRECTTEXT__Wrapper__ = class(__ENCORRECTTEXT__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __ENCORRECTTEXT__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertENCORRECTTEXTToVariant(var R : ENCORRECTTEXT) : OleVariant;
var
__rw : __ENCORRECTTEXT__Wrapper__;
begin
__rw := __ENCORRECTTEXT__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToENCORRECTTEXT(const V : OleVariant) : ENCORRECTTEXT;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := ENCORRECTTEXT((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __ENPROTECTED__Wrapper__ = class(__ENPROTECTED__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __ENPROTECTED__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertENPROTECTEDToVariant(var R : ENPROTECTED) : OleVariant;
var
__rw : __ENPROTECTED__Wrapper__;
begin
__rw := __ENPROTECTED__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToENPROTECTED(const V : OleVariant) : ENPROTECTED;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := ENPROTECTED((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __ENSAVECLIPBOARD__Wrapper__ = class(__ENSAVECLIPBOARD__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __ENSAVECLIPBOARD__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertENSAVECLIPBOARDToVariant(var R : ENSAVECLIPBOARD) : OleVariant;
var
__rw : __ENSAVECLIPBOARD__Wrapper__;
begin
__rw := __ENSAVECLIPBOARD__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToENSAVECLIPBOARD(const V : OleVariant) : ENSAVECLIPBOARD;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := ENSAVECLIPBOARD((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __FORMATRANGE__Wrapper__ = class(__FORMATRANGE__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __FORMATRANGE__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertFORMATRANGEToVariant(var R : FORMATRANGE) : OleVariant;
var
__rw : __FORMATRANGE__Wrapper__;
begin
__rw := __FORMATRANGE__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToFORMATRANGE(const V : OleVariant) : FORMATRANGE;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := FORMATRANGE((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __MSGFILTER__Wrapper__ = class(__MSGFILTER__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __MSGFILTER__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertMSGFILTERToVariant(var R : MSGFILTER) : OleVariant;
var
__rw : __MSGFILTER__Wrapper__;
begin
__rw := __MSGFILTER__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToMSGFILTER(const V : OleVariant) : MSGFILTER;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := MSGFILTER((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __PARAFORMAT__Wrapper__ = class(__PARAFORMAT__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __PARAFORMAT__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertPARAFORMATToVariant(var R : PARAFORMAT) : OleVariant;
var
__rw : __PARAFORMAT__Wrapper__;
begin
__rw := __PARAFORMAT__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToPARAFORMAT(const V : OleVariant) : PARAFORMAT;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := PARAFORMAT((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __PUNCTUATION__Wrapper__ = class(__PUNCTUATION__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __PUNCTUATION__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertPUNCTUATIONToVariant(var R : PUNCTUATION) : OleVariant;
var
__rw : __PUNCTUATION__Wrapper__;
begin
__rw := __PUNCTUATION__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToPUNCTUATION(const V : OleVariant) : PUNCTUATION;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := PUNCTUATION((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __REPASTESPECIAL__Wrapper__ = class(__REPASTESPECIAL__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __REPASTESPECIAL__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertREPASTESPECIALToVariant(var R : REPASTESPECIAL) : OleVariant;
var
__rw : __REPASTESPECIAL__Wrapper__;
begin
__rw := __REPASTESPECIAL__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToREPASTESPECIAL(const V : OleVariant) : REPASTESPECIAL;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := REPASTESPECIAL((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __SELCHANGE__Wrapper__ = class(__SELCHANGE__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __SELCHANGE__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertSELCHANGEToVariant(var R : SELCHANGE) : OleVariant;
var
__rw : __SELCHANGE__Wrapper__;
begin
__rw := __SELCHANGE__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToSELCHANGE(const V : OleVariant) : SELCHANGE;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := SELCHANGE((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCharFormat__Wrapper__ = class(__TCharFormat__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCharFormat__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCharFormatToVariant(var R : TCharFormat) : OleVariant;
var
__rw : __TCharFormat__Wrapper__;
begin
__rw := __TCharFormat__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCharFormat(const V : OleVariant) : TCharFormat;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCharFormat((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCharFormat2__Wrapper__ = class(__TCharFormat2__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCharFormat2__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCharFormat2ToVariant(var R : TCharFormat2) : OleVariant;
var
__rw : __TCharFormat2__Wrapper__;
begin
__rw := __TCharFormat2__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCharFormat2(const V : OleVariant) : TCharFormat2;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCharFormat2((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCharFormat2A__Wrapper__ = class(__TCharFormat2A__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCharFormat2A__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCharFormat2AToVariant(var R : TCharFormat2A) : OleVariant;
var
__rw : __TCharFormat2A__Wrapper__;
begin
__rw := __TCharFormat2A__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCharFormat2A(const V : OleVariant) : TCharFormat2A;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCharFormat2A((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCharFormat2W__Wrapper__ = class(__TCharFormat2W__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCharFormat2W__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCharFormat2WToVariant(var R : TCharFormat2W) : OleVariant;
var
__rw : __TCharFormat2W__Wrapper__;
begin
__rw := __TCharFormat2W__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCharFormat2W(const V : OleVariant) : TCharFormat2W;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCharFormat2W((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCharFormatA__Wrapper__ = class(__TCharFormatA__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCharFormatA__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCharFormatAToVariant(var R : TCharFormatA) : OleVariant;
var
__rw : __TCharFormatA__Wrapper__;
begin
__rw := __TCharFormatA__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCharFormatA(const V : OleVariant) : TCharFormatA;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCharFormatA((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCharFormatW__Wrapper__ = class(__TCharFormatW__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCharFormatW__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCharFormatWToVariant(var R : TCharFormatW) : OleVariant;
var
__rw : __TCharFormatW__Wrapper__;
begin
__rw := __TCharFormatW__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCharFormatW(const V : OleVariant) : TCharFormatW;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCharFormatW((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCharRange__Wrapper__ = class(__TCharRange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCharRange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCharRangeToVariant(var R : TCharRange) : OleVariant;
var
__rw : __TCharRange__Wrapper__;
begin
__rw := __TCharRange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCharRange(const V : OleVariant) : TCharRange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCharRange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCompColor__Wrapper__ = class(__TCompColor__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCompColor__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCompColorToVariant(var R : TCompColor) : OleVariant;
var
__rw : __TCompColor__Wrapper__;
begin
__rw := __TCompColor__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCompColor(const V : OleVariant) : TCompColor;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCompColor((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TEditStream__Wrapper__ = class(__TEditStream__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TEditStream__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTEditStreamToVariant(var R : TEditStream) : OleVariant;
var
__rw : __TEditStream__Wrapper__;
begin
__rw := __TEditStream__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTEditStream(const V : OleVariant) : TEditStream;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TEditStream((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TENCorrectText__Wrapper__ = class(__TENCorrectText__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TENCorrectText__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTENCorrectTextToVariant(var R : TENCorrectText) : OleVariant;
var
__rw : __TENCorrectText__Wrapper__;
begin
__rw := __TENCorrectText__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTENCorrectText(const V : OleVariant) : TENCorrectText;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TENCorrectText((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TEndDropFiles__Wrapper__ = class(__TEndDropFiles__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TEndDropFiles__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTEndDropFilesToVariant(var R : TEndDropFiles) : OleVariant;
var
__rw : __TEndDropFiles__Wrapper__;
begin
__rw := __TEndDropFiles__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTEndDropFiles(const V : OleVariant) : TEndDropFiles;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TEndDropFiles((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TENLink__Wrapper__ = class(__TENLink__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TENLink__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTENLinkToVariant(var R : TENLink) : OleVariant;
var
__rw : __TENLink__Wrapper__;
begin
__rw := __TENLink__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTENLink(const V : OleVariant) : TENLink;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TENLink((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TENOleOpFailed__Wrapper__ = class(__TENOleOpFailed__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TENOleOpFailed__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTENOleOpFailedToVariant(var R : TENOleOpFailed) : OleVariant;
var
__rw : __TENOleOpFailed__Wrapper__;
begin
__rw := __TENOleOpFailed__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTENOleOpFailed(const V : OleVariant) : TENOleOpFailed;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TENOleOpFailed((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TENProtected__Wrapper__ = class(__TENProtected__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TENProtected__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTENProtectedToVariant(var R : TENProtected) : OleVariant;
var
__rw : __TENProtected__Wrapper__;
begin
__rw := __TENProtected__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTENProtected(const V : OleVariant) : TENProtected;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TENProtected((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TENSaveClipboard__Wrapper__ = class(__TENSaveClipboard__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TENSaveClipboard__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTENSaveClipboardToVariant(var R : TENSaveClipboard) : OleVariant;
var
__rw : __TENSaveClipboard__Wrapper__;
begin
__rw := __TENSaveClipboard__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTENSaveClipboard(const V : OleVariant) : TENSaveClipboard;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TENSaveClipboard((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFindText__Wrapper__ = class(__TFindText__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFindText__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFindTextToVariant(var R : TFindText) : OleVariant;
var
__rw : __TFindText__Wrapper__;
begin
__rw := __TFindText__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFindText(const V : OleVariant) : TFindText;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFindText((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFindTextA__Wrapper__ = class(__TFindTextA__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFindTextA__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFindTextAToVariant(var R : TFindTextA) : OleVariant;
var
__rw : __TFindTextA__Wrapper__;
begin
__rw := __TFindTextA__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFindTextA(const V : OleVariant) : TFindTextA;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFindTextA((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFindTextExA__Wrapper__ = class(__TFindTextExA__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFindTextExA__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFindTextExAToVariant(var R : TFindTextExA) : OleVariant;
var
__rw : __TFindTextExA__Wrapper__;
begin
__rw := __TFindTextExA__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFindTextExA(const V : OleVariant) : TFindTextExA;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFindTextExA((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFindTextExW__Wrapper__ = class(__TFindTextExW__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFindTextExW__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFindTextExWToVariant(var R : TFindTextExW) : OleVariant;
var
__rw : __TFindTextExW__Wrapper__;
begin
__rw := __TFindTextExW__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFindTextExW(const V : OleVariant) : TFindTextExW;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFindTextExW((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFindTextW__Wrapper__ = class(__TFindTextW__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFindTextW__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFindTextWToVariant(var R : TFindTextW) : OleVariant;
var
__rw : __TFindTextW__Wrapper__;
begin
__rw := __TFindTextW__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFindTextW(const V : OleVariant) : TFindTextW;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFindTextW((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TFormatRange__Wrapper__ = class(__TFormatRange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TFormatRange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTFormatRangeToVariant(var R : TFormatRange) : OleVariant;
var
__rw : __TFormatRange__Wrapper__;
begin
__rw := __TFormatRange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTFormatRange(const V : OleVariant) : TFormatRange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TFormatRange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TGetTextEx__Wrapper__ = class(__TGetTextEx__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGetTextEx__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGetTextExToVariant(var R : TGetTextEx) : OleVariant;
var
__rw : __TGetTextEx__Wrapper__;
begin
__rw := __TGetTextEx__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGetTextEx(const V : OleVariant) : TGetTextEx;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGetTextEx((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TGetTextLengthEx__Wrapper__ = class(__TGetTextLengthEx__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGetTextLengthEx__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGetTextLengthExToVariant(var R : TGetTextLengthEx) : OleVariant;
var
__rw : __TGetTextLengthEx__Wrapper__;
begin
__rw := __TGetTextLengthEx__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGetTextLengthEx(const V : OleVariant) : TGetTextLengthEx;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGetTextLengthEx((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMsgFilter__Wrapper__ = class(__TMsgFilter__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMsgFilter__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMsgFilterToVariant(var R : TMsgFilter) : OleVariant;
var
__rw : __TMsgFilter__Wrapper__;
begin
__rw := __TMsgFilter__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMsgFilter(const V : OleVariant) : TMsgFilter;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMsgFilter((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TObjectPositions__Wrapper__ = class(__TObjectPositions__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TObjectPositions__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTObjectPositionsToVariant(var R : TObjectPositions) : OleVariant;
var
__rw : __TObjectPositions__Wrapper__;
begin
__rw := __TObjectPositions__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTObjectPositions(const V : OleVariant) : TObjectPositions;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TObjectPositions((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TParaFormat__Wrapper__ = class(__TParaFormat__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TParaFormat__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTParaFormatToVariant(var R : TParaFormat) : OleVariant;
var
__rw : __TParaFormat__Wrapper__;
begin
__rw := __TParaFormat__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTParaFormat(const V : OleVariant) : TParaFormat;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TParaFormat((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TParaFormat2__Wrapper__ = class(__TParaFormat2__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TParaFormat2__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTParaFormat2ToVariant(var R : TParaFormat2) : OleVariant;
var
__rw : __TParaFormat2__Wrapper__;
begin
__rw := __TParaFormat2__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTParaFormat2(const V : OleVariant) : TParaFormat2;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TParaFormat2((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TPunctuation__Wrapper__ = class(__TPunctuation__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPunctuation__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPunctuationToVariant(var R : TPunctuation) : OleVariant;
var
__rw : __TPunctuation__Wrapper__;
begin
__rw := __TPunctuation__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPunctuation(const V : OleVariant) : TPunctuation;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPunctuation((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TRepasteSpecial__Wrapper__ = class(__TRepasteSpecial__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRepasteSpecial__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRepasteSpecialToVariant(var R : TRepasteSpecial) : OleVariant;
var
__rw : __TRepasteSpecial__Wrapper__;
begin
__rw := __TRepasteSpecial__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRepasteSpecial(const V : OleVariant) : TRepasteSpecial;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRepasteSpecial((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TReqSize__Wrapper__ = class(__TReqSize__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TReqSize__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTReqSizeToVariant(var R : TReqSize) : OleVariant;
var
__rw : __TReqSize__Wrapper__;
begin
__rw := __TReqSize__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTReqSize(const V : OleVariant) : TReqSize;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TReqSize((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TSelChange__Wrapper__ = class(__TSelChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TSelChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTSelChangeToVariant(var R : TSelChange) : OleVariant;
var
__rw : __TSelChange__Wrapper__;
begin
__rw := __TSelChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTSelChange(const V : OleVariant) : TSelChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TSelChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TTextRange__Wrapper__ = class(__TTextRange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTextRange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTextRangeToVariant(var R : TTextRange) : OleVariant;
var
__rw : __TTextRange__Wrapper__;
begin
__rw := __TTextRange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTextRange(const V : OleVariant) : TTextRange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTextRange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TTextRangeA__Wrapper__ = class(__TTextRangeA__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTextRangeA__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTextRangeAToVariant(var R : TTextRangeA) : OleVariant;
var
__rw : __TTextRangeA__Wrapper__;
begin
__rw := __TTextRangeA__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTextRangeA(const V : OleVariant) : TTextRangeA;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTextRangeA((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TTextRangeW__Wrapper__ = class(__TTextRangeW__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TTextRangeW__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTTextRangeWToVariant(var R : TTextRangeW) : OleVariant;
var
__rw : __TTextRangeW__Wrapper__;
begin
__rw := __TTextRangeW__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTTextRangeW(const V : OleVariant) : TTextRangeW;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TTextRangeW((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
procedure __RegisterProps;
begin
end;

const __ConstNames0 : array[0..311] of string = (
'cchTextLimitDefault'
,'RICHEDIT_CLASSA'
,'RICHEDIT_CLASSW'
,'RICHEDIT_CLASS'
,'RICHEDIT_CLASS10A'
,'WM_CONTEXTMENU'
,'WM_PRINTCLIENT'
,'EM_GETLIMITTEXT'
,'EM_SCROLLCARET'
,'EM_CANPASTE'
,'EM_DISPLAYBAND'
,'EM_EXGETSEL'
,'EM_EXLIMITTEXT'
,'EM_EXLINEFROMCHAR'
,'EM_EXSETSEL'
,'EM_FINDTEXT'
,'EM_FORMATRANGE'
,'EM_GETCHARFORMAT'
,'EM_GETEVENTMASK'
,'EM_GETOLEINTERFACE'
,'EM_GETPARAFORMAT'
,'EM_GETSELTEXT'
,'EM_HIDESELECTION'
,'EM_PASTESPECIAL'
,'EM_REQUESTRESIZE'
,'EM_SELECTIONTYPE'
,'EM_SETBKGNDCOLOR'
,'EM_SETCHARFORMAT'
,'EM_SETEVENTMASK'
,'EM_SETOLECALLBACK'
,'EM_SETPARAFORMAT'
,'EM_SETTARGETDEVICE'
,'EM_STREAMIN'
,'EM_STREAMOUT'
,'EM_GETTEXTRANGE'
,'EM_FINDWORDBREAK'
,'EM_SETOPTIONS'
,'EM_GETOPTIONS'
,'EM_FINDTEXTEX'
,'EM_GETWORDBREAKPROCEX'
,'EM_SETWORDBREAKPROCEX'
,'EM_SETUNDOLIMIT'
,'EM_REDO'
,'EM_CANREDO'
,'EM_GETUNDONAME'
,'EM_GETREDONAME'
,'EM_STOPGROUPTYPING'
,'EM_SETTEXTMODE'
,'EM_GETTEXTMODE'
,'TM_PLAINTEXT'
,'TM_RICHTEXT'
,'TM_SINGLELEVELUNDO'
,'TM_MULTILEVELUNDO'
,'TM_SINGLECODEPAGE'
,'TM_MULTICODEPAGE'
,'EM_AUTOURLDETECT'
,'EM_GETAUTOURLDETECT'
,'EM_SETPALETTE'
,'EM_GETTEXTEX'
,'EM_GETTEXTLENGTHEX'
,'EM_SETPUNCTUATION'
,'EM_GETPUNCTUATION'
,'EM_SETWORDWRAPMODE'
,'EM_GETWORDWRAPMODE'
,'EM_SETIMECOLOR'
,'EM_GETIMECOLOR'
,'EM_SETIMEOPTIONS'
,'EM_GETIMEOPTIONS'
,'EM_CONVPOSITION'
,'EM_SETLANGOPTIONS'
,'EM_GETLANGOPTIONS'
,'EM_GETIMECOMPMODE'
,'IMF_AUTOKEYBOARD'
,'IMF_AUTOFONT'
,'IMF_IMECANCELCOMPLETE'
,'IMF_IMEALWAYSSENDNOTIFY'
,'ICM_NOTOPEN'
,'ICM_LEVEL3'
,'ICM_LEVEL2'
,'ICM_LEVEL2_5'
,'ICM_LEVEL2_SUI'
,'EN_MSGFILTER'
,'EN_REQUESTRESIZE'
,'EN_SELCHANGE'
,'EN_DROPFILES'
,'EN_PROTECTED'
,'EN_CORRECTTEXT'
,'EN_STOPNOUNDO'
,'EN_IMECHANGE'
,'EN_SAVECLIPBOARD'
,'EN_OLEOPFAILED'
,'EN_OBJECTPOSITIONS'
,'EN_LINK'
,'EN_DRAGDROPDONE'
,'ENM_NONE'
,'ENM_CHANGE'
,'ENM_UPDATE'
,'ENM_SCROLL'
,'ENM_KEYEVENTS'
,'ENM_MOUSEEVENTS'
,'ENM_REQUESTRESIZE'
,'ENM_SELCHANGE'
,'ENM_DROPFILES'
,'ENM_PROTECTED'
,'ENM_CORRECTTEXT'
,'ENM_SCROLLEVENTS'
,'ENM_DRAGDROPDONE'
,'ENM_IMECHANGE'
,'ENM_LANGCHANGE'
,'ENM_OBJECTPOSITIONS'
,'ENM_LINK'
,'ES_SAVESEL'
,'ES_SUNKEN'
,'ES_DISABLENOSCROLL'
,'ES_SELECTIONBAR'
,'ES_NOOLEDRAGDROP'
,'ES_EX_NOCALLOLEINIT'
,'ES_VERTICAL'
,'ES_NOIME'
,'ES_SELFIME'
,'ECO_AUTOWORDSELECTION'
,'ECO_AUTOVSCROLL'
,'ECO_AUTOHSCROLL'
,'ECO_NOHIDESEL'
,'ECO_READONLY'
,'ECO_WANTRETURN'
,'ECO_SAVESEL'
,'ECO_SELECTIONBAR'
,'ECO_VERTICAL'
,'ECOOP_SET'
,'ECOOP_OR'
,'ECOOP_AND'
,'ECOOP_XOR'
,'WB_CLASSIFY'
,'WB_MOVEWORDLEFT'
,'WB_MOVEWORDRIGHT'
,'WB_LEFTBREAK'
,'WB_RIGHTBREAK'
,'WB_MOVEWORDPREV'
,'WB_MOVEWORDNEXT'
,'WB_PREVBREAK'
,'WB_NEXTBREAK'
,'PC_FOLLOWING'
,'PC_LEADING'
,'PC_OVERFLOW'
,'PC_DELIMITER'
,'WBF_WORDWRAP'
,'WBF_WORDBREAK'
,'WBF_OVERFLOW'
,'WBF_LEVEL1'
,'WBF_LEVEL2'
,'WBF_CUSTOM'
,'IMF_FORCENONE'
,'IMF_FORCEENABLE'
,'IMF_FORCEDISABLE'
,'IMF_CLOSESTATUSWINDOW'
,'IMF_VERTICAL'
,'IMF_FORCEACTIVE'
,'IMF_FORCEINACTIVE'
,'IMF_FORCEREMEMBER'
,'IMF_MULTIPLEEDIT'
,'WBF_CLASS'
,'WBF_ISWHITE'
,'WBF_BREAKLINE'
,'WBF_BREAKAFTER'
,'CFM_BOLD'
,'CFM_ITALIC'
,'CFM_UNDERLINE'
,'CFM_STRIKEOUT'
,'CFM_PROTECTED'
,'CFM_LINK'
,'CFM_SIZE'
,'CFM_COLOR'
,'CFM_FACE'
,'CFM_OFFSET'
,'CFM_CHARSET'
,'CFE_BOLD'
,'CFE_ITALIC'
,'CFE_UNDERLINE'
,'CFE_STRIKEOUT'
,'CFE_PROTECTED'
,'CFE_LINK'
,'CFE_AUTOCOLOR'
,'yHeightCharPtsMost'
,'SCF_SELECTION'
,'SCF_WORD'
,'SCF_DEFAULT'
,'SCF_ALL'
,'SCF_USEUIRULES'
,'SF_TEXT'
,'SF_RTF'
,'SF_RTFNOOBJS'
,'SF_TEXTIZED'
,'SF_UNICODE'
,'SFF_SELECTION'
,'SFF_PLAINRTF'
,'FT_MATCHCASE'
,'FT_WHOLEWORD'
,'MAX_TAB_STOPS'
,'lDefaultTab'
,'PFM_STARTINDENT'
,'PFM_RIGHTINDENT'
,'PFM_OFFSET'
,'PFM_ALIGNMENT'
,'PFM_TABSTOPS'
,'PFM_NUMBERING'
,'PFM_OFFSETINDENT'
,'PFN_BULLET'
,'PFA_LEFT'
,'PFA_RIGHT'
,'PFA_CENTER'
,'CFM_EFFECTS'
,'CFM_ALL'
,'PFM_ALL'
,'CFM_SMALLCAPS'
,'CFM_ALLCAPS'
,'CFM_HIDDEN'
,'CFM_OUTLINE'
,'CFM_SHADOW'
,'CFM_EMBOSS'
,'CFM_IMPRINT'
,'CFM_DISABLED'
,'CFM_REVISED'
,'CFM_BACKCOLOR'
,'CFM_LCID'
,'CFM_UNDERLINETYPE'
,'CFM_WEIGHT'
,'CFM_SPACING'
,'CFM_KERNING'
,'CFM_STYLE'
,'CFM_ANIMATION'
,'CFM_REVAUTHOR'
,'CFE_SUBSCRIPT'
,'CFE_SUPERSCRIPT'
,'CFM_SUBSCRIPT'
,'CFM_SUPERSCRIPT'
,'CFM_EFFECTS2'
,'CFM_ALL2'
,'CFE_SMALLCAPS'
,'CFE_ALLCAPS'
,'CFE_HIDDEN'
,'CFE_OUTLINE'
,'CFE_SHADOW'
,'CFE_EMBOSS'
,'CFE_IMPRINT'
,'CFE_DISABLED'
,'CFE_REVISED'
,'CFE_AUTOBACKCOLOR'
,'CFU_CF1UNDERLINE'
,'CFU_INVERT'
,'CFU_UNDERLINEDOTTED'
,'CFU_UNDERLINEDOUBLE'
,'CFU_UNDERLINEWORD'
,'CFU_UNDERLINE'
,'CFU_UNDERLINENONE'
,'PFM_SPACEBEFORE'
,'PFM_SPACEAFTER'
,'PFM_LINESPACING'
,'PFM_STYLE'
,'PFM_BORDER'
,'PFM_SHADING'
,'PFM_NUMBERINGSTYLE'
,'PFM_NUMBERINGTAB'
,'PFM_NUMBERINGSTART'
,'PFM_RTLPARA'
,'PFM_KEEP'
,'PFM_KEEPNEXT'
,'PFM_PAGEBREAKBEFORE'
,'PFM_NOLINENUMBER'
,'PFM_NOWIDOWCONTROL'
,'PFM_DONOTHYPHEN'
,'PFM_SIDEBYSIDE'
,'PFM_TABLE'
,'PFM_EFFECTS'
,'PFM_ALL2'
,'PFE_RTLPARA'
,'PFE_KEEP'
,'PFE_KEEPNEXT'
,'PFE_PAGEBREAKBEFORE'
,'PFE_NOLINENUMBER'
,'PFE_NOWIDOWCONTROL'
,'PFE_DONOTHYPHEN'
,'PFE_SIDEBYSIDE'
,'PFE_TABLEROW'
,'PFE_TABLECELLEND'
,'PFE_TABLECELL'
,'PFA_JUSTIFY'
,'SEL_EMPTY'
,'SEL_TEXT'
,'SEL_OBJECT'
,'SEL_MULTICHAR'
,'SEL_MULTIOBJECT'
,'GCM_RIGHTMOUSEDROP'
,'OLEOP_DOVERB'
,'CF_RTF'
,'CF_RTFNOOBJS'
,'CF_RETEXTOBJ'
,'UID_UNKNOWN'
,'UID_TYPING'
,'UID_DELETE'
,'UID_DRAGDROP'
,'UID_CUT'
,'UID_PASTE'
,'GT_DEFAULT'
,'GT_USECRLF'
,'GTL_DEFAULT'
,'GTL_USECRLF'
,'GTL_PRECISE'
,'GTL_CLOSE'
,'GTL_NUMCHARS'
,'GTL_NUMBYTES'
,'WCH_EMBEDDING'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,cchTextLimitDefault));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,RICHEDIT_CLASSA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,RICHEDIT_CLASSW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,RICHEDIT_CLASS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,RICHEDIT_CLASS10A));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,WM_CONTEXTMENU));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,WM_PRINTCLIENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,EM_GETLIMITTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,EM_SCROLLCARET));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,EM_CANPASTE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,EM_DISPLAYBAND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,EM_EXGETSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,EM_EXLIMITTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,EM_EXLINEFROMCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,EM_EXSETSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,EM_FINDTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,EM_FORMATRANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,EM_GETCHARFORMAT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,EM_GETEVENTMASK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,EM_GETOLEINTERFACE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,EM_GETPARAFORMAT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,EM_GETSELTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,EM_HIDESELECTION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,EM_PASTESPECIAL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,EM_REQUESTRESIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,EM_SELECTIONTYPE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,EM_SETBKGNDCOLOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,EM_SETCHARFORMAT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,EM_SETEVENTMASK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,EM_SETOLECALLBACK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,EM_SETPARAFORMAT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,EM_SETTARGETDEVICE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,EM_STREAMIN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,EM_STREAMOUT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,EM_GETTEXTRANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,EM_FINDWORDBREAK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,EM_SETOPTIONS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,EM_GETOPTIONS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,EM_FINDTEXTEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,EM_GETWORDBREAKPROCEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,EM_SETWORDBREAKPROCEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,EM_SETUNDOLIMIT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,EM_REDO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,EM_CANREDO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,EM_GETUNDONAME));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,EM_GETREDONAME));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,EM_STOPGROUPTYPING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,EM_SETTEXTMODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,EM_GETTEXTMODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,TM_PLAINTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,TM_RICHTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,TM_SINGLELEVELUNDO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,TM_MULTILEVELUNDO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,TM_SINGLECODEPAGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,TM_MULTICODEPAGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,EM_AUTOURLDETECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,EM_GETAUTOURLDETECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,EM_SETPALETTE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,EM_GETTEXTEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,EM_GETTEXTLENGTHEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,EM_SETPUNCTUATION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,EM_GETPUNCTUATION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,EM_SETWORDWRAPMODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,EM_GETWORDWRAPMODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,EM_SETIMECOLOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,EM_GETIMECOLOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,EM_SETIMEOPTIONS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,EM_GETIMEOPTIONS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,EM_CONVPOSITION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,EM_SETLANGOPTIONS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,EM_GETLANGOPTIONS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,EM_GETIMECOMPMODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,IMF_AUTOKEYBOARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,IMF_AUTOFONT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,IMF_IMECANCELCOMPLETE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,IMF_IMEALWAYSSENDNOTIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,ICM_NOTOPEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,ICM_LEVEL3));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,ICM_LEVEL2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,ICM_LEVEL2_5));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,ICM_LEVEL2_SUI));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,EN_MSGFILTER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,EN_REQUESTRESIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,EN_SELCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,EN_DROPFILES));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,EN_PROTECTED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,EN_CORRECTTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,EN_STOPNOUNDO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,EN_IMECHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,EN_SAVECLIPBOARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,EN_OLEOPFAILED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,EN_OBJECTPOSITIONS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,EN_LINK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,EN_DRAGDROPDONE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,ENM_NONE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,ENM_CHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,ENM_UPDATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,ENM_SCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,ENM_KEYEVENTS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,ENM_MOUSEEVENTS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,ENM_REQUESTRESIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,ENM_SELCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,ENM_DROPFILES));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,ENM_PROTECTED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,ENM_CORRECTTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,ENM_SCROLLEVENTS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,ENM_DRAGDROPDONE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,ENM_IMECHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,ENM_LANGCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,ENM_OBJECTPOSITIONS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,ENM_LINK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,ES_SAVESEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,ES_SUNKEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,ES_DISABLENOSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,ES_SELECTIONBAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,ES_NOOLEDRAGDROP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,ES_EX_NOCALLOLEINIT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,ES_VERTICAL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,ES_NOIME));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,ES_SELFIME));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,ECO_AUTOWORDSELECTION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,ECO_AUTOVSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[122] ,ECO_AUTOHSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[123] ,ECO_NOHIDESEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[124] ,ECO_READONLY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[125] ,ECO_WANTRETURN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[126] ,ECO_SAVESEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[127] ,ECO_SELECTIONBAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[128] ,ECO_VERTICAL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[129] ,ECOOP_SET));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[130] ,ECOOP_OR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[131] ,ECOOP_AND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[132] ,ECOOP_XOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[133] ,WB_CLASSIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[134] ,WB_MOVEWORDLEFT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[135] ,WB_MOVEWORDRIGHT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[136] ,WB_LEFTBREAK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[137] ,WB_RIGHTBREAK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[138] ,WB_MOVEWORDPREV));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[139] ,WB_MOVEWORDNEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[140] ,WB_PREVBREAK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[141] ,WB_NEXTBREAK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[142] ,PC_FOLLOWING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[143] ,PC_LEADING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[144] ,PC_OVERFLOW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[145] ,PC_DELIMITER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[146] ,WBF_WORDWRAP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[147] ,WBF_WORDBREAK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[148] ,WBF_OVERFLOW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[149] ,WBF_LEVEL1));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[150] ,WBF_LEVEL2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[151] ,WBF_CUSTOM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[152] ,IMF_FORCENONE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[153] ,IMF_FORCEENABLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[154] ,IMF_FORCEDISABLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[155] ,IMF_CLOSESTATUSWINDOW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[156] ,IMF_VERTICAL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[157] ,IMF_FORCEACTIVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[158] ,IMF_FORCEINACTIVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[159] ,IMF_FORCEREMEMBER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[160] ,IMF_MULTIPLEEDIT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[161] ,WBF_CLASS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[162] ,WBF_ISWHITE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[163] ,WBF_BREAKLINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[164] ,WBF_BREAKAFTER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[165] ,CFM_BOLD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[166] ,CFM_ITALIC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[167] ,CFM_UNDERLINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[168] ,CFM_STRIKEOUT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[169] ,CFM_PROTECTED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[170] ,CFM_LINK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[171] ,CFM_SIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[172] ,CFM_COLOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[173] ,CFM_FACE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[174] ,CFM_OFFSET));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[175] ,CFM_CHARSET));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[176] ,CFE_BOLD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[177] ,CFE_ITALIC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[178] ,CFE_UNDERLINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[179] ,CFE_STRIKEOUT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[180] ,CFE_PROTECTED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[181] ,CFE_LINK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[182] ,CFE_AUTOCOLOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[183] ,yHeightCharPtsMost));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[184] ,SCF_SELECTION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[185] ,SCF_WORD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[186] ,SCF_DEFAULT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[187] ,SCF_ALL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[188] ,SCF_USEUIRULES));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[189] ,SF_TEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[190] ,SF_RTF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[191] ,SF_RTFNOOBJS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[192] ,SF_TEXTIZED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[193] ,SF_UNICODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[194] ,SFF_SELECTION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[195] ,SFF_PLAINRTF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[196] ,FT_MATCHCASE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[197] ,FT_WHOLEWORD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[198] ,MAX_TAB_STOPS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[199] ,lDefaultTab));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[200] ,PFM_STARTINDENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[201] ,PFM_RIGHTINDENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[202] ,PFM_OFFSET));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[203] ,PFM_ALIGNMENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[204] ,PFM_TABSTOPS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[205] ,PFM_NUMBERING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[206] ,PFM_OFFSETINDENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[207] ,PFN_BULLET));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[208] ,PFA_LEFT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[209] ,PFA_RIGHT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[210] ,PFA_CENTER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[211] ,CFM_EFFECTS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[212] ,CFM_ALL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[213] ,PFM_ALL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[214] ,CFM_SMALLCAPS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[215] ,CFM_ALLCAPS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[216] ,CFM_HIDDEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[217] ,CFM_OUTLINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[218] ,CFM_SHADOW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[219] ,CFM_EMBOSS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[220] ,CFM_IMPRINT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[221] ,CFM_DISABLED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[222] ,CFM_REVISED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[223] ,CFM_BACKCOLOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[224] ,CFM_LCID));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[225] ,CFM_UNDERLINETYPE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[226] ,CFM_WEIGHT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[227] ,CFM_SPACING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[228] ,CFM_KERNING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[229] ,CFM_STYLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[230] ,CFM_ANIMATION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[231] ,CFM_REVAUTHOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[232] ,CFE_SUBSCRIPT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[233] ,CFE_SUPERSCRIPT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[234] ,CFM_SUBSCRIPT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[235] ,CFM_SUPERSCRIPT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[236] ,CFM_EFFECTS2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[237] ,CFM_ALL2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[238] ,CFE_SMALLCAPS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[239] ,CFE_ALLCAPS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[240] ,CFE_HIDDEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[241] ,CFE_OUTLINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[242] ,CFE_SHADOW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[243] ,CFE_EMBOSS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[244] ,CFE_IMPRINT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[245] ,CFE_DISABLED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[246] ,CFE_REVISED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[247] ,CFE_AUTOBACKCOLOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[248] ,CFU_CF1UNDERLINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[249] ,CFU_INVERT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[250] ,CFU_UNDERLINEDOTTED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[251] ,CFU_UNDERLINEDOUBLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[252] ,CFU_UNDERLINEWORD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[253] ,CFU_UNDERLINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[254] ,CFU_UNDERLINENONE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[255] ,PFM_SPACEBEFORE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[256] ,PFM_SPACEAFTER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[257] ,PFM_LINESPACING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[258] ,PFM_STYLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[259] ,PFM_BORDER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[260] ,PFM_SHADING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[261] ,PFM_NUMBERINGSTYLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[262] ,PFM_NUMBERINGTAB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[263] ,PFM_NUMBERINGSTART));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[264] ,PFM_RTLPARA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[265] ,PFM_KEEP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[266] ,PFM_KEEPNEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[267] ,PFM_PAGEBREAKBEFORE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[268] ,PFM_NOLINENUMBER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[269] ,PFM_NOWIDOWCONTROL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[270] ,PFM_DONOTHYPHEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[271] ,PFM_SIDEBYSIDE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[272] ,PFM_TABLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[273] ,PFM_EFFECTS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[274] ,PFM_ALL2));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[275] ,PFE_RTLPARA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[276] ,PFE_KEEP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[277] ,PFE_KEEPNEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[278] ,PFE_PAGEBREAKBEFORE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[279] ,PFE_NOLINENUMBER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[280] ,PFE_NOWIDOWCONTROL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[281] ,PFE_DONOTHYPHEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[282] ,PFE_SIDEBYSIDE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[283] ,PFE_TABLEROW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[284] ,PFE_TABLECELLEND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[285] ,PFE_TABLECELL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[286] ,PFA_JUSTIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[287] ,SEL_EMPTY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[288] ,SEL_TEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[289] ,SEL_OBJECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[290] ,SEL_MULTICHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[291] ,SEL_MULTIOBJECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[292] ,GCM_RIGHTMOUSEDROP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[293] ,OLEOP_DOVERB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[294] ,CF_RTF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[295] ,CF_RTFNOOBJS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[296] ,CF_RETEXTOBJ));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[297] ,UID_UNKNOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[298] ,UID_TYPING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[299] ,UID_DELETE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[300] ,UID_DRAGDROP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[301] ,UID_CUT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[302] ,UID_PASTE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[303] ,GT_DEFAULT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[304] ,GT_USECRLF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[305] ,GTL_DEFAULT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[306] ,GTL_USECRLF));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[307] ,GTL_PRECISE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[308] ,GTL_CLOSE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[309] ,GTL_NUMCHARS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[310] ,GTL_NUMBYTES));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[311] ,WCH_EMBEDDING));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

procedure __RegisterClasses;
begin
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..57] of string = (
'_charrange'
,'_compcolor'
,'_editstream'
,'_encorrecttext'
,'_enprotected'
,'_ensaveclipboard'
,'_formatrange'
,'_msgfilter'
,'_paraformat'
,'_punctuation'
,'_repastespecial'
,'_selchange'
,'CHARRANGE'
,'COMPCOLOR'
,'EDITSTREAM'
,'ENCORRECTTEXT'
,'ENPROTECTED'
,'ENSAVECLIPBOARD'
,'FORMATRANGE'
,'MSGFILTER'
,'PARAFORMAT'
,'PUNCTUATION'
,'REPASTESPECIAL'
,'SELCHANGE'
,'TCharFormat'
,'TCharFormat2'
,'TCharFormat2A'
,'TCharFormat2W'
,'TCharFormatA'
,'TCharFormatW'
,'TCharRange'
,'TCompColor'
,'TEditStream'
,'TENCorrectText'
,'TEndDropFiles'
,'TENLink'
,'TENOleOpFailed'
,'TENProtected'
,'TENSaveClipboard'
,'TFindText'
,'TFindTextA'
,'TFindTextExA'
,'TFindTextExW'
,'TFindTextW'
,'TFormatRange'
,'TGetTextEx'
,'TGetTextLengthEx'
,'TMsgFilter'
,'TObjectPositions'
,'TParaFormat'
,'TParaFormat2'
,'TPunctuation'
,'TRepasteSpecial'
,'TReqSize'
,'TSelChange'
,'TTextRange'
,'TTextRangeA'
,'TTextRangeW'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(__charrange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(__compcolor_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(__editstream_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(__encorrecttext_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[4],Addr(__enprotected_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[5],Addr(__ensaveclipboard_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[6],Addr(__formatrange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[7],Addr(__msgfilter_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[8],Addr(__paraformat_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[9],Addr(__punctuation_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[10],Addr(__repastespecial_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[11],Addr(__selchange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[12],Addr(_CHARRANGE_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[13],Addr(_COMPCOLOR_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[14],Addr(_EDITSTREAM_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[15],Addr(_ENCORRECTTEXT_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[16],Addr(_ENPROTECTED_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[17],Addr(_ENSAVECLIPBOARD_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[18],Addr(_FORMATRANGE_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[19],Addr(_MSGFILTER_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[20],Addr(_PARAFORMAT_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[21],Addr(_PUNCTUATION_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[22],Addr(_REPASTESPECIAL_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[23],Addr(_SELCHANGE_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[24],Addr(_TCharFormat_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[25],Addr(_TCharFormat2_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[26],Addr(_TCharFormat2A_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[27],Addr(_TCharFormat2W_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[28],Addr(_TCharFormatA_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[29],Addr(_TCharFormatW_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[30],Addr(_TCharRange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[31],Addr(_TCompColor_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[32],Addr(_TEditStream_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[33],Addr(_TENCorrectText_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[34],Addr(_TEndDropFiles_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[35],Addr(_TENLink_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[36],Addr(_TENOleOpFailed_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[37],Addr(_TENProtected_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[38],Addr(_TENSaveClipboard_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[39],Addr(_TFindText_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[40],Addr(_TFindTextA_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[41],Addr(_TFindTextExA_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[42],Addr(_TFindTextExW_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[43],Addr(_TFindTextW_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[44],Addr(_TFormatRange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[45],Addr(_TGetTextEx_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[46],Addr(_TGetTextLengthEx_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[47],Addr(_TMsgFilter_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[48],Addr(_TObjectPositions_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[49],Addr(_TParaFormat_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[50],Addr(_TParaFormat2_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[51],Addr(_TPunctuation_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[52],Addr(_TRepasteSpecial_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[53],Addr(_TReqSize_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[54],Addr(_TSelChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[55],Addr(_TTextRange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[56],Addr(_TTextRangeA_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[57],Addr(_TTextRangeW_)));
end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
__RegisterClasses;
__RegisterConsts0;
__RegisterProps;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnregisterProcs;
end.
