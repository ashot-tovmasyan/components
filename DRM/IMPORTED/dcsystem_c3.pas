{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit dcsystem_C3;
interface
{$I dc.inc}
{$D-,L-,Y-}
{$HINTS OFF}
{$WARNINGS OFF}
uses
  dcscript,
  Consts,
  windows,
  messages,
  activex,
  dcClasses,
  Classes,
  Sysutils,
  Typinfo,
  dcapi,
  dchook,
  registry,
  graphics,
  dcconsts,
  dcdreamlib,
  Stdctrls,
  dcsystem;
function ConvertIMAGE_DATA_DIRECTORYToVariant(var R : IMAGE_DATA_DIRECTORY) : OleVariant;
function ConvertVariantToIMAGE_DATA_DIRECTORY(const V : OleVariant) : IMAGE_DATA_DIRECTORY;
function ConvertIMAGE_DOS_HEADERToVariant(var R : IMAGE_DOS_HEADER) : OleVariant;
function ConvertVariantToIMAGE_DOS_HEADER(const V : OleVariant) : IMAGE_DOS_HEADER;
function ConvertIMAGE_FILE_HEADERToVariant(var R : IMAGE_FILE_HEADER) : OleVariant;
function ConvertVariantToIMAGE_FILE_HEADER(const V : OleVariant) : IMAGE_FILE_HEADER;
function ConvertIMAGE_NT_HEADERSToVariant(var R : IMAGE_NT_HEADERS) : OleVariant;
function ConvertVariantToIMAGE_NT_HEADERS(const V : OleVariant) : IMAGE_NT_HEADERS;
function ConvertIMAGE_OPTIONAL_HEADERToVariant(var R : IMAGE_OPTIONAL_HEADER) : OleVariant;
function ConvertVariantToIMAGE_OPTIONAL_HEADER(const V : OleVariant) : IMAGE_OPTIONAL_HEADER;
function ConvertIMAGE_RESOURCE_DATA_ENTRYToVariant(var R : IMAGE_RESOURCE_DATA_ENTRY) : OleVariant;
function ConvertVariantToIMAGE_RESOURCE_DATA_ENTRY(const V : OleVariant) : IMAGE_RESOURCE_DATA_ENTRY;
function ConvertIMAGE_RESOURCE_DIR_STRING_UToVariant(var R : IMAGE_RESOURCE_DIR_STRING_U) : OleVariant;
function ConvertVariantToIMAGE_RESOURCE_DIR_STRING_U(const V : OleVariant) : IMAGE_RESOURCE_DIR_STRING_U;
function ConvertIMAGE_RESOURCE_DIRECTORYToVariant(var R : IMAGE_RESOURCE_DIRECTORY) : OleVariant;
function ConvertVariantToIMAGE_RESOURCE_DIRECTORY(const V : OleVariant) : IMAGE_RESOURCE_DIRECTORY;
function ConvertIMAGE_RESOURCE_DIRECTORY_ENTRYToVariant(var R : IMAGE_RESOURCE_DIRECTORY_ENTRY) : OleVariant;
function ConvertVariantToIMAGE_RESOURCE_DIRECTORY_ENTRY(const V : OleVariant) : IMAGE_RESOURCE_DIRECTORY_ENTRY;
function ConvertIMAGE_SECTION_HEADERToVariant(var R : IMAGE_SECTION_HEADER) : OleVariant;
function ConvertVariantToIMAGE_SECTION_HEADER(const V : OleVariant) : IMAGE_SECTION_HEADER;
function ConvertTCursorResInfoToVariant(var R : TCursorResInfo) : OleVariant;
function ConvertVariantToTCursorResInfo(const V : OleVariant) : TCursorResInfo;
function ConvertTDesignResFormDataToVariant(var R : TDesignResFormData) : OleVariant;
function ConvertVariantToTDesignResFormData(const V : OleVariant) : TDesignResFormData;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
function ConvertTIconHeaderToVariant(var R : TIconHeader) : OleVariant;
function ConvertVariantToTIconHeader(const V : OleVariant) : TIconHeader;
function ConvertTIconResInfoToVariant(var R : TIconResInfo) : OleVariant;
function ConvertVariantToTIconResInfo(const V : OleVariant) : TIconResInfo;
function ConvertTMethodDefToVariant(var R : TMethodDef) : OleVariant;
function ConvertVariantToTMethodDef(const V : OleVariant) : TMethodDef;
function ConvertTMethodTableToVariant(var R : TMethodTable) : OleVariant;
function ConvertVariantToTMethodTable(const V : OleVariant) : TMethodTable;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
function ConvertTScriptErrorInfoToVariant(var R : TScriptErrorInfo) : OleVariant;
function ConvertVariantToTScriptErrorInfo(const V : OleVariant) : TScriptErrorInfo;
function ConvertTVerbDataToVariant(var R : TVerbData) : OleVariant;
function ConvertVariantToTVerbData(const V : OleVariant) : TVerbData;
function ConvertTWMScriptErrorToVariant(var R : TWMScriptError) : OleVariant;
function ConvertVariantToTWMScriptError(const V : OleVariant) : TWMScriptError;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __IMAGE_DATA_DIRECTORY__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_DATA_DIRECTORY;
public
function GetRecordPtr : pointer; override;
published
procedure setVirtualAddress(const val : DWORD);
function getVirtualAddress : DWORD;
property VirtualAddress : DWORD read getVirtualAddress write setVirtualAddress;
procedure setSize(const val : DWORD);
function getSize : DWORD;
property Size : DWORD read getSize write setSize;
end;
type __IMAGE_DOS_HEADER__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_DOS_HEADER;
public
function GetRecordPtr : pointer; override;
published
procedure sete_magic(const val : Word);
function gete_magic : Word;
property e_magic : Word read gete_magic write sete_magic;
procedure sete_cblp(const val : Word);
function gete_cblp : Word;
property e_cblp : Word read gete_cblp write sete_cblp;
procedure sete_cp(const val : Word);
function gete_cp : Word;
property e_cp : Word read gete_cp write sete_cp;
procedure sete_crlc(const val : Word);
function gete_crlc : Word;
property e_crlc : Word read gete_crlc write sete_crlc;
procedure sete_cparhdr(const val : Word);
function gete_cparhdr : Word;
property e_cparhdr : Word read gete_cparhdr write sete_cparhdr;
procedure sete_minalloc(const val : Word);
function gete_minalloc : Word;
property e_minalloc : Word read gete_minalloc write sete_minalloc;
procedure sete_maxalloc(const val : Word);
function gete_maxalloc : Word;
property e_maxalloc : Word read gete_maxalloc write sete_maxalloc;
procedure sete_ss(const val : Word);
function gete_ss : Word;
property e_ss : Word read gete_ss write sete_ss;
procedure sete_sp(const val : Word);
function gete_sp : Word;
property e_sp : Word read gete_sp write sete_sp;
procedure sete_csum(const val : Word);
function gete_csum : Word;
property e_csum : Word read gete_csum write sete_csum;
procedure sete_ip(const val : Word);
function gete_ip : Word;
property e_ip : Word read gete_ip write sete_ip;
procedure sete_cs(const val : Word);
function gete_cs : Word;
property e_cs : Word read gete_cs write sete_cs;
procedure sete_lfarlc(const val : Word);
function gete_lfarlc : Word;
property e_lfarlc : Word read gete_lfarlc write sete_lfarlc;
procedure sete_ovno(const val : Word);
function gete_ovno : Word;
property e_ovno : Word read gete_ovno write sete_ovno;
procedure sete_oemid(const val : Word);
function gete_oemid : Word;
property e_oemid : Word read gete_oemid write sete_oemid;
procedure sete_oeminfo(const val : Word);
function gete_oeminfo : Word;
property e_oeminfo : Word read gete_oeminfo write sete_oeminfo;
procedure sete_lfanew(const val : Longint);
function gete_lfanew : Longint;
property e_lfanew : Longint read gete_lfanew write sete_lfanew;
end;
type __IMAGE_FILE_HEADER__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_FILE_HEADER;
public
function GetRecordPtr : pointer; override;
published
procedure setMachine(const val : Word);
function getMachine : Word;
property Machine : Word read getMachine write setMachine;
procedure setNumberOfSections(const val : Word);
function getNumberOfSections : Word;
property NumberOfSections : Word read getNumberOfSections write setNumberOfSections;
procedure setTimeDateStamp(const val : DWORD);
function getTimeDateStamp : DWORD;
property TimeDateStamp : DWORD read getTimeDateStamp write setTimeDateStamp;
procedure setPointerToSymbolTable(const val : DWORD);
function getPointerToSymbolTable : DWORD;
property PointerToSymbolTable : DWORD read getPointerToSymbolTable write setPointerToSymbolTable;
procedure setNumberOfSymbols(const val : DWORD);
function getNumberOfSymbols : DWORD;
property NumberOfSymbols : DWORD read getNumberOfSymbols write setNumberOfSymbols;
procedure setSizeOfOptionalHeader(const val : Word);
function getSizeOfOptionalHeader : Word;
property SizeOfOptionalHeader : Word read getSizeOfOptionalHeader write setSizeOfOptionalHeader;
procedure setCharacteristics(const val : Word);
function getCharacteristics : Word;
property Characteristics : Word read getCharacteristics write setCharacteristics;
end;
type __IMAGE_NT_HEADERS__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_NT_HEADERS;
public
function GetRecordPtr : pointer; override;
published
procedure setSignature(const val : DWORD);
function getSignature : DWORD;
property Signature : DWORD read getSignature write setSignature;
end;
type __IMAGE_OPTIONAL_HEADER__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_OPTIONAL_HEADER;
public
function GetRecordPtr : pointer; override;
published
procedure setMagic(const val : Word);
function getMagic : Word;
property Magic : Word read getMagic write setMagic;
procedure setMajorLinkerVersion(const val : Byte);
function getMajorLinkerVersion : Byte;
property MajorLinkerVersion : Byte read getMajorLinkerVersion write setMajorLinkerVersion;
procedure setMinorLinkerVersion(const val : Byte);
function getMinorLinkerVersion : Byte;
property MinorLinkerVersion : Byte read getMinorLinkerVersion write setMinorLinkerVersion;
procedure setSizeOfCode(const val : DWORD);
function getSizeOfCode : DWORD;
property SizeOfCode : DWORD read getSizeOfCode write setSizeOfCode;
procedure setSizeOfInitializedData(const val : DWORD);
function getSizeOfInitializedData : DWORD;
property SizeOfInitializedData : DWORD read getSizeOfInitializedData write setSizeOfInitializedData;
procedure setSizeOfUninitializedData(const val : DWORD);
function getSizeOfUninitializedData : DWORD;
property SizeOfUninitializedData : DWORD read getSizeOfUninitializedData write setSizeOfUninitializedData;
procedure setAddressOfEntryPoint(const val : DWORD);
function getAddressOfEntryPoint : DWORD;
property AddressOfEntryPoint : DWORD read getAddressOfEntryPoint write setAddressOfEntryPoint;
procedure setBaseOfCode(const val : DWORD);
function getBaseOfCode : DWORD;
property BaseOfCode : DWORD read getBaseOfCode write setBaseOfCode;
procedure setBaseOfData(const val : DWORD);
function getBaseOfData : DWORD;
property BaseOfData : DWORD read getBaseOfData write setBaseOfData;
procedure setImageBase(const val : DWORD);
function getImageBase : DWORD;
property ImageBase : DWORD read getImageBase write setImageBase;
procedure setSectionAlignment(const val : DWORD);
function getSectionAlignment : DWORD;
property SectionAlignment : DWORD read getSectionAlignment write setSectionAlignment;
procedure setFileAlignment(const val : DWORD);
function getFileAlignment : DWORD;
property FileAlignment : DWORD read getFileAlignment write setFileAlignment;
procedure setMajorOperatingSystemVersion(const val : Word);
function getMajorOperatingSystemVersion : Word;
property MajorOperatingSystemVersion : Word read getMajorOperatingSystemVersion write setMajorOperatingSystemVersion;
procedure setMinorOperatingSystemVersion(const val : Word);
function getMinorOperatingSystemVersion : Word;
property MinorOperatingSystemVersion : Word read getMinorOperatingSystemVersion write setMinorOperatingSystemVersion;
procedure setMajorImageVersion(const val : Word);
function getMajorImageVersion : Word;
property MajorImageVersion : Word read getMajorImageVersion write setMajorImageVersion;
procedure setMinorImageVersion(const val : Word);
function getMinorImageVersion : Word;
property MinorImageVersion : Word read getMinorImageVersion write setMinorImageVersion;
procedure setMajorSubsystemVersion(const val : Word);
function getMajorSubsystemVersion : Word;
property MajorSubsystemVersion : Word read getMajorSubsystemVersion write setMajorSubsystemVersion;
procedure setMinorSubsystemVersion(const val : Word);
function getMinorSubsystemVersion : Word;
property MinorSubsystemVersion : Word read getMinorSubsystemVersion write setMinorSubsystemVersion;
procedure setReserved1(const val : DWORD);
function getReserved1 : DWORD;
property Reserved1 : DWORD read getReserved1 write setReserved1;
procedure setSizeOfImage(const val : DWORD);
function getSizeOfImage : DWORD;
property SizeOfImage : DWORD read getSizeOfImage write setSizeOfImage;
procedure setSizeOfHeaders(const val : DWORD);
function getSizeOfHeaders : DWORD;
property SizeOfHeaders : DWORD read getSizeOfHeaders write setSizeOfHeaders;
procedure setCheckSum(const val : DWORD);
function getCheckSum : DWORD;
property CheckSum : DWORD read getCheckSum write setCheckSum;
procedure setSubsystem(const val : Word);
function getSubsystem : Word;
property Subsystem : Word read getSubsystem write setSubsystem;
procedure setDllCharacteristics(const val : Word);
function getDllCharacteristics : Word;
property DllCharacteristics : Word read getDllCharacteristics write setDllCharacteristics;
procedure setSizeOfStackReserve(const val : DWORD);
function getSizeOfStackReserve : DWORD;
property SizeOfStackReserve : DWORD read getSizeOfStackReserve write setSizeOfStackReserve;
procedure setSizeOfStackCommit(const val : DWORD);
function getSizeOfStackCommit : DWORD;
property SizeOfStackCommit : DWORD read getSizeOfStackCommit write setSizeOfStackCommit;
procedure setSizeOfHeapReserve(const val : DWORD);
function getSizeOfHeapReserve : DWORD;
property SizeOfHeapReserve : DWORD read getSizeOfHeapReserve write setSizeOfHeapReserve;
procedure setSizeOfHeapCommit(const val : DWORD);
function getSizeOfHeapCommit : DWORD;
property SizeOfHeapCommit : DWORD read getSizeOfHeapCommit write setSizeOfHeapCommit;
procedure setLoaderFlags(const val : DWORD);
function getLoaderFlags : DWORD;
property LoaderFlags : DWORD read getLoaderFlags write setLoaderFlags;
procedure setNumberOfRvaAndSizes(const val : DWORD);
function getNumberOfRvaAndSizes : DWORD;
property NumberOfRvaAndSizes : DWORD read getNumberOfRvaAndSizes write setNumberOfRvaAndSizes;
end;
type __IMAGE_RESOURCE_DATA_ENTRY__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_RESOURCE_DATA_ENTRY;
public
function GetRecordPtr : pointer; override;
published
procedure setOffsetToData(const val : DWORD);
function getOffsetToData : DWORD;
property OffsetToData : DWORD read getOffsetToData write setOffsetToData;
procedure setSize(const val : DWORD);
function getSize : DWORD;
property Size : DWORD read getSize write setSize;
procedure setCodePage(const val : DWORD);
function getCodePage : DWORD;
property CodePage : DWORD read getCodePage write setCodePage;
procedure setReserved(const val : DWORD);
function getReserved : DWORD;
property Reserved : DWORD read getReserved write setReserved;
end;
type __IMAGE_RESOURCE_DIR_STRING_U__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_RESOURCE_DIR_STRING_U;
public
function GetRecordPtr : pointer; override;
published
procedure setLength(const val : Word);
function getLength : Word;
property Length : Word read getLength write setLength;
end;
type __IMAGE_RESOURCE_DIRECTORY__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_RESOURCE_DIRECTORY;
public
function GetRecordPtr : pointer; override;
published
procedure setCharacteristics(const val : DWORD);
function getCharacteristics : DWORD;
property Characteristics : DWORD read getCharacteristics write setCharacteristics;
procedure setTimeDateStamp(const val : DWORD);
function getTimeDateStamp : DWORD;
property TimeDateStamp : DWORD read getTimeDateStamp write setTimeDateStamp;
procedure setMajorVersion(const val : Word);
function getMajorVersion : Word;
property MajorVersion : Word read getMajorVersion write setMajorVersion;
procedure setMinorVersion(const val : Word);
function getMinorVersion : Word;
property MinorVersion : Word read getMinorVersion write setMinorVersion;
procedure setNumberOfNamedEntries(const val : Word);
function getNumberOfNamedEntries : Word;
property NumberOfNamedEntries : Word read getNumberOfNamedEntries write setNumberOfNamedEntries;
procedure setNumberOfIdEntries(const val : Word);
function getNumberOfIdEntries : Word;
property NumberOfIdEntries : Word read getNumberOfIdEntries write setNumberOfIdEntries;
end;
type __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_RESOURCE_DIRECTORY_ENTRY;
public
function GetRecordPtr : pointer; override;
published
procedure setName(const val : DWORD);
function getName : DWORD;
property Name : DWORD read getName write setName;
procedure setOffsetToData(const val : DWORD);
function getOffsetToData : DWORD;
property OffsetToData : DWORD read getOffsetToData write setOffsetToData;
end;
type __IMAGE_SECTION_HEADER__Wrapper = class(TDCRecordWrapper)
private
fR : IMAGE_SECTION_HEADER;
public
function GetRecordPtr : pointer; override;
published
procedure setPhysicalAddress(const val : DWORD);
function getPhysicalAddress : DWORD;
property PhysicalAddress : DWORD read getPhysicalAddress write setPhysicalAddress;
procedure setVirtualAddress(const val : DWORD);
function getVirtualAddress : DWORD;
property VirtualAddress : DWORD read getVirtualAddress write setVirtualAddress;
procedure setSizeOfRawData(const val : DWORD);
function getSizeOfRawData : DWORD;
property SizeOfRawData : DWORD read getSizeOfRawData write setSizeOfRawData;
procedure setPointerToRawData(const val : DWORD);
function getPointerToRawData : DWORD;
property PointerToRawData : DWORD read getPointerToRawData write setPointerToRawData;
procedure setPointerToRelocations(const val : DWORD);
function getPointerToRelocations : DWORD;
property PointerToRelocations : DWORD read getPointerToRelocations write setPointerToRelocations;
procedure setPointerToLinenumbers(const val : DWORD);
function getPointerToLinenumbers : DWORD;
property PointerToLinenumbers : DWORD read getPointerToLinenumbers write setPointerToLinenumbers;
procedure setNumberOfRelocations(const val : Word);
function getNumberOfRelocations : Word;
property NumberOfRelocations : Word read getNumberOfRelocations write setNumberOfRelocations;
procedure setNumberOfLinenumbers(const val : Word);
function getNumberOfLinenumbers : Word;
property NumberOfLinenumbers : Word read getNumberOfLinenumbers write setNumberOfLinenumbers;
procedure setCharacteristics(const val : DWORD);
function getCharacteristics : DWORD;
property Characteristics : DWORD read getCharacteristics write setCharacteristics;
end;
type __TCursorResInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TCursorResInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setwWidth(const val : Word);
function getwWidth : Word;
property wWidth : Word read getwWidth write setwWidth;
procedure setwHeight(const val : Word);
function getwHeight : Word;
property wHeight : Word read getwHeight write setwHeight;
procedure setwPlanes(const val : Word);
function getwPlanes : Word;
property wPlanes : Word read getwPlanes write setwPlanes;
procedure setwBitCount(const val : Word);
function getwBitCount : Word;
property wBitCount : Word read getwBitCount write setwBitCount;
procedure setlBytesInRes(const val : DWORD);
function getlBytesInRes : DWORD;
property lBytesInRes : DWORD read getlBytesInRes write setlBytesInRes;
procedure setwNameOrdinal(const val : Word);
function getwNameOrdinal : Word;
property wNameOrdinal : Word read getwNameOrdinal write setwNameOrdinal;
end;
type __TDesignResFormData__Wrapper = class(TDCRecordWrapper)
private
fR : TDesignResFormData;
public
function GetRecordPtr : pointer; override;
published
procedure setResName(const val : AnsiString);
function getResName : AnsiString;
property ResName : AnsiString read getResName write setResName;
end;
type __TIconHeader__Wrapper = class(TDCRecordWrapper)
private
fR : TIconHeader;
public
function GetRecordPtr : pointer; override;
published
procedure setwReserved(const val : Word);
function getwReserved : Word;
property wReserved : Word read getwReserved write setwReserved;
procedure setwType(const val : Word);
function getwType : Word;
property wType : Word read getwType write setwType;
procedure setwCount(const val : Word);
function getwCount : Word;
property wCount : Word read getwCount write setwCount;
end;
type __TIconResInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TIconResInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setbWidth(const val : Byte);
function getbWidth : Byte;
property bWidth : Byte read getbWidth write setbWidth;
procedure setbHeight(const val : Byte);
function getbHeight : Byte;
property bHeight : Byte read getbHeight write setbHeight;
procedure setbColorCount(const val : Byte);
function getbColorCount : Byte;
property bColorCount : Byte read getbColorCount write setbColorCount;
procedure setbReserved(const val : Byte);
function getbReserved : Byte;
property bReserved : Byte read getbReserved write setbReserved;
procedure setwPlanes(const val : Word);
function getwPlanes : Word;
property wPlanes : Word read getwPlanes write setwPlanes;
procedure setwBitCount(const val : Word);
function getwBitCount : Word;
property wBitCount : Word read getwBitCount write setwBitCount;
procedure setlBytesInRes(const val : DWORD);
function getlBytesInRes : DWORD;
property lBytesInRes : DWORD read getlBytesInRes write setlBytesInRes;
procedure setwNameOrdinal(const val : Word);
function getwNameOrdinal : Word;
property wNameOrdinal : Word read getwNameOrdinal write setwNameOrdinal;
end;
type __TMethodDef__Wrapper = class(TDCRecordWrapper)
private
fR : TMethodDef;
public
function GetRecordPtr : pointer; override;
published
procedure setSize(const val : Word);
function getSize : Word;
property Size : Word read getSize write setSize;
end;
type __TMethodTable__Wrapper = class(TDCRecordWrapper)
private
fR : TMethodTable;
public
function GetRecordPtr : pointer; override;
published
procedure setSize(const val : Word);
function getSize : Word;
property Size : Word read getSize write setSize;
end;
type __TScriptErrorInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TScriptErrorInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setFilerID(const val : TFilerID);
function getFilerID : TFilerID;
property FilerID : TFilerID read getFilerID write setFilerID;
procedure setCharPos(const val : Integer);
function getCharPos : Integer;
property CharPos : Integer read getCharPos write setCharPos;
procedure setLinePos(const val : Integer);
function getLinePos : Integer;
property LinePos : Integer read getLinePos write setLinePos;
procedure setExcepInfo(const val : TExcepInfo);
function getExcepInfo : TExcepInfo;
property ExcepInfo : TExcepInfo read getExcepInfo write setExcepInfo;
end;
type __TVerbData__Wrapper = class(TDCRecordWrapper)
private
fR : TVerbData;
public
function GetRecordPtr : pointer; override;
published
procedure setName(const val : AnsiString);
function getName : AnsiString;
property Name : AnsiString read getName write setName;
end;
type __TWMScriptError__Wrapper = class(TDCRecordWrapper)
private
fR : TWMScriptError;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setLParam(const val : Longint);
function getLParam : Longint;
property LParam : Longint read getLParam write setLParam;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TRect__Wrapper = class(TDCRecordWrapper)
private
fR : TRect;
public
function GetRecordPtr : pointer; override;
published
procedure setLeft(const val : Integer);
function getLeft : Integer;
property Left : Integer read getLeft write setLeft;
procedure setTop(const val : Integer);
function getTop : Integer;
property Top : Integer read getTop write setTop;
procedure setRight(const val : Integer);
function getRight : Integer;
property Right : Integer read getRight write setRight;
procedure setBottom(const val : Integer);
function getBottom : Integer;
property Bottom : Integer read getBottom write setBottom;
end;
type __TPoint__Wrapper = class(TDCRecordWrapper)
private
fR : TPoint;
public
function GetRecordPtr : pointer; override;
published
procedure setx(const val : Longint);
function getx : Longint;
property x : Longint read getx write setx;
procedure sety(const val : Longint);
function gety : Longint;
property y : Longint read gety write sety;
end;
type __TGUID__Wrapper = class(TDCRecordWrapper)
private
fR : TGUID;
public
function GetRecordPtr : pointer; override;
published
procedure setD1(const val : Integer);
function getD1 : Integer;
property D1 : Integer read getD1 write setD1;
procedure setD2(const val : Word);
function getD2 : Word;
property D2 : Word read getD2 write setD2;
procedure setD3(const val : Word);
function getD3 : Word;
property D3 : Word read getD3 write setD3;
end;
type
_T0 = function (const p0 : String): String of object;

_T1 = procedure (const p0 : String;
const p1 : String;
const p2 : String) of object;

_T2 = function : Boolean of object;

_T3 = function (const p0 : IDispatch): String of object;

_T4 = _T3;

_T5 = function (const p0 : IDispatch): Integer of object;

_T6 = _T5;

_T7 = function : Word of object;

_T8 = function (p0 : Integer): Boolean of object;

_T9 = _T8;

_T10 = function : String of object;

_T11 = procedure (const p0 : Variant) of object;

_T12 = _T11;

_T13 = procedure  of object;

{_T14 = procedure (p0 : TOptionExtClass) of object;}

{_T15 = function (p0 : TOptionExtClass): TOptionExt of object;}

_T16 = _T13;

{_T17 = function (const p0 : String;
var p1 : TGetVerbStateProc;
var p2 : TExecuteVerbProc): TObjectParamListItem of object;}

_T18 = procedure (const p0 : String) of object;

{_T19 = procedure (const p0 : String;
p1 : TGetVerbStateProc;
p2 : TExecuteVerbProc) of object;}

_T20 = procedure (const p0 : IDispatch) of object;

_T21 = _T2;

_T22 = function (const p0 : String): TDelphiVers of object;

_T23 = function (const p0 : String): TFilerID of object;

_T24 = function (p0 : TFileSystem): TFilerID of object;

_T25 = function (const p0 : TFilerID): TFileSystem of object;

_T26 = procedure (p0 : TFileSystem) of object;

_T27 = function : TWin32FileSystem of object;

_T28 = function : IDispatch of object;

_T29 = _T0;

_T30 = _T3;

_T31 = _T0;

_T32 = _T18;

{_T33 = procedure (const p0 : IDispatch;
p1 : TDispID;
const p2 : OleVariant) of object;}

_T34 = function (const p0 : String;
p1 : TStrings;
p2 : Char): String of object;

_T35 = procedure (p0 : TStrings;
p1 : TStrings;
p2 : Char) of object;

_T36 = procedure (p0 : TStrings;
p1 : TStrings) of object;

_T37 = procedure (const p0 : String;
p1 : TStrings) of object;

_T38 = procedure (const p0 : String;
const p1 : String;
p2 : Integer;
p3 : TStrings;
p4 : Boolean) of object;

_T39 = _T2;

_T40 = _T2;

_T41 = function : TShiftState of object;

_T42 = function (const p0 : String;
p1 : Char): String of object;

_T43 = procedure (const p0 : String;
const p1 : String) of object;

_T44 = function (const p0 : String): Boolean of object;

_T45 = _T0;

_T46 = function (const p0 : String): Integer of object;

_T47 = procedure (var p0 : String;
const p1 : String;
const p2 : String;
p3 : Boolean) of object;

_T48 = procedure (var p0 : String;
const p1 : String;
const p2 : String) of object;

_T49 = function (const p0 : String;
p1 : Integer): String of object;

_T50 = function (const p0 : String;
p1 : Integer;
const p2 : TCharSet): Integer of object;

_T51 = function (const p0 : String;
p1 : Integer;
const p2 : TCharSet): String of object;

_T52 = _T0;

_T53 = function (const p0 : String;
p1 : TCharSet): String of object;

_T54 = _T53;

_T55 = _T53;

_T56 = procedure (var p0 : String;
p1 : Integer;
const p2 : String;
const p3 : String) of object;

_T57 = function (const p0 : Array of String): String of object;

_T58 = function (p0 : Integer): String of object;

_T59 = procedure (var p0 : String;
p1 : Integer) of object;

{_T60 = function (var p0 : PChar): String of object;}

_T61 = _T0;

_T62 = procedure (var p0 : String;
const p1 : String) of object;

_T63 = _T46;

_T64 = function (const p0 : String;
p1 : Char;
p2 : Integer): String of object;

_T65 = function (const p0 : TCharSet;
const p1 : String): String of object;

_T66 = _T0;

_T67 = function (const p0 : String;
const p1 : String;
p2 : Boolean): String of object;

_T68 = function (p0 : TCharSet;
const p1 : String;
p2 : Boolean): TCharSet of object;

{_T69 = function (p0 : PChar): String of object;}

{_T70 = function (p0 : PChar): String of object;}

_T71 = function (const p0 : Array of String;
p1 : Char): String of object;

_T75 = _T36;

_T76 = procedure (p0 : TStrings) of object;

{_T77 = procedure (p0 : TStrings;
p1 : TStringsOperateProc) of object;}

_T78 = _T76;

_T79 = function (p0 : TStrings;
p1 : Char): String of object;

_T80 = procedure (p0 : TStrings;
p1 : TList) of object;

_T81 = function : TStringList of object;

{_T82 = function (p0 : TStringListClass): TStringList of object;}

_T83 = _T76;

_T84 = procedure (var p0) of object;

_T85 = _T76;

_T86 = procedure (p0 : TComponent;
const p1 : String) of object;

_T87 = _T36;

_T88 = _T36;

{_T89 = procedure (p0 : TStrings;
p1 : TGetStrProc) of object;}

_T90 = _T76;

_T91 = _T36;

_T92 = _T76;

_T93 = _T36;

_T94 = procedure (p0 : TStrings;
const p1 : Array of String) of object;

_T95 = _T36;

_T96 = function (var p0 : String;
const p1 : String;
p2 : TStrings): Boolean of object;

{_T97 = function (p0 : TStream): TComponentClass of object;}

_T98 = function (p0 : TStream;
p1 : Boolean): Boolean of object;

_T99 = procedure (p0 : TWriter;
p1 : TComponent;
p2 : TStrings) of object;

_T100 = procedure (p0 : TStream;
p1 : TComponent;
const p2 : Array of String) of object;

_T101 = procedure (p0 : TStream;
p1 : TComponent) of object;

_T102 = procedure (p0 : TStream;
p1 : Word) of object;

_T103 = procedure (p0 : TStream;
p1 : Integer) of object;

_T104 = procedure (p0 : TStream;
const p1 : String) of object;

_T105 = _T104;

_T106 = function (p0 : TStream): String of object;

_T107 = function (var p0 : TList): TList of object;

_T108 = procedure (var p0 : TList) of object;

_T109 = function (p0 : TList;
p1 : TList): Boolean of object;

_T110 = _T109;

{_T111 = function (p0 : TList;
p1 : TListIteratorProc): Boolean of object;}

_T112 = procedure (p0 : TList;
p1 : TList) of object;

_T113 = function (p0 : TList;
p1 : Pointer): Integer of object;

_T114 = function : TList of object;

_T115 = function (p0 : TSortedList;
p1 : Pointer): Integer of object;

_T116 = procedure (p0 : TCollectionItem;
const p1 : String) of object;

_T117 = function (p0 : TCollectionItem): String of object;

_T118 = function : TObjectParamList of object;

{_T119 = procedure (p0 : TInitProc) of object;}

{_T120 = procedure (p0 : TInitProc) of object;}

{_T121 = procedure (p0 : TCodeDesignerClass;
const p1 : String) of object;}

{_T122 = procedure (p0 : TCodeDesignerClass;
const p1 : String) of object;}

{_T123 = function (const p0 : String): TCodeDesignerClass of object;}

{_T124 = function (const p0 : String): TCodeDesignerClass of object;}

{_T125 = function (p0 : TClass;
const p1 : Array of String;
const p2 : Array of Variant): TObjectParamListItem of object;}

{_T126 = procedure (p0 : TClass) of object;}

_T127 = procedure (p0 : TObject;
const p1 : Array of String;
const p2 : Array of Variant) of object;

{_T128 = function (p0 : TClass;
const p1 : Array of String;
const p2 : Array of Variant;
p3 : TCompareParams): TClass of object;}

{_T129 = procedure (p0 : TClass;
p1 : TList) of object;}

{_T130 = procedure (p0 : TClass;
const p1 : Array of String;
const p2 : Array of Variant;
p3 : TCompareParams;
p4 : TList) of object;}

{_T131 = function (p0 : TClass;
const p1 : Array of String;
const p2 : Array of Variant;
p3 : TCompareParams): TObjectParamListItem of object;}

{_T132 = function (p0 : TClass;
const p1 : Array of String;
const p2 : Array of Variant;
p3 : TCompareParams): TObjectParamListItem of object;}

{_T133 = function (p0 : TClass;
const p1 : Array of String;
const p2 : Array of Variant;
p3 : TCompareParams): TObjectParamListItem of object;}

{_T134 = function (p0 : TClass;
p1 : TClass;
const p2 : Array of String;
const p3 : Array of Variant;
p4 : TCompareParams): TObjectParamListItem of object;}

{_T135 = function (const p0 : String;
p1 : Boolean): TCodeDesignerClass of object;}

{_T136 = function (p0 : TClass;
const p1 : Array of String;
const p2 : Array of Variant;
p3 : TCompareParams): TClass of object;}

{_T137 = procedure (p0 : Array of TPersistentClass) of object;}

{_T138 = procedure (p0 : TPersistentClass) of object;}

{_T139 = function (p0 : TFindComponentProc): Boolean of object;}

_T140 = _T13;

_T141 = function (const p0 : Array of Integer): Integer of object;

_T142 = function (p0 : TComponent;
const p1 : String): Boolean of object;

_T143 = function (p0 : TComponent;
const p1 : String): String of object;

_T144 = _T0;

{_T145 = function (p0 : TClass): THandle of object;}

{_T146 = procedure (p0 : TComponent;
p1 : TComponent;
p2 : PTypeData;
p3 : TGetStrProc) of object;}

{_T147 = procedure (p0 : TList;
p1 : TComponent;
p2 : PTypeData;
p3 : TGetStrProc) of object;}

{_T148 = function (p0 : TClass): Pointer of object;}

{_T149 = procedure (p0 : TClass;
p1 : Pointer) of object;}

{_T150 = procedure (p0 : TClass;
p1 : Pointer) of object;}

{_T151 = function (p0 : TClass): PMethodTable of object;}

_T152 = function (p0 : Pointer;
p1 : Pointer): Integer of object;

_T153 = function (p0 : TObject): String of object;

_T154 = function (p0 : TPersistent): String of object;

{_T155 = function (p0 : TClass;
p1 : TClass): TClass of object;}

{_T156 = function (p0 : TList): TClass of object;}

_T157 = procedure (p0 : TPersistent;
p1 : TStrings) of object;

_T158 = _T157;

_T159 = procedure (const p0 : Array of TPersistent;
p1 : Boolean) of object;

_T160 = procedure (const p0 : Array of TPersistent;
const p1 : String;
const p2 : Variant) of object;

_T161 = procedure (p0 : TPersistent;
const p1 : String;
const p2 : Variant) of object;

_T162 = function (p0 : TPersistent;
const p1 : String): Variant of object;

_T163 = function (p0 : TPersistent;
const p1 : String): Boolean of object;

_T164 = procedure (p0 : TPersistent;
p1 : TPersistent;
p2 : Array of String) of object;

_T165 = procedure (p0 : TPersistent;
p1 : TPersistent;
const p2 : String) of object;

_T166 = _T20;

_T167 = function (const p0 : IDispatch): Boolean of object;

_T168 = procedure (const p0 : String;
const p1 : String;
const p2 : String;
const p3 : String;
p4 : Integer) of object;

_T169 = _T43;

_T170 = procedure (const p0 : String;
p1 : TPersistent) of object;

_T171 = _T170;

_T172 = _T170;

_T173 = _T170;

_T174 = procedure (const p0 : String;
var p1 : String;
p2 : Integer) of object;

_T175 = function (const p0 : String;
var p1 : String;
p2 : Integer): Integer of object;

_T176 = _T46;

_T177 = _T174;

_T178 = _T175;

_T179 = _T46;

_T180 = procedure (const p0 : String;
const p1 : Variant) of object;

_T181 = function (const p0 : String;
const p1 : Variant): Variant of object;

_T182 = _T37;

_T183 = _T37;

_T184 = procedure (p0 : TPersistent;
const p1 : String) of object;

_T185 = _T184;

_T186 = _T44;

_T187 = function (p0 : HKey;
const p1 : String;
const p2 : String): Boolean of object;

_T188 = procedure (const p0 : String;
p1 : Integer;
p2 : Integer) of object;

_T189 = procedure (p0 : TStrings;
p1 : Integer;
p2 : Integer) of object;

_T190 = procedure (const p0 : String;
p1 : Integer;
p2 : Integer;
p3 : Boolean) of object;

_T191 = function (const p0 : String;
const p1 : String): String of object;

_T192 = _T191;

_T193 = _T191;

_T194 = _T191;

{_T195 = function (const p0 : String;
const p1 : String;
p2 : PChar): Boolean of object;}

{_T196 = function (const p0 : String;
p1 : PChar;
const p2 : String;
p3 : Word;
p4 : Pointer;
p5 : Integer): Boolean of object;}

_T197 = function (const p0 : String;
const p1 : String;
const p2 : TFilerID): String of object;

_T198 = function (const p0 : String;
const p1 : String;
p2 : TFilerID): String of object;

_T199 = procedure (const p0 : String;
const p1 : String;
p2 : Integer;
p3 : Boolean;
p4 : TStrings) of object;

_T200 = procedure (const p0 : String;
p1 : Integer;
p2 : Boolean;
p3 : TStrings) of object;

_T201 = function (const p0 : TFileName): TFileName of object;

_T202 = _T10;

{_T203 = function (const p0 : String;
p1 : Integer;
p2 : Boolean;
p3 : TFileFoundCallBack): Integer of object;}

_T204 = _T18;

_T205 = _T0;

_T206 = procedure (p0 : TObject) of object;

_T207 = procedure (p0 : TComponent;
p1 : TNotifierList) of object;

_T208 = procedure (p0 : TList) of object;

_T209 = _T13;

_T210 = _T13;

_T211 = procedure (p0 : Boolean) of object;

_T212 = _T13;

_T213 = procedure (p0 : Integer) of object;

_T214 = _T206;

_T215 = _T206;

_T216 = _T13;

_T217 = _T13;

_T218 = _T13;

_T219 = function (p0 : TObject;
p1 : Cardinal;
p2 : Longint;
p3 : Longint;
p4 : Boolean): Boolean of object;

_T220 = function (p0 : TObject;
p1 : TList;
p2 : Cardinal;
p3 : Longint;
p4 : Longint;
p5 : Boolean): Boolean of object;

_T221 = procedure (p0 : TObject;
p1 : Cardinal;
p2 : Longint;
p3 : Longint) of object;

_T222 = function (p0 : TObject;
p1 : Cardinal;
p2 : Longint;
p3 : Longint): Boolean of object;

_T223 = function (p0 : THandle;
const p1 : IDispatch): Longint of object;

_T224 = procedure (p0 : THandle;
p1 : THandle;
const p2 : IDispatch;
const p3 : IDispatch;
p4 : Longint) of object;

_T225 = procedure (p0 : THandle;
p1 : THandle;
const p2 : IDispatch;
p3 : Longint;
p4 : Integer;
p5 : Integer) of object;

_T226 = procedure (const p0 : IDispatch;
const p1 : IDispatch) of object;

_T227 = procedure (p0 : TCanvas;
const p1 : String;
p2 : Integer;
const p3 : IDispatch) of object;

_T228 = procedure (p0 : TCanvas;
const p1 : IDispatch;
const p2 : IDispatch) of object;

_T229 = function (const p0 : IDispatch;
const p1 : IDispatch;
p2 : THorzAlignment;
p3 : TVertAlignment;
p4 : Integer;
p5 : Integer): IDispatch of object;

_T230 = function (p0 : TComponent): IDispatch of object;

_T231 = procedure (p0 : TComponent;
const p1 : IDispatch) of object;

_T232 = function (const p0 : String): IDispatch of object;

_T233 = _T3;

_T234 = function (p0 : TPersistent;
const p1 : String): String of object;

_T235 = _T58;

{_T236 = procedure (p0 : TClass;
const p1 : String;
p2 : TKeyboardInitProc) of object;}

{_T237 = function (p0 : TClass;
const p1 : String): TKeyboardInitProc of object;}

_T238 = _T13;

_T239 = _T0;

_T240 = procedure (const p0 : HKey) of object;

_T241 = _T184;

_T242 = _T184;

_T243 = function : TPackagedCollection of object;

_T244 = _T243;

_T245 = _T243;

{_T246 = procedure (p0 : PTypeInfo;
p1 : TClass;
const p2 : String;
p3 : TComponentClass) of object;}

{_T247 = procedure (p0 : TEditSourceClass) of object;}

{_T248 = procedure (p0 : PTypeInfo;
p1 : TClass;
const p2 : String;
p3 : TComponentClass) of object;}

{_T249 = procedure (p0 : PTypeInfo;
p1 : TClass;
const p2 : String;
p3 : TComponentClass) of object;}

{_T250 = function (p0 : TComponentClass): Boolean of object;}

{_T251 = procedure (p0 : PTypeInfo;
p1 : TClass;
const p2 : String;
p3 : TComponentClass) of object;}

{_T252 = procedure (p0 : PTypeInfo;
p1 : TClass;
const p2 : String;
p3 : TComponentClass) of object;}

_T253 = function : Integer of object;

_T254 = _T253;

_T255 = _T184;

_T256 = function : TClassItems of object;

{_T257 = function (p0 : TComponentClass): Boolean of object;}

{_T258 = procedure (p0 : Array of TComponentClass) of object;}

_T259 = procedure (p0 : TButton;
p1 : TButton;
p2 : TButton) of object;

{_T260 = procedure (p0 : TOptionsInitializator) of object;}

{_T261 = procedure (p0 : TOptionsInitializator) of object;}

{_T262 = procedure (p0 : TGetStrProc) of object;}

_T263 = _T13;

{_T264 = function (p0 : PChar;
p1 : Integer): String of object;}

_T265 = procedure (const p0 : String;
p1 : TStream) of object;

_T266 = function (const p0 : String;
const p1 : Array of String): Boolean of object;

_T267 = function (const p0 : String;
var p1 : TDelphiVer): Boolean of object;

_T268 = function (p0 : TStrings;
const p1 : String): String of object;

_T269 = function (p0 : TStrings;
const p1 : String;
p2 : Boolean): String of object;

{_T270 = function (p0 : TPersistent;
p1 : TTypeKinds): IDCPropInfoList of object;}

{_T271 = procedure (p0 : PTypeInfo;
p1 : TStrings) of object;}

_T272 = procedure (p0 : TDelphiVer;
p1 : TStrings) of object;

_T273 = procedure (p0 : TStrings;
p1 : TDelphiVer) of object;

_T274 = _T76;

_T275 = _T191;

_T276 = procedure (p0 : TStrings;
const p1 : String) of object;

_T277 = _T276;

{_T278 = function (p0 : TComponentClass): Boolean of object;}

_T279 = _T208;

{_T280 = function (p0 : TClass;
p1 : TClassItemCats): TClassItem of object;}

_T281 = _T13;

_T282 = _T76;

_T283 = function : TStrings of object;

_T284 = procedure (p0 : Integer;
p1 : Integer) of object;

{_T285 = function : TSimpleParserClass of object;}

{_T286 = procedure (const p0 : String;
p1 : PTypeData) of object;}

_T287 = _T18;

_T288 = _T43;

_T289 = _T18;

_T290 = _T13;

{_T291 = procedure (p0 : PTypeData;
p1 : TStrings) of object;}

_T292 = _T44;

_T293 = _T86;

_T294 = procedure (p0 : TComponent) of object;

_T295 = _T86;

_T296 = _T44;

_T297 = function (const p0 : String): TMethodState of object;

_T298 = procedure (p0 : TStrings;
p1 : Boolean) of object;

_T299 = _T298;

_T300 = _T2;

_T301 = _T43;

_T302 = procedure (const p0 : String;
p1 : Boolean) of object;

_T303 = _T58;

_T304 = _T10;

_T305 = _T18;

_T306 = procedure (p0 : TStream) of object;

_T307 = _T306;

_T308 = _T18;

{_T309 = function (const p0 : IDCDsgnDesignerSelections): Boolean of object;}

_T310 = _T13;

_T311 = _T253;

_T312 = function (const p0 : TPersistent): Integer of object;

_T313 = function (p0 : Integer): TPersistent of object;

_T314 = _T13;

_T315 = _T13;

_T316 = procedure (p0 : TComponent;
const p1 : String;
const p2 : String;
p3 : Boolean) of object;

_T317 = _T43;

_T318 = _T13;

_T319 = _T10;

_T320 = _T18;

_T321 = _T13;

_T322 = _T43;

_T323 = _T18;

_T324 = _T10;

_T325 = _T18;

_T326 = function (const p0 : TFileName;
p1 : Integer): TStream of object;

_T327 = function (const p0 : TFileName): Integer of object;

_T328 = function (const p0 : TFileName;
const p1 : TFileName): Boolean of object;

_T329 = function (const p0 : TFileName): Boolean of object;

_T330 = _T329;

_T331 = _T329;

_T332 = _T201;

_T333 = _T201;

_T334 = function : TFileSystemLevel of object;

_T335 = _T191;

_T336 = _T13;

{_T337 = function (p0 : Word;
p1 : TShiftState;
p2 : TKeyboardMethod;
p3 : Shortint;
p4 : Shortint): TKeyData of object;}

{_T338 = function (p0 : Word;
p1 : TShiftState;
p2 : TKeyboardMethod): TKeyData of object;}

{_T339 = function (p0 : Word;
p1 : TShiftState;
p2 : TKeyboardMethod): TKeyData of object;}

_T340 = function (p0 : Word;
p1 : TShiftState;
p2 : Shortint): TKeyData of object;

_T341 = _T13;

_T342 = procedure (p0 : Pointer) of object;

_T343 = _T342;

_T344 = _T13;

_T345 = procedure (p0 : TStream;
p1 : Integer;
p2 : TObject) of object;

_T346 = procedure (p0 : TObject;
p1 : Integer;
p2 : Integer) of object;

_T347 = _T13;

{_T348 = procedure (p0 : TNotifierProc) of object;}

{_T349 = procedure (p0 : TNotifierProc) of object;}

_T350 = _T342;

_T351 = function (p0 : Pointer): TObjectParamListItem of object;

_T352 = _T13;

{_T353 = function (p0 : TClass;
const p1 : Array of Variant;
p2 : TObjectParamListIterator): Variant of object;}

_T354 = _T13;

_T355 = _T13;

_T356 = _T10;

_T357 = _T13;

_T358 = _T13;

_T359 = _T13;

_T360 = _T13;

_T361 = _T13;

_T362 = _T13;

_T363 = function : TPersistent of object;

_T364 = _T13;

_T365 = function (const p0 : String): TOptionExt of object;

_T366 = _T13;

_T367 = function : TPackagedCollectionItem of object;

{_T368 = procedure (p0 : TCollectionItemClass) of object;}

_T369 = _T213;

_T370 = _T367;

_T371 = _T345;

_T372 = procedure (const p0 : String;
p1 : Integer) of object;

{_T373 = procedure (const p0 : String;
const p1 : String;
p2 : PChar;
p3 : Integer) of object;}

_T374 = _T213;

{_T375 = procedure (p0 : TNotifierProc) of object;}

{_T376 = procedure (p0 : TNotifierProc) of object;}

_T377 = function (p0 : Integer): TFont of object;

_T378 = function (p0 : Integer;
var p1 : TColor): Boolean of object;

_T379 = function (const p0 : String;
p1 : Integer;
var p2 : String): Integer of object;

_T380 = _T2;

_T381 = procedure (p0 : Integer;
const p1 : String;
var p2 : String) of object;

function __IMAGE_DATA_DIRECTORY__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_DATA_DIRECTORY__Wrapper.setVirtualAddress(const val : DWORD);
begin
IMAGE_DATA_DIRECTORY(GetRecordPtr^).VirtualAddress := val;
end;
function __IMAGE_DATA_DIRECTORY__Wrapper.getVirtualAddress : DWORD;
begin
result := IMAGE_DATA_DIRECTORY(GetRecordPtr^).VirtualAddress;
end;
procedure __IMAGE_DATA_DIRECTORY__Wrapper.setSize(const val : DWORD);
begin
IMAGE_DATA_DIRECTORY(GetRecordPtr^).Size := val;
end;
function __IMAGE_DATA_DIRECTORY__Wrapper.getSize : DWORD;
begin
result := IMAGE_DATA_DIRECTORY(GetRecordPtr^).Size;
end;
function __IMAGE_DOS_HEADER__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_magic(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_magic := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_magic : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_magic;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_cblp(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_cblp := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_cblp : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_cblp;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_cp(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_cp := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_cp : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_cp;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_crlc(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_crlc := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_crlc : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_crlc;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_cparhdr(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_cparhdr := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_cparhdr : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_cparhdr;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_minalloc(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_minalloc := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_minalloc : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_minalloc;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_maxalloc(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_maxalloc := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_maxalloc : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_maxalloc;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_ss(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_ss := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_ss : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_ss;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_sp(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_sp := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_sp : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_sp;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_csum(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_csum := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_csum : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_csum;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_ip(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_ip := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_ip : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_ip;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_cs(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_cs := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_cs : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_cs;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_lfarlc(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_lfarlc := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_lfarlc : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_lfarlc;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_ovno(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_ovno := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_ovno : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_ovno;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_oemid(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_oemid := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_oemid : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_oemid;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_oeminfo(const val : Word);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_oeminfo := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_oeminfo : Word;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_oeminfo;
end;
procedure __IMAGE_DOS_HEADER__Wrapper.sete_lfanew(const val : Longint);
begin
IMAGE_DOS_HEADER(GetRecordPtr^).e_lfanew := val;
end;
function __IMAGE_DOS_HEADER__Wrapper.gete_lfanew : Longint;
begin
result := IMAGE_DOS_HEADER(GetRecordPtr^).e_lfanew;
end;
function __IMAGE_FILE_HEADER__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_FILE_HEADER__Wrapper.setMachine(const val : Word);
begin
IMAGE_FILE_HEADER(GetRecordPtr^).Machine := val;
end;
function __IMAGE_FILE_HEADER__Wrapper.getMachine : Word;
begin
result := IMAGE_FILE_HEADER(GetRecordPtr^).Machine;
end;
procedure __IMAGE_FILE_HEADER__Wrapper.setNumberOfSections(const val : Word);
begin
IMAGE_FILE_HEADER(GetRecordPtr^).NumberOfSections := val;
end;
function __IMAGE_FILE_HEADER__Wrapper.getNumberOfSections : Word;
begin
result := IMAGE_FILE_HEADER(GetRecordPtr^).NumberOfSections;
end;
procedure __IMAGE_FILE_HEADER__Wrapper.setTimeDateStamp(const val : DWORD);
begin
IMAGE_FILE_HEADER(GetRecordPtr^).TimeDateStamp := val;
end;
function __IMAGE_FILE_HEADER__Wrapper.getTimeDateStamp : DWORD;
begin
result := IMAGE_FILE_HEADER(GetRecordPtr^).TimeDateStamp;
end;
procedure __IMAGE_FILE_HEADER__Wrapper.setPointerToSymbolTable(const val : DWORD);
begin
IMAGE_FILE_HEADER(GetRecordPtr^).PointerToSymbolTable := val;
end;
function __IMAGE_FILE_HEADER__Wrapper.getPointerToSymbolTable : DWORD;
begin
result := IMAGE_FILE_HEADER(GetRecordPtr^).PointerToSymbolTable;
end;
procedure __IMAGE_FILE_HEADER__Wrapper.setNumberOfSymbols(const val : DWORD);
begin
IMAGE_FILE_HEADER(GetRecordPtr^).NumberOfSymbols := val;
end;
function __IMAGE_FILE_HEADER__Wrapper.getNumberOfSymbols : DWORD;
begin
result := IMAGE_FILE_HEADER(GetRecordPtr^).NumberOfSymbols;
end;
procedure __IMAGE_FILE_HEADER__Wrapper.setSizeOfOptionalHeader(const val : Word);
begin
IMAGE_FILE_HEADER(GetRecordPtr^).SizeOfOptionalHeader := val;
end;
function __IMAGE_FILE_HEADER__Wrapper.getSizeOfOptionalHeader : Word;
begin
result := IMAGE_FILE_HEADER(GetRecordPtr^).SizeOfOptionalHeader;
end;
procedure __IMAGE_FILE_HEADER__Wrapper.setCharacteristics(const val : Word);
begin
IMAGE_FILE_HEADER(GetRecordPtr^).Characteristics := val;
end;
function __IMAGE_FILE_HEADER__Wrapper.getCharacteristics : Word;
begin
result := IMAGE_FILE_HEADER(GetRecordPtr^).Characteristics;
end;
function __IMAGE_NT_HEADERS__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_NT_HEADERS__Wrapper.setSignature(const val : DWORD);
begin
IMAGE_NT_HEADERS(GetRecordPtr^).Signature := val;
end;
function __IMAGE_NT_HEADERS__Wrapper.getSignature : DWORD;
begin
result := IMAGE_NT_HEADERS(GetRecordPtr^).Signature;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMagic(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).Magic := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMagic : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).Magic;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMajorLinkerVersion(const val : Byte);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MajorLinkerVersion := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMajorLinkerVersion : Byte;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MajorLinkerVersion;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMinorLinkerVersion(const val : Byte);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MinorLinkerVersion := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMinorLinkerVersion : Byte;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MinorLinkerVersion;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfCode(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfCode := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfCode : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfCode;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfInitializedData(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfInitializedData := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfInitializedData : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfInitializedData;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfUninitializedData(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfUninitializedData := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfUninitializedData : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfUninitializedData;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setAddressOfEntryPoint(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).AddressOfEntryPoint := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getAddressOfEntryPoint : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).AddressOfEntryPoint;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setBaseOfCode(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).BaseOfCode := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getBaseOfCode : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).BaseOfCode;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setBaseOfData(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).BaseOfData := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getBaseOfData : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).BaseOfData;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setImageBase(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).ImageBase := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getImageBase : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).ImageBase;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSectionAlignment(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SectionAlignment := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSectionAlignment : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SectionAlignment;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setFileAlignment(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).FileAlignment := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getFileAlignment : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).FileAlignment;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMajorOperatingSystemVersion(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MajorOperatingSystemVersion := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMajorOperatingSystemVersion : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MajorOperatingSystemVersion;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMinorOperatingSystemVersion(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MinorOperatingSystemVersion := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMinorOperatingSystemVersion : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MinorOperatingSystemVersion;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMajorImageVersion(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MajorImageVersion := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMajorImageVersion : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MajorImageVersion;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMinorImageVersion(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MinorImageVersion := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMinorImageVersion : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MinorImageVersion;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMajorSubsystemVersion(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MajorSubsystemVersion := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMajorSubsystemVersion : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MajorSubsystemVersion;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setMinorSubsystemVersion(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MinorSubsystemVersion := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getMinorSubsystemVersion : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).MinorSubsystemVersion;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setReserved1(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).Reserved1 := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getReserved1 : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).Reserved1;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfImage(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfImage := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfImage : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfImage;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfHeaders(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfHeaders := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfHeaders : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfHeaders;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setCheckSum(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).CheckSum := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getCheckSum : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).CheckSum;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSubsystem(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).Subsystem := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSubsystem : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).Subsystem;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setDllCharacteristics(const val : Word);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).DllCharacteristics := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getDllCharacteristics : Word;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).DllCharacteristics;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfStackReserve(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfStackReserve := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfStackReserve : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfStackReserve;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfStackCommit(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfStackCommit := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfStackCommit : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfStackCommit;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfHeapReserve(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfHeapReserve := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfHeapReserve : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfHeapReserve;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setSizeOfHeapCommit(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfHeapCommit := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getSizeOfHeapCommit : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).SizeOfHeapCommit;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setLoaderFlags(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).LoaderFlags := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getLoaderFlags : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).LoaderFlags;
end;
procedure __IMAGE_OPTIONAL_HEADER__Wrapper.setNumberOfRvaAndSizes(const val : DWORD);
begin
IMAGE_OPTIONAL_HEADER(GetRecordPtr^).NumberOfRvaAndSizes := val;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper.getNumberOfRvaAndSizes : DWORD;
begin
result := IMAGE_OPTIONAL_HEADER(GetRecordPtr^).NumberOfRvaAndSizes;
end;
function __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.setOffsetToData(const val : DWORD);
begin
IMAGE_RESOURCE_DATA_ENTRY(GetRecordPtr^).OffsetToData := val;
end;
function __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.getOffsetToData : DWORD;
begin
result := IMAGE_RESOURCE_DATA_ENTRY(GetRecordPtr^).OffsetToData;
end;
procedure __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.setSize(const val : DWORD);
begin
IMAGE_RESOURCE_DATA_ENTRY(GetRecordPtr^).Size := val;
end;
function __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.getSize : DWORD;
begin
result := IMAGE_RESOURCE_DATA_ENTRY(GetRecordPtr^).Size;
end;
procedure __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.setCodePage(const val : DWORD);
begin
IMAGE_RESOURCE_DATA_ENTRY(GetRecordPtr^).CodePage := val;
end;
function __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.getCodePage : DWORD;
begin
result := IMAGE_RESOURCE_DATA_ENTRY(GetRecordPtr^).CodePage;
end;
procedure __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.setReserved(const val : DWORD);
begin
IMAGE_RESOURCE_DATA_ENTRY(GetRecordPtr^).Reserved := val;
end;
function __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.getReserved : DWORD;
begin
result := IMAGE_RESOURCE_DATA_ENTRY(GetRecordPtr^).Reserved;
end;
function __IMAGE_RESOURCE_DIR_STRING_U__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_RESOURCE_DIR_STRING_U__Wrapper.setLength(const val : Word);
begin
IMAGE_RESOURCE_DIR_STRING_U(GetRecordPtr^).Length := val;
end;
function __IMAGE_RESOURCE_DIR_STRING_U__Wrapper.getLength : Word;
begin
result := IMAGE_RESOURCE_DIR_STRING_U(GetRecordPtr^).Length;
end;
function __IMAGE_RESOURCE_DIRECTORY__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_RESOURCE_DIRECTORY__Wrapper.setCharacteristics(const val : DWORD);
begin
IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).Characteristics := val;
end;
function __IMAGE_RESOURCE_DIRECTORY__Wrapper.getCharacteristics : DWORD;
begin
result := IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).Characteristics;
end;
procedure __IMAGE_RESOURCE_DIRECTORY__Wrapper.setTimeDateStamp(const val : DWORD);
begin
IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).TimeDateStamp := val;
end;
function __IMAGE_RESOURCE_DIRECTORY__Wrapper.getTimeDateStamp : DWORD;
begin
result := IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).TimeDateStamp;
end;
procedure __IMAGE_RESOURCE_DIRECTORY__Wrapper.setMajorVersion(const val : Word);
begin
IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).MajorVersion := val;
end;
function __IMAGE_RESOURCE_DIRECTORY__Wrapper.getMajorVersion : Word;
begin
result := IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).MajorVersion;
end;
procedure __IMAGE_RESOURCE_DIRECTORY__Wrapper.setMinorVersion(const val : Word);
begin
IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).MinorVersion := val;
end;
function __IMAGE_RESOURCE_DIRECTORY__Wrapper.getMinorVersion : Word;
begin
result := IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).MinorVersion;
end;
procedure __IMAGE_RESOURCE_DIRECTORY__Wrapper.setNumberOfNamedEntries(const val : Word);
begin
IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).NumberOfNamedEntries := val;
end;
function __IMAGE_RESOURCE_DIRECTORY__Wrapper.getNumberOfNamedEntries : Word;
begin
result := IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).NumberOfNamedEntries;
end;
procedure __IMAGE_RESOURCE_DIRECTORY__Wrapper.setNumberOfIdEntries(const val : Word);
begin
IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).NumberOfIdEntries := val;
end;
function __IMAGE_RESOURCE_DIRECTORY__Wrapper.getNumberOfIdEntries : Word;
begin
result := IMAGE_RESOURCE_DIRECTORY(GetRecordPtr^).NumberOfIdEntries;
end;
function __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper.setName(const val : DWORD);
begin
IMAGE_RESOURCE_DIRECTORY_ENTRY(GetRecordPtr^).Name := val;
end;
function __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper.getName : DWORD;
begin
result := IMAGE_RESOURCE_DIRECTORY_ENTRY(GetRecordPtr^).Name;
end;
procedure __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper.setOffsetToData(const val : DWORD);
begin
IMAGE_RESOURCE_DIRECTORY_ENTRY(GetRecordPtr^).OffsetToData := val;
end;
function __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper.getOffsetToData : DWORD;
begin
result := IMAGE_RESOURCE_DIRECTORY_ENTRY(GetRecordPtr^).OffsetToData;
end;
function __IMAGE_SECTION_HEADER__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setPhysicalAddress(const val : DWORD);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).PhysicalAddress := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getPhysicalAddress : DWORD;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).PhysicalAddress;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setVirtualAddress(const val : DWORD);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).VirtualAddress := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getVirtualAddress : DWORD;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).VirtualAddress;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setSizeOfRawData(const val : DWORD);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).SizeOfRawData := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getSizeOfRawData : DWORD;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).SizeOfRawData;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setPointerToRawData(const val : DWORD);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).PointerToRawData := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getPointerToRawData : DWORD;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).PointerToRawData;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setPointerToRelocations(const val : DWORD);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).PointerToRelocations := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getPointerToRelocations : DWORD;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).PointerToRelocations;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setPointerToLinenumbers(const val : DWORD);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).PointerToLinenumbers := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getPointerToLinenumbers : DWORD;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).PointerToLinenumbers;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setNumberOfRelocations(const val : Word);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).NumberOfRelocations := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getNumberOfRelocations : Word;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).NumberOfRelocations;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setNumberOfLinenumbers(const val : Word);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).NumberOfLinenumbers := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getNumberOfLinenumbers : Word;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).NumberOfLinenumbers;
end;
procedure __IMAGE_SECTION_HEADER__Wrapper.setCharacteristics(const val : DWORD);
begin
IMAGE_SECTION_HEADER(GetRecordPtr^).Characteristics := val;
end;
function __IMAGE_SECTION_HEADER__Wrapper.getCharacteristics : DWORD;
begin
result := IMAGE_SECTION_HEADER(GetRecordPtr^).Characteristics;
end;
function __TCursorResInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TCursorResInfo__Wrapper.setwWidth(const val : Word);
begin
TCursorResInfo(GetRecordPtr^).wWidth := val;
end;
function __TCursorResInfo__Wrapper.getwWidth : Word;
begin
result := TCursorResInfo(GetRecordPtr^).wWidth;
end;
procedure __TCursorResInfo__Wrapper.setwHeight(const val : Word);
begin
TCursorResInfo(GetRecordPtr^).wHeight := val;
end;
function __TCursorResInfo__Wrapper.getwHeight : Word;
begin
result := TCursorResInfo(GetRecordPtr^).wHeight;
end;
procedure __TCursorResInfo__Wrapper.setwPlanes(const val : Word);
begin
TCursorResInfo(GetRecordPtr^).wPlanes := val;
end;
function __TCursorResInfo__Wrapper.getwPlanes : Word;
begin
result := TCursorResInfo(GetRecordPtr^).wPlanes;
end;
procedure __TCursorResInfo__Wrapper.setwBitCount(const val : Word);
begin
TCursorResInfo(GetRecordPtr^).wBitCount := val;
end;
function __TCursorResInfo__Wrapper.getwBitCount : Word;
begin
result := TCursorResInfo(GetRecordPtr^).wBitCount;
end;
procedure __TCursorResInfo__Wrapper.setlBytesInRes(const val : DWORD);
begin
TCursorResInfo(GetRecordPtr^).lBytesInRes := val;
end;
function __TCursorResInfo__Wrapper.getlBytesInRes : DWORD;
begin
result := TCursorResInfo(GetRecordPtr^).lBytesInRes;
end;
procedure __TCursorResInfo__Wrapper.setwNameOrdinal(const val : Word);
begin
TCursorResInfo(GetRecordPtr^).wNameOrdinal := val;
end;
function __TCursorResInfo__Wrapper.getwNameOrdinal : Word;
begin
result := TCursorResInfo(GetRecordPtr^).wNameOrdinal;
end;
function __TDesignResFormData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TDesignResFormData__Wrapper.setResName(const val : AnsiString);
begin
TDesignResFormData(GetRecordPtr^).ResName := val;
end;
function __TDesignResFormData__Wrapper.getResName : AnsiString;
begin
result := TDesignResFormData(GetRecordPtr^).ResName;
end;
function __TIconHeader__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TIconHeader__Wrapper.setwReserved(const val : Word);
begin
TIconHeader(GetRecordPtr^).wReserved := val;
end;
function __TIconHeader__Wrapper.getwReserved : Word;
begin
result := TIconHeader(GetRecordPtr^).wReserved;
end;
procedure __TIconHeader__Wrapper.setwType(const val : Word);
begin
TIconHeader(GetRecordPtr^).wType := val;
end;
function __TIconHeader__Wrapper.getwType : Word;
begin
result := TIconHeader(GetRecordPtr^).wType;
end;
procedure __TIconHeader__Wrapper.setwCount(const val : Word);
begin
TIconHeader(GetRecordPtr^).wCount := val;
end;
function __TIconHeader__Wrapper.getwCount : Word;
begin
result := TIconHeader(GetRecordPtr^).wCount;
end;
function __TIconResInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TIconResInfo__Wrapper.setbWidth(const val : Byte);
begin
TIconResInfo(GetRecordPtr^).bWidth := val;
end;
function __TIconResInfo__Wrapper.getbWidth : Byte;
begin
result := TIconResInfo(GetRecordPtr^).bWidth;
end;
procedure __TIconResInfo__Wrapper.setbHeight(const val : Byte);
begin
TIconResInfo(GetRecordPtr^).bHeight := val;
end;
function __TIconResInfo__Wrapper.getbHeight : Byte;
begin
result := TIconResInfo(GetRecordPtr^).bHeight;
end;
procedure __TIconResInfo__Wrapper.setbColorCount(const val : Byte);
begin
TIconResInfo(GetRecordPtr^).bColorCount := val;
end;
function __TIconResInfo__Wrapper.getbColorCount : Byte;
begin
result := TIconResInfo(GetRecordPtr^).bColorCount;
end;
procedure __TIconResInfo__Wrapper.setbReserved(const val : Byte);
begin
TIconResInfo(GetRecordPtr^).bReserved := val;
end;
function __TIconResInfo__Wrapper.getbReserved : Byte;
begin
result := TIconResInfo(GetRecordPtr^).bReserved;
end;
procedure __TIconResInfo__Wrapper.setwPlanes(const val : Word);
begin
TIconResInfo(GetRecordPtr^).wPlanes := val;
end;
function __TIconResInfo__Wrapper.getwPlanes : Word;
begin
result := TIconResInfo(GetRecordPtr^).wPlanes;
end;
procedure __TIconResInfo__Wrapper.setwBitCount(const val : Word);
begin
TIconResInfo(GetRecordPtr^).wBitCount := val;
end;
function __TIconResInfo__Wrapper.getwBitCount : Word;
begin
result := TIconResInfo(GetRecordPtr^).wBitCount;
end;
procedure __TIconResInfo__Wrapper.setlBytesInRes(const val : DWORD);
begin
TIconResInfo(GetRecordPtr^).lBytesInRes := val;
end;
function __TIconResInfo__Wrapper.getlBytesInRes : DWORD;
begin
result := TIconResInfo(GetRecordPtr^).lBytesInRes;
end;
procedure __TIconResInfo__Wrapper.setwNameOrdinal(const val : Word);
begin
TIconResInfo(GetRecordPtr^).wNameOrdinal := val;
end;
function __TIconResInfo__Wrapper.getwNameOrdinal : Word;
begin
result := TIconResInfo(GetRecordPtr^).wNameOrdinal;
end;
function __TMethodDef__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMethodDef__Wrapper.setSize(const val : Word);
begin
TMethodDef(GetRecordPtr^).Size := val;
end;
function __TMethodDef__Wrapper.getSize : Word;
begin
result := TMethodDef(GetRecordPtr^).Size;
end;
function __TMethodTable__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMethodTable__Wrapper.setSize(const val : Word);
begin
TMethodTable(GetRecordPtr^).Size := val;
end;
function __TMethodTable__Wrapper.getSize : Word;
begin
result := TMethodTable(GetRecordPtr^).Size;
end;
function __TScriptErrorInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TScriptErrorInfo__Wrapper.setFilerID(const val : TFilerID);
begin
TScriptErrorInfo(GetRecordPtr^).FilerID := val;
end;
function __TScriptErrorInfo__Wrapper.getFilerID : TFilerID;
begin
result := TScriptErrorInfo(GetRecordPtr^).FilerID;
end;
procedure __TScriptErrorInfo__Wrapper.setCharPos(const val : Integer);
begin
TScriptErrorInfo(GetRecordPtr^).CharPos := val;
end;
function __TScriptErrorInfo__Wrapper.getCharPos : Integer;
begin
result := TScriptErrorInfo(GetRecordPtr^).CharPos;
end;
procedure __TScriptErrorInfo__Wrapper.setLinePos(const val : Integer);
begin
TScriptErrorInfo(GetRecordPtr^).LinePos := val;
end;
function __TScriptErrorInfo__Wrapper.getLinePos : Integer;
begin
result := TScriptErrorInfo(GetRecordPtr^).LinePos;
end;
procedure __TScriptErrorInfo__Wrapper.setExcepInfo(const val : TExcepInfo);
begin
TScriptErrorInfo(GetRecordPtr^).ExcepInfo := val;
end;
function __TScriptErrorInfo__Wrapper.getExcepInfo : TExcepInfo;
begin
result := TScriptErrorInfo(GetRecordPtr^).ExcepInfo;
end;
function __TVerbData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TVerbData__Wrapper.setName(const val : AnsiString);
begin
TVerbData(GetRecordPtr^).Name := val;
end;
function __TVerbData__Wrapper.getName : AnsiString;
begin
result := TVerbData(GetRecordPtr^).Name;
end;
function __TWMScriptError__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMScriptError__Wrapper.setMsg(const val : Cardinal);
begin
TWMScriptError(GetRecordPtr^).Msg := val;
end;
function __TWMScriptError__Wrapper.getMsg : Cardinal;
begin
result := TWMScriptError(GetRecordPtr^).Msg;
end;
procedure __TWMScriptError__Wrapper.setLParam(const val : Longint);
begin
TWMScriptError(GetRecordPtr^).LParam := val;
end;
function __TWMScriptError__Wrapper.getLParam : Longint;
begin
result := TWMScriptError(GetRecordPtr^).LParam;
end;
procedure __TWMScriptError__Wrapper.setResult(const val : Longint);
begin
TWMScriptError(GetRecordPtr^).Result := val;
end;
function __TWMScriptError__Wrapper.getResult : Longint;
begin
result := TWMScriptError(GetRecordPtr^).Result;
end;
function _IMAGE_DATA_DIRECTORY_ : IDispatch;
begin
  result := __IMAGE_DATA_DIRECTORY__Wrapper.Create;
