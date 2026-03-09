{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MATH_D5;
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
  SysUtils,
  Math;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type
_T0 = function (p0 : Extended): Extended of object;

_T1 = _T0;

_T2 = function (p0 : Extended;
p1 : Extended): Extended of object;

_T3 = procedure (p0 : Extended;
var p1 : Extended;
var p2 : Extended) of object;

_T4 = _T0;

_T5 = _T0;

_T6 = _T2;

_T7 = _T0;

_T8 = _T0;

_T9 = _T0;

_T10 = _T0;

_T11 = _T0;

_T12 = _T0;

_T13 = _T0;

_T14 = _T0;

_T15 = _T0;

_T16 = _T0;

_T17 = _T0;

_T18 = _T0;

_T19 = _T0;

_T20 = _T0;

_T21 = _T0;

_T22 = _T2;

_T23 = function (p0 : Extended;
p1 : Integer): Extended of object;

_T24 = _T2;

_T25 = procedure (p0 : Extended;
var p1 : Extended;
var p2 : Integer) of object;

_T26 = _T23;

_T27 = function (p0 : Extended): Integer of object;

_T28 = _T27;

_T29 = function (p0 : Extended;
const p1 : Array of Double): Extended of object;

_T30 = function (const p0 : Array of Double): Extended of object;

_T31 = _T30;

_T32 = _T30;

_T33 = procedure (const p0 : Array of Double;
var p1 : Extended;
var p2 : Extended) of object;

_T34 = function (const p0 : Array of Double): Double of object;

_T35 = function (p0 : Integer;
p1 : Integer): Integer of object;

_T36 = _T34;

_T37 = _T35;

_T38 = _T30;

_T39 = _T33;

_T40 = _T30;

_T41 = _T30;

_T42 = _T30;

_T43 = _T30;

_T44 = _T30;

_T45 = procedure (const p0 : Array of Double;
var p1 : Extended;
var p2 : Extended;
var p3 : Extended;
var p4 : Extended;
var p5 : Extended;
var p6 : Extended) of object;

_T46 = _T2;

_T47 = function (p0 : Extended;
p1 : Extended;
p2 : Integer;
p3 : Integer): Extended of object;

_T48 = function (p0 : Extended;
p1 : Integer;
p2 : Extended;
p3 : Extended;
p4 : TPaymentTime): Extended of object;

_T49 = function (p0 : Extended;
p1 : Integer;
p2 : Integer;
p3 : Extended;
p4 : Extended;
p5 : TPaymentTime): Extended of object;

_T50 = function (p0 : Integer;
p1 : Extended;
p2 : Extended;
p3 : Extended;
p4 : TPaymentTime): Extended of object;

_T51 = _T29;

_T52 = function (p0 : Extended;
p1 : Extended;
p2 : Extended;
p3 : Extended;
p4 : TPaymentTime): Extended of object;

_T53 = function (p0 : Extended;
const p1 : Array of Double;
p2 : TPaymentTime): Extended of object;

_T54 = _T48;

_T55 = _T49;

_T56 = _T48;

_T57 = function (p0 : Extended;
p1 : Extended;
p2 : Integer): Extended of object;

_T58 = _T47;

procedure __RegisterProps;
begin
end;

const __ConstNames0 : array[0..8] of string = (
'MinSingle'
,'MaxSingle'
,'MinDouble'
,'MaxDouble'
,'MinExtended'
,'MinComp'
,'MaxComp'
,'ptEndOfPeriod'
,'ptStartOfPeriod'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,MinSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,MaxSingle));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,MinDouble));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,MaxDouble));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,MinExtended));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,MinComp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,MaxComp));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,ptEndOfPeriod));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,ptStartOfPeriod));
end;

procedure __UnregisterConsts0;
var i : integer;
begin
__RegisteredConstsList0.Free
end;

const ClassList : array[0..0] of TClass = (
EInvalidArgument
);
procedure __RegisterClasses;
begin
RegisterClassesInScript(ClassList);
end;

procedure __UnRegisterClasses;
begin
end;

var __RegisteredMethods : TList;
const MethodNames : array[0..58] of string = (
'ArcCos'
,'ArcSin'
,'ArcTan2'
,'SinCos'
,'Tan'
,'Cotan'
,'Hypot'
,'DegToRad'
,'RadToDeg'
,'GradToRad'
,'RadToGrad'
,'CycleToRad'
,'RadToCycle'
,'Cosh'
,'Sinh'
,'Tanh'
,'ArcCosh'
,'ArcSinh'
,'ArcTanh'
,'LnXP1'
,'Log10'
,'Log2'
,'LogN'
,'IntPower'
,'Power'
,'Frexp'
,'Ldexp'
,'Ceil'
,'Floor'
,'Poly'
,'Mean'
,'Sum'
,'SumOfSquares'
,'SumsAndSquares'
,'MinValue'
,'Min'
,'MaxValue'
,'Max'
,'StdDev'
,'MeanAndStdDev'
,'PopnStdDev'
,'Variance'
,'PopnVariance'
,'TotalVariance'
,'Norm'
,'MomentSkewKurtosis'
,'RandG'
,'DoubleDecliningBalance'
,'FutureValue'
,'InterestPayment'
,'InterestRate'
,'InternalRateOfReturn'
,'NumberOfPeriods'
,'NetPresentValue'
,'Payment'
,'PeriodPayment'
,'PresentValue'
,'SLNDepreciation'
,'SYDDepreciation'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
RegisterProc(nil,MethodNames[0],mtProc,TypeInfo(_T0),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(ArcCos),cRegister);

RegisterProc(nil,MethodNames[1],mtProc,TypeInfo(_T1),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(ArcSin),cRegister);

RegisterProc(nil,MethodNames[2],mtProc,TypeInfo(_T2),[
TypeInfo(Extended),
TypeInfo(Extended),TypeInfo(Extended)],Addr(ArcTan2),cRegister);

RegisterProc(nil,MethodNames[3],mtProc,TypeInfo(_T3),[
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Extended)],Addr(SinCos),cRegister);