end;
function _IMAGE_DOS_HEADER_ : IDispatch;
begin
  result := __IMAGE_DOS_HEADER__Wrapper.Create;
end;
function _IMAGE_FILE_HEADER_ : IDispatch;
begin
  result := __IMAGE_FILE_HEADER__Wrapper.Create;
end;
function _IMAGE_NT_HEADERS_ : IDispatch;
begin
  result := __IMAGE_NT_HEADERS__Wrapper.Create;
end;
function _IMAGE_OPTIONAL_HEADER_ : IDispatch;
begin
  result := __IMAGE_OPTIONAL_HEADER__Wrapper.Create;
end;
function _IMAGE_RESOURCE_DATA_ENTRY_ : IDispatch;
begin
  result := __IMAGE_RESOURCE_DATA_ENTRY__Wrapper.Create;
end;
function _IMAGE_RESOURCE_DIR_STRING_U_ : IDispatch;
begin
  result := __IMAGE_RESOURCE_DIR_STRING_U__Wrapper.Create;
end;
function _IMAGE_RESOURCE_DIRECTORY_ : IDispatch;
begin
  result := __IMAGE_RESOURCE_DIRECTORY__Wrapper.Create;
end;
function _IMAGE_RESOURCE_DIRECTORY_ENTRY_ : IDispatch;
begin
  result := __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper.Create;
end;
function _IMAGE_SECTION_HEADER_ : IDispatch;
begin
  result := __IMAGE_SECTION_HEADER__Wrapper.Create;
end;
function _TCursorResInfo_ : IDispatch;
begin
  result := __TCursorResInfo__Wrapper.Create;
end;
function _TDesignResFormData_ : IDispatch;
begin
  result := __TDesignResFormData__Wrapper.Create;
end;
function _TIconHeader_ : IDispatch;
begin
  result := __TIconHeader__Wrapper.Create;
end;
function _TIconResInfo_ : IDispatch;
begin
  result := __TIconResInfo__Wrapper.Create;
end;
function _TMethodDef_ : IDispatch;
begin
  result := __TMethodDef__Wrapper.Create;
end;
function _TMethodTable_ : IDispatch;
begin
  result := __TMethodTable__Wrapper.Create;
end;
function _TScriptErrorInfo_ : IDispatch;
begin
  result := __TScriptErrorInfo__Wrapper.Create;
end;
function _TVerbData_ : IDispatch;
begin
  result := __TVerbData__Wrapper.Create;
end;
function _TWMScriptError_ : IDispatch;
begin
  result := __TWMScriptError__Wrapper.Create;
end;
function __TRect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TRect__Wrapper.setLeft(const val : Integer);
begin
TRect(GetRecordPtr^).Left := val;
end;
function __TRect__Wrapper.getLeft : Integer;
begin
result := TRect(GetRecordPtr^).Left;
end;
procedure __TRect__Wrapper.setTop(const val : Integer);
begin
TRect(GetRecordPtr^).Top := val;
end;
function __TRect__Wrapper.getTop : Integer;
begin
result := TRect(GetRecordPtr^).Top;
end;
procedure __TRect__Wrapper.setRight(const val : Integer);
begin
TRect(GetRecordPtr^).Right := val;
end;
function __TRect__Wrapper.getRight : Integer;
begin
result := TRect(GetRecordPtr^).Right;
end;
procedure __TRect__Wrapper.setBottom(const val : Integer);
begin
TRect(GetRecordPtr^).Bottom := val;
end;
function __TRect__Wrapper.getBottom : Integer;
begin
result := TRect(GetRecordPtr^).Bottom;
end;
function __TPoint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TPoint__Wrapper.setx(const val : Longint);
begin
TPoint(GetRecordPtr^).x := val;
end;
function __TPoint__Wrapper.getx : Longint;
begin
result := TPoint(GetRecordPtr^).x;
end;
procedure __TPoint__Wrapper.sety(const val : Longint);
begin
TPoint(GetRecordPtr^).y := val;
end;
function __TPoint__Wrapper.gety : Longint;
begin
result := TPoint(GetRecordPtr^).y;
end;
function __TGUID__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TGUID__Wrapper.setD1(const val : Integer);
begin
TGUID(GetRecordPtr^).D1 := val;
end;
function __TGUID__Wrapper.getD1 : Integer;
begin
result := TGUID(GetRecordPtr^).D1;
end;
procedure __TGUID__Wrapper.setD2(const val : Word);
begin
TGUID(GetRecordPtr^).D2 := val;
end;
function __TGUID__Wrapper.getD2 : Word;
begin
result := TGUID(GetRecordPtr^).D2;
end;
procedure __TGUID__Wrapper.setD3(const val : Word);
begin
TGUID(GetRecordPtr^).D3 := val;
end;
function __TGUID__Wrapper.getD3 : Word;
begin
result := TGUID(GetRecordPtr^).D3;
end;
function ____RectToStr__Wrapper(const p0 : IDispatch): String;
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := RectToStr(__p0^);
end;