RegisterProc(nil,MethodNames[4],mtProc,TypeInfo(_T4),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(Tan),cRegister);

RegisterProc(nil,MethodNames[5],mtProc,TypeInfo(_T5),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(Cotan),cRegister);

RegisterProc(nil,MethodNames[6],mtProc,TypeInfo(_T6),[
TypeInfo(Extended),
TypeInfo(Extended),TypeInfo(Extended)],Addr(Hypot),cRegister);

RegisterProc(nil,MethodNames[7],mtProc,TypeInfo(_T7),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(DegToRad),cRegister);

RegisterProc(nil,MethodNames[8],mtProc,TypeInfo(_T8),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(RadToDeg),cRegister);

RegisterProc(nil,MethodNames[9],mtProc,TypeInfo(_T9),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(GradToRad),cRegister);

RegisterProc(nil,MethodNames[10],mtProc,TypeInfo(_T10),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(RadToGrad),cRegister);

RegisterProc(nil,MethodNames[11],mtProc,TypeInfo(_T11),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(CycleToRad),cRegister);

RegisterProc(nil,MethodNames[12],mtProc,TypeInfo(_T12),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(RadToCycle),cRegister);

RegisterProc(nil,MethodNames[13],mtProc,TypeInfo(_T13),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(Cosh),cRegister);

RegisterProc(nil,MethodNames[14],mtProc,TypeInfo(_T14),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(Sinh),cRegister);

RegisterProc(nil,MethodNames[15],mtProc,TypeInfo(_T15),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(Tanh),cRegister);

RegisterProc(nil,MethodNames[16],mtProc,TypeInfo(_T16),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(ArcCosh),cRegister);

RegisterProc(nil,MethodNames[17],mtProc,TypeInfo(_T17),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(ArcSinh),cRegister);

RegisterProc(nil,MethodNames[18],mtProc,TypeInfo(_T18),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(ArcTanh),cRegister);

RegisterProc(nil,MethodNames[19],mtProc,TypeInfo(_T19),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(LnXP1),cRegister);

RegisterProc(nil,MethodNames[20],mtProc,TypeInfo(_T20),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(Log10),cRegister);

RegisterProc(nil,MethodNames[21],mtProc,TypeInfo(_T21),[
TypeInfo(Extended),TypeInfo(Extended)],Addr(Log2),cRegister);

RegisterProc(nil,MethodNames[22],mtProc,TypeInfo(_T22),[
TypeInfo(Extended),
TypeInfo(Extended),TypeInfo(Extended)],Addr(LogN),cRegister);

RegisterProc(nil,MethodNames[23],mtProc,TypeInfo(_T23),[
TypeInfo(Extended),
TypeInfo(Integer),TypeInfo(Extended)],Addr(IntPower),cRegister);

RegisterProc(nil,MethodNames[24],mtProc,TypeInfo(_T24),[
TypeInfo(Extended),
TypeInfo(Extended),TypeInfo(Extended)],Addr(Power),cRegister);

RegisterProc(nil,MethodNames[25],mtProc,TypeInfo(_T25),[
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Integer)],Addr(Frexp),cRegister);

RegisterProc(nil,MethodNames[26],mtProc,TypeInfo(_T26),[
TypeInfo(Extended),
TypeInfo(Integer),TypeInfo(Extended)],Addr(Ldexp),cRegister);

RegisterProc(nil,MethodNames[27],mtProc,TypeInfo(_T27),[
TypeInfo(Extended),TypeInfo(Integer)],Addr(Ceil),cRegister);

RegisterProc(nil,MethodNames[28],mtProc,TypeInfo(_T28),[
TypeInfo(Extended),TypeInfo(Integer)],Addr(Floor),cRegister);