function ____PointToStr__Wrapper(const p0 : IDispatch): String;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := PointToStr(__p0^);
end;

function ____RectWidth__Wrapper(const p0 : IDispatch): Integer;
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := RectWidth(__p0^);
end;

function ____RectHeight__Wrapper(const p0 : IDispatch): Integer;
var
__p0 : ^TRect;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := RectHeight(__p0^);
end;

procedure ____RegisterVerbArray__Wrapper(const p0 : IDispatch);
var
__p0 : ^TVerbData;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
RegisterVerbArray(__p0^);
end;

function ____CreateNewGUID__Wrapper: IDispatch;
var
__result : TGUID;
__wrapper : __TGUID__Wrapper;
begin
__result := CreateNewGUID;
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____GetTypeLibName__Wrapper(const p0 : IDispatch): String;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := GetTypeLibName(__p0^);
end;

procedure ____DCClearPointStruct__Wrapper(const p0 : IDispatch);
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
DCClearPointStruct(__p0^);
end;

function ____DCIsPointStructClear__Wrapper(const p0 : IDispatch): Boolean;
var
__p0 : ^TPoint;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := DCIsPointStructClear(__p0^);
end;

function ____GetTransparentColor__Wrapper(p0 : THandle;
const p1 : IDispatch): Longint;
var
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
result := GetTransparentColor(p0,__p1^);
end;

procedure ____TransparentBitBltEx__Wrapper(p0 : THandle;
p1 : THandle;
const p2 : IDispatch;
const p3 : IDispatch;
p4 : Longint);
var
__p2 : ^TRect;
__i2 : IDispatch;
__p3 : ^TRect;
__i3 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
if p3 = nil then exit;
__p3 := (p3 as IDCRecordWrapper).GetRecordPtr;
TransparentBitBltEx(p0,p1,__p2^,__p3^,p4);
end;

procedure ____TransparentBitBlt__Wrapper(p0 : THandle;
p1 : THandle;
const p2 : IDispatch;
p3 : Longint;
p4 : Integer;
p5 : Integer);
var
__p2 : ^TRect;
__i2 : IDispatch;
begin
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
TransparentBitBlt(p0,p1,__p2^,p3,p4,p5);
end;

procedure ____CorrectRectByRect__Wrapper(const p0 : IDispatch;
const p1 : IDispatch);
var
__p0 : ^TRect;
__i0 : IDispatch;
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
CorrectRectByRect(__p0^,__p1^);
end;

procedure ____DrawTextWithFill__Wrapper(p0 : TCanvas;
const p1 : String;
p2 : Integer;
const p3 : IDispatch);
var
__p3 : ^TRect;
__i3 : IDispatch;
begin
if p3 = nil then exit;
__p3 := (p3 as IDCRecordWrapper).GetRecordPtr;
DrawTextWithFill(p0,p1,p2,__p3^);
end;

procedure ____FillRectEx__Wrapper(p0 : TCanvas;
const p1 : IDispatch;
const p2 : IDispatch);
var
__p1 : ^TRect;
__i1 : IDispatch;
__p2 : ^TRect;
__i2 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
if p2 = nil then exit;
__p2 := (p2 as IDCRecordWrapper).GetRecordPtr;
FillRectEx(p0,__p1^,__p2^);
end;

function ____AlignRectByRect__Wrapper(const p0 : IDispatch;
const p1 : IDispatch;
p2 : THorzAlignment;
p3 : TVertAlignment;
p4 : Integer;
p5 : Integer): IDispatch;
var
__result : TRect;
__wrapper : __TRect__Wrapper;
__p0 : ^TRect;
__i0 : IDispatch;
__p1 : ^TRect;
__i1 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
__result := AlignRectByRect(__p0^,__p1^,p2,p3,p4,p5);
__wrapper := __TRect__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____GetComponentTopLeft__Wrapper(p0 : TComponent): IDispatch;
var
__result : TPoint;
__wrapper : __TPoint__Wrapper;
begin
__result := GetComponentTopLeft(p0);
__wrapper := __TPoint__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

procedure ____SetComponentTopLeft__Wrapper(p0 : TComponent;
const p1 : IDispatch);
var
__p1 : ^TPoint;
__i1 : IDispatch;
begin
if p1 = nil then exit;
__p1 := (p1 as IDCRecordWrapper).GetRecordPtr;
SetComponentTopLeft(p0,__p1^);
end;

function ____StringToGUID__Wrapper(const p0 : String): IDispatch;
var
__result : TGUID;
__wrapper : __TGUID__Wrapper;
begin
__result := StringToGUID(p0);
__wrapper := __TGUID__Wrapper.Create;
__wrapper.fR := __result;
result := IDispatch(__wrapper);
end;

function ____GUIDToString__Wrapper(const p0 : IDispatch): String;
var
__p0 : ^TGUID;
__i0 : IDispatch;
begin
if p0 = nil then exit;
__p0 := (p0 as IDCRecordWrapper).GetRecordPtr;
result := GUIDToString(__p0^);
end;


type __IMAGE_DATA_DIRECTORY__Wrapper__ = class(__IMAGE_DATA_DIRECTORY__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_DATA_DIRECTORY__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_DATA_DIRECTORYToVariant(var R : IMAGE_DATA_DIRECTORY) : OleVariant;
var
__rw : __IMAGE_DATA_DIRECTORY__Wrapper__;
begin
__rw := __IMAGE_DATA_DIRECTORY__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_DATA_DIRECTORY(const V : OleVariant) : IMAGE_DATA_DIRECTORY;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_DATA_DIRECTORY((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_DOS_HEADER__Wrapper__ = class(__IMAGE_DOS_HEADER__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_DOS_HEADER__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_DOS_HEADERToVariant(var R : IMAGE_DOS_HEADER) : OleVariant;
var
__rw : __IMAGE_DOS_HEADER__Wrapper__;
begin
__rw := __IMAGE_DOS_HEADER__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_DOS_HEADER(const V : OleVariant) : IMAGE_DOS_HEADER;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_DOS_HEADER((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_FILE_HEADER__Wrapper__ = class(__IMAGE_FILE_HEADER__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_FILE_HEADER__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_FILE_HEADERToVariant(var R : IMAGE_FILE_HEADER) : OleVariant;
var
__rw : __IMAGE_FILE_HEADER__Wrapper__;
begin
__rw := __IMAGE_FILE_HEADER__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_FILE_HEADER(const V : OleVariant) : IMAGE_FILE_HEADER;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_FILE_HEADER((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_NT_HEADERS__Wrapper__ = class(__IMAGE_NT_HEADERS__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_NT_HEADERS__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_NT_HEADERSToVariant(var R : IMAGE_NT_HEADERS) : OleVariant;
var
__rw : __IMAGE_NT_HEADERS__Wrapper__;
begin
__rw := __IMAGE_NT_HEADERS__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_NT_HEADERS(const V : OleVariant) : IMAGE_NT_HEADERS;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_NT_HEADERS((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_OPTIONAL_HEADER__Wrapper__ = class(__IMAGE_OPTIONAL_HEADER__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_OPTIONAL_HEADER__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_OPTIONAL_HEADERToVariant(var R : IMAGE_OPTIONAL_HEADER) : OleVariant;
var
__rw : __IMAGE_OPTIONAL_HEADER__Wrapper__;
begin
__rw := __IMAGE_OPTIONAL_HEADER__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_OPTIONAL_HEADER(const V : OleVariant) : IMAGE_OPTIONAL_HEADER;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_OPTIONAL_HEADER((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_RESOURCE_DATA_ENTRY__Wrapper__ = class(__IMAGE_RESOURCE_DATA_ENTRY__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_RESOURCE_DATA_ENTRY__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_RESOURCE_DATA_ENTRYToVariant(var R : IMAGE_RESOURCE_DATA_ENTRY) : OleVariant;
var
__rw : __IMAGE_RESOURCE_DATA_ENTRY__Wrapper__;
begin
__rw := __IMAGE_RESOURCE_DATA_ENTRY__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_RESOURCE_DATA_ENTRY(const V : OleVariant) : IMAGE_RESOURCE_DATA_ENTRY;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_RESOURCE_DATA_ENTRY((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_RESOURCE_DIR_STRING_U__Wrapper__ = class(__IMAGE_RESOURCE_DIR_STRING_U__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_RESOURCE_DIR_STRING_U__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_RESOURCE_DIR_STRING_UToVariant(var R : IMAGE_RESOURCE_DIR_STRING_U) : OleVariant;
var
__rw : __IMAGE_RESOURCE_DIR_STRING_U__Wrapper__;
begin
__rw := __IMAGE_RESOURCE_DIR_STRING_U__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_RESOURCE_DIR_STRING_U(const V : OleVariant) : IMAGE_RESOURCE_DIR_STRING_U;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_RESOURCE_DIR_STRING_U((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_RESOURCE_DIRECTORY__Wrapper__ = class(__IMAGE_RESOURCE_DIRECTORY__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_RESOURCE_DIRECTORY__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_RESOURCE_DIRECTORYToVariant(var R : IMAGE_RESOURCE_DIRECTORY) : OleVariant;
var
__rw : __IMAGE_RESOURCE_DIRECTORY__Wrapper__;
begin
__rw := __IMAGE_RESOURCE_DIRECTORY__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_RESOURCE_DIRECTORY(const V : OleVariant) : IMAGE_RESOURCE_DIRECTORY;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_RESOURCE_DIRECTORY((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper__ = class(__IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_RESOURCE_DIRECTORY_ENTRYToVariant(var R : IMAGE_RESOURCE_DIRECTORY_ENTRY) : OleVariant;
var
__rw : __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper__;
begin
__rw := __IMAGE_RESOURCE_DIRECTORY_ENTRY__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_RESOURCE_DIRECTORY_ENTRY(const V : OleVariant) : IMAGE_RESOURCE_DIRECTORY_ENTRY;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_RESOURCE_DIRECTORY_ENTRY((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __IMAGE_SECTION_HEADER__Wrapper__ = class(__IMAGE_SECTION_HEADER__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __IMAGE_SECTION_HEADER__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertIMAGE_SECTION_HEADERToVariant(var R : IMAGE_SECTION_HEADER) : OleVariant;
var
__rw : __IMAGE_SECTION_HEADER__Wrapper__;
begin
__rw := __IMAGE_SECTION_HEADER__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToIMAGE_SECTION_HEADER(const V : OleVariant) : IMAGE_SECTION_HEADER;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := IMAGE_SECTION_HEADER((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TCursorResInfo__Wrapper__ = class(__TCursorResInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TCursorResInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTCursorResInfoToVariant(var R : TCursorResInfo) : OleVariant;
var
__rw : __TCursorResInfo__Wrapper__;
begin
__rw := __TCursorResInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTCursorResInfo(const V : OleVariant) : TCursorResInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TCursorResInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TDesignResFormData__Wrapper__ = class(__TDesignResFormData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TDesignResFormData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTDesignResFormDataToVariant(var R : TDesignResFormData) : OleVariant;
var
__rw : __TDesignResFormData__Wrapper__;
begin
__rw := __TDesignResFormData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTDesignResFormData(const V : OleVariant) : TDesignResFormData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TDesignResFormData((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TGUID__Wrapper__ = class(__TGUID__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TGUID__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTGUIDToVariant(var R : TGUID) : OleVariant;
var
__rw : __TGUID__Wrapper__;
begin
__rw := __TGUID__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTGUID(const V : OleVariant) : TGUID;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TGUID((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TIconHeader__Wrapper__ = class(__TIconHeader__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TIconHeader__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTIconHeaderToVariant(var R : TIconHeader) : OleVariant;
var
__rw : __TIconHeader__Wrapper__;
begin
__rw := __TIconHeader__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTIconHeader(const V : OleVariant) : TIconHeader;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TIconHeader((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TIconResInfo__Wrapper__ = class(__TIconResInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TIconResInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTIconResInfoToVariant(var R : TIconResInfo) : OleVariant;
var
__rw : __TIconResInfo__Wrapper__;
begin
__rw := __TIconResInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTIconResInfo(const V : OleVariant) : TIconResInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TIconResInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMethodDef__Wrapper__ = class(__TMethodDef__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMethodDef__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMethodDefToVariant(var R : TMethodDef) : OleVariant;
var
__rw : __TMethodDef__Wrapper__;
begin
__rw := __TMethodDef__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMethodDef(const V : OleVariant) : TMethodDef;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMethodDef((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMethodTable__Wrapper__ = class(__TMethodTable__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMethodTable__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMethodTableToVariant(var R : TMethodTable) : OleVariant;
var
__rw : __TMethodTable__Wrapper__;
begin
__rw := __TMethodTable__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMethodTable(const V : OleVariant) : TMethodTable;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMethodTable((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TPoint__Wrapper__ = class(__TPoint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TPoint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTPointToVariant(var R : TPoint) : OleVariant;
var
__rw : __TPoint__Wrapper__;
begin
__rw := __TPoint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTPoint(const V : OleVariant) : TPoint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TPoint((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TRect__Wrapper__ = class(__TRect__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TRect__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTRectToVariant(var R : TRect) : OleVariant;
var
__rw : __TRect__Wrapper__;
begin
__rw := __TRect__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTRect(const V : OleVariant) : TRect;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TRect((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TScriptErrorInfo__Wrapper__ = class(__TScriptErrorInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TScriptErrorInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTScriptErrorInfoToVariant(var R : TScriptErrorInfo) : OleVariant;
var
__rw : __TScriptErrorInfo__Wrapper__;
begin
__rw := __TScriptErrorInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTScriptErrorInfo(const V : OleVariant) : TScriptErrorInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TScriptErrorInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TVerbData__Wrapper__ = class(__TVerbData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TVerbData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTVerbDataToVariant(var R : TVerbData) : OleVariant;
var
__rw : __TVerbData__Wrapper__;
begin
__rw := __TVerbData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTVerbData(const V : OleVariant) : TVerbData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TVerbData((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMScriptError__Wrapper__ = class(__TWMScriptError__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMScriptError__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMScriptErrorToVariant(var R : TWMScriptError) : OleVariant;
var
__rw : __TWMScriptError__Wrapper__;
begin
__rw := __TWMScriptError__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMScriptError(const V : OleVariant) : TWMScriptError;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMScriptError((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
function __DC__GetTCodeDesigner__ModuleOwner(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCodeDesigner(Instance).ModuleOwner);
end;

procedure __DC__SetTCodeDesigner__ModuleOwner(Instance : TObject; Params : PVariantArgList);
begin
TCodeDesigner(Instance).ModuleOwner:=TComponent(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTCodeDesigner__Strings(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TCodeDesigner(Instance).Strings);
end;

procedure __DC__SetTCodeDesigner__Strings(Instance : TObject; Params : PVariantArgList);
begin
TCodeDesigner(Instance).Strings:=TStrings(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTDCPersistentList__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TDCPersistentList(Instance).Count;
end;

function __DC__GetTDCPersistentList__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TDCPersistentList(Instance).Items[OleVariant(Params^[0])]);
end;

function __DC__GetTEditSource__Value(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TEditSource(Instance).Value;
end;

procedure __DC__SetTEditSource__Value(Instance : TObject; Params : PVariantArgList);
begin
TEditSource(Instance).Value:=OleVariant(Params^[0]);
end;

function __DC__GetTFileSystem__CurrentDir(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TFileSystem(Instance).CurrentDir;
end;

procedure __DC__SetTFileSystem__CurrentDir(Instance : TObject; Params : PVariantArgList);
begin
TFileSystem(Instance).CurrentDir:=OleVariant(Params^[0]);
end;

function __DC__GetTListWrapper__Objects(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TListWrapper(Instance).Objects[OleVariant(Params^[0])]);
end;

function __DC__GetTListWrapper__Count(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TListWrapper(Instance).Count;
end;

function __DC__GetTObjectParamList__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TObjectParamList(Instance).Items[OleVariant(Params^[0])]);
end;

function __DC__GetTObjectParamListItem__ObjectPtr(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TObjectParamListItem(Instance).ObjectPtr);
end;

function __DC__GetTObjectParamListItem__Params(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TObjectParamListItem(Instance).Params[OleVariant(Params^[0])];
end;

procedure __DC__SetTObjectParamListItem__Params(Instance : TObject; Params : PVariantArgList);
begin
TObjectParamListItem(Instance).Params[OleVariant(Params^[1])]:=OleVariant(Params^[0]);
end;

function __DC__GetTOptionExt__Global(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOptionExt(Instance).Global;
end;

function __DC__GetTOptionExt__UpdateCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := TOptionExt(Instance).UpdateCount;
end;

function __DC__GetTPackagedCollection__Items(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TPackagedCollection(Instance).Items[OleVariant(Params^[0])]);
end;

procedure __DC__SetTPackagedCollection__Items(Instance : TObject; Params : PVariantArgList);
begin
TPackagedCollection(Instance).Items[OleVariant(Params^[1])]:=TCollectionItem(VarToObject(OleVariant(Params^[0])));
end;

function __DC__GetTSimpleParser__Notifiers(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := VarFromObject(TSimpleParser(Instance).Notifiers);
end;

procedure __RegisterProps;
begin
RegisterProperty(TCodeDesigner,'ModuleOwner',__DC__GetTCodeDesigner__ModuleOwner,__DC__SetTCodeDesigner__ModuleOwner);
RegisterProperty(TCodeDesigner,'Strings',__DC__GetTCodeDesigner__Strings,__DC__SetTCodeDesigner__Strings);
RegisterProperty(TDCPersistentList,'Count',__DC__GetTDCPersistentList__Count,nil);
RegisterIndexedProperty(TDCPersistentList,'Items',1,True,__DC__GetTDCPersistentList__Items,nil);
RegisterProperty(TEditSource,'Value',__DC__GetTEditSource__Value,__DC__SetTEditSource__Value);
RegisterProperty(TFileSystem,'CurrentDir',__DC__GetTFileSystem__CurrentDir,__DC__SetTFileSystem__CurrentDir);
RegisterIndexedProperty(TListWrapper,'Objects',1,False,__DC__GetTListWrapper__Objects,nil);
RegisterProperty(TListWrapper,'Count',__DC__GetTListWrapper__Count,nil);
RegisterIndexedProperty(TObjectParamList,'Items',1,True,__DC__GetTObjectParamList__Items,nil);
RegisterProperty(TObjectParamListItem,'ObjectPtr',__DC__GetTObjectParamListItem__ObjectPtr,nil);
RegisterIndexedProperty(TObjectParamListItem,'Params',1,False,__DC__GetTObjectParamListItem__Params,__DC__SetTObjectParamListItem__Params);
RegisterProperty(TOptionExt,'Global',__DC__GetTOptionExt__Global,nil);
RegisterProperty(TOptionExt,'UpdateCount',__DC__GetTOptionExt__UpdateCount,nil);
RegisterIndexedProperty(TPackagedCollection,'Items',1,True,__DC__GetTPackagedCollection__Items,__DC__SetTPackagedCollection__Items);
RegisterProperty(TSimpleParser,'Notifiers',__DC__GetTSimpleParser__Notifiers,nil);
end;

function __DC__Getdcsystem__DCLogFileShowGUID(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.DCLogFileShowGUID;
end;

procedure __DC__Setdcsystem__DCLogFileShowGUID(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.DCLogFileShowGUID:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__DCLogFileShowTime(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.DCLogFileShowTime;
end;

procedure __DC__Setdcsystem__DCLogFileShowTime(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.DCLogFileShowTime:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__DCLogFileWriteln(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.DCLogFileWriteln;
end;

procedure __DC__Setdcsystem__DCLogFileWriteln(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.DCLogFileWriteln:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__DCLogSuspend(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.DCLogSuspend;
end;

procedure __DC__Setdcsystem__DCLogSuspend(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.DCLogSuspend:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__RegistryKey(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.RegistryKey;
end;

procedure __DC__Setdcsystem__RegistryKey(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.RegistryKey:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__IDEUpdateCount(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.IDEUpdateCount;
end;

procedure __DC__Setdcsystem__IDEUpdateCount(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.IDEUpdateCount:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__UnderDelphiIDE(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.UnderDelphiIDE;
end;

procedure __DC__Setdcsystem__UnderDelphiIDE(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.UnderDelphiIDE:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__ClassPrefix(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.ClassPrefix;
end;

procedure __DC__Setdcsystem__ClassPrefix(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.ClassPrefix:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__OptionsFileName(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.OptionsFileName;
end;

procedure __DC__Setdcsystem__OptionsFileName(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.OptionsFileName:=OleVariant(Params^[0]);
end;

function __DC__Getdcsystem__StoreOptionsInFile(Instance : TObject; Params : PVariantArgList) : OleVariant;
begin
result := dcsystem.StoreOptionsInFile;
end;

procedure __DC__Setdcsystem__StoreOptionsInFile(Instance : TObject; Params : PVariantArgList);
begin
dcsystem.StoreOptionsInFile:=OleVariant(Params^[0]);
end;

var __RegisteredVars : TList;
procedure __RegisterVars;
begin
__RegisteredVars := TList.Create;
__RegisteredVars.Add(RegisterVar('DCLogFileShowGUID',__DC__Getdcsystem__DCLogFileShowGUID,__DC__Setdcsystem__DCLogFileShowGUID));
__RegisteredVars.Add(RegisterVar('DCLogFileShowTime',__DC__Getdcsystem__DCLogFileShowTime,__DC__Setdcsystem__DCLogFileShowTime));
__RegisteredVars.Add(RegisterVar('DCLogFileWriteln',__DC__Getdcsystem__DCLogFileWriteln,__DC__Setdcsystem__DCLogFileWriteln));
__RegisteredVars.Add(RegisterVar('DCLogSuspend',__DC__Getdcsystem__DCLogSuspend,__DC__Setdcsystem__DCLogSuspend));
__RegisteredVars.Add(RegisterVar('RegistryKey',__DC__Getdcsystem__RegistryKey,__DC__Setdcsystem__RegistryKey));
__RegisteredVars.Add(RegisterVar('IDEUpdateCount',__DC__Getdcsystem__IDEUpdateCount,__DC__Setdcsystem__IDEUpdateCount));
__RegisteredVars.Add(RegisterVar('UnderDelphiIDE',__DC__Getdcsystem__UnderDelphiIDE,__DC__Setdcsystem__UnderDelphiIDE));
__RegisteredVars.Add(RegisterVar('ClassPrefix',__DC__Getdcsystem__ClassPrefix,__DC__Setdcsystem__ClassPrefix));
__RegisteredVars.Add(RegisterVar('OptionsFileName',__DC__Getdcsystem__OptionsFileName,__DC__Setdcsystem__OptionsFileName));
__RegisteredVars.Add(RegisterVar('StoreOptionsInFile',__DC__Getdcsystem__StoreOptionsInFile,__DC__Setdcsystem__StoreOptionsInFile));
end;

procedure __UnregisterVars;
begin
__RegisteredVars.Free;
end;

const __ConstNames0 : array[0..79] of string = (
'SvarSourceClass'
,'SvarSourceEditMethod'
,'SvarSourceIdent'
,'SVarInitProc'
,'SVarForInstant'
,'SVarRegistered'
,'haNone'
,'haLeft'
,'haCenter'
,'haRight'
,'vaNone'
,'vaLeft'
,'vaCenter'
,'vaRight'
,'spCaseSens'
,'spWholeWords'
,'spBackSearch'
,'vsVisible'
,'vsEnabled'
,'vsChecked'
,'cpIgnoreCase'
,'cpPartialCompare'
,'flFullSupport'
,'flOnlyGetStream'
,'cRegister'
,'cPascal'
,'cCdecl'
,'cStdCall'
,'cSafeCall'
,'mtProc'
,'mtMethod'
,'mtClassMethod'
,'mtConstructor'
,'mtDestructor'
,'mtScriptProc'
,'mtScriptMethod'
,'acNoChange'
,'acLefts'
,'acTops'
,'acCenters'
,'acRights'
,'acBottoms'
,'acSpaceEqually'
,'acCenterInWindow'
,'msEmpty'
,'msNotPresent'
,'msOk'
,'boolShowHelpButton'
,'PCharTypeInfo'
,'PWideCharTypeInfo'
,'RealTypeInfo'
,'UntypedTypeInfo'
,'ArrayOfConstInfo'
,'PointerInfo'
,'TypeInfoReal'
,'TypeInfoUntyped'
,'TypeInfoArrayOfConst'
,'TypeInfoPointer'
,'tNoTypeInfoTypes'
,'DefaultRegBlockSize'
,'NullInt'
,'StringsPerBlock'
,'_Package'
,'DesignerInsertClass'
,'cDelphiDelimiters'
,'ssAShift'
,'ssCAShift'
,'ssCShift'
,'StringTypes'
,'RegistrationURL'
,'WriteToUsURL'
,'HomePageURL'
,'scNoChange'
,'scShrinkToSmallest'
,'scGrowToLargest'
,'MinVMTOffset'
,'icNonActiveX'
,'icField'
,'icNoIcon'
,'icShowinPalette'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,SvarSourceClass));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,SvarSourceEditMethod));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,SvarSourceIdent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,SVarInitProc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,SVarForInstant));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,SVarRegistered));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,haNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,haLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,haCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,haRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,vaNone));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,vaLeft));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,vaCenter));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,vaRight));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,spCaseSens));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,spWholeWords));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,spBackSearch));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,vsVisible));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,vsEnabled));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,vsChecked));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,cpIgnoreCase));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,cpPartialCompare));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,flFullSupport));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,flOnlyGetStream));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,cRegister));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,cPascal));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,cCdecl));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,cStdCall));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,cSafeCall));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,mtProc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,mtMethod));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,mtClassMethod));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,mtConstructor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,mtDestructor));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,mtScriptProc));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,mtScriptMethod));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,acNoChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,acLefts));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,acTops));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,acCenters));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,acRights));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,acBottoms));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,acSpaceEqually));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,acCenterInWindow));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,msEmpty));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,msNotPresent));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,msOk));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,boolShowHelpButton));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,PCharTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,PWideCharTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,RealTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,UntypedTypeInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,ArrayOfConstInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,PointerInfo));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,Integer(TypeInfoReal)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,Integer(TypeInfoUntyped)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,Integer(TypeInfoArrayOfConst)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,Integer(TypeInfoPointer)));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,VarFromSet(tNoTypeInfoTypes, sizeof(tNoTypeInfoTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,DefaultRegBlockSize));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,NullInt));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,StringsPerBlock));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,_Package));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,DesignerInsertClass));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,cDelphiDelimiters));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,VarFromSet(ssAShift, sizeof(ssAShift))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,VarFromSet(ssCAShift, sizeof(ssCAShift))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,VarFromSet(ssCShift, sizeof(ssCShift))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,VarFromSet(StringTypes, sizeof(StringTypes))));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,RegistrationURL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,WriteToUsURL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,HomePageURL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,scNoChange));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,scShrinkToSmallest));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,scGrowToLargest));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,MinVMTOffset));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,icNonActiveX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,icField));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,icNoIcon));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,icShowinPalette));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..33] of TClass = (
_TIDEObject,
TActiveNotifier,
TClassItem,
TClassItems,
TCodeDesigner,
TDCNamedItems,
TDCPersistentList,
TDCSimpleScripter,
TEditClassInfo,
TEditSource,
TEditSourceClassInfo,
TFileSystem,
TInitProcClass,
TKeyData,
TKeyList,
TListWrapper,
TMessageAnswer,
TMWriter,
TNotifierList,
TNotifierListItem,
TObjectParamList,
TObjectParamListItem,
TOptionExt,
TOptionExtList,
TPackagedCollection,
TPackagedCollectionItem,
TPopupClassInfo,
TPropReader,
TRegistryStream,
TResFileSystem,
TResWriteStream,
TSimpleParser,
TVerbObject,
TWin32FileSystem
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..231] of string = (
'IMAGE_DATA_DIRECTORY'
,'IMAGE_DOS_HEADER'
,'IMAGE_FILE_HEADER'
,'IMAGE_NT_HEADERS'
,'IMAGE_OPTIONAL_HEADER'
,'IMAGE_RESOURCE_DATA_ENTRY'
,'IMAGE_RESOURCE_DIR_STRING_U'
,'IMAGE_RESOURCE_DIRECTORY'
,'IMAGE_RESOURCE_DIRECTORY_ENTRY'
,'IMAGE_SECTION_HEADER'
,'TCursorResInfo'
,'TDesignResFormData'
,'TIconHeader'
,'TIconResInfo'
,'TMethodDef'
,'TMethodTable'
,'TScriptErrorInfo'
,'TVerbData'
,'TWMScriptError'
,'GetOriginalComponentName'
,'AddResFromFile'
,'UnderWindowsNT'
,'RectToStr'
,'PointToStr'
,'RectWidth'
,'RectHeight'
,'CurrentYear'
,'IsLeapHour'
,'IsLeapMinute'
,'GetLogDataFileName'
,'WriteToLog'
,'DoWriteToLog'
,'MapLogFileToWriteln'
,'SaveGlobalOptions'
,'CallVerbByName'
,'RegisterVerbArray'
,'CompiledWithPackages'
,'StrToDelphiVers'
,'GetResFileSystemFilerID'
,'GetFilerID'
,'GetFileSystem'
,'ReleaseFileSystem'
,'Win32FileSystem'
,'CreateNewGUID'
,'ExtractControlName'
,'GetTypeLibName'
,'ExtractActiveXHint'
,'RegisterOCX'
,'ChangeParamsEx'
,'ChangeParamsInStringsEx'
,'ChangeParamsInStrings'
,'ChangeParamsInFile'
,'ChangeParamsInFiles'
,'ShiftIsPressed'
,'IsAltKeyDown'
,'KeysToShift'
,'ExtractQuotedStr'
,'SaveStringToFile'
,'StrToBoolean'
,'RemoveExtraSlash'
,'ShortMonthNameToIndex'
,'ReplaceAllOccurEx'
,'ReplaceAllOccur'
,'GetWord'
,'GetWordPos'
,'GetWordEx'
,'ExtractOnlyName'
,'TrimSeparatorsLeft'
,'TrimSeparatorsRight'
,'TrimSeparators'
,'Replace'
,'CommaText'
,'StringOfSpace'
,'AddBackSpaces'
,'RemoveNonIdentChars'
,'AddStr'
,'GetFirstNotSpace'
,'AddCharOccurence'
,'RemoveCharSet'
,'DCRemovePoints'
,'RemoveStrSet'
,'StringToCharSet'
,'StrArrayToDelimStr'
,'ExtractFilePaths'
,'SortAndRemoveDups'
,'RemoveEmptyStrings'
,'StringsToString'
,'StringsObjectsToList'
,'CreateSortedStringList'
,'FreeStringsObjects'
,'FreeStrings'
,'ClearStrings'
,'EditStringsProperty'
,'ValuePartToStrings'
,'NamePartToStrings'
,'AnsiUpperCaseStrings'
,'SubtractStrings'
,'AnsiLowerCaseStrings'
,'RemoveStrings'
,'StrArrayToStrings'
,'IntersectStrings'
,'DCGetUnitSource'
,'SmartSkipResHeader'
,'_WritePropsToStream'
,'WritePropsToStream'
,'ReadPropsFromStream'
,'WriteWord'
,'WriteInt'
,'WriteShortStr'
,'DCWriteStrWithLenToStream'
,'DCReadStrWithLenFromStream'
,'CreateListIfEmpty'
,'DisposeList'
,'EqualList'
,'ListsInterSect'
,'AddList'
,'RemoveItem'
,'CreateList'
,'RemoveSortedItem'
,'SetColItemDisplayName'
,'GetColItemDisplayName'
,'ObjectParamList'
,'RegisterObjectEx'
,'RemoveFindGlobalCompProc'
,'MaxIntValue'
,'NameIsUnique'
,'UniqueName'
,'FindUniqueName'
,'CallMethod'
,'GetClassUnit'
,'GetCompName'
,'PropNamesToStrings'
,'AssignPropsFromStrings'
,'SetEnabledControls'
,'SetPropValues'
,'SetPropValue'
,'GetPropValue'
,'PropertyExists'
,'AssignProps'
,'AssignPropsEx'
,'DCClearPointStruct'
,'DCIsPointStructClear'
,'AssociateFileExt'
,'UnAssociateFileExt'
,'WriteObjToRegistry'
,'ReadObjFromRegistry'
,'WriteObjTextToRegistry'
,'ReadObjTextFromRegistry'
,'WriteBufToRegistry'
,'ReadBufFromRegistry'
,'GetRegBufSize'
,'WriteLongBufToRegistry'
,'ReadLongBufFromRegistry'
,'GetLongRegBufSize'
,'WriteToRegistry'
,'ReadFromRegistry'
,'ReadStringsFromRegistry'
,'WriteStringsToRegistry'
,'ReadPropsFromRegistry'
,'WritePropsToRegistry'
,'RegValueExists'
,'DCDeleteRegKey'
,'ModifyFileAttr'
,'ModifyFilesAttr'
,'ModifyFilesAttrInFolder'
,'ChangeFileName'
,'DCRelativeFileSearch'
,'DCExpandRelativeFileEx'
,'DCExpandRelativePathEx'
,'ExpandRelativePath'
,'ExpandRelativeFileName'
,'FindFilesEx'
,'FindFiles'
,'TempFileName'
,'AppFolder'
,'RenameToBak'
,'FileBakName'
,'NotifyDestroy'
,'NotifyDestroying'
,'NotifyDestroyObjects'
,'ShowInspector'
,'ToggleInspector'
,'ShowInspectorEx'
,'HideInspector'
,'SimpleBroadCast'
,'RegisterNotifier'
,'UnRegisterNotifier'
,'IDEChanged'
,'IDEBeginUpdate'
,'IDEEndUpdate'
,'BroadcastToNotifiersEx'
,'BroadcastToNotifierList'
,'BroadCastToNotifiers'
,'NotifiersAgree'
,'GetTransparentColor'
,'TransparentBitBltEx'
,'TransparentBitBlt'
,'CorrectRectByRect'
,'DrawTextWithFill'
,'FillRectEx'
,'AlignRectByRect'
,'GetComponentTopLeft'
,'SetComponentTopLeft'
,'StringToGUID'
,'GUIDToString'
,'BuildCompName'
,'ConvertDelphiTypeToString'
,'InitIDENotifier'
,'GetDreamRegKey'
,'SetRootRegKey'
,'SaveComponentToIniFile'
,'LoadComponentFromIniFile'
,'PopupClasses'
,'EditSourceClasses'
,'EditClasses'
,'DefaultCheckWidth'
,'DefaultCheckHeight'
,'CallPropertyEdit'
,'ClassItems'
,'UpdateStandardButtons'
,'FreeTextStylesSets'
,'TextToStream'
,'DCIsStrInStrArray'
,'DCGetDelphiVerFromDefinesStr'
,'DCUnParseString'
,'DCUnParseStringEx'
,'DCGetDelphiSourceDirsAsStrings'
,'DCRemoveVCLPaths'
,'DCAddSlashInStrings'
,'DCChangeFilePath'
,'DCChangeFilePathInStrings'
,'DCChangeFileExtInStrings'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_IMAGE_DATA_DIRECTORY_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_IMAGE_DOS_HEADER_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_IMAGE_FILE_HEADER_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_IMAGE_NT_HEADERS_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[4],Addr(_IMAGE_OPTIONAL_HEADER_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[5],Addr(_IMAGE_RESOURCE_DATA_ENTRY_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[6],Addr(_IMAGE_RESOURCE_DIR_STRING_U_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[7],Addr(_IMAGE_RESOURCE_DIRECTORY_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[8],Addr(_IMAGE_RESOURCE_DIRECTORY_ENTRY_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[9],Addr(_IMAGE_SECTION_HEADER_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[10],Addr(_TCursorResInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[11],Addr(_TDesignResFormData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[12],Addr(_TIconHeader_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[13],Addr(_TIconResInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[14],Addr(_TMethodDef_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[15],Addr(_TMethodTable_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[16],Addr(_TScriptErrorInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[17],Addr(_TVerbData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[18],Addr(_TWMScriptError_)));
RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T0),[
TypeInfo(String),TypeInfo(String)],Addr(GetOriginalComponentName),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T1),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(String)],Addr(AddResFromFile),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T2),[TypeInfo(Boolean)],Addr(UnderWindowsNT),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T3),[
TypeInfo(IDispatch),TypeInfo(String)],Addr(____RectToStr__Wrapper),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T4),[
TypeInfo(IDispatch),TypeInfo(String)],Addr(____PointToStr__Wrapper),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T5),[
TypeInfo(IDispatch),TypeInfo(Integer)],Addr(____RectWidth__Wrapper),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T6),[
TypeInfo(IDispatch),TypeInfo(Integer)],Addr(____RectHeight__Wrapper),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T7),[TypeInfo(Word)],Addr(CurrentYear),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T8),[
TypeInfo(Integer),TypeInfo(Boolean)],Addr(IsLeapHour),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T9),[
TypeInfo(Integer),TypeInfo(Boolean)],Addr(IsLeapMinute),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T10),[TypeInfo(String)],Addr(GetLogDataFileName),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T11),[
TypeInfo(Variant)],Addr(WriteToLog),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T12),[
TypeInfo(Variant)],Addr(DoWriteToLog),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T13),NoParams,Addr(MapLogFileToWriteln),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T16),NoParams,Addr(SaveGlobalOptions),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T18),[
TypeInfo(String)],Addr(CallVerbByName),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T20),[
ArrayInfo(TypeInfo(IDispatch))],Addr(____RegisterVerbArray__Wrapper),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T21),[TypeInfo(Boolean)],Addr(CompiledWithPackages),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T22),[
TypeInfo(String),TypeInfo(TDelphiVers)],Addr(StrToDelphiVers),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T23),[
TypeInfo(String),TypeInfo(TFilerID)],Addr(GetResFileSystemFilerID),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T24),[
TypeInfo(TFileSystem),TypeInfo(TFilerID)],Addr(GetFilerID),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T25),[
TypeInfo(TFilerID),TypeInfo(TFileSystem)],Addr(GetFileSystem),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T26),[
TypeInfo(TFileSystem)],Addr(ReleaseFileSystem),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T27),[TypeInfo(TWin32FileSystem)],Addr(Win32FileSystem),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T28),[TypeInfo(IDispatch)],Addr(____CreateNewGUID__Wrapper),cRegister);

RegisterProc(nil,MethodNames[44],mtProc,TypeInfo(_T29),[
TypeInfo(String),TypeInfo(String)],Addr(ExtractControlName),cRegister);