RegisterProc(nil,MethodNames[29],mtProc,TypeInfo(_T29),[
TypeInfo(Extended),
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(Poly),cRegister);

RegisterProc(nil,MethodNames[30],mtProc,TypeInfo(_T30),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(Mean),cRegister);

RegisterProc(nil,MethodNames[31],mtProc,TypeInfo(_T31),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(Sum),cRegister);

RegisterProc(nil,MethodNames[32],mtProc,TypeInfo(_T32),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(SumOfSquares),cRegister);

RegisterProc(nil,MethodNames[33],mtProc,TypeInfo(_T33),[
ArrayInfo(TypeInfo(Double)),
TypeInfo(Extended),
TypeInfo(Extended)],Addr(SumsAndSquares),cRegister);

RegisterProc(nil,MethodNames[34],mtProc,TypeInfo(_T34),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Double)],Addr(MinValue),cRegister);

RegisterProc(nil,MethodNames[35],mtProc,TypeInfo(_T35),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(Min),cRegister);

RegisterProc(nil,MethodNames[36],mtProc,TypeInfo(_T36),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Double)],Addr(MaxValue),cRegister);

RegisterProc(nil,MethodNames[37],mtProc,TypeInfo(_T37),[
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Integer)],Addr(Max),cRegister);

RegisterProc(nil,MethodNames[38],mtProc,TypeInfo(_T38),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(StdDev),cRegister);

RegisterProc(nil,MethodNames[39],mtProc,TypeInfo(_T39),[
ArrayInfo(TypeInfo(Double)),
TypeInfo(Extended),
TypeInfo(Extended)],Addr(MeanAndStdDev),cRegister);

RegisterProc(nil,MethodNames[40],mtProc,TypeInfo(_T40),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(PopnStdDev),cRegister);

RegisterProc(nil,MethodNames[41],mtProc,TypeInfo(_T41),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(Variance),cRegister);

RegisterProc(nil,MethodNames[42],mtProc,TypeInfo(_T42),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(PopnVariance),cRegister);

RegisterProc(nil,MethodNames[43],mtProc,TypeInfo(_T43),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(TotalVariance),cRegister);

RegisterProc(nil,MethodNames[44],mtProc,TypeInfo(_T44),[
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(Norm),cRegister);

RegisterProc(nil,MethodNames[45],mtProc,TypeInfo(_T45),[
ArrayInfo(TypeInfo(Double)),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Extended)],Addr(MomentSkewKurtosis),cRegister);

RegisterProc(nil,MethodNames[46],mtProc,TypeInfo(_T46),[
TypeInfo(Extended),
TypeInfo(Extended),TypeInfo(Extended)],Addr(RandG),cRegister);

RegisterProc(nil,MethodNames[47],mtProc,TypeInfo(_T47),[
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Extended)],Addr(DoubleDecliningBalance),cRegister);

RegisterProc(nil,MethodNames[48],mtProc,TypeInfo(_T48),[
TypeInfo(Extended),
TypeInfo(Integer),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(TPaymentTime),TypeInfo(Extended)],Addr(FutureValue),cRegister);

RegisterProc(nil,MethodNames[49],mtProc,TypeInfo(_T49),[
TypeInfo(Extended),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(TPaymentTime),TypeInfo(Extended)],Addr(InterestPayment),cRegister);

RegisterProc(nil,MethodNames[50],mtProc,TypeInfo(_T50),[
TypeInfo(Integer),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(TPaymentTime),TypeInfo(Extended)],Addr(InterestRate),cRegister);

RegisterProc(nil,MethodNames[51],mtProc,TypeInfo(_T51),[
TypeInfo(Extended),
ArrayInfo(TypeInfo(Double)),TypeInfo(Extended)],Addr(InternalRateOfReturn),cRegister);

RegisterProc(nil,MethodNames[52],mtProc,TypeInfo(_T52),[
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(TPaymentTime),TypeInfo(Extended)],Addr(NumberOfPeriods),cRegister);

RegisterProc(nil,MethodNames[53],mtProc,TypeInfo(_T53),[
TypeInfo(Extended),
ArrayInfo(TypeInfo(Double)),
TypeInfo(TPaymentTime),TypeInfo(Extended)],Addr(NetPresentValue),cRegister);

RegisterProc(nil,MethodNames[54],mtProc,TypeInfo(_T54),[
TypeInfo(Extended),
TypeInfo(Integer),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(TPaymentTime),TypeInfo(Extended)],Addr(Payment),cRegister);

RegisterProc(nil,MethodNames[55],mtProc,TypeInfo(_T55),[
TypeInfo(Extended),
TypeInfo(Integer),
TypeInfo(Integer),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(TPaymentTime),TypeInfo(Extended)],Addr(PeriodPayment),cRegister);

RegisterProc(nil,MethodNames[56],mtProc,TypeInfo(_T56),[
TypeInfo(Extended),
TypeInfo(Integer),
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(TPaymentTime),TypeInfo(Extended)],Addr(PresentValue),cRegister);

RegisterProc(nil,MethodNames[57],mtProc,TypeInfo(_T57),[
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Integer),TypeInfo(Extended)],Addr(SLNDepreciation),cRegister);

RegisterProc(nil,MethodNames[58],mtProc,TypeInfo(_T58),[
TypeInfo(Extended),
TypeInfo(Extended),
TypeInfo(Integer),
TypeInfo(Integer),TypeInfo(Extended)],Addr(SYDDepreciation),cRegister);

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