RegisterProc(nil,MethodNames[45],mtProc,TypeInfo(_T30),[
TypeInfo(IDispatch),TypeInfo(String)],Addr(____GetTypeLibName__Wrapper),cRegister);

RegisterProc(nil,MethodNames[46],mtProc,TypeInfo(_T31),[
TypeInfo(String),TypeInfo(String)],Addr(ExtractActiveXHint),cRegister);

RegisterProc(nil,MethodNames[47],mtProc,TypeInfo(_T32),[
TypeInfo(String)],Addr(RegisterOCX),cRegister);

RegisterProc(nil,MethodNames[48],mtProc,TypeInfo(_T34),[
TypeInfo(String),
TypeInfo(TStrings),
TypeInfo(Char),TypeInfo(String)],Addr(ChangeParamsEx),cRegister);

RegisterProc(nil,MethodNames[49],mtProc,TypeInfo(_T35),[
TypeInfo(TStrings),
TypeInfo(TStrings),
TypeInfo(Char)],Addr(ChangeParamsInStringsEx),cRegister);

RegisterProc(nil,MethodNames[50],mtProc,TypeInfo(_T36),[
TypeInfo(TStrings),
TypeInfo(TStrings)],Addr(ChangeParamsInStrings),cRegister);

RegisterProc(nil,MethodNames[51],mtProc,TypeInfo(_T37),[
TypeInfo(String),
TypeInfo(TStrings)],Addr(ChangeParamsInFile),cRegister);

RegisterProc(nil,MethodNames[52],mtProc,TypeInfo(_T38),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(TStrings),
TypeInfo(Boolean)],Addr(ChangeParamsInFiles),cRegister);

RegisterProc(nil,MethodNames[53],mtProc,TypeInfo(_T39),[TypeInfo(Boolean)],Addr(ShiftIsPressed),cRegister);

RegisterProc(nil,MethodNames[54],mtProc,TypeInfo(_T40),[TypeInfo(Boolean)],Addr(IsAltKeyDown),cRegister);

RegisterProc(nil,MethodNames[55],mtProc,TypeInfo(_T41),[TypeInfo(TShiftState)],Addr(KeysToShift),cRegister);

RegisterProc(nil,MethodNames[56],mtProc,TypeInfo(_T42),[
TypeInfo(String),
TypeInfo(Char),TypeInfo(String)],Addr(ExtractQuotedStr),cRegister);

RegisterProc(nil,MethodNames[57],mtProc,TypeInfo(_T43),[
TypeInfo(String),
TypeInfo(String)],Addr(SaveStringToFile),cRegister);

RegisterProc(nil,MethodNames[58],mtProc,TypeInfo(_T44),[
TypeInfo(String),TypeInfo(Boolean)],Addr(StrToBoolean),cRegister);

RegisterProc(nil,MethodNames[59],mtProc,TypeInfo(_T45),[
TypeInfo(String),TypeInfo(String)],Addr(RemoveExtraSlash),cRegister);

RegisterProc(nil,MethodNames[60],mtProc,TypeInfo(_T46),[
TypeInfo(String),TypeInfo(Integer)],Addr(ShortMonthNameToIndex),cRegister);

RegisterProc(nil,MethodNames[61],mtProc,TypeInfo(_T47),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(String),
TypeInfo(Boolean)],Addr(ReplaceAllOccurEx),cRegister);

RegisterProc(nil,MethodNames[62],mtProc,TypeInfo(_T48),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(String)],Addr(ReplaceAllOccur),cRegister);

RegisterProc(nil,MethodNames[63],mtProc,TypeInfo(_T49),[
TypeInfo(String),
TypeInfo(Integer),TypeInfo(String)],Addr(GetWord),cRegister);

RegisterProc(nil,MethodNames[64],mtProc,TypeInfo(_T50),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(TCharSet),TypeInfo(Integer)],Addr(GetWordPos),cRegister);

RegisterProc(nil,MethodNames[65],mtProc,TypeInfo(_T51),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(TCharSet),TypeInfo(String)],Addr(GetWordEx),cRegister);

RegisterProc(nil,MethodNames[66],mtProc,TypeInfo(_T52),[
TypeInfo(String),TypeInfo(String)],Addr(ExtractOnlyName),cRegister);

RegisterProc(nil,MethodNames[67],mtProc,TypeInfo(_T53),[
TypeInfo(String),
TypeInfo(TCharSet),TypeInfo(String)],Addr(TrimSeparatorsLeft),cRegister);

RegisterProc(nil,MethodNames[68],mtProc,TypeInfo(_T54),[
TypeInfo(String),
TypeInfo(TCharSet),TypeInfo(String)],Addr(TrimSeparatorsRight),cRegister);

RegisterProc(nil,MethodNames[69],mtProc,TypeInfo(_T55),[
TypeInfo(String),
TypeInfo(TCharSet),TypeInfo(String)],Addr(TrimSeparators),cRegister);

RegisterProc(nil,MethodNames[70],mtProc,TypeInfo(_T56),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(String),
TypeInfo(String)],Addr(Replace),cRegister);

RegisterProc(nil,MethodNames[71],mtProc,TypeInfo(_T57),[
ArrayInfo(TypeInfo(String)),TypeInfo(String)],Addr(CommaText),cRegister);

RegisterProc(nil,MethodNames[72],mtProc,TypeInfo(_T58),[
TypeInfo(Integer),TypeInfo(String)],Addr(StringOfSpace),cRegister);

RegisterProc(nil,MethodNames[73],mtProc,TypeInfo(_T59),[
TypeInfo(String),
TypeInfo(Integer)],Addr(AddBackSpaces),cRegister);

RegisterProc(nil,MethodNames[74],mtProc,TypeInfo(_T61),[
TypeInfo(String),TypeInfo(String)],Addr(RemoveNonIdentChars),cRegister);

RegisterProc(nil,MethodNames[75],mtProc,TypeInfo(_T62),[
TypeInfo(String),
TypeInfo(String)],Addr(AddStr),cRegister);

RegisterProc(nil,MethodNames[76],mtProc,TypeInfo(_T63),[
TypeInfo(String),TypeInfo(Integer)],Addr(GetFirstNotSpace),cRegister);

RegisterProc(nil,MethodNames[77],mtProc,TypeInfo(_T64),[
TypeInfo(String),
TypeInfo(Char),
TypeInfo(Integer),TypeInfo(String)],Addr(AddCharOccurence),cRegister);

RegisterProc(nil,MethodNames[78],mtProc,TypeInfo(_T65),[
TypeInfo(TCharSet),
TypeInfo(String),TypeInfo(String)],Addr(RemoveCharSet),cRegister);

RegisterProc(nil,MethodNames[79],mtProc,TypeInfo(_T66),[
TypeInfo(String),TypeInfo(String)],Addr(DCRemovePoints),cRegister);

RegisterProc(nil,MethodNames[80],mtProc,TypeInfo(_T67),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(Boolean),TypeInfo(String)],Addr(RemoveStrSet),cRegister);

RegisterProc(nil,MethodNames[81],mtProc,TypeInfo(_T68),[
TypeInfo(TCharSet),
TypeInfo(String),
TypeInfo(Boolean),TypeInfo(TCharSet)],Addr(StringToCharSet),cRegister);

RegisterProc(nil,MethodNames[82],mtProc,TypeInfo(_T71),[
ArrayInfo(TypeInfo(String)),
TypeInfo(Char),TypeInfo(String)],Addr(StrArrayToDelimStr),cRegister);

RegisterProc(nil,MethodNames[83],mtProc,TypeInfo(_T75),[
TypeInfo(TStrings),
TypeInfo(TStrings)],Addr(ExtractFilePaths),cRegister);

RegisterProc(nil,MethodNames[84],mtProc,TypeInfo(_T76),[
TypeInfo(TStrings)],Addr(SortAndRemoveDups),cRegister);

RegisterProc(nil,MethodNames[85],mtProc,TypeInfo(_T78),[
TypeInfo(TStrings)],Addr(RemoveEmptyStrings),cRegister);

RegisterProc(nil,MethodNames[86],mtProc,TypeInfo(_T79),[
TypeInfo(TStrings),
TypeInfo(Char),TypeInfo(String)],Addr(StringsToString),cRegister);

RegisterProc(nil,MethodNames[87],mtProc,TypeInfo(_T80),[
TypeInfo(TStrings),
TypeInfo(TList)],Addr(StringsObjectsToList),cRegister);

RegisterProc(nil,MethodNames[88],mtProc,TypeInfo(_T81),[TypeInfo(TStringList)],Addr(CreateSortedStringList),cRegister);

RegisterProc(nil,MethodNames[89],mtProc,TypeInfo(_T83),[
TypeInfo(TStrings)],Addr(FreeStringsObjects),cRegister);

RegisterProc(nil,MethodNames[90],mtProc,TypeInfo(_T84),[
TypeInfoUntyped],Addr(FreeStrings),cRegister);

RegisterProc(nil,MethodNames[91],mtProc,TypeInfo(_T85),[
TypeInfo(TStrings)],Addr(ClearStrings),cRegister);

RegisterProc(nil,MethodNames[92],mtProc,TypeInfo(_T86),[
TypeInfo(TComponent),
TypeInfo(String)],Addr(EditStringsProperty),cRegister);

RegisterProc(nil,MethodNames[93],mtProc,TypeInfo(_T87),[
TypeInfo(TStrings),
TypeInfo(TStrings)],Addr(ValuePartToStrings),cRegister);

RegisterProc(nil,MethodNames[94],mtProc,TypeInfo(_T88),[
TypeInfo(TStrings),
TypeInfo(TStrings)],Addr(NamePartToStrings),cRegister);

RegisterProc(nil,MethodNames[95],mtProc,TypeInfo(_T90),[
TypeInfo(TStrings)],Addr(AnsiUpperCaseStrings),cRegister);

RegisterProc(nil,MethodNames[96],mtProc,TypeInfo(_T91),[
TypeInfo(TStrings),
TypeInfo(TStrings)],Addr(SubtractStrings),cRegister);

RegisterProc(nil,MethodNames[97],mtProc,TypeInfo(_T92),[
TypeInfo(TStrings)],Addr(AnsiLowerCaseStrings),cRegister);

RegisterProc(nil,MethodNames[98],mtProc,TypeInfo(_T93),[
TypeInfo(TStrings),
TypeInfo(TStrings)],Addr(RemoveStrings),cRegister);

RegisterProc(nil,MethodNames[99],mtProc,TypeInfo(_T94),[
TypeInfo(TStrings),
ArrayInfo(TypeInfo(String))],Addr(StrArrayToStrings),cRegister);

RegisterProc(nil,MethodNames[100],mtProc,TypeInfo(_T95),[
TypeInfo(TStrings),
TypeInfo(TStrings)],Addr(IntersectStrings),cRegister);

RegisterProc(nil,MethodNames[101],mtProc,TypeInfo(_T96),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(TStrings),TypeInfo(Boolean)],Addr(DCGetUnitSource),cRegister);

RegisterProc(nil,MethodNames[102],mtProc,TypeInfo(_T98),[
TypeInfo(TStream),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(SmartSkipResHeader),cRegister);

RegisterProc(nil,MethodNames[103],mtProc,TypeInfo(_T99),[
TypeInfo(TWriter),
TypeInfo(TComponent),
TypeInfo(TStrings)],Addr(_WritePropsToStream),cRegister);

RegisterProc(nil,MethodNames[104],mtProc,TypeInfo(_T100),[
TypeInfo(TStream),
TypeInfo(TComponent),
ArrayInfo(TypeInfo(String))],Addr(WritePropsToStream),cRegister);

RegisterProc(nil,MethodNames[105],mtProc,TypeInfo(_T101),[
TypeInfo(TStream),
TypeInfo(TComponent)],Addr(ReadPropsFromStream),cRegister);

RegisterProc(nil,MethodNames[106],mtProc,TypeInfo(_T102),[
TypeInfo(TStream),
TypeInfo(Word)],Addr(WriteWord),cRegister);

RegisterProc(nil,MethodNames[107],mtProc,TypeInfo(_T103),[
TypeInfo(TStream),
TypeInfo(Integer)],Addr(WriteInt),cRegister);

RegisterProc(nil,MethodNames[108],mtProc,TypeInfo(_T104),[
TypeInfo(TStream),
TypeInfo(String)],Addr(WriteShortStr),cRegister);

RegisterProc(nil,MethodNames[109],mtProc,TypeInfo(_T105),[
TypeInfo(TStream),
TypeInfo(String)],Addr(DCWriteStrWithLenToStream),cRegister);

RegisterProc(nil,MethodNames[110],mtProc,TypeInfo(_T106),[
TypeInfo(TStream),TypeInfo(String)],Addr(DCReadStrWithLenFromStream),cRegister);

RegisterProc(nil,MethodNames[111],mtProc,TypeInfo(_T107),[
TypeInfo(TList),TypeInfo(TList)],Addr(CreateListIfEmpty),cRegister);

RegisterProc(nil,MethodNames[112],mtProc,TypeInfo(_T108),[
TypeInfo(TList)],Addr(DisposeList),cRegister);

RegisterProc(nil,MethodNames[113],mtProc,TypeInfo(_T109),[
TypeInfo(TList),
TypeInfo(TList),TypeInfo(Boolean)],Addr(EqualList),cRegister);

RegisterProc(nil,MethodNames[114],mtProc,TypeInfo(_T110),[
TypeInfo(TList),
TypeInfo(TList),TypeInfo(Boolean)],Addr(ListsInterSect),cRegister);

RegisterProc(nil,MethodNames[115],mtProc,TypeInfo(_T112),[
TypeInfo(TList),
TypeInfo(TList)],Addr(AddList),cRegister);

RegisterProc(nil,MethodNames[116],mtProc,TypeInfo(_T113),[
TypeInfo(TList),
TypeInfoPointer,TypeInfo(Integer)],Addr(RemoveItem),cRegister);

RegisterProc(nil,MethodNames[117],mtProc,TypeInfo(_T114),[TypeInfo(TList)],Addr(CreateList),cRegister);

RegisterProc(nil,MethodNames[118],mtProc,TypeInfo(_T115),[
TypeInfo(TSortedList),
TypeInfoPointer,TypeInfo(Integer)],Addr(RemoveSortedItem),cRegister);

RegisterProc(nil,MethodNames[119],mtProc,TypeInfo(_T116),[
TypeInfo(TCollectionItem),
TypeInfo(String)],Addr(SetColItemDisplayName),cRegister);

RegisterProc(nil,MethodNames[120],mtProc,TypeInfo(_T117),[
TypeInfo(TCollectionItem),TypeInfo(String)],Addr(GetColItemDisplayName),cRegister);

RegisterProc(nil,MethodNames[121],mtProc,TypeInfo(_T118),[TypeInfo(TObjectParamList)],Addr(ObjectParamList),cRegister);

RegisterProc(nil,MethodNames[122],mtProc,TypeInfo(_T127),[
TypeInfo(TObject),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant))],Addr(RegisterObjectEx),cRegister);

RegisterProc(nil,MethodNames[123],mtProc,TypeInfo(_T140),NoParams,Addr(RemoveFindGlobalCompProc),cRegister);

RegisterProc(nil,MethodNames[124],mtProc,TypeInfo(_T141),[
ArrayInfo(TypeInfo(Integer)),TypeInfo(Integer)],Addr(MaxIntValue),cRegister);

RegisterProc(nil,MethodNames[125],mtProc,TypeInfo(_T142),[
TypeInfo(TComponent),
TypeInfo(String),TypeInfo(Boolean)],Addr(NameIsUnique),cRegister);

RegisterProc(nil,MethodNames[126],mtProc,TypeInfo(_T143),[
TypeInfo(TComponent),
TypeInfo(String),TypeInfo(String)],Addr(UniqueName),cRegister);

RegisterProc(nil,MethodNames[127],mtProc,TypeInfo(_T144),[
TypeInfo(String),TypeInfo(String)],Addr(FindUniqueName),cRegister);

RegisterProc(nil,MethodNames[128],mtProc,TypeInfo(_T152),[
TypeInfoPointer,
TypeInfoPointer,TypeInfo(Integer)],Addr(CallMethod),cRegister);

RegisterProc(nil,MethodNames[129],mtProc,TypeInfo(_T153),[
TypeInfo(TObject),TypeInfo(String)],Addr(GetClassUnit),cRegister);

RegisterProc(nil,MethodNames[130],mtProc,TypeInfo(_T154),[
TypeInfo(TPersistent),TypeInfo(String)],Addr(GetCompName),cRegister);

RegisterProc(nil,MethodNames[131],mtProc,TypeInfo(_T157),[
TypeInfo(TPersistent),
TypeInfo(TStrings)],Addr(PropNamesToStrings),cRegister);

RegisterProc(nil,MethodNames[132],mtProc,TypeInfo(_T158),[
TypeInfo(TPersistent),
TypeInfo(TStrings)],Addr(AssignPropsFromStrings),cRegister);

RegisterProc(nil,MethodNames[133],mtProc,TypeInfo(_T159),[
ArrayInfo(TypeInfo(TPersistent)),
TypeInfo(Boolean)],Addr(SetEnabledControls),cRegister);

RegisterProc(nil,MethodNames[134],mtProc,TypeInfo(_T160),[
ArrayInfo(TypeInfo(TPersistent)),
TypeInfo(String),
TypeInfo(Variant)],Addr(SetPropValues),cRegister);

RegisterProc(nil,MethodNames[135],mtProc,TypeInfo(_T161),[
TypeInfo(TPersistent),
TypeInfo(String),
TypeInfo(Variant)],Addr(SetPropValue),cRegister);

RegisterProc(nil,MethodNames[136],mtProc,TypeInfo(_T162),[
TypeInfo(TPersistent),
TypeInfo(String),TypeInfo(Variant)],Addr(GetPropValue),cRegister);

RegisterProc(nil,MethodNames[137],mtProc,TypeInfo(_T163),[
TypeInfo(TPersistent),
TypeInfo(String),TypeInfo(Boolean)],Addr(PropertyExists),cRegister);

RegisterProc(nil,MethodNames[138],mtProc,TypeInfo(_T164),[
TypeInfo(TPersistent),
TypeInfo(TPersistent),
ArrayInfo(TypeInfo(String))],Addr(AssignProps),cRegister);

RegisterProc(nil,MethodNames[139],mtProc,TypeInfo(_T165),[
TypeInfo(TPersistent),
TypeInfo(TPersistent),
TypeInfo(String)],Addr(AssignPropsEx),cRegister);

RegisterProc(nil,MethodNames[140],mtProc,TypeInfo(_T166),[
TypeInfo(IDispatch)],Addr(____DCClearPointStruct__Wrapper),cRegister);

RegisterProc(nil,MethodNames[141],mtProc,TypeInfo(_T167),[
TypeInfo(IDispatch),TypeInfo(Boolean)],Addr(____DCIsPointStructClear__Wrapper),cRegister);

RegisterProc(nil,MethodNames[142],mtProc,TypeInfo(_T168),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(String),
TypeInfo(String),
TypeInfo(Integer)],Addr(AssociateFileExt),cRegister);

RegisterProc(nil,MethodNames[143],mtProc,TypeInfo(_T169),[
TypeInfo(String),
TypeInfo(String)],Addr(UnAssociateFileExt),cRegister);

RegisterProc(nil,MethodNames[144],mtProc,TypeInfo(_T170),[
TypeInfo(String),
TypeInfo(TPersistent)],Addr(WriteObjToRegistry),cRegister);

RegisterProc(nil,MethodNames[145],mtProc,TypeInfo(_T171),[
TypeInfo(String),
TypeInfo(TPersistent)],Addr(ReadObjFromRegistry),cRegister);

RegisterProc(nil,MethodNames[146],mtProc,TypeInfo(_T172),[
TypeInfo(String),
TypeInfo(TPersistent)],Addr(WriteObjTextToRegistry),cRegister);

RegisterProc(nil,MethodNames[147],mtProc,TypeInfo(_T173),[
TypeInfo(String),
TypeInfo(TPersistent)],Addr(ReadObjTextFromRegistry),cRegister);

RegisterProc(nil,MethodNames[148],mtProc,TypeInfo(_T174),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(Integer)],Addr(WriteBufToRegistry),cRegister);

RegisterProc(nil,MethodNames[149],mtProc,TypeInfo(_T175),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(Integer),TypeInfo(Integer)],Addr(ReadBufFromRegistry),cRegister);

RegisterProc(nil,MethodNames[150],mtProc,TypeInfo(_T176),[
TypeInfo(String),TypeInfo(Integer)],Addr(GetRegBufSize),cRegister);

RegisterProc(nil,MethodNames[151],mtProc,TypeInfo(_T177),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(Integer)],Addr(WriteLongBufToRegistry),cRegister);

RegisterProc(nil,MethodNames[152],mtProc,TypeInfo(_T178),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(Integer),TypeInfo(Integer)],Addr(ReadLongBufFromRegistry),cRegister);

RegisterProc(nil,MethodNames[153],mtProc,TypeInfo(_T179),[
TypeInfo(String),TypeInfo(Integer)],Addr(GetLongRegBufSize),cRegister);

RegisterProc(nil,MethodNames[154],mtProc,TypeInfo(_T180),[
TypeInfo(String),
TypeInfo(Variant)],Addr(WriteToRegistry),cRegister);

RegisterProc(nil,MethodNames[155],mtProc,TypeInfo(_T181),[
TypeInfo(String),
TypeInfo(Variant),TypeInfo(Variant)],Addr(ReadFromRegistry),cRegister);

RegisterProc(nil,MethodNames[156],mtProc,TypeInfo(_T182),[
TypeInfo(String),
TypeInfo(TStrings)],Addr(ReadStringsFromRegistry),cRegister);

RegisterProc(nil,MethodNames[157],mtProc,TypeInfo(_T183),[
TypeInfo(String),
TypeInfo(TStrings)],Addr(WriteStringsToRegistry),cRegister);

RegisterProc(nil,MethodNames[158],mtProc,TypeInfo(_T184),[
TypeInfo(TPersistent),
TypeInfo(String)],Addr(ReadPropsFromRegistry),cRegister);

RegisterProc(nil,MethodNames[159],mtProc,TypeInfo(_T185),[
TypeInfo(TPersistent),
TypeInfo(String)],Addr(WritePropsToRegistry),cRegister);

RegisterProc(nil,MethodNames[160],mtProc,TypeInfo(_T186),[
TypeInfo(String),TypeInfo(Boolean)],Addr(RegValueExists),cRegister);

RegisterProc(nil,MethodNames[161],mtProc,TypeInfo(_T187),[
TypeInfo(HKey),
TypeInfo(String),
TypeInfo(String),TypeInfo(Boolean)],Addr(DCDeleteRegKey),cRegister);

RegisterProc(nil,MethodNames[162],mtProc,TypeInfo(_T188),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(ModifyFileAttr),cRegister);

RegisterProc(nil,MethodNames[163],mtProc,TypeInfo(_T189),[
TypeInfo(TStrings),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(ModifyFilesAttr),cRegister);

RegisterProc(nil,MethodNames[164],mtProc,TypeInfo(_T190),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean)],Addr(ModifyFilesAttrInFolder),cRegister);

RegisterProc(nil,MethodNames[165],mtProc,TypeInfo(_T191),[
TypeInfo(String),
TypeInfo(String),TypeInfo(String)],Addr(ChangeFileName),cRegister);

RegisterProc(nil,MethodNames[166],mtProc,TypeInfo(_T192),[
TypeInfo(String),
TypeInfo(String),TypeInfo(String)],Addr(DCRelativeFileSearch),cRegister);

RegisterProc(nil,MethodNames[167],mtProc,TypeInfo(_T193),[
TypeInfo(String),
TypeInfo(String),TypeInfo(String)],Addr(DCExpandRelativeFileEx),cRegister);

RegisterProc(nil,MethodNames[168],mtProc,TypeInfo(_T194),[
TypeInfo(String),
TypeInfo(String),TypeInfo(String)],Addr(DCExpandRelativePathEx),cRegister);

RegisterProc(nil,MethodNames[169],mtProc,TypeInfo(_T197),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(TFilerID),TypeInfo(String)],Addr(ExpandRelativePath),cRegister);

RegisterProc(nil,MethodNames[170],mtProc,TypeInfo(_T198),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(TFilerID),TypeInfo(String)],Addr(ExpandRelativeFileName),cRegister);

RegisterProc(nil,MethodNames[171],mtProc,TypeInfo(_T199),[
TypeInfo(String),
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(Boolean),
TypeInfo(TStrings)],Addr(FindFilesEx),cRegister);

RegisterProc(nil,MethodNames[172],mtProc,TypeInfo(_T200),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(Boolean),
TypeInfo(TStrings)],Addr(FindFiles),cRegister);

RegisterProc(nil,MethodNames[173],mtProc,TypeInfo(_T201),[
TypeInfo(TFileName),TypeInfo(TFileName)],Addr(TempFileName),cRegister);

RegisterProc(nil,MethodNames[174],mtProc,TypeInfo(_T202),[TypeInfo(String)],Addr(AppFolder),cRegister);

RegisterProc(nil,MethodNames[175],mtProc,TypeInfo(_T204),[
TypeInfo(String)],Addr(RenameToBak),cRegister);

RegisterProc(nil,MethodNames[176],mtProc,TypeInfo(_T205),[
TypeInfo(String),TypeInfo(String)],Addr(FileBakName),cRegister);

RegisterProc(nil,MethodNames[177],mtProc,TypeInfo(_T206),[
TypeInfo(TObject)],Addr(NotifyDestroy),cRegister);

RegisterProc(nil,MethodNames[178],mtProc,TypeInfo(_T207),[
TypeInfo(TComponent),
TypeInfo(TNotifierList)],Addr(NotifyDestroying),cRegister);

RegisterProc(nil,MethodNames[179],mtProc,TypeInfo(_T208),[
TypeInfo(TList)],Addr(NotifyDestroyObjects),cRegister);

RegisterProc(nil,MethodNames[180],mtProc,TypeInfo(_T209),NoParams,Addr(ShowInspector),cRegister);

RegisterProc(nil,MethodNames[181],mtProc,TypeInfo(_T210),NoParams,Addr(ToggleInspector),cRegister);

RegisterProc(nil,MethodNames[182],mtProc,TypeInfo(_T211),[
TypeInfo(Boolean)],Addr(ShowInspectorEx),cRegister);

RegisterProc(nil,MethodNames[183],mtProc,TypeInfo(_T212),NoParams,Addr(HideInspector),cRegister);

RegisterProc(nil,MethodNames[184],mtProc,TypeInfo(_T213),[
TypeInfo(Integer)],Addr(SimpleBroadCast),cRegister);

RegisterProc(nil,MethodNames[185],mtProc,TypeInfo(_T214),[
TypeInfo(TObject)],Addr(RegisterNotifier),cRegister);

RegisterProc(nil,MethodNames[186],mtProc,TypeInfo(_T215),[
TypeInfo(TObject)],Addr(UnRegisterNotifier),cRegister);

RegisterProc(nil,MethodNames[187],mtProc,TypeInfo(_T216),NoParams,Addr(IDEChanged),cRegister);

RegisterProc(nil,MethodNames[188],mtProc,TypeInfo(_T217),NoParams,Addr(IDEBeginUpdate),cRegister);

RegisterProc(nil,MethodNames[189],mtProc,TypeInfo(_T218),NoParams,Addr(IDEEndUpdate),cRegister);

RegisterProc(nil,MethodNames[190],mtProc,TypeInfo(_T219),[
TypeInfo(TObject),
TypeInfo(Cardinal),
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(BroadcastToNotifiersEx),cRegister);

RegisterProc(nil,MethodNames[191],mtProc,TypeInfo(_T220),[
TypeInfo(TObject),
TypeInfo(TList),
TypeInfo(Cardinal),
TypeInfo(Longint),
TypeInfo(Longint),
TypeInfo(Boolean),TypeInfo(Boolean)],Addr(BroadcastToNotifierList),cRegister);

RegisterProc(nil,MethodNames[192],mtProc,TypeInfo(_T221),[
TypeInfo(TObject),
TypeInfo(Cardinal),
TypeInfo(Longint),
TypeInfo(Longint)],Addr(BroadCastToNotifiers),cRegister);

RegisterProc(nil,MethodNames[193],mtProc,TypeInfo(_T222),[
TypeInfo(TObject),
TypeInfo(Cardinal),
TypeInfo(Longint),
TypeInfo(Longint),TypeInfo(Boolean)],Addr(NotifiersAgree),cRegister);

RegisterProc(nil,MethodNames[194],mtProc,TypeInfo(_T223),[
TypeInfo(THandle),
TypeInfo(IDispatch),TypeInfo(Longint)],Addr(____GetTransparentColor__Wrapper),cRegister);

RegisterProc(nil,MethodNames[195],mtProc,TypeInfo(_T224),[
TypeInfo(THandle),
TypeInfo(THandle),
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(Longint)],Addr(____TransparentBitBltEx__Wrapper),cRegister);

RegisterProc(nil,MethodNames[196],mtProc,TypeInfo(_T225),[
TypeInfo(THandle),
TypeInfo(THandle),
TypeInfo(IDispatch),
TypeInfo(Longint),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(____TransparentBitBlt__Wrapper),cRegister);

RegisterProc(nil,MethodNames[197],mtProc,TypeInfo(_T226),[
TypeInfo(IDispatch),
TypeInfo(IDispatch)],Addr(____CorrectRectByRect__Wrapper),cRegister);

RegisterProc(nil,MethodNames[198],mtProc,TypeInfo(_T227),[
TypeInfo(TCanvas),
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(IDispatch)],Addr(____DrawTextWithFill__Wrapper),cRegister);

RegisterProc(nil,MethodNames[199],mtProc,TypeInfo(_T228),[
TypeInfo(TCanvas),
TypeInfo(IDispatch),
TypeInfo(IDispatch)],Addr(____FillRectEx__Wrapper),cRegister);

RegisterProc(nil,MethodNames[200],mtProc,TypeInfo(_T229),[
TypeInfo(IDispatch),
TypeInfo(IDispatch),
TypeInfo(THorzAlignment),
TypeInfo(TVertAlignment),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(IDispatch)],Addr(____AlignRectByRect__Wrapper),cRegister);

RegisterProc(nil,MethodNames[201],mtProc,TypeInfo(_T230),[
TypeInfo(TComponent),TypeInfo(IDispatch)],Addr(____GetComponentTopLeft__Wrapper),cRegister);

RegisterProc(nil,MethodNames[202],mtProc,TypeInfo(_T231),[
TypeInfo(TComponent),
TypeInfo(IDispatch)],Addr(____SetComponentTopLeft__Wrapper),cRegister);

RegisterProc(nil,MethodNames[203],mtProc,TypeInfo(_T232),[
TypeInfo(String),TypeInfo(IDispatch)],Addr(____StringToGUID__Wrapper),cRegister);

RegisterProc(nil,MethodNames[204],mtProc,TypeInfo(_T233),[
TypeInfo(IDispatch),TypeInfo(String)],Addr(____GUIDToString__Wrapper),cRegister);

RegisterProc(nil,MethodNames[205],mtProc,TypeInfo(_T234),[
TypeInfo(TPersistent),
TypeInfo(String),TypeInfo(String)],Addr(BuildCompName),cRegister);

RegisterProc(nil,MethodNames[206],mtProc,TypeInfo(_T235),[
TypeInfo(Integer),TypeInfo(String)],Addr(ConvertDelphiTypeToString),cRegister);

RegisterProc(nil,MethodNames[207],mtProc,TypeInfo(_T238),NoParams,Addr(InitIDENotifier),cRegister);

RegisterProc(nil,MethodNames[208],mtProc,TypeInfo(_T239),[
TypeInfo(String),TypeInfo(String)],Addr(GetDreamRegKey),cRegister);

RegisterProc(nil,MethodNames[209],mtProc,TypeInfo(_T240),[
TypeInfo(HKey)],Addr(SetRootRegKey),cRegister);

RegisterProc(nil,MethodNames[210],mtProc,TypeInfo(_T241),[
TypeInfo(TPersistent),
TypeInfo(String)],Addr(SaveComponentToIniFile),cRegister);

RegisterProc(nil,MethodNames[211],mtProc,TypeInfo(_T242),[
TypeInfo(TPersistent),
TypeInfo(String)],Addr(LoadComponentFromIniFile),cRegister);

RegisterProc(nil,MethodNames[212],mtProc,TypeInfo(_T243),[TypeInfo(TPackagedCollection)],Addr(PopupClasses),cRegister);

RegisterProc(nil,MethodNames[213],mtProc,TypeInfo(_T244),[TypeInfo(TPackagedCollection)],Addr(EditSourceClasses),cRegister);

RegisterProc(nil,MethodNames[214],mtProc,TypeInfo(_T245),[TypeInfo(TPackagedCollection)],Addr(EditClasses),cRegister);

RegisterProc(nil,MethodNames[215],mtProc,TypeInfo(_T253),[TypeInfo(Integer)],Addr(DefaultCheckWidth),cRegister);

RegisterProc(nil,MethodNames[216],mtProc,TypeInfo(_T254),[TypeInfo(Integer)],Addr(DefaultCheckHeight),cRegister);

RegisterProc(nil,MethodNames[217],mtProc,TypeInfo(_T255),[
TypeInfo(TPersistent),
TypeInfo(String)],Addr(CallPropertyEdit),cRegister);

RegisterProc(nil,MethodNames[218],mtProc,TypeInfo(_T256),[TypeInfo(TClassItems)],Addr(ClassItems),cRegister);

RegisterProc(nil,MethodNames[219],mtProc,TypeInfo(_T259),[
TypeInfo(TButton),
TypeInfo(TButton),
TypeInfo(TButton)],Addr(UpdateStandardButtons),cRegister);

RegisterProc(nil,MethodNames[220],mtProc,TypeInfo(_T263),NoParams,Addr(FreeTextStylesSets),cRegister);

RegisterProc(nil,MethodNames[221],mtProc,TypeInfo(_T265),[
TypeInfo(String),
TypeInfo(TStream)],Addr(TextToStream),cRegister);

RegisterProc(nil,MethodNames[222],mtProc,TypeInfo(_T266),[
TypeInfo(String),
ArrayInfo(TypeInfo(String)),TypeInfo(Boolean)],Addr(DCIsStrInStrArray),cRegister);

RegisterProc(nil,MethodNames[223],mtProc,TypeInfo(_T267),[
TypeInfo(String),
TypeInfo(TDelphiVer),TypeInfo(Boolean)],Addr(DCGetDelphiVerFromDefinesStr),cRegister);

RegisterProc(nil,MethodNames[224],mtProc,TypeInfo(_T268),[
TypeInfo(TStrings),
TypeInfo(String),TypeInfo(String)],Addr(DCUnParseString),cRegister);

RegisterProc(nil,MethodNames[225],mtProc,TypeInfo(_T269),[
TypeInfo(TStrings),
TypeInfo(String),
TypeInfo(Boolean),TypeInfo(String)],Addr(DCUnParseStringEx),cRegister);

RegisterProc(nil,MethodNames[226],mtProc,TypeInfo(_T272),[
TypeInfo(TDelphiVer),
TypeInfo(TStrings)],Addr(DCGetDelphiSourceDirsAsStrings),cRegister);

RegisterProc(nil,MethodNames[227],mtProc,TypeInfo(_T273),[
TypeInfo(TStrings),
TypeInfo(TDelphiVer)],Addr(DCRemoveVCLPaths),cRegister);

RegisterProc(nil,MethodNames[228],mtProc,TypeInfo(_T274),[
TypeInfo(TStrings)],Addr(DCAddSlashInStrings),cRegister);

RegisterProc(nil,MethodNames[229],mtProc,TypeInfo(_T275),[
TypeInfo(String),
TypeInfo(String),TypeInfo(String)],Addr(DCChangeFilePath),cRegister);

RegisterProc(nil,MethodNames[230],mtProc,TypeInfo(_T276),[
TypeInfo(TStrings),
TypeInfo(String)],Addr(DCChangeFilePathInStrings),cRegister);

RegisterProc(nil,MethodNames[231],mtProc,TypeInfo(_T277),[
TypeInfo(TStrings),
TypeInfo(String)],Addr(DCChangeFileExtInStrings),cRegister);

RegRegisterMethod(TClassItems,'ListFieldClasses',TypeInfo(_T279),[
TypeInfo(TList)],Addr(TClassItems.ListFieldClasses));

RegisterProc(TClassItems,'Create',mtConstructor,TypeInfo(_T281),NoParams,Addr(TClassItems.Create),cRegister);

RegRegisterMethod(TCodeDesigner,'SetStrings',TypeInfo(_T282),[
TypeInfo(TStrings)], pointer(44));

RegRegisterMethod(TCodeDesigner,'GetStrings',TypeInfo(_T283),[TypeInfo(TStrings)], pointer(48));

RegRegisterMethod(TCodeDesigner,'ShowSource',TypeInfo(_T284),[
TypeInfo(Integer),
TypeInfo(Integer)], pointer(52));

RegRegisterMethod(TCodeDesigner,'ShowMethod',TypeInfo(_T287),[
TypeInfo(String)], pointer(64));

RegRegisterMethod(TCodeDesigner,'RenameMethod',TypeInfo(_T288),[
TypeInfo(String),
TypeInfo(String)], pointer(68));

RegRegisterMethod(TCodeDesigner,'DeleteMethod',TypeInfo(_T289),[
TypeInfo(String)], pointer(72));

RegRegisterMethod(TCodeDesigner,'DeleteEmptyMethods',TypeInfo(_T290),NoParams, pointer(76));

RegRegisterMethod(TCodeDesigner,'MethodExists',TypeInfo(_T292),[
TypeInfo(String),TypeInfo(Boolean)], pointer(84));

RegRegisterMethod(TCodeDesigner,'InsertComponent',TypeInfo(_T293),[
TypeInfo(TComponent),
TypeInfo(String)], pointer(88));

RegRegisterMethod(TCodeDesigner,'DeleteComponent',TypeInfo(_T294),[
TypeInfo(TComponent)], pointer(92));

RegRegisterMethod(TCodeDesigner,'RenameComponent',TypeInfo(_T295),[
TypeInfo(TComponent),
TypeInfo(String)], pointer(96));

RegRegisterMethod(TCodeDesigner,'ValidIdentifier',TypeInfo(_T296),[
TypeInfo(String),TypeInfo(Boolean)], pointer(100));

RegRegisterMethod(TCodeDesigner,'GetMethodState',TypeInfo(_T297),[
TypeInfo(String),TypeInfo(TMethodState)], pointer(104));

RegRegisterMethod(TCodeDesigner,'GetUsedUnits',TypeInfo(_T298),[
TypeInfo(TStrings),
TypeInfo(Boolean)], pointer(108));

RegRegisterMethod(TCodeDesigner,'UseUnits',TypeInfo(_T299),[
TypeInfo(TStrings),
TypeInfo(Boolean)], pointer(112));

RegRegisterMethod(TCodeDesigner,'AutoFillUses',TypeInfo(_T300),[TypeInfo(Boolean)], pointer(116));

RegRegisterMethod(TCodeDesigner,'RenameModule',TypeInfo(_T301),[
TypeInfo(String),
TypeInfo(String)], pointer(120));

RegRegisterMethod(TCodeDesigner,'FillWithTemplate',TypeInfo(_T302),[
TypeInfo(String),
TypeInfo(Boolean)], pointer(124));

RegRegisterMethod(TCodeDesigner,'TypeToString',TypeInfo(_T303),[
TypeInfo(Integer),TypeInfo(String)], pointer(128));

RegRegisterMethod(TCodeDesigner,'GetDelimiters',TypeInfo(_T304),[TypeInfo(String)], pointer(132));

RegRegisterMethod(TDCNamedItems,'LoadFromFile',TypeInfo(_T305),[
TypeInfo(String)],Addr(TDCNamedItems.LoadFromFile));

RegRegisterMethod(TDCNamedItems,'LoadFromStream',TypeInfo(_T306),[
TypeInfo(TStream)],Addr(TDCNamedItems.LoadFromStream));

RegRegisterMethod(TDCNamedItems,'SaveToStream',TypeInfo(_T307),[
TypeInfo(TStream)],Addr(TDCNamedItems.SaveToStream));

RegRegisterMethod(TDCNamedItems,'SaveToFile',TypeInfo(_T308),[
TypeInfo(String)],Addr(TDCNamedItems.SaveToFile));

RegisterProc(TDCPersistentList,'Create',mtConstructor,TypeInfo(_T310),NoParams,Addr(TDCPersistentList.Create),cRegister);

RegRegisterMethod(TDCPersistentList,'GetCount',TypeInfo(_T311),[TypeInfo(Integer)],Addr(TDCPersistentList.GetCount));

RegRegisterMethod(TDCPersistentList,'Add',TypeInfo(_T312),[
TypeInfo(TPersistent),TypeInfo(Integer)],Addr(TDCPersistentList.Add));

RegRegisterMethod(TDCPersistentList,'Get',TypeInfo(_T313),[
TypeInfo(Integer),TypeInfo(TPersistent)],Addr(TDCPersistentList.Get));

RegRegisterMethod(TDCSimpleScripter,'BeginDesign',TypeInfo(_T314),NoParams, pointer(44));

RegRegisterMethod(TDCSimpleScripter,'EndDesign',TypeInfo(_T315),NoParams, pointer(48));

RegRegisterMethod(TDCSimpleScripter,'CreateEvent',TypeInfo(_T316),[
TypeInfo(TComponent),
TypeInfo(String),
TypeInfo(String),
TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TDCSimpleScripter,'RenameEvent',TypeInfo(_T317),[
TypeInfo(String),
TypeInfo(String)], pointer(56));

RegRegisterMethod(TDCSimpleScripter,'EventDeleted',TypeInfo(_T318),NoParams, pointer(60));

RegRegisterMethod(TEditSource,'GetValue',TypeInfo(_T319),[TypeInfo(String)], pointer(44));

RegRegisterMethod(TEditSource,'SetValue',TypeInfo(_T320),[
TypeInfo(String)], pointer(48));

RegRegisterMethod(TEditSource,'StartEdit',TypeInfo(_T321),NoParams, pointer(MinVMTOffset - 13));

RegRegisterMethod(TFileSystem,'RenameFileExcept',TypeInfo(_T322),[
TypeInfo(String),
TypeInfo(String)], pointer(44));

RegRegisterMethod(TFileSystem,'DeleteFileExcept',TypeInfo(_T323),[
TypeInfo(String)], pointer(48));

RegRegisterMethod(TFileSystem,'GetCurrentDir',TypeInfo(_T324),[TypeInfo(String)], pointer(52));

RegRegisterMethod(TFileSystem,'SetCurrentDir',TypeInfo(_T325),[
TypeInfo(String)], pointer(56));

RegRegisterMethod(TFileSystem,'GetFileStream',TypeInfo(_T326),[
TypeInfo(TFileName),
TypeInfo(Integer),TypeInfo(TStream)], pointer(60));

RegRegisterMethod(TFileSystem,'FileAge',TypeInfo(_T327),[
TypeInfo(TFileName),TypeInfo(Integer)], pointer(64));

RegRegisterMethod(TFileSystem,'RenameFile',TypeInfo(_T328),[
TypeInfo(TFileName),
TypeInfo(TFileName),TypeInfo(Boolean)], pointer(68));

RegRegisterMethod(TFileSystem,'IsReadonly',TypeInfo(_T329),[
TypeInfo(TFileName),TypeInfo(Boolean)], pointer(72));

RegRegisterMethod(TFileSystem,'DeleteFile',TypeInfo(_T330),[
TypeInfo(TFileName),TypeInfo(Boolean)], pointer(76));

RegRegisterMethod(TFileSystem,'FileExists',TypeInfo(_T331),[
TypeInfo(TFileName),TypeInfo(Boolean)], pointer(80));

RegRegisterMethod(TFileSystem,'GetTempFileName',TypeInfo(_T332),[
TypeInfo(TFileName),TypeInfo(TFileName)], pointer(84));

RegRegisterMethod(TFileSystem,'GetBackupFileName',TypeInfo(_T333),[
TypeInfo(TFileName),TypeInfo(TFileName)], pointer(88));

RegRegisterMethod(TFileSystem,'GetFileSystemLevel',TypeInfo(_T334),[TypeInfo(TFileSystemLevel)], pointer(92));

RegRegisterMethod(TFileSystem,'ChangeFileExt',TypeInfo(_T335),[
TypeInfo(String),
TypeInfo(String),TypeInfo(String)], pointer(96));

RegisterProc(TKeyList,'Create',mtConstructor,TypeInfo(_T336),NoParams,Addr(TKeyList.Create),cRegister);

RegRegisterMethod(TKeyList,'FindKeyData',TypeInfo(_T340),[
TypeInfo(Word),
TypeInfo(TShiftState),
TypeInfo(Shortint),TypeInfo(TKeyData)],Addr(TKeyList.FindKeyData));

RegisterProc(TListWrapper,'Create',mtConstructor,TypeInfo(_T341),NoParams,Addr(TListWrapper.Create),cRegister);

RegRegisterMethod(TListWrapper,'Add',TypeInfo(_T342),[
TypeInfoPointer],Addr(TListWrapper.Add));

RegRegisterMethod(TListWrapper,'Remove',TypeInfo(_T343),[
TypeInfoPointer],Addr(TListWrapper.Remove));

RegisterProc(TMessageAnswer,'Create',mtConstructor,TypeInfo(_T344),NoParams,Addr(TMessageAnswer.Create),cRegister);

RegisterProc(TMWriter,'Create',mtConstructor,TypeInfo(_T345),[
TypeInfo(TStream),
TypeInfo(Integer),
TypeInfo(TObject)],Addr(TMWriter.Create),cRegister);

RegRegisterMethod(TNotifierList,'NotifyEvents',TypeInfo(_T346),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)],Addr(TNotifierList.NotifyEvents));

RegisterProc(TNotifierList,'Create',mtConstructor,TypeInfo(_T347),NoParams,Addr(TNotifierList.Create),cRegister);

RegRegisterMethod(TNotifierList,'DeleteWithData',TypeInfo(_T350),[
TypeInfoPointer],Addr(TNotifierList.DeleteWithData));

RegRegisterMethod(TObjectParamList,'ItemByDataPtr',TypeInfo(_T351),[
TypeInfoPointer,TypeInfo(TObjectParamListItem)],Addr(TObjectParamList.ItemByDataPtr));

RegisterProc(TObjectParamList,'Create',mtConstructor,TypeInfo(_T352),NoParams,Addr(TObjectParamList.Create),cRegister);

RegRegisterMethod(TOptionExt,'LoadConfig',TypeInfo(_T354),NoParams, pointer(12));

RegRegisterMethod(TOptionExt,'SaveConfig',TypeInfo(_T355),NoParams, pointer(16));

RegRegisterMethod(TOptionExt,'GetKey',TypeInfo(_T356),[TypeInfo(String)], pointer(20));

RegRegisterMethod(TOptionExt,'InitValues',TypeInfo(_T357),NoParams, pointer(24));

RegRegisterMethod(TOptionExt,'Update',TypeInfo(_T358),NoParams, pointer(28));

RegRegisterMethod(TOptionExt,'BeginUpdate',TypeInfo(_T359),NoParams,Addr(TOptionExt.BeginUpdate));

RegRegisterMethod(TOptionExt,'EndUpdate',TypeInfo(_T360),NoParams,Addr(TOptionExt.EndUpdate));

RegisterProc(TOptionExt,'Create',mtConstructor,TypeInfo(_T361),NoParams, pointer(32),cRegister);

RegRegisterMethod(TOptionExt,'ApplyOptions',TypeInfo(_T362),NoParams, pointer(36));

RegRegisterMethod(TOptionExt,'GetOptionControl',TypeInfo(_T363),[TypeInfo(TPersistent)], pointer(40));

RegisterProc(TOptionExtList,'Create',mtConstructor,TypeInfo(_T364),NoParams,Addr(TOptionExtList.Create),cRegister);

RegRegisterMethod(TOptionExtList,'GetOptionWithClass',TypeInfo(_T365),[
TypeInfo(String),TypeInfo(TOptionExt)],Addr(TOptionExtList.GetOptionWithClass));

RegRegisterMethod(TOptionExtList,'ApplyOptions',TypeInfo(_T366),NoParams,Addr(TOptionExtList.ApplyOptions));

RegRegisterMethod(TPackagedCollection,'Add',TypeInfo(_T367),[TypeInfo(TPackagedCollectionItem)],Addr(TPackagedCollection.Add));

RegRegisterMethod(TPackagedCollection,'DeleteItems',TypeInfo(_T369),[
TypeInfo(Integer)],Addr(TPackagedCollection.DeleteItems));

RegRegisterMethod(TPackagedCollection,'Last',TypeInfo(_T370),[TypeInfo(TPackagedCollectionItem)],Addr(TPackagedCollection.Last));

RegisterProc(TPropReader,'Create',mtConstructor,TypeInfo(_T371),[
TypeInfo(TStream),
TypeInfo(Integer),
TypeInfo(TObject)],Addr(TPropReader.Create),cRegister);

RegisterProc(TRegistryStream,'Create',mtConstructor,TypeInfo(_T372),[
TypeInfo(String),
TypeInfo(Integer)],Addr(TRegistryStream.Create),cRegister);

RegRegisterMethod(TSimpleParser,'UpdateLinePos',TypeInfo(_T374),[
TypeInfo(Integer)], pointer(44));

RegRegisterMethod(TSimpleParser,'GetFont',TypeInfo(_T377),[
TypeInfo(Integer),TypeInfo(TFont)], pointer(48));

RegRegisterMethod(TSimpleParser,'GetBackColor',TypeInfo(_T378),[
TypeInfo(Integer),
TypeInfo(TColor),TypeInfo(Boolean)], pointer(52));

RegRegisterMethod(TSimpleParser,'ColorString',TypeInfo(_T379),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(String),TypeInfo(Integer)], pointer(56));

RegRegisterMethod(TSimpleParser,'StoreColorData',TypeInfo(_T380),[TypeInfo(Boolean)], pointer(60));

RegRegisterMethod(TSimpleParser,'PrepareColorData',TypeInfo(_T381),[
TypeInfo(Integer),
TypeInfo(String),
TypeInfo(String)], pointer(64));

end;
initialization
__RegisteredMethods := TList.Create;
_mreg_0;
{RegisterProc(nil,'RegisterOptionExt',mtProc,TypeInfo(_T14),[
TypeInfo(TOptionExtClass)],Addr(RegisterOptionExt),cRegister)}

{RegisterProc(nil,'GetOptionsByClass',mtProc,TypeInfo(_T15),[
TypeInfo(TOptionExtClass),TypeInfo(TOptionExt)],Addr(GetOptionsByClass),cRegister)}

{RegisterProc(nil,'GetVerbProcAddr',mtProc,TypeInfo(_T17),[
TypeInfo(String),
TypeInfo(TGetVerbStateProc),
TypeInfo(TExecuteVerbProc),TypeInfo(TObjectParamListItem)],Addr(GetVerbProcAddr),cRegister)}

{RegisterProc(nil,'RegisterVerb',mtProc,TypeInfo(_T19),[
TypeInfo(String),
TypeInfo(TGetVerbStateProc),
TypeInfo(TExecuteVerbProc)],Addr(RegisterVerb),cRegister)}

{RegisterProc(nil,'SetPropByDispatch',mtProc,TypeInfo(_T33),[
TypeInfo(IDispatch),
TypeInfo(TDispID),
TypeInfo(OleVariant)],Addr(SetPropByDispatch),cRegister)}

{RegisterProc(nil,'PReadShortStr',mtProc,TypeInfo(_T60),[
TypeInfoPChar,TypeInfo(String)],Addr(PReadShortStr),cRegister)}

{RegisterProc(nil,'StringFromRType',mtProc,TypeInfo(_T69),[
TypeInfoPChar,TypeInfo(String)],Addr(StringFromRType),cRegister)}

{RegisterProc(nil,'StringFromRName',mtProc,TypeInfo(_T70),[
TypeInfoPChar,TypeInfo(String)],Addr(StringFromRName),cRegister)}

{RegisterProc(nil,'OperateStrings',mtProc,TypeInfo(_T77),[
TypeInfo(TStrings),
TypeInfo(TStringsOperateProc)],Addr(OperateStrings),cRegister)}

{RegisterProc(nil,'CreateSortedStringListEx',mtProc,TypeInfo(_T82),[
TypeInfo(TStringListClass),TypeInfo(TStringList)],Addr(CreateSortedStringListEx),cRegister)}

{RegisterProc(nil,'StringsToProc',mtProc,TypeInfo(_T89),[
TypeInfo(TStrings),
TypeInfo(TGetStrProc)],Addr(StringsToProc),cRegister)}

{RegisterProc(nil,'GetClassFromStream',mtProc,TypeInfo(_T97),[
TypeInfo(TStream),TypeInfo(TComponentClass)],Addr(GetClassFromStream),cRegister)}

{RegisterProc(nil,'ForEachListItem',mtProc,TypeInfo(_T111),[
TypeInfo(TList),
TypeInfo(TListIteratorProc),TypeInfo(Boolean)],Addr(ForEachListItem),cRegister)}

{RegisterProc(nil,'RegisterForDelphi',mtProc,TypeInfo(_T119),[
TypeInfo(TInitProc)],Addr(RegisterForDelphi),cRegister)}

{RegisterProc(nil,'RegisterForInstant',mtProc,TypeInfo(_T120),[
TypeInfo(TInitProc)],Addr(RegisterForInstant),cRegister)}

{RegisterProc(nil,'RegisterUnitCodeDesigner',mtProc,TypeInfo(_T121),[
TypeInfo(TCodeDesignerClass),
TypeInfo(String)],Addr(RegisterUnitCodeDesigner),cRegister)}

{RegisterProc(nil,'RegisterFormCodeDesigner',mtProc,TypeInfo(_T122),[
TypeInfo(TCodeDesignerClass),
TypeInfo(String)],Addr(RegisterFormCodeDesigner),cRegister)}

{RegisterProc(nil,'GetUnitCodeDesignerClass',mtProc,TypeInfo(_T123),[
TypeInfo(String),TypeInfo(TCodeDesignerClass)],Addr(GetUnitCodeDesignerClass),cRegister)}

{RegisterProc(nil,'GetFormCodeDesignerClass',mtProc,TypeInfo(_T124),[
TypeInfo(String),TypeInfo(TCodeDesignerClass)],Addr(GetFormCodeDesignerClass),cRegister)}

{RegisterProc(nil,'RegisterClassExt',mtProc,TypeInfo(_T125),[
TypeInfo(TClass),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant)),TypeInfo(TObjectParamListItem)],Addr(RegisterClassExt),cRegister)}

{RegisterProc(nil,'UnRegisterClassExt',mtProc,TypeInfo(_T126),[
TypeInfo(TClass)],Addr(UnRegisterClassExt),cRegister)}

{RegisterProc(nil,'GetClassEx',mtProc,TypeInfo(_T128),[
TypeInfo(TClass),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(TCompareParams),TypeInfo(TClass)],Addr(GetClassEx),cRegister)}

{RegisterProc(nil,'GetRegisteredClasses',mtProc,TypeInfo(_T129),[
TypeInfo(TClass),
TypeInfo(TList)],Addr(GetRegisteredClasses),cRegister)}

{RegisterProc(nil,'GetItemsEx',mtProc,TypeInfo(_T130),[
TypeInfo(TClass),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(TCompareParams),
TypeInfo(TList)],Addr(GetItemsEx),cRegister)}

{RegisterProc(nil,'GetItemEqual',mtProc,TypeInfo(_T131),[
TypeInfo(TClass),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(TCompareParams),TypeInfo(TObjectParamListItem)],Addr(GetItemEqual),cRegister)}

{RegisterProc(nil,'GetItemInherited',mtProc,TypeInfo(_T132),[
TypeInfo(TClass),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(TCompareParams),TypeInfo(TObjectParamListItem)],Addr(GetItemInherited),cRegister)}

{RegisterProc(nil,'GetItemEx',mtProc,TypeInfo(_T133),[
TypeInfo(TClass),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(TCompareParams),TypeInfo(TObjectParamListItem)],Addr(GetItemEx),cRegister)}

{RegisterProc(nil,'GetItemExParent',mtProc,TypeInfo(_T134),[
TypeInfo(TClass),
TypeInfo(TClass),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(TCompareParams),TypeInfo(TObjectParamListItem)],Addr(GetItemExParent),cRegister)}

{RegisterProc(nil,'GetCodeDesignerClass',mtProc,TypeInfo(_T135),[
TypeInfo(String),
TypeInfo(Boolean),TypeInfo(TCodeDesignerClass)],Addr(GetCodeDesignerClass),cRegister)}

{RegisterProc(nil,'GetClassInherited',mtProc,TypeInfo(_T136),[
TypeInfo(TClass),
ArrayInfo(TypeInfo(String)),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(TCompareParams),TypeInfo(TClass)],Addr(GetClassInherited),cRegister)}

{RegisterProc(nil,'SafeRegisterClasses',mtProc,TypeInfo(_T137),[
ArrayInfo(TypeInfo(TPersistentClass))],Addr(SafeRegisterClasses),cRegister)}

{RegisterProc(nil,'SafeRegisterClass',mtProc,TypeInfo(_T138),[
TypeInfo(TPersistentClass)],Addr(SafeRegisterClass),cRegister)}

{RegisterProc(nil,'SetFindGlobalCompProc',mtProc,TypeInfo(_T139),[
TypeInfo(TFindComponentProc),TypeInfo(Boolean)],Addr(SetFindGlobalCompProc),cRegister)}

{RegisterProc(nil,'GetClassModule',mtProc,TypeInfo(_T145),[
TypeInfo(TClass),TypeInfo(THandle)],Addr(GetClassModule),cRegister)}

{RegisterProc(nil,'CompNamesToProc',mtProc,TypeInfo(_T146),[
TypeInfo(TComponent),
TypeInfo(TComponent),
TypeInfoPointer,
TypeInfo(TGetStrProc)],Addr(CompNamesToProc),cRegister)}

{RegisterProc(nil,'CompListNamesToProc',mtProc,TypeInfo(_T147),[
TypeInfo(TList),
TypeInfo(TComponent),
TypeInfoPointer,
TypeInfo(TGetStrProc)],Addr(CompListNamesToProc),cRegister)}

{RegisterProc(nil,'ClassNamePtr',mtProc,TypeInfo(_T148),[
TypeInfo(TClass),TypeInfoPointer],Addr(ClassNamePtr),cRegister)}

{RegisterProc(nil,'SetClassNamePtr',mtProc,TypeInfo(_T149),[
TypeInfo(TClass),
TypeInfoPointer],Addr(SetClassNamePtr),cRegister)}

{RegisterProc(nil,'SetMethodTable',mtProc,TypeInfo(_T150),[
TypeInfo(TClass),
TypeInfoPointer],Addr(SetMethodTable),cRegister)}

{RegisterProc(nil,'MethodTable',mtProc,TypeInfo(_T151),[
TypeInfo(TClass),TypeInfoPointer],Addr(MethodTable),cRegister)}

{RegisterProc(nil,'GetCommonParent',mtProc,TypeInfo(_T155),[
TypeInfo(TClass),
TypeInfo(TClass),TypeInfo(TClass)],Addr(GetCommonParent),cRegister)}

{RegisterProc(nil,'GetCommonClassesParent',mtProc,TypeInfo(_T156),[
TypeInfo(TList),TypeInfo(TClass)],Addr(GetCommonClassesParent),cRegister)}

{RegisterProc(nil,'IsFormInResource',mtProc,TypeInfo(_T195),[
TypeInfo(String),
TypeInfo(String),
TypeInfoPChar,TypeInfo(Boolean)],Addr(IsFormInResource),cRegister)}

{RegisterProc(nil,'ResourceUpdate',mtProc,TypeInfo(_T196),[
TypeInfo(String),
TypeInfoPChar,
TypeInfo(String),
TypeInfo(Word),
TypeInfoPointer,
TypeInfo(Integer),TypeInfo(Boolean)],Addr(ResourceUpdate),cRegister)}

{RegisterProc(nil,'ForEachFile',mtProc,TypeInfo(_T203),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(Boolean),
TypeInfo(TFileFoundCallBack),TypeInfo(Integer)],Addr(ForEachFile),cRegister)}

{RegisterProc(nil,'RegisterKeyboardInitProc',mtProc,TypeInfo(_T236),[
TypeInfo(TClass),
TypeInfo(String),
TypeInfo(TKeyboardInitProc)],Addr(RegisterKeyboardInitProc),cRegister)}

{RegisterProc(nil,'GetKeyboardInitProc',mtProc,TypeInfo(_T237),[
TypeInfo(TClass),
TypeInfo(String),TypeInfo(TKeyboardInitProc)],Addr(GetKeyboardInitProc),cRegister)}

{RegisterProc(nil,'RegisterPopupClass',mtProc,TypeInfo(_T246),[
TypeInfoPointer,
TypeInfo(TClass),
TypeInfo(String),
TypeInfo(TComponentClass)],Addr(RegisterPopupClass),cRegister)}

{RegisterProc(nil,'RegisterEditSource',mtProc,TypeInfo(_T247),[
TypeInfo(TEditSourceClass)],Addr(RegisterEditSource),cRegister)}

{RegisterProc(nil,'RegisterEditClass',mtProc,TypeInfo(_T248),[
TypeInfoPointer,
TypeInfo(TClass),
TypeInfo(String),
TypeInfo(TComponentClass)],Addr(RegisterEditClass),cRegister)}

{RegisterProc(nil,'RegisterTextEditClass',mtProc,TypeInfo(_T249),[
TypeInfoPointer,
TypeInfo(TClass),
TypeInfo(String),
TypeInfo(TComponentClass)],Addr(RegisterTextEditClass),cRegister)}

{RegisterProc(nil,'IsTextEditClass',mtProc,TypeInfo(_T250),[
TypeInfo(TComponentClass),TypeInfo(Boolean)],Addr(IsTextEditClass),cRegister)}

{RegisterProc(nil,'UnRegisterPopupClass',mtProc,TypeInfo(_T251),[
TypeInfoPointer,
TypeInfo(TClass),
TypeInfo(String),
TypeInfo(TComponentClass)],Addr(UnRegisterPopupClass),cRegister)}

{RegisterProc(nil,'UnRegisterEditClass',mtProc,TypeInfo(_T252),[
TypeInfoPointer,
TypeInfo(TClass),
TypeInfo(String),
TypeInfo(TComponentClass)],Addr(UnRegisterEditClass),cRegister)}

{RegisterProc(nil,'IsIconClass',mtProc,TypeInfo(_T257),[
TypeInfo(TComponentClass),TypeInfo(Boolean)],Addr(IsIconClass),cRegister)}

{RegisterProc(nil,'RegisterNonInstant',mtProc,TypeInfo(_T258),[
ArrayInfo(TypeInfo(TComponentClass))],Addr(RegisterNonInstant),cRegister)}

{RegisterProc(nil,'RegisterOptionsInitializator',mtProc,TypeInfo(_T260),[
TypeInfo(TOptionsInitializator)],Addr(RegisterOptionsInitializator),cRegister)}

{RegisterProc(nil,'UnRegisterOptionsInitializator',mtProc,TypeInfo(_T261),[
TypeInfo(TOptionsInitializator)],Addr(UnRegisterOptionsInitializator),cRegister)}

{RegisterProc(nil,'EnumTextStylesSets',mtProc,TypeInfo(_T262),[
TypeInfo(TGetStrProc)],Addr(EnumTextStylesSets),cRegister)}

{RegisterProc(nil,'BufferToText',mtProc,TypeInfo(_T264),[
TypeInfoPChar,
TypeInfo(Integer),TypeInfo(String)],Addr(BufferToText),cRegister)}

{RegisterProc(nil,'DCCreatePropInfoList',mtProc,TypeInfo(_T270),[
TypeInfo(TPersistent),
TypeInfo(TTypeKinds),TypeInfo(IDCPropInfoList)],Addr(DCCreatePropInfoList),cRegister)}

{RegisterProc(nil,'DCGetEnumTypeValueNames',mtProc,TypeInfo(_T271),[
TypeInfoPointer,
TypeInfo(TStrings)],Addr(DCGetEnumTypeValueNames),cRegister)}

{RegRegisterMethod(TClassItems,'IsIconClass',TypeInfo(_T278),[
TypeInfo(TComponentClass),TypeInfo(Boolean)],Addr(TClassItems.IsIconClass))}

{RegRegisterMethod(TClassItems,'RegisterClass',TypeInfo(_T280),[
TypeInfo(TClass),
TypeInfo(TClassItemCats),TypeInfo(TClassItem)],Addr(TClassItems.RegisterClass))}

{RegRegisterMethod(TCodeDesigner,'GetSyntaxParserClass',TypeInfo(_T285),[TypeInfo(TSimpleParserClass)], pointer(56))}

{RegRegisterMethod(TCodeDesigner,'CreateMethod',TypeInfo(_T286),[
TypeInfo(String),
TypeInfoPointer], pointer(60))}

{RegRegisterMethod(TCodeDesigner,'GetMethods',TypeInfo(_T291),[
TypeInfoPointer,
TypeInfo(TStrings)], pointer(80))}

{RegRegisterMethod(TDCPersistentList,'Equals',TypeInfo(_T309),[
TypeInfo(IDCDsgnDesignerSelections),TypeInfo(Boolean)],Addr(TDCPersistentList.Equals))}

{RegRegisterMethod(TKeyList,'AddKey',TypeInfo(_T337),[
TypeInfo(Word),
TypeInfo(TShiftState),
TypeInfo(TKeyboardMethod),
TypeInfo(Shortint),
TypeInfo(Shortint),TypeInfo(TKeyData)],Addr(TKeyList.AddKey))}

{RegRegisterMethod(TKeyList,'AddAllKey',TypeInfo(_T338),[
TypeInfo(Word),
TypeInfo(TShiftState),
TypeInfo(TKeyboardMethod),TypeInfo(TKeyData)],Addr(TKeyList.AddAllKey))}

{RegRegisterMethod(TKeyList,'AddSimpleKey',TypeInfo(_T339),[
TypeInfo(Word),
TypeInfo(TShiftState),
TypeInfo(TKeyboardMethod),TypeInfo(TKeyData)],Addr(TKeyList.AddSimpleKey))}

{RegRegisterMethod(TNotifierList,'AddMethod',TypeInfo(_T348),[
TypeInfo(TNotifierProc)],Addr(TNotifierList.AddMethod))}

{RegRegisterMethod(TNotifierList,'DeleteMethod',TypeInfo(_T349),[
TypeInfo(TNotifierProc)],Addr(TNotifierList.DeleteMethod))}

{RegRegisterMethod(TObjectParamList,'ForEveryClass',TypeInfo(_T353),[
TypeInfo(TClass),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(TObjectParamListIterator),TypeInfo(Variant)],Addr(TObjectParamList.ForEveryClass))}

{RegisterProc(TPackagedCollection,'Create',mtConstructor,TypeInfo(_T368),[
TypeInfo(TCollectionItemClass)],Addr(TPackagedCollection.Create),cRegister)}

{RegisterProc(TResWriteStream,'Create',mtConstructor,TypeInfo(_T373),[
TypeInfo(String),
TypeInfo(String),
TypeInfoPChar,
TypeInfo(Integer)],Addr(TResWriteStream.Create),cRegister)}

{RegRegisterMethod(TSimpleParser,'RegisterNotifier',TypeInfo(_T375),[
TypeInfo(TNotifierProc)],Addr(TSimpleParser.RegisterNotifier))}

{RegRegisterMethod(TSimpleParser,'UnRegisterNotifier',TypeInfo(_T376),[
TypeInfo(TNotifierProc)],Addr(TSimpleParser.UnRegisterNotifier))}

{RegisterEvent(TypeInfo(TEventHandler),[
TypeInfoPChar,
TypeInfo(Integer),
TypeInfo(PVariantArgList),TypeInfo(Variant)]);}

{RegisterEvent(TypeInfo(TFileFoundCallBack),[
TypeInfo(String),
TypeInfo(IDispatch),
TypeInfo(Boolean)]);}

RegisterEvent(TypeInfo(TFindComponentProc),[
TypeInfo(String),TypeInfo(TComponent)]);

RegisterEvent(TypeInfo(TFindExpression),[
TypeInfo(String),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Boolean),TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TGetColorDataEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(String),
TypeInfo(String)]);

RegisterEvent(TypeInfo(TKeyboardMethod),NoParams);

RegisterEvent(TypeInfo(TListIteratorProc),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Boolean)]);

RegisterEvent(TypeInfo(TNotifierProc),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

RegisterEvent(TypeInfo(TObjectParamListIterator),[
TypeInfo(TObjectParamListItem),
ArrayInfo(TypeInfo(Variant)),
TypeInfo(Boolean),TypeInfo(Variant)]);

RegisterEvent(TypeInfo(TShowSourceEvent),[
TypeInfo(TObject),
TypeInfo(Integer),
TypeInfo(Integer)]);

__RegisterClasses;
__RegisterConsts0;
__RegisterProps;
__RegisterVars;

finalization
__UnRegisterClasses;
__UnregisterConsts0;
__UnRegisterVars;
__UnregisterProcs;
end.
