{*******************************************************}
{                                                       }
{  Copyright (c) 1997-2001 Altium Limited               }
{                                                       }
{  http://www.dream-com.com                             }
{  contact@dream-com.com                                }
{                                                       }
{*******************************************************}
Unit MESSAGES_C4;
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
  Windows,
  Messages;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
function ConvertTMSHMouseWheelToVariant(var R : TMSHMouseWheel) : OleVariant;
function ConvertVariantToTMSHMouseWheel(const V : OleVariant) : TMSHMouseWheel;
function ConvertTWMActivateToVariant(var R : TWMActivate) : OleVariant;
function ConvertVariantToTWMActivate(const V : OleVariant) : TWMActivate;
function ConvertTWMActivateAppToVariant(var R : TWMActivateApp) : OleVariant;
function ConvertVariantToTWMActivateApp(const V : OleVariant) : TWMActivateApp;
function ConvertTWMAskCBFormatNameToVariant(var R : TWMAskCBFormatName) : OleVariant;
function ConvertVariantToTWMAskCBFormatName(const V : OleVariant) : TWMAskCBFormatName;
function ConvertTWMCancelModeToVariant(var R : TWMCancelMode) : OleVariant;
function ConvertVariantToTWMCancelMode(const V : OleVariant) : TWMCancelMode;
function ConvertTWMChangeCBChainToVariant(var R : TWMChangeCBChain) : OleVariant;
function ConvertVariantToTWMChangeCBChain(const V : OleVariant) : TWMChangeCBChain;
function ConvertTWMCharToVariant(var R : TWMChar) : OleVariant;
function ConvertVariantToTWMChar(const V : OleVariant) : TWMChar;
function ConvertTWMCharToItemToVariant(var R : TWMCharToItem) : OleVariant;
function ConvertVariantToTWMCharToItem(const V : OleVariant) : TWMCharToItem;
function ConvertTWMChildActivateToVariant(var R : TWMChildActivate) : OleVariant;
function ConvertVariantToTWMChildActivate(const V : OleVariant) : TWMChildActivate;
function ConvertTWMChooseFont_GetLogFontToVariant(var R : TWMChooseFont_GetLogFont) : OleVariant;
function ConvertVariantToTWMChooseFont_GetLogFont(const V : OleVariant) : TWMChooseFont_GetLogFont;
function ConvertTWMClearToVariant(var R : TWMClear) : OleVariant;
function ConvertVariantToTWMClear(const V : OleVariant) : TWMClear;
function ConvertTWMCloseToVariant(var R : TWMClose) : OleVariant;
function ConvertVariantToTWMClose(const V : OleVariant) : TWMClose;
function ConvertTWMCommandToVariant(var R : TWMCommand) : OleVariant;
function ConvertVariantToTWMCommand(const V : OleVariant) : TWMCommand;
function ConvertTWMCompactingToVariant(var R : TWMCompacting) : OleVariant;
function ConvertVariantToTWMCompacting(const V : OleVariant) : TWMCompacting;
function ConvertTWMCompareItemToVariant(var R : TWMCompareItem) : OleVariant;
function ConvertVariantToTWMCompareItem(const V : OleVariant) : TWMCompareItem;
function ConvertTWMCopyToVariant(var R : TWMCopy) : OleVariant;
function ConvertVariantToTWMCopy(const V : OleVariant) : TWMCopy;
function ConvertTWMCopyDataToVariant(var R : TWMCopyData) : OleVariant;
function ConvertVariantToTWMCopyData(const V : OleVariant) : TWMCopyData;
function ConvertTWMCreateToVariant(var R : TWMCreate) : OleVariant;
function ConvertVariantToTWMCreate(const V : OleVariant) : TWMCreate;
function ConvertTWMCtlColorToVariant(var R : TWMCtlColor) : OleVariant;
function ConvertVariantToTWMCtlColor(const V : OleVariant) : TWMCtlColor;
function ConvertTWMCtlColorBtnToVariant(var R : TWMCtlColorBtn) : OleVariant;
function ConvertVariantToTWMCtlColorBtn(const V : OleVariant) : TWMCtlColorBtn;
function ConvertTWMCtlColorDlgToVariant(var R : TWMCtlColorDlg) : OleVariant;
function ConvertVariantToTWMCtlColorDlg(const V : OleVariant) : TWMCtlColorDlg;
function ConvertTWMCtlColorEditToVariant(var R : TWMCtlColorEdit) : OleVariant;
function ConvertVariantToTWMCtlColorEdit(const V : OleVariant) : TWMCtlColorEdit;
function ConvertTWMCtlColorListboxToVariant(var R : TWMCtlColorListbox) : OleVariant;
function ConvertVariantToTWMCtlColorListbox(const V : OleVariant) : TWMCtlColorListbox;
function ConvertTWMCtlColorMsgboxToVariant(var R : TWMCtlColorMsgbox) : OleVariant;
function ConvertVariantToTWMCtlColorMsgbox(const V : OleVariant) : TWMCtlColorMsgbox;
function ConvertTWMCtlColorScrollbarToVariant(var R : TWMCtlColorScrollbar) : OleVariant;
function ConvertVariantToTWMCtlColorScrollbar(const V : OleVariant) : TWMCtlColorScrollbar;
function ConvertTWMCtlColorStaticToVariant(var R : TWMCtlColorStatic) : OleVariant;
function ConvertVariantToTWMCtlColorStatic(const V : OleVariant) : TWMCtlColorStatic;
function ConvertTWMCutToVariant(var R : TWMCut) : OleVariant;
function ConvertVariantToTWMCut(const V : OleVariant) : TWMCut;
function ConvertTWMDDE_AckToVariant(var R : TWMDDE_Ack) : OleVariant;
function ConvertVariantToTWMDDE_Ack(const V : OleVariant) : TWMDDE_Ack;
function ConvertTWMDDE_AdviseToVariant(var R : TWMDDE_Advise) : OleVariant;
function ConvertVariantToTWMDDE_Advise(const V : OleVariant) : TWMDDE_Advise;
function ConvertTWMDDE_DataToVariant(var R : TWMDDE_Data) : OleVariant;
function ConvertVariantToTWMDDE_Data(const V : OleVariant) : TWMDDE_Data;
function ConvertTWMDDE_ExecuteToVariant(var R : TWMDDE_Execute) : OleVariant;
function ConvertVariantToTWMDDE_Execute(const V : OleVariant) : TWMDDE_Execute;
function ConvertTWMDDE_InitiateToVariant(var R : TWMDDE_Initiate) : OleVariant;
function ConvertVariantToTWMDDE_Initiate(const V : OleVariant) : TWMDDE_Initiate;
function ConvertTWMDDE_PokeToVariant(var R : TWMDDE_Poke) : OleVariant;
function ConvertVariantToTWMDDE_Poke(const V : OleVariant) : TWMDDE_Poke;
function ConvertTWMDDE_RequestToVariant(var R : TWMDDE_Request) : OleVariant;
function ConvertVariantToTWMDDE_Request(const V : OleVariant) : TWMDDE_Request;
function ConvertTWMDDE_TerminateToVariant(var R : TWMDDE_Terminate) : OleVariant;
function ConvertVariantToTWMDDE_Terminate(const V : OleVariant) : TWMDDE_Terminate;
function ConvertTWMDDE_UnadviseToVariant(var R : TWMDDE_Unadvise) : OleVariant;
function ConvertVariantToTWMDDE_Unadvise(const V : OleVariant) : TWMDDE_Unadvise;
function ConvertTWMDeadCharToVariant(var R : TWMDeadChar) : OleVariant;
function ConvertVariantToTWMDeadChar(const V : OleVariant) : TWMDeadChar;
function ConvertTWMDeleteItemToVariant(var R : TWMDeleteItem) : OleVariant;
function ConvertVariantToTWMDeleteItem(const V : OleVariant) : TWMDeleteItem;
function ConvertTWMDestroyToVariant(var R : TWMDestroy) : OleVariant;
function ConvertVariantToTWMDestroy(const V : OleVariant) : TWMDestroy;
function ConvertTWMDestroyClipboardToVariant(var R : TWMDestroyClipboard) : OleVariant;
function ConvertVariantToTWMDestroyClipboard(const V : OleVariant) : TWMDestroyClipboard;
function ConvertTWMDevModeChangeToVariant(var R : TWMDevModeChange) : OleVariant;
function ConvertVariantToTWMDevModeChange(const V : OleVariant) : TWMDevModeChange;
function ConvertTWMDisplayChangeToVariant(var R : TWMDisplayChange) : OleVariant;
function ConvertVariantToTWMDisplayChange(const V : OleVariant) : TWMDisplayChange;
function ConvertTWMDrawClipboardToVariant(var R : TWMDrawClipboard) : OleVariant;
function ConvertVariantToTWMDrawClipboard(const V : OleVariant) : TWMDrawClipboard;
function ConvertTWMDrawItemToVariant(var R : TWMDrawItem) : OleVariant;
function ConvertVariantToTWMDrawItem(const V : OleVariant) : TWMDrawItem;
function ConvertTWMDropFilesToVariant(var R : TWMDropFiles) : OleVariant;
function ConvertVariantToTWMDropFiles(const V : OleVariant) : TWMDropFiles;
function ConvertTWMEnableToVariant(var R : TWMEnable) : OleVariant;
function ConvertVariantToTWMEnable(const V : OleVariant) : TWMEnable;
function ConvertTWMEndSessionToVariant(var R : TWMEndSession) : OleVariant;
function ConvertVariantToTWMEndSession(const V : OleVariant) : TWMEndSession;
function ConvertTWMEnterIdleToVariant(var R : TWMEnterIdle) : OleVariant;
function ConvertVariantToTWMEnterIdle(const V : OleVariant) : TWMEnterIdle;
function ConvertTWMEnterMenuLoopToVariant(var R : TWMEnterMenuLoop) : OleVariant;
function ConvertVariantToTWMEnterMenuLoop(const V : OleVariant) : TWMEnterMenuLoop;
function ConvertTWMEraseBkgndToVariant(var R : TWMEraseBkgnd) : OleVariant;
function ConvertVariantToTWMEraseBkgnd(const V : OleVariant) : TWMEraseBkgnd;
function ConvertTWMExitMenuLoopToVariant(var R : TWMExitMenuLoop) : OleVariant;
function ConvertVariantToTWMExitMenuLoop(const V : OleVariant) : TWMExitMenuLoop;
function ConvertTWMFontChangeToVariant(var R : TWMFontChange) : OleVariant;
function ConvertVariantToTWMFontChange(const V : OleVariant) : TWMFontChange;
function ConvertTWMGetDlgCodeToVariant(var R : TWMGetDlgCode) : OleVariant;
function ConvertVariantToTWMGetDlgCode(const V : OleVariant) : TWMGetDlgCode;
function ConvertTWMGetFontToVariant(var R : TWMGetFont) : OleVariant;
function ConvertVariantToTWMGetFont(const V : OleVariant) : TWMGetFont;
function ConvertTWMGetHotKeyToVariant(var R : TWMGetHotKey) : OleVariant;
function ConvertVariantToTWMGetHotKey(const V : OleVariant) : TWMGetHotKey;
function ConvertTWMGetIconToVariant(var R : TWMGetIcon) : OleVariant;
function ConvertVariantToTWMGetIcon(const V : OleVariant) : TWMGetIcon;
function ConvertTWMGetMinMaxInfoToVariant(var R : TWMGetMinMaxInfo) : OleVariant;
function ConvertVariantToTWMGetMinMaxInfo(const V : OleVariant) : TWMGetMinMaxInfo;
function ConvertTWMGetTextToVariant(var R : TWMGetText) : OleVariant;
function ConvertVariantToTWMGetText(const V : OleVariant) : TWMGetText;
function ConvertTWMGetTextLengthToVariant(var R : TWMGetTextLength) : OleVariant;
function ConvertVariantToTWMGetTextLength(const V : OleVariant) : TWMGetTextLength;
function ConvertTWMHelpToVariant(var R : TWMHelp) : OleVariant;
function ConvertVariantToTWMHelp(const V : OleVariant) : TWMHelp;
function ConvertTWMHotKeyToVariant(var R : TWMHotKey) : OleVariant;
function ConvertVariantToTWMHotKey(const V : OleVariant) : TWMHotKey;
function ConvertTWMHScrollToVariant(var R : TWMHScroll) : OleVariant;
function ConvertVariantToTWMHScroll(const V : OleVariant) : TWMHScroll;
function ConvertTWMHScrollClipboardToVariant(var R : TWMHScrollClipboard) : OleVariant;
function ConvertVariantToTWMHScrollClipboard(const V : OleVariant) : TWMHScrollClipboard;
function ConvertTWMIconEraseBkgndToVariant(var R : TWMIconEraseBkgnd) : OleVariant;
function ConvertVariantToTWMIconEraseBkgnd(const V : OleVariant) : TWMIconEraseBkgnd;
function ConvertTWMInitDialogToVariant(var R : TWMInitDialog) : OleVariant;
function ConvertVariantToTWMInitDialog(const V : OleVariant) : TWMInitDialog;
function ConvertTWMInitMenuToVariant(var R : TWMInitMenu) : OleVariant;
function ConvertVariantToTWMInitMenu(const V : OleVariant) : TWMInitMenu;
function ConvertTWMInitMenuPopupToVariant(var R : TWMInitMenuPopup) : OleVariant;
function ConvertVariantToTWMInitMenuPopup(const V : OleVariant) : TWMInitMenuPopup;
function ConvertTWMKeyToVariant(var R : TWMKey) : OleVariant;
function ConvertVariantToTWMKey(const V : OleVariant) : TWMKey;
function ConvertTWMKeyDownToVariant(var R : TWMKeyDown) : OleVariant;
function ConvertVariantToTWMKeyDown(const V : OleVariant) : TWMKeyDown;
function ConvertTWMKeyUpToVariant(var R : TWMKeyUp) : OleVariant;
function ConvertVariantToTWMKeyUp(const V : OleVariant) : TWMKeyUp;
function ConvertTWMKillFocusToVariant(var R : TWMKillFocus) : OleVariant;
function ConvertVariantToTWMKillFocus(const V : OleVariant) : TWMKillFocus;
function ConvertTWMLButtonDblClkToVariant(var R : TWMLButtonDblClk) : OleVariant;
function ConvertVariantToTWMLButtonDblClk(const V : OleVariant) : TWMLButtonDblClk;
function ConvertTWMLButtonDownToVariant(var R : TWMLButtonDown) : OleVariant;
function ConvertVariantToTWMLButtonDown(const V : OleVariant) : TWMLButtonDown;
function ConvertTWMLButtonUpToVariant(var R : TWMLButtonUp) : OleVariant;
function ConvertVariantToTWMLButtonUp(const V : OleVariant) : TWMLButtonUp;
function ConvertTWMMButtonDblClkToVariant(var R : TWMMButtonDblClk) : OleVariant;
function ConvertVariantToTWMMButtonDblClk(const V : OleVariant) : TWMMButtonDblClk;
function ConvertTWMMButtonDownToVariant(var R : TWMMButtonDown) : OleVariant;
function ConvertVariantToTWMMButtonDown(const V : OleVariant) : TWMMButtonDown;
function ConvertTWMMButtonUpToVariant(var R : TWMMButtonUp) : OleVariant;
function ConvertVariantToTWMMButtonUp(const V : OleVariant) : TWMMButtonUp;
function ConvertTWMMDIActivateToVariant(var R : TWMMDIActivate) : OleVariant;
function ConvertVariantToTWMMDIActivate(const V : OleVariant) : TWMMDIActivate;
function ConvertTWMMDICascadeToVariant(var R : TWMMDICascade) : OleVariant;
function ConvertVariantToTWMMDICascade(const V : OleVariant) : TWMMDICascade;
function ConvertTWMMDICreateToVariant(var R : TWMMDICreate) : OleVariant;
function ConvertVariantToTWMMDICreate(const V : OleVariant) : TWMMDICreate;
function ConvertTWMMDIDestroyToVariant(var R : TWMMDIDestroy) : OleVariant;
function ConvertVariantToTWMMDIDestroy(const V : OleVariant) : TWMMDIDestroy;
function ConvertTWMMDIGetActiveToVariant(var R : TWMMDIGetActive) : OleVariant;
function ConvertVariantToTWMMDIGetActive(const V : OleVariant) : TWMMDIGetActive;
function ConvertTWMMDIIconArrangeToVariant(var R : TWMMDIIconArrange) : OleVariant;
function ConvertVariantToTWMMDIIconArrange(const V : OleVariant) : TWMMDIIconArrange;
function ConvertTWMMDIMaximizeToVariant(var R : TWMMDIMaximize) : OleVariant;
function ConvertVariantToTWMMDIMaximize(const V : OleVariant) : TWMMDIMaximize;
function ConvertTWMMDINextToVariant(var R : TWMMDINext) : OleVariant;
function ConvertVariantToTWMMDINext(const V : OleVariant) : TWMMDINext;
function ConvertTWMMDIRefreshMenuToVariant(var R : TWMMDIRefreshMenu) : OleVariant;
function ConvertVariantToTWMMDIRefreshMenu(const V : OleVariant) : TWMMDIRefreshMenu;
function ConvertTWMMDIRestoreToVariant(var R : TWMMDIRestore) : OleVariant;
function ConvertVariantToTWMMDIRestore(const V : OleVariant) : TWMMDIRestore;
function ConvertTWMMDISetMenuToVariant(var R : TWMMDISetMenu) : OleVariant;
function ConvertVariantToTWMMDISetMenu(const V : OleVariant) : TWMMDISetMenu;
function ConvertTWMMDITileToVariant(var R : TWMMDITile) : OleVariant;
function ConvertVariantToTWMMDITile(const V : OleVariant) : TWMMDITile;
function ConvertTWMMeasureItemToVariant(var R : TWMMeasureItem) : OleVariant;
function ConvertVariantToTWMMeasureItem(const V : OleVariant) : TWMMeasureItem;
function ConvertTWMMenuCharToVariant(var R : TWMMenuChar) : OleVariant;
function ConvertVariantToTWMMenuChar(const V : OleVariant) : TWMMenuChar;
function ConvertTWMMenuSelectToVariant(var R : TWMMenuSelect) : OleVariant;
function ConvertVariantToTWMMenuSelect(const V : OleVariant) : TWMMenuSelect;
function ConvertTWMMouseToVariant(var R : TWMMouse) : OleVariant;
function ConvertVariantToTWMMouse(const V : OleVariant) : TWMMouse;
function ConvertTWMMouseActivateToVariant(var R : TWMMouseActivate) : OleVariant;
function ConvertVariantToTWMMouseActivate(const V : OleVariant) : TWMMouseActivate;
function ConvertTWMMouseMoveToVariant(var R : TWMMouseMove) : OleVariant;
function ConvertVariantToTWMMouseMove(const V : OleVariant) : TWMMouseMove;
function ConvertTWMMouseWheelToVariant(var R : TWMMouseWheel) : OleVariant;
function ConvertVariantToTWMMouseWheel(const V : OleVariant) : TWMMouseWheel;
function ConvertTWMMoveToVariant(var R : TWMMove) : OleVariant;
function ConvertVariantToTWMMove(const V : OleVariant) : TWMMove;
function ConvertTWMNCActivateToVariant(var R : TWMNCActivate) : OleVariant;
function ConvertVariantToTWMNCActivate(const V : OleVariant) : TWMNCActivate;
function ConvertTWMNCCalcSizeToVariant(var R : TWMNCCalcSize) : OleVariant;
function ConvertVariantToTWMNCCalcSize(const V : OleVariant) : TWMNCCalcSize;
function ConvertTWMNCCreateToVariant(var R : TWMNCCreate) : OleVariant;
function ConvertVariantToTWMNCCreate(const V : OleVariant) : TWMNCCreate;
function ConvertTWMNCDestroyToVariant(var R : TWMNCDestroy) : OleVariant;
function ConvertVariantToTWMNCDestroy(const V : OleVariant) : TWMNCDestroy;
function ConvertTWMNCHitMessageToVariant(var R : TWMNCHitMessage) : OleVariant;
function ConvertVariantToTWMNCHitMessage(const V : OleVariant) : TWMNCHitMessage;
function ConvertTWMNCHitTestToVariant(var R : TWMNCHitTest) : OleVariant;
function ConvertVariantToTWMNCHitTest(const V : OleVariant) : TWMNCHitTest;
function ConvertTWMNCLButtonDblClkToVariant(var R : TWMNCLButtonDblClk) : OleVariant;
function ConvertVariantToTWMNCLButtonDblClk(const V : OleVariant) : TWMNCLButtonDblClk;
function ConvertTWMNCLButtonDownToVariant(var R : TWMNCLButtonDown) : OleVariant;
function ConvertVariantToTWMNCLButtonDown(const V : OleVariant) : TWMNCLButtonDown;
function ConvertTWMNCLButtonUpToVariant(var R : TWMNCLButtonUp) : OleVariant;
function ConvertVariantToTWMNCLButtonUp(const V : OleVariant) : TWMNCLButtonUp;
function ConvertTWMNCMButtonDblClkToVariant(var R : TWMNCMButtonDblClk) : OleVariant;
function ConvertVariantToTWMNCMButtonDblClk(const V : OleVariant) : TWMNCMButtonDblClk;
function ConvertTWMNCMButtonDownToVariant(var R : TWMNCMButtonDown) : OleVariant;
function ConvertVariantToTWMNCMButtonDown(const V : OleVariant) : TWMNCMButtonDown;
function ConvertTWMNCMButtonUpToVariant(var R : TWMNCMButtonUp) : OleVariant;
function ConvertVariantToTWMNCMButtonUp(const V : OleVariant) : TWMNCMButtonUp;
function ConvertTWMNCMouseMoveToVariant(var R : TWMNCMouseMove) : OleVariant;
function ConvertVariantToTWMNCMouseMove(const V : OleVariant) : TWMNCMouseMove;
function ConvertTWMNCPaintToVariant(var R : TWMNCPaint) : OleVariant;
function ConvertVariantToTWMNCPaint(const V : OleVariant) : TWMNCPaint;
function ConvertTWMNCRButtonDblClkToVariant(var R : TWMNCRButtonDblClk) : OleVariant;
function ConvertVariantToTWMNCRButtonDblClk(const V : OleVariant) : TWMNCRButtonDblClk;
function ConvertTWMNCRButtonDownToVariant(var R : TWMNCRButtonDown) : OleVariant;
function ConvertVariantToTWMNCRButtonDown(const V : OleVariant) : TWMNCRButtonDown;
function ConvertTWMNCRButtonUpToVariant(var R : TWMNCRButtonUp) : OleVariant;
function ConvertVariantToTWMNCRButtonUp(const V : OleVariant) : TWMNCRButtonUp;
function ConvertTWMNextDlgCtlToVariant(var R : TWMNextDlgCtl) : OleVariant;
function ConvertVariantToTWMNextDlgCtl(const V : OleVariant) : TWMNextDlgCtl;
function ConvertTWMNoParamsToVariant(var R : TWMNoParams) : OleVariant;
function ConvertVariantToTWMNoParams(const V : OleVariant) : TWMNoParams;
function ConvertTWMNotifyToVariant(var R : TWMNotify) : OleVariant;
function ConvertVariantToTWMNotify(const V : OleVariant) : TWMNotify;
function ConvertTWMNotifyFormatToVariant(var R : TWMNotifyFormat) : OleVariant;
function ConvertVariantToTWMNotifyFormat(const V : OleVariant) : TWMNotifyFormat;
function ConvertTWMPaintToVariant(var R : TWMPaint) : OleVariant;
function ConvertVariantToTWMPaint(const V : OleVariant) : TWMPaint;
function ConvertTWMPaintClipboardToVariant(var R : TWMPaintClipboard) : OleVariant;
function ConvertVariantToTWMPaintClipboard(const V : OleVariant) : TWMPaintClipboard;
function ConvertTWMPaintIconToVariant(var R : TWMPaintIcon) : OleVariant;
function ConvertVariantToTWMPaintIcon(const V : OleVariant) : TWMPaintIcon;
function ConvertTWMPaletteChangedToVariant(var R : TWMPaletteChanged) : OleVariant;
function ConvertVariantToTWMPaletteChanged(const V : OleVariant) : TWMPaletteChanged;
function ConvertTWMPaletteIsChangingToVariant(var R : TWMPaletteIsChanging) : OleVariant;
function ConvertVariantToTWMPaletteIsChanging(const V : OleVariant) : TWMPaletteIsChanging;
function ConvertTWMParentNotifyToVariant(var R : TWMParentNotify) : OleVariant;
function ConvertVariantToTWMParentNotify(const V : OleVariant) : TWMParentNotify;
function ConvertTWMPasteToVariant(var R : TWMPaste) : OleVariant;
function ConvertVariantToTWMPaste(const V : OleVariant) : TWMPaste;
function ConvertTWMPowerToVariant(var R : TWMPower) : OleVariant;
function ConvertVariantToTWMPower(const V : OleVariant) : TWMPower;
function ConvertTWMQueryDragIconToVariant(var R : TWMQueryDragIcon) : OleVariant;
function ConvertVariantToTWMQueryDragIcon(const V : OleVariant) : TWMQueryDragIcon;
function ConvertTWMQueryEndSessionToVariant(var R : TWMQueryEndSession) : OleVariant;
function ConvertVariantToTWMQueryEndSession(const V : OleVariant) : TWMQueryEndSession;
function ConvertTWMQueryNewPaletteToVariant(var R : TWMQueryNewPalette) : OleVariant;
function ConvertVariantToTWMQueryNewPalette(const V : OleVariant) : TWMQueryNewPalette;
function ConvertTWMQueryOpenToVariant(var R : TWMQueryOpen) : OleVariant;
function ConvertVariantToTWMQueryOpen(const V : OleVariant) : TWMQueryOpen;
function ConvertTWMQueueSyncToVariant(var R : TWMQueueSync) : OleVariant;
function ConvertVariantToTWMQueueSync(const V : OleVariant) : TWMQueueSync;
function ConvertTWMQuitToVariant(var R : TWMQuit) : OleVariant;
function ConvertVariantToTWMQuit(const V : OleVariant) : TWMQuit;
function ConvertTWMRButtonDblClkToVariant(var R : TWMRButtonDblClk) : OleVariant;
function ConvertVariantToTWMRButtonDblClk(const V : OleVariant) : TWMRButtonDblClk;
function ConvertTWMRButtonDownToVariant(var R : TWMRButtonDown) : OleVariant;
function ConvertVariantToTWMRButtonDown(const V : OleVariant) : TWMRButtonDown;
function ConvertTWMRButtonUpToVariant(var R : TWMRButtonUp) : OleVariant;
function ConvertVariantToTWMRButtonUp(const V : OleVariant) : TWMRButtonUp;
function ConvertTWMRenderAllFormatsToVariant(var R : TWMRenderAllFormats) : OleVariant;
function ConvertVariantToTWMRenderAllFormats(const V : OleVariant) : TWMRenderAllFormats;
function ConvertTWMRenderFormatToVariant(var R : TWMRenderFormat) : OleVariant;
function ConvertVariantToTWMRenderFormat(const V : OleVariant) : TWMRenderFormat;
function ConvertTWMScrollToVariant(var R : TWMScroll) : OleVariant;
function ConvertVariantToTWMScroll(const V : OleVariant) : TWMScroll;
function ConvertTWMSetCursorToVariant(var R : TWMSetCursor) : OleVariant;
function ConvertVariantToTWMSetCursor(const V : OleVariant) : TWMSetCursor;
function ConvertTWMSetFocusToVariant(var R : TWMSetFocus) : OleVariant;
function ConvertVariantToTWMSetFocus(const V : OleVariant) : TWMSetFocus;
function ConvertTWMSetFontToVariant(var R : TWMSetFont) : OleVariant;
function ConvertVariantToTWMSetFont(const V : OleVariant) : TWMSetFont;
function ConvertTWMSetHotKeyToVariant(var R : TWMSetHotKey) : OleVariant;
function ConvertVariantToTWMSetHotKey(const V : OleVariant) : TWMSetHotKey;
function ConvertTWMSetIconToVariant(var R : TWMSetIcon) : OleVariant;
function ConvertVariantToTWMSetIcon(const V : OleVariant) : TWMSetIcon;
function ConvertTWMSetRedrawToVariant(var R : TWMSetRedraw) : OleVariant;
function ConvertVariantToTWMSetRedraw(const V : OleVariant) : TWMSetRedraw;
function ConvertTWMSetTextToVariant(var R : TWMSetText) : OleVariant;
function ConvertVariantToTWMSetText(const V : OleVariant) : TWMSetText;
function ConvertTWMSettingChangeToVariant(var R : TWMSettingChange) : OleVariant;
function ConvertVariantToTWMSettingChange(const V : OleVariant) : TWMSettingChange;
function ConvertTWMShowWindowToVariant(var R : TWMShowWindow) : OleVariant;
function ConvertVariantToTWMShowWindow(const V : OleVariant) : TWMShowWindow;
function ConvertTWMSizeToVariant(var R : TWMSize) : OleVariant;
function ConvertVariantToTWMSize(const V : OleVariant) : TWMSize;
function ConvertTWMSizeClipboardToVariant(var R : TWMSizeClipboard) : OleVariant;
function ConvertVariantToTWMSizeClipboard(const V : OleVariant) : TWMSizeClipboard;
function ConvertTWMSpoolerStatusToVariant(var R : TWMSpoolerStatus) : OleVariant;
function ConvertVariantToTWMSpoolerStatus(const V : OleVariant) : TWMSpoolerStatus;
function ConvertTWMStyleChangeToVariant(var R : TWMStyleChange) : OleVariant;
function ConvertVariantToTWMStyleChange(const V : OleVariant) : TWMStyleChange;
function ConvertTWMStyleChangedToVariant(var R : TWMStyleChanged) : OleVariant;
function ConvertVariantToTWMStyleChanged(const V : OleVariant) : TWMStyleChanged;
function ConvertTWMStyleChangingToVariant(var R : TWMStyleChanging) : OleVariant;
function ConvertVariantToTWMStyleChanging(const V : OleVariant) : TWMStyleChanging;
function ConvertTWMSysCharToVariant(var R : TWMSysChar) : OleVariant;
function ConvertVariantToTWMSysChar(const V : OleVariant) : TWMSysChar;
function ConvertTWMSysColorChangeToVariant(var R : TWMSysColorChange) : OleVariant;
function ConvertVariantToTWMSysColorChange(const V : OleVariant) : TWMSysColorChange;
function ConvertTWMSysCommandToVariant(var R : TWMSysCommand) : OleVariant;
function ConvertVariantToTWMSysCommand(const V : OleVariant) : TWMSysCommand;
function ConvertTWMSysDeadCharToVariant(var R : TWMSysDeadChar) : OleVariant;
function ConvertVariantToTWMSysDeadChar(const V : OleVariant) : TWMSysDeadChar;
function ConvertTWMSysKeyDownToVariant(var R : TWMSysKeyDown) : OleVariant;
function ConvertVariantToTWMSysKeyDown(const V : OleVariant) : TWMSysKeyDown;
function ConvertTWMSysKeyUpToVariant(var R : TWMSysKeyUp) : OleVariant;
function ConvertVariantToTWMSysKeyUp(const V : OleVariant) : TWMSysKeyUp;
function ConvertTWMSystemErrorToVariant(var R : TWMSystemError) : OleVariant;
function ConvertVariantToTWMSystemError(const V : OleVariant) : TWMSystemError;
function ConvertTWMTimeChangeToVariant(var R : TWMTimeChange) : OleVariant;
function ConvertVariantToTWMTimeChange(const V : OleVariant) : TWMTimeChange;
function ConvertTWMTimerToVariant(var R : TWMTimer) : OleVariant;
function ConvertVariantToTWMTimer(const V : OleVariant) : TWMTimer;
function ConvertTWMUndoToVariant(var R : TWMUndo) : OleVariant;
function ConvertVariantToTWMUndo(const V : OleVariant) : TWMUndo;
function ConvertTWMVKeyToItemToVariant(var R : TWMVKeyToItem) : OleVariant;
function ConvertVariantToTWMVKeyToItem(const V : OleVariant) : TWMVKeyToItem;
function ConvertTWMVScrollToVariant(var R : TWMVScroll) : OleVariant;
function ConvertVariantToTWMVScroll(const V : OleVariant) : TWMVScroll;
function ConvertTWMVScrollClipboardToVariant(var R : TWMVScrollClipboard) : OleVariant;
function ConvertVariantToTWMVScrollClipboard(const V : OleVariant) : TWMVScrollClipboard;
function ConvertTWMWindowPosChangedToVariant(var R : TWMWindowPosChanged) : OleVariant;
function ConvertVariantToTWMWindowPosChanged(const V : OleVariant) : TWMWindowPosChanged;
function ConvertTWMWindowPosChangingToVariant(var R : TWMWindowPosChanging) : OleVariant;
function ConvertVariantToTWMWindowPosChanging(const V : OleVariant) : TWMWindowPosChanging;
function ConvertTWMWindowPosMsgToVariant(var R : TWMWindowPosMsg) : OleVariant;
function ConvertVariantToTWMWindowPosMsg(const V : OleVariant) : TWMWindowPosMsg;
function ConvertTWMWinIniChangeToVariant(var R : TWMWinIniChange) : OleVariant;
function ConvertVariantToTWMWinIniChange(const V : OleVariant) : TWMWinIniChange;
implementation
{$IFDEF D3}
{$ELSE}
uses ole2;
type
  OleVariant = Variant;
{$ENDIF}
type __TMessage__Wrapper = class(TDCRecordWrapper)
private
fR : TMessage;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setWParam(const val : Longint);
function getWParam : Longint;
property WParam : Longint read getWParam write setWParam;
procedure setLParam(const val : Longint);
function getLParam : Longint;
property LParam : Longint read getLParam write setLParam;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
procedure setWParamLo(const val : Word);
function getWParamLo : Word;
property WParamLo : Word read getWParamLo write setWParamLo;
procedure setWParamHi(const val : Word);
function getWParamHi : Word;
property WParamHi : Word read getWParamHi write setWParamHi;
procedure setLParamLo(const val : Word);
function getLParamLo : Word;
property LParamLo : Word read getLParamLo write setLParamLo;
procedure setLParamHi(const val : Word);
function getLParamHi : Word;
property LParamHi : Word read getLParamHi write setLParamHi;
procedure setResultLo(const val : Word);
function getResultLo : Word;
property ResultLo : Word read getResultLo write setResultLo;
procedure setResultHi(const val : Word);
function getResultHi : Word;
property ResultHi : Word read getResultHi write setResultHi;
end;
type __TMSHMouseWheel__Wrapper = class(TDCRecordWrapper)
private
fR : TMSHMouseWheel;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setWheelDelta(const val : Integer);
function getWheelDelta : Integer;
property WheelDelta : Integer read getWheelDelta write setWheelDelta;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMActivate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMActivate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setActive(const val : Word);
function getActive : Word;
property Active : Word read getActive write setActive;
procedure setMinimized(const val : WordBool);
function getMinimized : WordBool;
property Minimized : WordBool read getMinimized write setMinimized;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMActivateApp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMActivateApp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setActive(const val : BOOL);
function getActive : BOOL;
property Active : BOOL read getActive write setActive;
procedure setThreadId(const val : Longint);
function getThreadId : Longint;
property ThreadId : Longint read getThreadId write setThreadId;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMAskCBFormatName__Wrapper = class(TDCRecordWrapper)
private
fR : TWMAskCBFormatName;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setNameLen(const val : Word);
function getNameLen : Word;
property NameLen : Word read getNameLen write setNameLen;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCancelMode__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCancelMode;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMChangeCBChain__Wrapper = class(TDCRecordWrapper)
private
fR : TWMChangeCBChain;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMChar__Wrapper = class(TDCRecordWrapper)
private
fR : TWMChar;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCharToItem__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCharToItem;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKey(const val : Word);
function getKey : Word;
property Key : Word read getKey write setKey;
procedure setCaretPos(const val : Word);
function getCaretPos : Word;
property CaretPos : Word read getCaretPos write setCaretPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMChildActivate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMChildActivate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMChooseFont_GetLogFont__Wrapper = class(TDCRecordWrapper)
private
fR : TWMChooseFont_GetLogFont;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMClear__Wrapper = class(TDCRecordWrapper)
private
fR : TWMClear;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMClose__Wrapper = class(TDCRecordWrapper)
private
fR : TWMClose;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCommand__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCommand;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setItemID(const val : Word);
function getItemID : Word;
property ItemID : Word read getItemID write setItemID;
procedure setNotifyCode(const val : Word);
function getNotifyCode : Word;
property NotifyCode : Word read getNotifyCode write setNotifyCode;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCompacting__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCompacting;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCompactRatio(const val : Longint);
function getCompactRatio : Longint;
property CompactRatio : Longint read getCompactRatio write setCompactRatio;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCompareItem__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCompareItem;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCopy__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCopy;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCopyData__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCopyData;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCreate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCreate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCtlColor__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCtlColor;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCtlColorBtn__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCtlColorBtn;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCtlColorDlg__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCtlColorDlg;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCtlColorEdit__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCtlColorEdit;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCtlColorListbox__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCtlColorListbox;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCtlColorMsgbox__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCtlColorMsgbox;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCtlColorScrollbar__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCtlColorScrollbar;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCtlColorStatic__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCtlColorStatic;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMCut__Wrapper = class(TDCRecordWrapper)
private
fR : TWMCut;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDDE_Ack__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Ack;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setApp(const val : Word);
function getApp : Word;
property App : Word read getApp write setApp;
procedure setTopic(const val : Word);
function getTopic : Word;
property Topic : Word read getTopic write setTopic;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
procedure setPackedVal(const val : Longint);
function getPackedVal : Longint;
property PackedVal : Longint read getPackedVal write setPackedVal;
end;
type __TWMDDE_Advise__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Advise;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setPackedVal(const val : Longint);
function getPackedVal : Longint;
property PackedVal : Longint read getPackedVal write setPackedVal;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDDE_Data__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Data;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setPackedVal(const val : Longint);
function getPackedVal : Longint;
property PackedVal : Longint read getPackedVal write setPackedVal;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDDE_Execute__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Execute;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCommands(const val : THandle);
function getCommands : THandle;
property Commands : THandle read getCommands write setCommands;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDDE_Initiate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Initiate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setApp(const val : Word);
function getApp : Word;
property App : Word read getApp write setApp;
procedure setTopic(const val : Word);
function getTopic : Word;
property Topic : Word read getTopic write setTopic;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDDE_Poke__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Poke;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setPackedVal(const val : Longint);
function getPackedVal : Longint;
property PackedVal : Longint read getPackedVal write setPackedVal;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDDE_Request__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Request;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setFormat(const val : Word);
function getFormat : Word;
property Format : Word read getFormat write setFormat;
procedure setItem(const val : Word);
function getItem : Word;
property Item : Word read getItem write setItem;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDDE_Terminate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Terminate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDDE_Unadvise__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDDE_Unadvise;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setFormat(const val : Word);
function getFormat : Word;
property Format : Word read getFormat write setFormat;
procedure setItem(const val : Word);
function getItem : Word;
property Item : Word read getItem write setItem;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDeadChar__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDeadChar;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDeleteItem__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDeleteItem;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDestroy__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDestroy;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDestroyClipboard__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDestroyClipboard;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDevModeChange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDevModeChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDisplayChange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDisplayChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setBitsPerPixel(const val : Integer);
function getBitsPerPixel : Integer;
property BitsPerPixel : Integer read getBitsPerPixel write setBitsPerPixel;
procedure setWidth(const val : Word);
function getWidth : Word;
property Width : Word read getWidth write setWidth;
procedure setHeight(const val : Word);
function getHeight : Word;
property Height : Word read getHeight write setHeight;
end;
type __TWMDrawClipboard__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDrawClipboard;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDrawItem__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDrawItem;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMDropFiles__Wrapper = class(TDCRecordWrapper)
private
fR : TWMDropFiles;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setDrop(const val : THandle);
function getDrop : THandle;
property Drop : THandle read getDrop write setDrop;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMEnable__Wrapper = class(TDCRecordWrapper)
private
fR : TWMEnable;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setEnabled(const val : LongBool);
function getEnabled : LongBool;
property Enabled : LongBool read getEnabled write setEnabled;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMEndSession__Wrapper = class(TDCRecordWrapper)
private
fR : TWMEndSession;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setEndSession(const val : LongBool);
function getEndSession : LongBool;
property EndSession : LongBool read getEndSession write setEndSession;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMEnterIdle__Wrapper = class(TDCRecordWrapper)
private
fR : TWMEnterIdle;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setSource(const val : Longint);
function getSource : Longint;
property Source : Longint read getSource write setSource;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMEnterMenuLoop__Wrapper = class(TDCRecordWrapper)
private
fR : TWMEnterMenuLoop;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setIsTrackPopupMenu(const val : LongBool);
function getIsTrackPopupMenu : LongBool;
property IsTrackPopupMenu : LongBool read getIsTrackPopupMenu write setIsTrackPopupMenu;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMEraseBkgnd__Wrapper = class(TDCRecordWrapper)
private
fR : TWMEraseBkgnd;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMExitMenuLoop__Wrapper = class(TDCRecordWrapper)
private
fR : TWMExitMenuLoop;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setIsTrackPopupMenu(const val : LongBool);
function getIsTrackPopupMenu : LongBool;
property IsTrackPopupMenu : LongBool read getIsTrackPopupMenu write setIsTrackPopupMenu;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMFontChange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMFontChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMGetDlgCode__Wrapper = class(TDCRecordWrapper)
private
fR : TWMGetDlgCode;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMGetFont__Wrapper = class(TDCRecordWrapper)
private
fR : TWMGetFont;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMGetHotKey__Wrapper = class(TDCRecordWrapper)
private
fR : TWMGetHotKey;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMGetIcon__Wrapper = class(TDCRecordWrapper)
private
fR : TWMGetIcon;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setBigIcon(const val : LongBool);
function getBigIcon : LongBool;
property BigIcon : LongBool read getBigIcon write setBigIcon;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMGetMinMaxInfo__Wrapper = class(TDCRecordWrapper)
private
fR : TWMGetMinMaxInfo;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMGetText__Wrapper = class(TDCRecordWrapper)
private
fR : TWMGetText;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setTextMax(const val : Integer);
function getTextMax : Integer;
property TextMax : Integer read getTextMax write setTextMax;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMGetTextLength__Wrapper = class(TDCRecordWrapper)
private
fR : TWMGetTextLength;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMHelp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMHelp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMHotKey__Wrapper = class(TDCRecordWrapper)
private
fR : TWMHotKey;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHotKey(const val : Longint);
function getHotKey : Longint;
property HotKey : Longint read getHotKey write setHotKey;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMHScroll__Wrapper = class(TDCRecordWrapper)
private
fR : TWMHScroll;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setScrollCode(const val : SmallInt);
function getScrollCode : SmallInt;
property ScrollCode : SmallInt read getScrollCode write setScrollCode;
procedure setPos(const val : SmallInt);
function getPos : SmallInt;
property Pos : SmallInt read getPos write setPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMHScrollClipboard__Wrapper = class(TDCRecordWrapper)
private
fR : TWMHScrollClipboard;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setScrollCode(const val : Word);
function getScrollCode : Word;
property ScrollCode : Word read getScrollCode write setScrollCode;
procedure setPos(const val : Word);
function getPos : Word;
property Pos : Word read getPos write setPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMIconEraseBkgnd__Wrapper = class(TDCRecordWrapper)
private
fR : TWMIconEraseBkgnd;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMInitDialog__Wrapper = class(TDCRecordWrapper)
private
fR : TWMInitDialog;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setInitParam(const val : Longint);
function getInitParam : Longint;
property InitParam : Longint read getInitParam write setInitParam;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMInitMenu__Wrapper = class(TDCRecordWrapper)
private
fR : TWMInitMenu;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMInitMenuPopup__Wrapper = class(TDCRecordWrapper)
private
fR : TWMInitMenuPopup;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setPos(const val : SmallInt);
function getPos : SmallInt;
property Pos : SmallInt read getPos write setPos;
procedure setSystemMenu(const val : WordBool);
function getSystemMenu : WordBool;
property SystemMenu : WordBool read getSystemMenu write setSystemMenu;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMKey__Wrapper = class(TDCRecordWrapper)
private
fR : TWMKey;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMKeyDown__Wrapper = class(TDCRecordWrapper)
private
fR : TWMKeyDown;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMKeyUp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMKeyUp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMKillFocus__Wrapper = class(TDCRecordWrapper)
private
fR : TWMKillFocus;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMLButtonDblClk__Wrapper = class(TDCRecordWrapper)
private
fR : TWMLButtonDblClk;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMLButtonDown__Wrapper = class(TDCRecordWrapper)
private
fR : TWMLButtonDown;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMLButtonUp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMLButtonUp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMButtonDblClk__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMButtonDblClk;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMButtonDown__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMButtonDown;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMButtonUp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMButtonUp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDIActivate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDIActivate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDICascade__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDICascade;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCascade(const val : Longint);
function getCascade : Longint;
property Cascade : Longint read getCascade write setCascade;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDICreate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDICreate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDIDestroy__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDIDestroy;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDIGetActive__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDIGetActive;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDIIconArrange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDIIconArrange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDIMaximize__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDIMaximize;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDINext__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDINext;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setNext(const val : Longint);
function getNext : Longint;
property Next : Longint read getNext write setNext;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDIRefreshMenu__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDIRefreshMenu;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDIRestore__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDIRestore;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDISetMenu__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDISetMenu;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMDITile__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMDITile;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setTile(const val : Longint);
function getTile : Longint;
property Tile : Longint read getTile write setTile;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMeasureItem__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMeasureItem;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMenuChar__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMenuChar;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUser(const val : Char);
function getUser : Char;
property User : Char read getUser write setUser;
procedure setUnused(const val : Byte);
function getUnused : Byte;
property Unused : Byte read getUnused write setUnused;
procedure setMenuFlag(const val : Word);
function getMenuFlag : Word;
property MenuFlag : Word read getMenuFlag write setMenuFlag;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMenuSelect__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMenuSelect;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setIDItem(const val : Word);
function getIDItem : Word;
property IDItem : Word read getIDItem write setIDItem;
procedure setMenuFlag(const val : Word);
function getMenuFlag : Word;
property MenuFlag : Word read getMenuFlag write setMenuFlag;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMouse__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMouse;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMouseActivate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMouseActivate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTestCode(const val : Word);
function getHitTestCode : Word;
property HitTestCode : Word read getHitTestCode write setHitTestCode;
procedure setMouseMsg(const val : Word);
function getMouseMsg : Word;
property MouseMsg : Word read getMouseMsg write setMouseMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMouseMove__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMouseMove;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMouseWheel__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMouseWheel;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : SmallInt);
function getKeys : SmallInt;
property Keys : SmallInt read getKeys write setKeys;
procedure setWheelDelta(const val : SmallInt);
function getWheelDelta : SmallInt;
property WheelDelta : SmallInt read getWheelDelta write setWheelDelta;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMMove__Wrapper = class(TDCRecordWrapper)
private
fR : TWMMove;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCActivate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCActivate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setActive(const val : BOOL);
function getActive : BOOL;
property Active : BOOL read getActive write setActive;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCCalcSize__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCCalcSize;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCalcValidRects(const val : BOOL);
function getCalcValidRects : BOOL;
property CalcValidRects : BOOL read getCalcValidRects write setCalcValidRects;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCCreate__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCCreate;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCDestroy__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCDestroy;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCHitMessage__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCHitMessage;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCHitTest__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCHitTest;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCLButtonDblClk__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCLButtonDblClk;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCLButtonDown__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCLButtonDown;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCLButtonUp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCLButtonUp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCMButtonDblClk__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCMButtonDblClk;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCMButtonDown__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCMButtonDown;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCMButtonUp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCMButtonUp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCMouseMove__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCMouseMove;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCPaint__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCPaint;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCRButtonDblClk__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCRButtonDblClk;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCRButtonDown__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCRButtonDown;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNCRButtonUp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNCRButtonUp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Longint);
function getHitTest : Longint;
property HitTest : Longint read getHitTest write setHitTest;
procedure setXCursor(const val : SmallInt);
function getXCursor : SmallInt;
property XCursor : SmallInt read getXCursor write setXCursor;
procedure setYCursor(const val : SmallInt);
function getYCursor : SmallInt;
property YCursor : SmallInt read getYCursor write setYCursor;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNextDlgCtl__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNextDlgCtl;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCtlFocus(const val : Longint);
function getCtlFocus : Longint;
property CtlFocus : Longint read getCtlFocus write setCtlFocus;
procedure setHandle(const val : WordBool);
function getHandle : WordBool;
property Handle : WordBool read getHandle write setHandle;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNoParams__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNoParams;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNotify__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNotify;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setIDCtrl(const val : Longint);
function getIDCtrl : Longint;
property IDCtrl : Longint read getIDCtrl write setIDCtrl;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMNotifyFormat__Wrapper = class(TDCRecordWrapper)
private
fR : TWMNotifyFormat;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCommand(const val : Longint);
function getCommand : Longint;
property Command : Longint read getCommand write setCommand;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMPaint__Wrapper = class(TDCRecordWrapper)
private
fR : TWMPaint;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMPaintClipboard__Wrapper = class(TDCRecordWrapper)
private
fR : TWMPaintClipboard;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setPaintStruct(const val : THandle);
function getPaintStruct : THandle;
property PaintStruct : THandle read getPaintStruct write setPaintStruct;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMPaintIcon__Wrapper = class(TDCRecordWrapper)
private
fR : TWMPaintIcon;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMPaletteChanged__Wrapper = class(TDCRecordWrapper)
private
fR : TWMPaletteChanged;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMPaletteIsChanging__Wrapper = class(TDCRecordWrapper)
private
fR : TWMPaletteIsChanging;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMParentNotify__Wrapper = class(TDCRecordWrapper)
private
fR : TWMParentNotify;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setChildID(const val : Word);
function getChildID : Word;
property ChildID : Word read getChildID write setChildID;
procedure setValue(const val : Word);
function getValue : Word;
property Value : Word read getValue write setValue;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setValue1(const val : Word);
function getValue1 : Word;
property Value1 : Word read getValue1 write setValue1;
procedure setValue2(const val : Longint);
function getValue2 : Longint;
property Value2 : Longint read getValue2 write setValue2;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMPaste__Wrapper = class(TDCRecordWrapper)
private
fR : TWMPaste;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMPower__Wrapper = class(TDCRecordWrapper)
private
fR : TWMPower;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setPowerEvt(const val : Longint);
function getPowerEvt : Longint;
property PowerEvt : Longint read getPowerEvt write setPowerEvt;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMQueryDragIcon__Wrapper = class(TDCRecordWrapper)
private
fR : TWMQueryDragIcon;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMQueryEndSession__Wrapper = class(TDCRecordWrapper)
private
fR : TWMQueryEndSession;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setSource(const val : Longint);
function getSource : Longint;
property Source : Longint read getSource write setSource;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMQueryNewPalette__Wrapper = class(TDCRecordWrapper)
private
fR : TWMQueryNewPalette;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMQueryOpen__Wrapper = class(TDCRecordWrapper)
private
fR : TWMQueryOpen;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMQueueSync__Wrapper = class(TDCRecordWrapper)
private
fR : TWMQueueSync;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMQuit__Wrapper = class(TDCRecordWrapper)
private
fR : TWMQuit;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setExitCode(const val : Longint);
function getExitCode : Longint;
property ExitCode : Longint read getExitCode write setExitCode;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMRButtonDblClk__Wrapper = class(TDCRecordWrapper)
private
fR : TWMRButtonDblClk;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMRButtonDown__Wrapper = class(TDCRecordWrapper)
private
fR : TWMRButtonDown;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMRButtonUp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMRButtonUp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKeys(const val : Longint);
function getKeys : Longint;
property Keys : Longint read getKeys write setKeys;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMRenderAllFormats__Wrapper = class(TDCRecordWrapper)
private
fR : TWMRenderAllFormats;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMRenderFormat__Wrapper = class(TDCRecordWrapper)
private
fR : TWMRenderFormat;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setFormat(const val : Longint);
function getFormat : Longint;
property Format : Longint read getFormat write setFormat;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMScroll__Wrapper = class(TDCRecordWrapper)
private
fR : TWMScroll;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setScrollCode(const val : SmallInt);
function getScrollCode : SmallInt;
property ScrollCode : SmallInt read getScrollCode write setScrollCode;
procedure setPos(const val : SmallInt);
function getPos : SmallInt;
property Pos : SmallInt read getPos write setPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSetCursor__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSetCursor;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setHitTest(const val : Word);
function getHitTest : Word;
property HitTest : Word read getHitTest write setHitTest;
procedure setMouseMsg(const val : Word);
function getMouseMsg : Word;
property MouseMsg : Word read getMouseMsg write setMouseMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSetFocus__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSetFocus;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSetFont__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSetFont;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setRedraw(const val : WordBool);
function getRedraw : WordBool;
property Redraw : WordBool read getRedraw write setRedraw;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSetHotKey__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSetHotKey;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKey(const val : Longint);
function getKey : Longint;
property Key : Longint read getKey write setKey;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSetIcon__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSetIcon;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setBigIcon(const val : LongBool);
function getBigIcon : LongBool;
property BigIcon : LongBool read getBigIcon write setBigIcon;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSetRedraw__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSetRedraw;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setRedraw(const val : Longint);
function getRedraw : Longint;
property Redraw : Longint read getRedraw write setRedraw;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSetText__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSetText;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSettingChange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSettingChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setFlag(const val : Integer);
function getFlag : Integer;
property Flag : Integer read getFlag write setFlag;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMShowWindow__Wrapper = class(TDCRecordWrapper)
private
fR : TWMShowWindow;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setShow(const val : BOOL);
function getShow : BOOL;
property Show : BOOL read getShow write setShow;
procedure setStatus(const val : Longint);
function getStatus : Longint;
property Status : Longint read getStatus write setStatus;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSize__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSize;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setSizeType(const val : Longint);
function getSizeType : Longint;
property SizeType : Longint read getSizeType write setSizeType;
procedure setWidth(const val : Word);
function getWidth : Word;
property Width : Word read getWidth write setWidth;
procedure setHeight(const val : Word);
function getHeight : Word;
property Height : Word read getHeight write setHeight;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSizeClipboard__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSizeClipboard;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setRC(const val : THandle);
function getRC : THandle;
property RC : THandle read getRC write setRC;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSpoolerStatus__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSpoolerStatus;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setJobStatus(const val : Longint);
function getJobStatus : Longint;
property JobStatus : Longint read getJobStatus write setJobStatus;
procedure setJobsLeft(const val : Word);
function getJobsLeft : Word;
property JobsLeft : Word read getJobsLeft write setJobsLeft;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMStyleChange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMStyleChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setStyleType(const val : Longint);
function getStyleType : Longint;
property StyleType : Longint read getStyleType write setStyleType;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMStyleChanged__Wrapper = class(TDCRecordWrapper)
private
fR : TWMStyleChanged;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setStyleType(const val : Longint);
function getStyleType : Longint;
property StyleType : Longint read getStyleType write setStyleType;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMStyleChanging__Wrapper = class(TDCRecordWrapper)
private
fR : TWMStyleChanging;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setStyleType(const val : Longint);
function getStyleType : Longint;
property StyleType : Longint read getStyleType write setStyleType;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSysChar__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSysChar;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSysColorChange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSysColorChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSysCommand__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSysCommand;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKey(const val : Word);
function getKey : Word;
property Key : Word read getKey write setKey;
procedure setXPos(const val : SmallInt);
function getXPos : SmallInt;
property XPos : SmallInt read getXPos write setXPos;
procedure setYPos(const val : SmallInt);
function getYPos : SmallInt;
property YPos : SmallInt read getYPos write setYPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSysDeadChar__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSysDeadChar;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSysKeyDown__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSysKeyDown;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSysKeyUp__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSysKeyUp;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setCharCode(const val : Word);
function getCharCode : Word;
property CharCode : Word read getCharCode write setCharCode;
procedure setUnused(const val : Word);
function getUnused : Word;
property Unused : Word read getUnused write setUnused;
procedure setKeyData(const val : Longint);
function getKeyData : Longint;
property KeyData : Longint read getKeyData write setKeyData;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMSystemError__Wrapper = class(TDCRecordWrapper)
private
fR : TWMSystemError;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setErrSpec(const val : Word);
function getErrSpec : Word;
property ErrSpec : Word read getErrSpec write setErrSpec;
procedure setUnused(const val : Longint);
function getUnused : Longint;
property Unused : Longint read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMTimeChange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMTimeChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMTimer__Wrapper = class(TDCRecordWrapper)
private
fR : TWMTimer;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setTimerID(const val : Longint);
function getTimerID : Longint;
property TimerID : Longint read getTimerID write setTimerID;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMUndo__Wrapper = class(TDCRecordWrapper)
private
fR : TWMUndo;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMVKeyToItem__Wrapper = class(TDCRecordWrapper)
private
fR : TWMVKeyToItem;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setKey(const val : Word);
function getKey : Word;
property Key : Word read getKey write setKey;
procedure setCaretPos(const val : Word);
function getCaretPos : Word;
property CaretPos : Word read getCaretPos write setCaretPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMVScroll__Wrapper = class(TDCRecordWrapper)
private
fR : TWMVScroll;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setScrollCode(const val : SmallInt);
function getScrollCode : SmallInt;
property ScrollCode : SmallInt read getScrollCode write setScrollCode;
procedure setPos(const val : SmallInt);
function getPos : SmallInt;
property Pos : SmallInt read getPos write setPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMVScrollClipboard__Wrapper = class(TDCRecordWrapper)
private
fR : TWMVScrollClipboard;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setScollCode(const val : Word);
function getScollCode : Word;
property ScollCode : Word read getScollCode write setScollCode;
procedure setThumbPos(const val : Word);
function getThumbPos : Word;
property ThumbPos : Word read getThumbPos write setThumbPos;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMWindowPosChanged__Wrapper = class(TDCRecordWrapper)
private
fR : TWMWindowPosChanged;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMWindowPosChanging__Wrapper = class(TDCRecordWrapper)
private
fR : TWMWindowPosChanging;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMWindowPosMsg__Wrapper = class(TDCRecordWrapper)
private
fR : TWMWindowPosMsg;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
type __TWMWinIniChange__Wrapper = class(TDCRecordWrapper)
private
fR : TWMWinIniChange;
public
function GetRecordPtr : pointer; override;
published
procedure setMsg(const val : Cardinal);
function getMsg : Cardinal;
property Msg : Cardinal read getMsg write setMsg;
procedure setUnused(const val : Integer);
function getUnused : Integer;
property Unused : Integer read getUnused write setUnused;
procedure setResult(const val : Longint);
function getResult : Longint;
property Result : Longint read getResult write setResult;
end;
function __TMessage__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMessage__Wrapper.setMsg(const val : Cardinal);
begin
TMessage(GetRecordPtr^).Msg := val;
end;
function __TMessage__Wrapper.getMsg : Cardinal;
begin
result := TMessage(GetRecordPtr^).Msg;
end;
procedure __TMessage__Wrapper.setWParam(const val : Longint);
begin
TMessage(GetRecordPtr^).WParam := val;
end;
function __TMessage__Wrapper.getWParam : Longint;
begin
result := TMessage(GetRecordPtr^).WParam;
end;
procedure __TMessage__Wrapper.setLParam(const val : Longint);
begin
TMessage(GetRecordPtr^).LParam := val;
end;
function __TMessage__Wrapper.getLParam : Longint;
begin
result := TMessage(GetRecordPtr^).LParam;
end;
procedure __TMessage__Wrapper.setResult(const val : Longint);
begin
TMessage(GetRecordPtr^).Result := val;
end;
function __TMessage__Wrapper.getResult : Longint;
begin
result := TMessage(GetRecordPtr^).Result;
end;
procedure __TMessage__Wrapper.setWParamLo(const val : Word);
begin
TMessage(GetRecordPtr^).WParamLo := val;
end;
function __TMessage__Wrapper.getWParamLo : Word;
begin
result := TMessage(GetRecordPtr^).WParamLo;
end;
procedure __TMessage__Wrapper.setWParamHi(const val : Word);
begin
TMessage(GetRecordPtr^).WParamHi := val;
end;
function __TMessage__Wrapper.getWParamHi : Word;
begin
result := TMessage(GetRecordPtr^).WParamHi;
end;
procedure __TMessage__Wrapper.setLParamLo(const val : Word);
begin
TMessage(GetRecordPtr^).LParamLo := val;
end;
function __TMessage__Wrapper.getLParamLo : Word;
begin
result := TMessage(GetRecordPtr^).LParamLo;
end;
procedure __TMessage__Wrapper.setLParamHi(const val : Word);
begin
TMessage(GetRecordPtr^).LParamHi := val;
end;
function __TMessage__Wrapper.getLParamHi : Word;
begin
result := TMessage(GetRecordPtr^).LParamHi;
end;
procedure __TMessage__Wrapper.setResultLo(const val : Word);
begin
TMessage(GetRecordPtr^).ResultLo := val;
end;
function __TMessage__Wrapper.getResultLo : Word;
begin
result := TMessage(GetRecordPtr^).ResultLo;
end;
procedure __TMessage__Wrapper.setResultHi(const val : Word);
begin
TMessage(GetRecordPtr^).ResultHi := val;
end;
function __TMessage__Wrapper.getResultHi : Word;
begin
result := TMessage(GetRecordPtr^).ResultHi;
end;
function __TMSHMouseWheel__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TMSHMouseWheel__Wrapper.setMsg(const val : Cardinal);
begin
TMSHMouseWheel(GetRecordPtr^).Msg := val;
end;
function __TMSHMouseWheel__Wrapper.getMsg : Cardinal;
begin
result := TMSHMouseWheel(GetRecordPtr^).Msg;
end;
procedure __TMSHMouseWheel__Wrapper.setWheelDelta(const val : Integer);
begin
TMSHMouseWheel(GetRecordPtr^).WheelDelta := val;
end;
function __TMSHMouseWheel__Wrapper.getWheelDelta : Integer;
begin
result := TMSHMouseWheel(GetRecordPtr^).WheelDelta;
end;
procedure __TMSHMouseWheel__Wrapper.setXPos(const val : SmallInt);
begin
TMSHMouseWheel(GetRecordPtr^).XPos := val;
end;
function __TMSHMouseWheel__Wrapper.getXPos : SmallInt;
begin
result := TMSHMouseWheel(GetRecordPtr^).XPos;
end;
procedure __TMSHMouseWheel__Wrapper.setYPos(const val : SmallInt);
begin
TMSHMouseWheel(GetRecordPtr^).YPos := val;
end;
function __TMSHMouseWheel__Wrapper.getYPos : SmallInt;
begin
result := TMSHMouseWheel(GetRecordPtr^).YPos;
end;
procedure __TMSHMouseWheel__Wrapper.setResult(const val : Longint);
begin
TMSHMouseWheel(GetRecordPtr^).Result := val;
end;
function __TMSHMouseWheel__Wrapper.getResult : Longint;
begin
result := TMSHMouseWheel(GetRecordPtr^).Result;
end;
function __TWMActivate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMActivate__Wrapper.setMsg(const val : Cardinal);
begin
TWMActivate(GetRecordPtr^).Msg := val;
end;
function __TWMActivate__Wrapper.getMsg : Cardinal;
begin
result := TWMActivate(GetRecordPtr^).Msg;
end;
procedure __TWMActivate__Wrapper.setActive(const val : Word);
begin
TWMActivate(GetRecordPtr^).Active := val;
end;
function __TWMActivate__Wrapper.getActive : Word;
begin
result := TWMActivate(GetRecordPtr^).Active;
end;
procedure __TWMActivate__Wrapper.setMinimized(const val : WordBool);
begin
TWMActivate(GetRecordPtr^).Minimized := val;
end;
function __TWMActivate__Wrapper.getMinimized : WordBool;
begin
result := TWMActivate(GetRecordPtr^).Minimized;
end;
procedure __TWMActivate__Wrapper.setResult(const val : Longint);
begin
TWMActivate(GetRecordPtr^).Result := val;
end;
function __TWMActivate__Wrapper.getResult : Longint;
begin
result := TWMActivate(GetRecordPtr^).Result;
end;
function __TWMActivateApp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMActivateApp__Wrapper.setMsg(const val : Cardinal);
begin
TWMActivateApp(GetRecordPtr^).Msg := val;
end;
function __TWMActivateApp__Wrapper.getMsg : Cardinal;
begin
result := TWMActivateApp(GetRecordPtr^).Msg;
end;
procedure __TWMActivateApp__Wrapper.setActive(const val : BOOL);
begin
TWMActivateApp(GetRecordPtr^).Active := val;
end;
function __TWMActivateApp__Wrapper.getActive : BOOL;
begin
result := TWMActivateApp(GetRecordPtr^).Active;
end;
procedure __TWMActivateApp__Wrapper.setThreadId(const val : Longint);
begin
TWMActivateApp(GetRecordPtr^).ThreadId := val;
end;
function __TWMActivateApp__Wrapper.getThreadId : Longint;
begin
result := TWMActivateApp(GetRecordPtr^).ThreadId;
end;
procedure __TWMActivateApp__Wrapper.setResult(const val : Longint);
begin
TWMActivateApp(GetRecordPtr^).Result := val;
end;
function __TWMActivateApp__Wrapper.getResult : Longint;
begin
result := TWMActivateApp(GetRecordPtr^).Result;
end;
function __TWMAskCBFormatName__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMAskCBFormatName__Wrapper.setMsg(const val : Cardinal);
begin
TWMAskCBFormatName(GetRecordPtr^).Msg := val;
end;
function __TWMAskCBFormatName__Wrapper.getMsg : Cardinal;
begin
result := TWMAskCBFormatName(GetRecordPtr^).Msg;
end;
procedure __TWMAskCBFormatName__Wrapper.setNameLen(const val : Word);
begin
TWMAskCBFormatName(GetRecordPtr^).NameLen := val;
end;
function __TWMAskCBFormatName__Wrapper.getNameLen : Word;
begin
result := TWMAskCBFormatName(GetRecordPtr^).NameLen;
end;
procedure __TWMAskCBFormatName__Wrapper.setUnused(const val : Word);
begin
TWMAskCBFormatName(GetRecordPtr^).Unused := val;
end;
function __TWMAskCBFormatName__Wrapper.getUnused : Word;
begin
result := TWMAskCBFormatName(GetRecordPtr^).Unused;
end;
procedure __TWMAskCBFormatName__Wrapper.setResult(const val : Longint);
begin
TWMAskCBFormatName(GetRecordPtr^).Result := val;
end;
function __TWMAskCBFormatName__Wrapper.getResult : Longint;
begin
result := TWMAskCBFormatName(GetRecordPtr^).Result;
end;
function __TWMCancelMode__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCancelMode__Wrapper.setMsg(const val : Cardinal);
begin
TWMCancelMode(GetRecordPtr^).Msg := val;
end;
function __TWMCancelMode__Wrapper.getMsg : Cardinal;
begin
result := TWMCancelMode(GetRecordPtr^).Msg;
end;
procedure __TWMCancelMode__Wrapper.setResult(const val : Longint);
begin
TWMCancelMode(GetRecordPtr^).Result := val;
end;
function __TWMCancelMode__Wrapper.getResult : Longint;
begin
result := TWMCancelMode(GetRecordPtr^).Result;
end;
function __TWMChangeCBChain__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMChangeCBChain__Wrapper.setMsg(const val : Cardinal);
begin
TWMChangeCBChain(GetRecordPtr^).Msg := val;
end;
function __TWMChangeCBChain__Wrapper.getMsg : Cardinal;
begin
result := TWMChangeCBChain(GetRecordPtr^).Msg;
end;
procedure __TWMChangeCBChain__Wrapper.setResult(const val : Longint);
begin
TWMChangeCBChain(GetRecordPtr^).Result := val;
end;
function __TWMChangeCBChain__Wrapper.getResult : Longint;
begin
result := TWMChangeCBChain(GetRecordPtr^).Result;
end;
function __TWMChar__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMChar__Wrapper.setMsg(const val : Cardinal);
begin
TWMChar(GetRecordPtr^).Msg := val;
end;
function __TWMChar__Wrapper.getMsg : Cardinal;
begin
result := TWMChar(GetRecordPtr^).Msg;
end;
procedure __TWMChar__Wrapper.setCharCode(const val : Word);
begin
TWMChar(GetRecordPtr^).CharCode := val;
end;
function __TWMChar__Wrapper.getCharCode : Word;
begin
result := TWMChar(GetRecordPtr^).CharCode;
end;
procedure __TWMChar__Wrapper.setUnused(const val : Word);
begin
TWMChar(GetRecordPtr^).Unused := val;
end;
function __TWMChar__Wrapper.getUnused : Word;
begin
result := TWMChar(GetRecordPtr^).Unused;
end;
procedure __TWMChar__Wrapper.setKeyData(const val : Longint);
begin
TWMChar(GetRecordPtr^).KeyData := val;
end;
function __TWMChar__Wrapper.getKeyData : Longint;
begin
result := TWMChar(GetRecordPtr^).KeyData;
end;
procedure __TWMChar__Wrapper.setResult(const val : Longint);
begin
TWMChar(GetRecordPtr^).Result := val;
end;
function __TWMChar__Wrapper.getResult : Longint;
begin
result := TWMChar(GetRecordPtr^).Result;
end;
function __TWMCharToItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCharToItem__Wrapper.setMsg(const val : Cardinal);
begin
TWMCharToItem(GetRecordPtr^).Msg := val;
end;
function __TWMCharToItem__Wrapper.getMsg : Cardinal;
begin
result := TWMCharToItem(GetRecordPtr^).Msg;
end;
procedure __TWMCharToItem__Wrapper.setKey(const val : Word);
begin
TWMCharToItem(GetRecordPtr^).Key := val;
end;
function __TWMCharToItem__Wrapper.getKey : Word;
begin
result := TWMCharToItem(GetRecordPtr^).Key;
end;
procedure __TWMCharToItem__Wrapper.setCaretPos(const val : Word);
begin
TWMCharToItem(GetRecordPtr^).CaretPos := val;
end;
function __TWMCharToItem__Wrapper.getCaretPos : Word;
begin
result := TWMCharToItem(GetRecordPtr^).CaretPos;
end;
procedure __TWMCharToItem__Wrapper.setResult(const val : Longint);
begin
TWMCharToItem(GetRecordPtr^).Result := val;
end;
function __TWMCharToItem__Wrapper.getResult : Longint;
begin
result := TWMCharToItem(GetRecordPtr^).Result;
end;
function __TWMChildActivate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMChildActivate__Wrapper.setMsg(const val : Cardinal);
begin
TWMChildActivate(GetRecordPtr^).Msg := val;
end;
function __TWMChildActivate__Wrapper.getMsg : Cardinal;
begin
result := TWMChildActivate(GetRecordPtr^).Msg;
end;
procedure __TWMChildActivate__Wrapper.setResult(const val : Longint);
begin
TWMChildActivate(GetRecordPtr^).Result := val;
end;
function __TWMChildActivate__Wrapper.getResult : Longint;
begin
result := TWMChildActivate(GetRecordPtr^).Result;
end;
function __TWMChooseFont_GetLogFont__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMChooseFont_GetLogFont__Wrapper.setMsg(const val : Cardinal);
begin
TWMChooseFont_GetLogFont(GetRecordPtr^).Msg := val;
end;
function __TWMChooseFont_GetLogFont__Wrapper.getMsg : Cardinal;
begin
result := TWMChooseFont_GetLogFont(GetRecordPtr^).Msg;
end;
procedure __TWMChooseFont_GetLogFont__Wrapper.setUnused(const val : Longint);
begin
TWMChooseFont_GetLogFont(GetRecordPtr^).Unused := val;
end;
function __TWMChooseFont_GetLogFont__Wrapper.getUnused : Longint;
begin
result := TWMChooseFont_GetLogFont(GetRecordPtr^).Unused;
end;
procedure __TWMChooseFont_GetLogFont__Wrapper.setResult(const val : Longint);
begin
TWMChooseFont_GetLogFont(GetRecordPtr^).Result := val;
end;
function __TWMChooseFont_GetLogFont__Wrapper.getResult : Longint;
begin
result := TWMChooseFont_GetLogFont(GetRecordPtr^).Result;
end;
function __TWMClear__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMClear__Wrapper.setMsg(const val : Cardinal);
begin
TWMClear(GetRecordPtr^).Msg := val;
end;
function __TWMClear__Wrapper.getMsg : Cardinal;
begin
result := TWMClear(GetRecordPtr^).Msg;
end;
procedure __TWMClear__Wrapper.setResult(const val : Longint);
begin
TWMClear(GetRecordPtr^).Result := val;
end;
function __TWMClear__Wrapper.getResult : Longint;
begin
result := TWMClear(GetRecordPtr^).Result;
end;
function __TWMClose__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMClose__Wrapper.setMsg(const val : Cardinal);
begin
TWMClose(GetRecordPtr^).Msg := val;
end;
function __TWMClose__Wrapper.getMsg : Cardinal;
begin
result := TWMClose(GetRecordPtr^).Msg;
end;
procedure __TWMClose__Wrapper.setResult(const val : Longint);
begin
TWMClose(GetRecordPtr^).Result := val;
end;
function __TWMClose__Wrapper.getResult : Longint;
begin
result := TWMClose(GetRecordPtr^).Result;
end;
function __TWMCommand__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCommand__Wrapper.setMsg(const val : Cardinal);
begin
TWMCommand(GetRecordPtr^).Msg := val;
end;
function __TWMCommand__Wrapper.getMsg : Cardinal;
begin
result := TWMCommand(GetRecordPtr^).Msg;
end;
procedure __TWMCommand__Wrapper.setItemID(const val : Word);
begin
TWMCommand(GetRecordPtr^).ItemID := val;
end;
function __TWMCommand__Wrapper.getItemID : Word;
begin
result := TWMCommand(GetRecordPtr^).ItemID;
end;
procedure __TWMCommand__Wrapper.setNotifyCode(const val : Word);
begin
TWMCommand(GetRecordPtr^).NotifyCode := val;
end;
function __TWMCommand__Wrapper.getNotifyCode : Word;
begin
result := TWMCommand(GetRecordPtr^).NotifyCode;
end;
procedure __TWMCommand__Wrapper.setResult(const val : Longint);
begin
TWMCommand(GetRecordPtr^).Result := val;
end;
function __TWMCommand__Wrapper.getResult : Longint;
begin
result := TWMCommand(GetRecordPtr^).Result;
end;
function __TWMCompacting__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCompacting__Wrapper.setMsg(const val : Cardinal);
begin
TWMCompacting(GetRecordPtr^).Msg := val;
end;
function __TWMCompacting__Wrapper.getMsg : Cardinal;
begin
result := TWMCompacting(GetRecordPtr^).Msg;
end;
procedure __TWMCompacting__Wrapper.setCompactRatio(const val : Longint);
begin
TWMCompacting(GetRecordPtr^).CompactRatio := val;
end;
function __TWMCompacting__Wrapper.getCompactRatio : Longint;
begin
result := TWMCompacting(GetRecordPtr^).CompactRatio;
end;
procedure __TWMCompacting__Wrapper.setUnused(const val : Longint);
begin
TWMCompacting(GetRecordPtr^).Unused := val;
end;
function __TWMCompacting__Wrapper.getUnused : Longint;
begin
result := TWMCompacting(GetRecordPtr^).Unused;
end;
procedure __TWMCompacting__Wrapper.setResult(const val : Longint);
begin
TWMCompacting(GetRecordPtr^).Result := val;
end;
function __TWMCompacting__Wrapper.getResult : Longint;
begin
result := TWMCompacting(GetRecordPtr^).Result;
end;
function __TWMCompareItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCompareItem__Wrapper.setMsg(const val : Cardinal);
begin
TWMCompareItem(GetRecordPtr^).Msg := val;
end;
function __TWMCompareItem__Wrapper.getMsg : Cardinal;
begin
result := TWMCompareItem(GetRecordPtr^).Msg;
end;
procedure __TWMCompareItem__Wrapper.setResult(const val : Longint);
begin
TWMCompareItem(GetRecordPtr^).Result := val;
end;
function __TWMCompareItem__Wrapper.getResult : Longint;
begin
result := TWMCompareItem(GetRecordPtr^).Result;
end;
function __TWMCopy__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCopy__Wrapper.setMsg(const val : Cardinal);
begin
TWMCopy(GetRecordPtr^).Msg := val;
end;
function __TWMCopy__Wrapper.getMsg : Cardinal;
begin
result := TWMCopy(GetRecordPtr^).Msg;
end;
procedure __TWMCopy__Wrapper.setResult(const val : Longint);
begin
TWMCopy(GetRecordPtr^).Result := val;
end;
function __TWMCopy__Wrapper.getResult : Longint;
begin
result := TWMCopy(GetRecordPtr^).Result;
end;
function __TWMCopyData__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCopyData__Wrapper.setMsg(const val : Cardinal);
begin
TWMCopyData(GetRecordPtr^).Msg := val;
end;
function __TWMCopyData__Wrapper.getMsg : Cardinal;
begin
result := TWMCopyData(GetRecordPtr^).Msg;
end;
procedure __TWMCopyData__Wrapper.setResult(const val : Longint);
begin
TWMCopyData(GetRecordPtr^).Result := val;
end;
function __TWMCopyData__Wrapper.getResult : Longint;
begin
result := TWMCopyData(GetRecordPtr^).Result;
end;
function __TWMCreate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCreate__Wrapper.setMsg(const val : Cardinal);
begin
TWMCreate(GetRecordPtr^).Msg := val;
end;
function __TWMCreate__Wrapper.getMsg : Cardinal;
begin
result := TWMCreate(GetRecordPtr^).Msg;
end;
procedure __TWMCreate__Wrapper.setUnused(const val : Integer);
begin
TWMCreate(GetRecordPtr^).Unused := val;
end;
function __TWMCreate__Wrapper.getUnused : Integer;
begin
result := TWMCreate(GetRecordPtr^).Unused;
end;
procedure __TWMCreate__Wrapper.setResult(const val : Longint);
begin
TWMCreate(GetRecordPtr^).Result := val;
end;
function __TWMCreate__Wrapper.getResult : Longint;
begin
result := TWMCreate(GetRecordPtr^).Result;
end;
function __TWMCtlColor__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCtlColor__Wrapper.setMsg(const val : Cardinal);
begin
TWMCtlColor(GetRecordPtr^).Msg := val;
end;
function __TWMCtlColor__Wrapper.getMsg : Cardinal;
begin
result := TWMCtlColor(GetRecordPtr^).Msg;
end;
procedure __TWMCtlColor__Wrapper.setResult(const val : Longint);
begin
TWMCtlColor(GetRecordPtr^).Result := val;
end;
function __TWMCtlColor__Wrapper.getResult : Longint;
begin
result := TWMCtlColor(GetRecordPtr^).Result;
end;
function __TWMCtlColorBtn__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCtlColorBtn__Wrapper.setMsg(const val : Cardinal);
begin
TWMCtlColorBtn(GetRecordPtr^).Msg := val;
end;
function __TWMCtlColorBtn__Wrapper.getMsg : Cardinal;
begin
result := TWMCtlColorBtn(GetRecordPtr^).Msg;
end;
procedure __TWMCtlColorBtn__Wrapper.setResult(const val : Longint);
begin
TWMCtlColorBtn(GetRecordPtr^).Result := val;
end;
function __TWMCtlColorBtn__Wrapper.getResult : Longint;
begin
result := TWMCtlColorBtn(GetRecordPtr^).Result;
end;
function __TWMCtlColorDlg__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCtlColorDlg__Wrapper.setMsg(const val : Cardinal);
begin
TWMCtlColorDlg(GetRecordPtr^).Msg := val;
end;
function __TWMCtlColorDlg__Wrapper.getMsg : Cardinal;
begin
result := TWMCtlColorDlg(GetRecordPtr^).Msg;
end;
procedure __TWMCtlColorDlg__Wrapper.setResult(const val : Longint);
begin
TWMCtlColorDlg(GetRecordPtr^).Result := val;
end;
function __TWMCtlColorDlg__Wrapper.getResult : Longint;
begin
result := TWMCtlColorDlg(GetRecordPtr^).Result;
end;
function __TWMCtlColorEdit__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCtlColorEdit__Wrapper.setMsg(const val : Cardinal);
begin
TWMCtlColorEdit(GetRecordPtr^).Msg := val;
end;
function __TWMCtlColorEdit__Wrapper.getMsg : Cardinal;
begin
result := TWMCtlColorEdit(GetRecordPtr^).Msg;
end;
procedure __TWMCtlColorEdit__Wrapper.setResult(const val : Longint);
begin
TWMCtlColorEdit(GetRecordPtr^).Result := val;
end;
function __TWMCtlColorEdit__Wrapper.getResult : Longint;
begin
result := TWMCtlColorEdit(GetRecordPtr^).Result;
end;
function __TWMCtlColorListbox__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCtlColorListbox__Wrapper.setMsg(const val : Cardinal);
begin
TWMCtlColorListbox(GetRecordPtr^).Msg := val;
end;
function __TWMCtlColorListbox__Wrapper.getMsg : Cardinal;
begin
result := TWMCtlColorListbox(GetRecordPtr^).Msg;
end;
procedure __TWMCtlColorListbox__Wrapper.setResult(const val : Longint);
begin
TWMCtlColorListbox(GetRecordPtr^).Result := val;
end;
function __TWMCtlColorListbox__Wrapper.getResult : Longint;
begin
result := TWMCtlColorListbox(GetRecordPtr^).Result;
end;
function __TWMCtlColorMsgbox__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCtlColorMsgbox__Wrapper.setMsg(const val : Cardinal);
begin
TWMCtlColorMsgbox(GetRecordPtr^).Msg := val;
end;
function __TWMCtlColorMsgbox__Wrapper.getMsg : Cardinal;
begin
result := TWMCtlColorMsgbox(GetRecordPtr^).Msg;
end;
procedure __TWMCtlColorMsgbox__Wrapper.setResult(const val : Longint);
begin
TWMCtlColorMsgbox(GetRecordPtr^).Result := val;
end;
function __TWMCtlColorMsgbox__Wrapper.getResult : Longint;
begin
result := TWMCtlColorMsgbox(GetRecordPtr^).Result;
end;
function __TWMCtlColorScrollbar__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCtlColorScrollbar__Wrapper.setMsg(const val : Cardinal);
begin
TWMCtlColorScrollbar(GetRecordPtr^).Msg := val;
end;
function __TWMCtlColorScrollbar__Wrapper.getMsg : Cardinal;
begin
result := TWMCtlColorScrollbar(GetRecordPtr^).Msg;
end;
procedure __TWMCtlColorScrollbar__Wrapper.setResult(const val : Longint);
begin
TWMCtlColorScrollbar(GetRecordPtr^).Result := val;
end;
function __TWMCtlColorScrollbar__Wrapper.getResult : Longint;
begin
result := TWMCtlColorScrollbar(GetRecordPtr^).Result;
end;
function __TWMCtlColorStatic__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCtlColorStatic__Wrapper.setMsg(const val : Cardinal);
begin
TWMCtlColorStatic(GetRecordPtr^).Msg := val;
end;
function __TWMCtlColorStatic__Wrapper.getMsg : Cardinal;
begin
result := TWMCtlColorStatic(GetRecordPtr^).Msg;
end;
procedure __TWMCtlColorStatic__Wrapper.setResult(const val : Longint);
begin
TWMCtlColorStatic(GetRecordPtr^).Result := val;
end;
function __TWMCtlColorStatic__Wrapper.getResult : Longint;
begin
result := TWMCtlColorStatic(GetRecordPtr^).Result;
end;
function __TWMCut__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMCut__Wrapper.setMsg(const val : Cardinal);
begin
TWMCut(GetRecordPtr^).Msg := val;
end;
function __TWMCut__Wrapper.getMsg : Cardinal;
begin
result := TWMCut(GetRecordPtr^).Msg;
end;
procedure __TWMCut__Wrapper.setResult(const val : Longint);
begin
TWMCut(GetRecordPtr^).Result := val;
end;
function __TWMCut__Wrapper.getResult : Longint;
begin
result := TWMCut(GetRecordPtr^).Result;
end;
function __TWMDDE_Ack__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Ack__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Ack(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Ack__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Ack(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Ack__Wrapper.setApp(const val : Word);
begin
TWMDDE_Ack(GetRecordPtr^).App := val;
end;
function __TWMDDE_Ack__Wrapper.getApp : Word;
begin
result := TWMDDE_Ack(GetRecordPtr^).App;
end;
procedure __TWMDDE_Ack__Wrapper.setTopic(const val : Word);
begin
TWMDDE_Ack(GetRecordPtr^).Topic := val;
end;
function __TWMDDE_Ack__Wrapper.getTopic : Word;
begin
result := TWMDDE_Ack(GetRecordPtr^).Topic;
end;
procedure __TWMDDE_Ack__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Ack(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Ack__Wrapper.getResult : Longint;
begin
result := TWMDDE_Ack(GetRecordPtr^).Result;
end;
procedure __TWMDDE_Ack__Wrapper.setPackedVal(const val : Longint);
begin
TWMDDE_Ack(GetRecordPtr^).PackedVal := val;
end;
function __TWMDDE_Ack__Wrapper.getPackedVal : Longint;
begin
result := TWMDDE_Ack(GetRecordPtr^).PackedVal;
end;
function __TWMDDE_Advise__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Advise__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Advise(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Advise__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Advise(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Advise__Wrapper.setPackedVal(const val : Longint);
begin
TWMDDE_Advise(GetRecordPtr^).PackedVal := val;
end;
function __TWMDDE_Advise__Wrapper.getPackedVal : Longint;
begin
result := TWMDDE_Advise(GetRecordPtr^).PackedVal;
end;
procedure __TWMDDE_Advise__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Advise(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Advise__Wrapper.getResult : Longint;
begin
result := TWMDDE_Advise(GetRecordPtr^).Result;
end;
function __TWMDDE_Data__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Data__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Data(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Data__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Data(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Data__Wrapper.setPackedVal(const val : Longint);
begin
TWMDDE_Data(GetRecordPtr^).PackedVal := val;
end;
function __TWMDDE_Data__Wrapper.getPackedVal : Longint;
begin
result := TWMDDE_Data(GetRecordPtr^).PackedVal;
end;
procedure __TWMDDE_Data__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Data(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Data__Wrapper.getResult : Longint;
begin
result := TWMDDE_Data(GetRecordPtr^).Result;
end;
function __TWMDDE_Execute__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Execute__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Execute(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Execute__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Execute(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Execute__Wrapper.setCommands(const val : THandle);
begin
TWMDDE_Execute(GetRecordPtr^).Commands := val;
end;
function __TWMDDE_Execute__Wrapper.getCommands : THandle;
begin
result := TWMDDE_Execute(GetRecordPtr^).Commands;
end;
procedure __TWMDDE_Execute__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Execute(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Execute__Wrapper.getResult : Longint;
begin
result := TWMDDE_Execute(GetRecordPtr^).Result;
end;
function __TWMDDE_Initiate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Initiate__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Initiate(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Initiate__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Initiate(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Initiate__Wrapper.setApp(const val : Word);
begin
TWMDDE_Initiate(GetRecordPtr^).App := val;
end;
function __TWMDDE_Initiate__Wrapper.getApp : Word;
begin
result := TWMDDE_Initiate(GetRecordPtr^).App;
end;
procedure __TWMDDE_Initiate__Wrapper.setTopic(const val : Word);
begin
TWMDDE_Initiate(GetRecordPtr^).Topic := val;
end;
function __TWMDDE_Initiate__Wrapper.getTopic : Word;
begin
result := TWMDDE_Initiate(GetRecordPtr^).Topic;
end;
procedure __TWMDDE_Initiate__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Initiate(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Initiate__Wrapper.getResult : Longint;
begin
result := TWMDDE_Initiate(GetRecordPtr^).Result;
end;
function __TWMDDE_Poke__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Poke__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Poke(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Poke__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Poke(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Poke__Wrapper.setPackedVal(const val : Longint);
begin
TWMDDE_Poke(GetRecordPtr^).PackedVal := val;
end;
function __TWMDDE_Poke__Wrapper.getPackedVal : Longint;
begin
result := TWMDDE_Poke(GetRecordPtr^).PackedVal;
end;
procedure __TWMDDE_Poke__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Poke(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Poke__Wrapper.getResult : Longint;
begin
result := TWMDDE_Poke(GetRecordPtr^).Result;
end;
function __TWMDDE_Request__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Request__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Request(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Request__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Request(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Request__Wrapper.setFormat(const val : Word);
begin
TWMDDE_Request(GetRecordPtr^).Format := val;
end;
function __TWMDDE_Request__Wrapper.getFormat : Word;
begin
result := TWMDDE_Request(GetRecordPtr^).Format;
end;
procedure __TWMDDE_Request__Wrapper.setItem(const val : Word);
begin
TWMDDE_Request(GetRecordPtr^).Item := val;
end;
function __TWMDDE_Request__Wrapper.getItem : Word;
begin
result := TWMDDE_Request(GetRecordPtr^).Item;
end;
procedure __TWMDDE_Request__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Request(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Request__Wrapper.getResult : Longint;
begin
result := TWMDDE_Request(GetRecordPtr^).Result;
end;
function __TWMDDE_Terminate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Terminate__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Terminate(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Terminate__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Terminate(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Terminate__Wrapper.setUnused(const val : Longint);
begin
TWMDDE_Terminate(GetRecordPtr^).Unused := val;
end;
function __TWMDDE_Terminate__Wrapper.getUnused : Longint;
begin
result := TWMDDE_Terminate(GetRecordPtr^).Unused;
end;
procedure __TWMDDE_Terminate__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Terminate(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Terminate__Wrapper.getResult : Longint;
begin
result := TWMDDE_Terminate(GetRecordPtr^).Result;
end;
function __TWMDDE_Unadvise__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDDE_Unadvise__Wrapper.setMsg(const val : Cardinal);
begin
TWMDDE_Unadvise(GetRecordPtr^).Msg := val;
end;
function __TWMDDE_Unadvise__Wrapper.getMsg : Cardinal;
begin
result := TWMDDE_Unadvise(GetRecordPtr^).Msg;
end;
procedure __TWMDDE_Unadvise__Wrapper.setFormat(const val : Word);
begin
TWMDDE_Unadvise(GetRecordPtr^).Format := val;
end;
function __TWMDDE_Unadvise__Wrapper.getFormat : Word;
begin
result := TWMDDE_Unadvise(GetRecordPtr^).Format;
end;
procedure __TWMDDE_Unadvise__Wrapper.setItem(const val : Word);
begin
TWMDDE_Unadvise(GetRecordPtr^).Item := val;
end;
function __TWMDDE_Unadvise__Wrapper.getItem : Word;
begin
result := TWMDDE_Unadvise(GetRecordPtr^).Item;
end;
procedure __TWMDDE_Unadvise__Wrapper.setResult(const val : Longint);
begin
TWMDDE_Unadvise(GetRecordPtr^).Result := val;
end;
function __TWMDDE_Unadvise__Wrapper.getResult : Longint;
begin
result := TWMDDE_Unadvise(GetRecordPtr^).Result;
end;
function __TWMDeadChar__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDeadChar__Wrapper.setMsg(const val : Cardinal);
begin
TWMDeadChar(GetRecordPtr^).Msg := val;
end;
function __TWMDeadChar__Wrapper.getMsg : Cardinal;
begin
result := TWMDeadChar(GetRecordPtr^).Msg;
end;
procedure __TWMDeadChar__Wrapper.setCharCode(const val : Word);
begin
TWMDeadChar(GetRecordPtr^).CharCode := val;
end;
function __TWMDeadChar__Wrapper.getCharCode : Word;
begin
result := TWMDeadChar(GetRecordPtr^).CharCode;
end;
procedure __TWMDeadChar__Wrapper.setUnused(const val : Word);
begin
TWMDeadChar(GetRecordPtr^).Unused := val;
end;
function __TWMDeadChar__Wrapper.getUnused : Word;
begin
result := TWMDeadChar(GetRecordPtr^).Unused;
end;
procedure __TWMDeadChar__Wrapper.setKeyData(const val : Longint);
begin
TWMDeadChar(GetRecordPtr^).KeyData := val;
end;
function __TWMDeadChar__Wrapper.getKeyData : Longint;
begin
result := TWMDeadChar(GetRecordPtr^).KeyData;
end;
procedure __TWMDeadChar__Wrapper.setResult(const val : Longint);
begin
TWMDeadChar(GetRecordPtr^).Result := val;
end;
function __TWMDeadChar__Wrapper.getResult : Longint;
begin
result := TWMDeadChar(GetRecordPtr^).Result;
end;
function __TWMDeleteItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDeleteItem__Wrapper.setMsg(const val : Cardinal);
begin
TWMDeleteItem(GetRecordPtr^).Msg := val;
end;
function __TWMDeleteItem__Wrapper.getMsg : Cardinal;
begin
result := TWMDeleteItem(GetRecordPtr^).Msg;
end;
procedure __TWMDeleteItem__Wrapper.setResult(const val : Longint);
begin
TWMDeleteItem(GetRecordPtr^).Result := val;
end;
function __TWMDeleteItem__Wrapper.getResult : Longint;
begin
result := TWMDeleteItem(GetRecordPtr^).Result;
end;
function __TWMDestroy__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDestroy__Wrapper.setMsg(const val : Cardinal);
begin
TWMDestroy(GetRecordPtr^).Msg := val;
end;
function __TWMDestroy__Wrapper.getMsg : Cardinal;
begin
result := TWMDestroy(GetRecordPtr^).Msg;
end;
procedure __TWMDestroy__Wrapper.setResult(const val : Longint);
begin
TWMDestroy(GetRecordPtr^).Result := val;
end;
function __TWMDestroy__Wrapper.getResult : Longint;
begin
result := TWMDestroy(GetRecordPtr^).Result;
end;
function __TWMDestroyClipboard__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDestroyClipboard__Wrapper.setMsg(const val : Cardinal);
begin
TWMDestroyClipboard(GetRecordPtr^).Msg := val;
end;
function __TWMDestroyClipboard__Wrapper.getMsg : Cardinal;
begin
result := TWMDestroyClipboard(GetRecordPtr^).Msg;
end;
procedure __TWMDestroyClipboard__Wrapper.setResult(const val : Longint);
begin
TWMDestroyClipboard(GetRecordPtr^).Result := val;
end;
function __TWMDestroyClipboard__Wrapper.getResult : Longint;
begin
result := TWMDestroyClipboard(GetRecordPtr^).Result;
end;
function __TWMDevModeChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDevModeChange__Wrapper.setMsg(const val : Cardinal);
begin
TWMDevModeChange(GetRecordPtr^).Msg := val;
end;
function __TWMDevModeChange__Wrapper.getMsg : Cardinal;
begin
result := TWMDevModeChange(GetRecordPtr^).Msg;
end;
procedure __TWMDevModeChange__Wrapper.setUnused(const val : Integer);
begin
TWMDevModeChange(GetRecordPtr^).Unused := val;
end;
function __TWMDevModeChange__Wrapper.getUnused : Integer;
begin
result := TWMDevModeChange(GetRecordPtr^).Unused;
end;
procedure __TWMDevModeChange__Wrapper.setResult(const val : Longint);
begin
TWMDevModeChange(GetRecordPtr^).Result := val;
end;
function __TWMDevModeChange__Wrapper.getResult : Longint;
begin
result := TWMDevModeChange(GetRecordPtr^).Result;
end;
function __TWMDisplayChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDisplayChange__Wrapper.setMsg(const val : Cardinal);
begin
TWMDisplayChange(GetRecordPtr^).Msg := val;
end;
function __TWMDisplayChange__Wrapper.getMsg : Cardinal;
begin
result := TWMDisplayChange(GetRecordPtr^).Msg;
end;
procedure __TWMDisplayChange__Wrapper.setBitsPerPixel(const val : Integer);
begin
TWMDisplayChange(GetRecordPtr^).BitsPerPixel := val;
end;
function __TWMDisplayChange__Wrapper.getBitsPerPixel : Integer;
begin
result := TWMDisplayChange(GetRecordPtr^).BitsPerPixel;
end;
procedure __TWMDisplayChange__Wrapper.setWidth(const val : Word);
begin
TWMDisplayChange(GetRecordPtr^).Width := val;
end;
function __TWMDisplayChange__Wrapper.getWidth : Word;
begin
result := TWMDisplayChange(GetRecordPtr^).Width;
end;
procedure __TWMDisplayChange__Wrapper.setHeight(const val : Word);
begin
TWMDisplayChange(GetRecordPtr^).Height := val;
end;
function __TWMDisplayChange__Wrapper.getHeight : Word;
begin
result := TWMDisplayChange(GetRecordPtr^).Height;
end;
function __TWMDrawClipboard__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDrawClipboard__Wrapper.setMsg(const val : Cardinal);
begin
TWMDrawClipboard(GetRecordPtr^).Msg := val;
end;
function __TWMDrawClipboard__Wrapper.getMsg : Cardinal;
begin
result := TWMDrawClipboard(GetRecordPtr^).Msg;
end;
procedure __TWMDrawClipboard__Wrapper.setResult(const val : Longint);
begin
TWMDrawClipboard(GetRecordPtr^).Result := val;
end;
function __TWMDrawClipboard__Wrapper.getResult : Longint;
begin
result := TWMDrawClipboard(GetRecordPtr^).Result;
end;
function __TWMDrawItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDrawItem__Wrapper.setMsg(const val : Cardinal);
begin
TWMDrawItem(GetRecordPtr^).Msg := val;
end;
function __TWMDrawItem__Wrapper.getMsg : Cardinal;
begin
result := TWMDrawItem(GetRecordPtr^).Msg;
end;
procedure __TWMDrawItem__Wrapper.setResult(const val : Longint);
begin
TWMDrawItem(GetRecordPtr^).Result := val;
end;
function __TWMDrawItem__Wrapper.getResult : Longint;
begin
result := TWMDrawItem(GetRecordPtr^).Result;
end;
function __TWMDropFiles__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMDropFiles__Wrapper.setMsg(const val : Cardinal);
begin
TWMDropFiles(GetRecordPtr^).Msg := val;
end;
function __TWMDropFiles__Wrapper.getMsg : Cardinal;
begin
result := TWMDropFiles(GetRecordPtr^).Msg;
end;
procedure __TWMDropFiles__Wrapper.setDrop(const val : THandle);
begin
TWMDropFiles(GetRecordPtr^).Drop := val;
end;
function __TWMDropFiles__Wrapper.getDrop : THandle;
begin
result := TWMDropFiles(GetRecordPtr^).Drop;
end;
procedure __TWMDropFiles__Wrapper.setUnused(const val : Longint);
begin
TWMDropFiles(GetRecordPtr^).Unused := val;
end;
function __TWMDropFiles__Wrapper.getUnused : Longint;
begin
result := TWMDropFiles(GetRecordPtr^).Unused;
end;
procedure __TWMDropFiles__Wrapper.setResult(const val : Longint);
begin
TWMDropFiles(GetRecordPtr^).Result := val;
end;
function __TWMDropFiles__Wrapper.getResult : Longint;
begin
result := TWMDropFiles(GetRecordPtr^).Result;
end;
function __TWMEnable__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMEnable__Wrapper.setMsg(const val : Cardinal);
begin
TWMEnable(GetRecordPtr^).Msg := val;
end;
function __TWMEnable__Wrapper.getMsg : Cardinal;
begin
result := TWMEnable(GetRecordPtr^).Msg;
end;
procedure __TWMEnable__Wrapper.setEnabled(const val : LongBool);
begin
TWMEnable(GetRecordPtr^).Enabled := val;
end;
function __TWMEnable__Wrapper.getEnabled : LongBool;
begin
result := TWMEnable(GetRecordPtr^).Enabled;
end;
procedure __TWMEnable__Wrapper.setUnused(const val : Longint);
begin
TWMEnable(GetRecordPtr^).Unused := val;
end;
function __TWMEnable__Wrapper.getUnused : Longint;
begin
result := TWMEnable(GetRecordPtr^).Unused;
end;
procedure __TWMEnable__Wrapper.setResult(const val : Longint);
begin
TWMEnable(GetRecordPtr^).Result := val;
end;
function __TWMEnable__Wrapper.getResult : Longint;
begin
result := TWMEnable(GetRecordPtr^).Result;
end;
function __TWMEndSession__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMEndSession__Wrapper.setMsg(const val : Cardinal);
begin
TWMEndSession(GetRecordPtr^).Msg := val;
end;
function __TWMEndSession__Wrapper.getMsg : Cardinal;
begin
result := TWMEndSession(GetRecordPtr^).Msg;
end;
procedure __TWMEndSession__Wrapper.setEndSession(const val : LongBool);
begin
TWMEndSession(GetRecordPtr^).EndSession := val;
end;
function __TWMEndSession__Wrapper.getEndSession : LongBool;
begin
result := TWMEndSession(GetRecordPtr^).EndSession;
end;
procedure __TWMEndSession__Wrapper.setUnused(const val : Longint);
begin
TWMEndSession(GetRecordPtr^).Unused := val;
end;
function __TWMEndSession__Wrapper.getUnused : Longint;
begin
result := TWMEndSession(GetRecordPtr^).Unused;
end;
procedure __TWMEndSession__Wrapper.setResult(const val : Longint);
begin
TWMEndSession(GetRecordPtr^).Result := val;
end;
function __TWMEndSession__Wrapper.getResult : Longint;
begin
result := TWMEndSession(GetRecordPtr^).Result;
end;
function __TWMEnterIdle__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMEnterIdle__Wrapper.setMsg(const val : Cardinal);
begin
TWMEnterIdle(GetRecordPtr^).Msg := val;
end;
function __TWMEnterIdle__Wrapper.getMsg : Cardinal;
begin
result := TWMEnterIdle(GetRecordPtr^).Msg;
end;
procedure __TWMEnterIdle__Wrapper.setSource(const val : Longint);
begin
TWMEnterIdle(GetRecordPtr^).Source := val;
end;
function __TWMEnterIdle__Wrapper.getSource : Longint;
begin
result := TWMEnterIdle(GetRecordPtr^).Source;
end;
procedure __TWMEnterIdle__Wrapper.setResult(const val : Longint);
begin
TWMEnterIdle(GetRecordPtr^).Result := val;
end;
function __TWMEnterIdle__Wrapper.getResult : Longint;
begin
result := TWMEnterIdle(GetRecordPtr^).Result;
end;
function __TWMEnterMenuLoop__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMEnterMenuLoop__Wrapper.setMsg(const val : Cardinal);
begin
TWMEnterMenuLoop(GetRecordPtr^).Msg := val;
end;
function __TWMEnterMenuLoop__Wrapper.getMsg : Cardinal;
begin
result := TWMEnterMenuLoop(GetRecordPtr^).Msg;
end;
procedure __TWMEnterMenuLoop__Wrapper.setIsTrackPopupMenu(const val : LongBool);
begin
TWMEnterMenuLoop(GetRecordPtr^).IsTrackPopupMenu := val;
end;
function __TWMEnterMenuLoop__Wrapper.getIsTrackPopupMenu : LongBool;
begin
result := TWMEnterMenuLoop(GetRecordPtr^).IsTrackPopupMenu;
end;
procedure __TWMEnterMenuLoop__Wrapper.setUnused(const val : Longint);
begin
TWMEnterMenuLoop(GetRecordPtr^).Unused := val;
end;
function __TWMEnterMenuLoop__Wrapper.getUnused : Longint;
begin
result := TWMEnterMenuLoop(GetRecordPtr^).Unused;
end;
procedure __TWMEnterMenuLoop__Wrapper.setResult(const val : Longint);
begin
TWMEnterMenuLoop(GetRecordPtr^).Result := val;
end;
function __TWMEnterMenuLoop__Wrapper.getResult : Longint;
begin
result := TWMEnterMenuLoop(GetRecordPtr^).Result;
end;
function __TWMEraseBkgnd__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMEraseBkgnd__Wrapper.setMsg(const val : Cardinal);
begin
TWMEraseBkgnd(GetRecordPtr^).Msg := val;
end;
function __TWMEraseBkgnd__Wrapper.getMsg : Cardinal;
begin
result := TWMEraseBkgnd(GetRecordPtr^).Msg;
end;
procedure __TWMEraseBkgnd__Wrapper.setUnused(const val : Longint);
begin
TWMEraseBkgnd(GetRecordPtr^).Unused := val;
end;
function __TWMEraseBkgnd__Wrapper.getUnused : Longint;
begin
result := TWMEraseBkgnd(GetRecordPtr^).Unused;
end;
procedure __TWMEraseBkgnd__Wrapper.setResult(const val : Longint);
begin
TWMEraseBkgnd(GetRecordPtr^).Result := val;
end;
function __TWMEraseBkgnd__Wrapper.getResult : Longint;
begin
result := TWMEraseBkgnd(GetRecordPtr^).Result;
end;
function __TWMExitMenuLoop__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMExitMenuLoop__Wrapper.setMsg(const val : Cardinal);
begin
TWMExitMenuLoop(GetRecordPtr^).Msg := val;
end;
function __TWMExitMenuLoop__Wrapper.getMsg : Cardinal;
begin
result := TWMExitMenuLoop(GetRecordPtr^).Msg;
end;
procedure __TWMExitMenuLoop__Wrapper.setIsTrackPopupMenu(const val : LongBool);
begin
TWMExitMenuLoop(GetRecordPtr^).IsTrackPopupMenu := val;
end;
function __TWMExitMenuLoop__Wrapper.getIsTrackPopupMenu : LongBool;
begin
result := TWMExitMenuLoop(GetRecordPtr^).IsTrackPopupMenu;
end;
procedure __TWMExitMenuLoop__Wrapper.setUnused(const val : Longint);
begin
TWMExitMenuLoop(GetRecordPtr^).Unused := val;
end;
function __TWMExitMenuLoop__Wrapper.getUnused : Longint;
begin
result := TWMExitMenuLoop(GetRecordPtr^).Unused;
end;
procedure __TWMExitMenuLoop__Wrapper.setResult(const val : Longint);
begin
TWMExitMenuLoop(GetRecordPtr^).Result := val;
end;
function __TWMExitMenuLoop__Wrapper.getResult : Longint;
begin
result := TWMExitMenuLoop(GetRecordPtr^).Result;
end;
function __TWMFontChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMFontChange__Wrapper.setMsg(const val : Cardinal);
begin
TWMFontChange(GetRecordPtr^).Msg := val;
end;
function __TWMFontChange__Wrapper.getMsg : Cardinal;
begin
result := TWMFontChange(GetRecordPtr^).Msg;
end;
procedure __TWMFontChange__Wrapper.setResult(const val : Longint);
begin
TWMFontChange(GetRecordPtr^).Result := val;
end;
function __TWMFontChange__Wrapper.getResult : Longint;
begin
result := TWMFontChange(GetRecordPtr^).Result;
end;
function __TWMGetDlgCode__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMGetDlgCode__Wrapper.setMsg(const val : Cardinal);
begin
TWMGetDlgCode(GetRecordPtr^).Msg := val;
end;
function __TWMGetDlgCode__Wrapper.getMsg : Cardinal;
begin
result := TWMGetDlgCode(GetRecordPtr^).Msg;
end;
procedure __TWMGetDlgCode__Wrapper.setResult(const val : Longint);
begin
TWMGetDlgCode(GetRecordPtr^).Result := val;
end;
function __TWMGetDlgCode__Wrapper.getResult : Longint;
begin
result := TWMGetDlgCode(GetRecordPtr^).Result;
end;
function __TWMGetFont__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMGetFont__Wrapper.setMsg(const val : Cardinal);
begin
TWMGetFont(GetRecordPtr^).Msg := val;
end;
function __TWMGetFont__Wrapper.getMsg : Cardinal;
begin
result := TWMGetFont(GetRecordPtr^).Msg;
end;
procedure __TWMGetFont__Wrapper.setResult(const val : Longint);
begin
TWMGetFont(GetRecordPtr^).Result := val;
end;
function __TWMGetFont__Wrapper.getResult : Longint;
begin
result := TWMGetFont(GetRecordPtr^).Result;
end;
function __TWMGetHotKey__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMGetHotKey__Wrapper.setMsg(const val : Cardinal);
begin
TWMGetHotKey(GetRecordPtr^).Msg := val;
end;
function __TWMGetHotKey__Wrapper.getMsg : Cardinal;
begin
result := TWMGetHotKey(GetRecordPtr^).Msg;
end;
procedure __TWMGetHotKey__Wrapper.setResult(const val : Longint);
begin
TWMGetHotKey(GetRecordPtr^).Result := val;
end;
function __TWMGetHotKey__Wrapper.getResult : Longint;
begin
result := TWMGetHotKey(GetRecordPtr^).Result;
end;
function __TWMGetIcon__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMGetIcon__Wrapper.setMsg(const val : Cardinal);
begin
TWMGetIcon(GetRecordPtr^).Msg := val;
end;
function __TWMGetIcon__Wrapper.getMsg : Cardinal;
begin
result := TWMGetIcon(GetRecordPtr^).Msg;
end;
procedure __TWMGetIcon__Wrapper.setBigIcon(const val : LongBool);
begin
TWMGetIcon(GetRecordPtr^).BigIcon := val;
end;
function __TWMGetIcon__Wrapper.getBigIcon : LongBool;
begin
result := TWMGetIcon(GetRecordPtr^).BigIcon;
end;
procedure __TWMGetIcon__Wrapper.setUnused(const val : Longint);
begin
TWMGetIcon(GetRecordPtr^).Unused := val;
end;
function __TWMGetIcon__Wrapper.getUnused : Longint;
begin
result := TWMGetIcon(GetRecordPtr^).Unused;
end;
procedure __TWMGetIcon__Wrapper.setResult(const val : Longint);
begin
TWMGetIcon(GetRecordPtr^).Result := val;
end;
function __TWMGetIcon__Wrapper.getResult : Longint;
begin
result := TWMGetIcon(GetRecordPtr^).Result;
end;
function __TWMGetMinMaxInfo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMGetMinMaxInfo__Wrapper.setMsg(const val : Cardinal);
begin
TWMGetMinMaxInfo(GetRecordPtr^).Msg := val;
end;
function __TWMGetMinMaxInfo__Wrapper.getMsg : Cardinal;
begin
result := TWMGetMinMaxInfo(GetRecordPtr^).Msg;
end;
procedure __TWMGetMinMaxInfo__Wrapper.setUnused(const val : Integer);
begin
TWMGetMinMaxInfo(GetRecordPtr^).Unused := val;
end;
function __TWMGetMinMaxInfo__Wrapper.getUnused : Integer;
begin
result := TWMGetMinMaxInfo(GetRecordPtr^).Unused;
end;
procedure __TWMGetMinMaxInfo__Wrapper.setResult(const val : Longint);
begin
TWMGetMinMaxInfo(GetRecordPtr^).Result := val;
end;
function __TWMGetMinMaxInfo__Wrapper.getResult : Longint;
begin
result := TWMGetMinMaxInfo(GetRecordPtr^).Result;
end;
function __TWMGetText__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMGetText__Wrapper.setMsg(const val : Cardinal);
begin
TWMGetText(GetRecordPtr^).Msg := val;
end;
function __TWMGetText__Wrapper.getMsg : Cardinal;
begin
result := TWMGetText(GetRecordPtr^).Msg;
end;
procedure __TWMGetText__Wrapper.setTextMax(const val : Integer);
begin
TWMGetText(GetRecordPtr^).TextMax := val;
end;
function __TWMGetText__Wrapper.getTextMax : Integer;
begin
result := TWMGetText(GetRecordPtr^).TextMax;
end;
procedure __TWMGetText__Wrapper.setResult(const val : Longint);
begin
TWMGetText(GetRecordPtr^).Result := val;
end;
function __TWMGetText__Wrapper.getResult : Longint;
begin
result := TWMGetText(GetRecordPtr^).Result;
end;
function __TWMGetTextLength__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMGetTextLength__Wrapper.setMsg(const val : Cardinal);
begin
TWMGetTextLength(GetRecordPtr^).Msg := val;
end;
function __TWMGetTextLength__Wrapper.getMsg : Cardinal;
begin
result := TWMGetTextLength(GetRecordPtr^).Msg;
end;
procedure __TWMGetTextLength__Wrapper.setResult(const val : Longint);
begin
TWMGetTextLength(GetRecordPtr^).Result := val;
end;
function __TWMGetTextLength__Wrapper.getResult : Longint;
begin
result := TWMGetTextLength(GetRecordPtr^).Result;
end;
function __TWMHelp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMHelp__Wrapper.setMsg(const val : Cardinal);
begin
TWMHelp(GetRecordPtr^).Msg := val;
end;
function __TWMHelp__Wrapper.getMsg : Cardinal;
begin
result := TWMHelp(GetRecordPtr^).Msg;
end;
procedure __TWMHelp__Wrapper.setUnused(const val : Integer);
begin
TWMHelp(GetRecordPtr^).Unused := val;
end;
function __TWMHelp__Wrapper.getUnused : Integer;
begin
result := TWMHelp(GetRecordPtr^).Unused;
end;
procedure __TWMHelp__Wrapper.setResult(const val : Longint);
begin
TWMHelp(GetRecordPtr^).Result := val;
end;
function __TWMHelp__Wrapper.getResult : Longint;
begin
result := TWMHelp(GetRecordPtr^).Result;
end;
function __TWMHotKey__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMHotKey__Wrapper.setMsg(const val : Cardinal);
begin
TWMHotKey(GetRecordPtr^).Msg := val;
end;
function __TWMHotKey__Wrapper.getMsg : Cardinal;
begin
result := TWMHotKey(GetRecordPtr^).Msg;
end;
procedure __TWMHotKey__Wrapper.setHotKey(const val : Longint);
begin
TWMHotKey(GetRecordPtr^).HotKey := val;
end;
function __TWMHotKey__Wrapper.getHotKey : Longint;
begin
result := TWMHotKey(GetRecordPtr^).HotKey;
end;
procedure __TWMHotKey__Wrapper.setUnused(const val : Longint);
begin
TWMHotKey(GetRecordPtr^).Unused := val;
end;
function __TWMHotKey__Wrapper.getUnused : Longint;
begin
result := TWMHotKey(GetRecordPtr^).Unused;
end;
procedure __TWMHotKey__Wrapper.setResult(const val : Longint);
begin
TWMHotKey(GetRecordPtr^).Result := val;
end;
function __TWMHotKey__Wrapper.getResult : Longint;
begin
result := TWMHotKey(GetRecordPtr^).Result;
end;
function __TWMHScroll__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMHScroll__Wrapper.setMsg(const val : Cardinal);
begin
TWMHScroll(GetRecordPtr^).Msg := val;
end;
function __TWMHScroll__Wrapper.getMsg : Cardinal;
begin
result := TWMHScroll(GetRecordPtr^).Msg;
end;
procedure __TWMHScroll__Wrapper.setScrollCode(const val : SmallInt);
begin
TWMHScroll(GetRecordPtr^).ScrollCode := val;
end;
function __TWMHScroll__Wrapper.getScrollCode : SmallInt;
begin
result := TWMHScroll(GetRecordPtr^).ScrollCode;
end;
procedure __TWMHScroll__Wrapper.setPos(const val : SmallInt);
begin
TWMHScroll(GetRecordPtr^).Pos := val;
end;
function __TWMHScroll__Wrapper.getPos : SmallInt;
begin
result := TWMHScroll(GetRecordPtr^).Pos;
end;
procedure __TWMHScroll__Wrapper.setResult(const val : Longint);
begin
TWMHScroll(GetRecordPtr^).Result := val;
end;
function __TWMHScroll__Wrapper.getResult : Longint;
begin
result := TWMHScroll(GetRecordPtr^).Result;
end;
function __TWMHScrollClipboard__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMHScrollClipboard__Wrapper.setMsg(const val : Cardinal);
begin
TWMHScrollClipboard(GetRecordPtr^).Msg := val;
end;
function __TWMHScrollClipboard__Wrapper.getMsg : Cardinal;
begin
result := TWMHScrollClipboard(GetRecordPtr^).Msg;
end;
procedure __TWMHScrollClipboard__Wrapper.setScrollCode(const val : Word);
begin
TWMHScrollClipboard(GetRecordPtr^).ScrollCode := val;
end;
function __TWMHScrollClipboard__Wrapper.getScrollCode : Word;
begin
result := TWMHScrollClipboard(GetRecordPtr^).ScrollCode;
end;
procedure __TWMHScrollClipboard__Wrapper.setPos(const val : Word);
begin
TWMHScrollClipboard(GetRecordPtr^).Pos := val;
end;
function __TWMHScrollClipboard__Wrapper.getPos : Word;
begin
result := TWMHScrollClipboard(GetRecordPtr^).Pos;
end;
procedure __TWMHScrollClipboard__Wrapper.setResult(const val : Longint);
begin
TWMHScrollClipboard(GetRecordPtr^).Result := val;
end;
function __TWMHScrollClipboard__Wrapper.getResult : Longint;
begin
result := TWMHScrollClipboard(GetRecordPtr^).Result;
end;
function __TWMIconEraseBkgnd__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMIconEraseBkgnd__Wrapper.setMsg(const val : Cardinal);
begin
TWMIconEraseBkgnd(GetRecordPtr^).Msg := val;
end;
function __TWMIconEraseBkgnd__Wrapper.getMsg : Cardinal;
begin
result := TWMIconEraseBkgnd(GetRecordPtr^).Msg;
end;
procedure __TWMIconEraseBkgnd__Wrapper.setUnused(const val : Longint);
begin
TWMIconEraseBkgnd(GetRecordPtr^).Unused := val;
end;
function __TWMIconEraseBkgnd__Wrapper.getUnused : Longint;
begin
result := TWMIconEraseBkgnd(GetRecordPtr^).Unused;
end;
procedure __TWMIconEraseBkgnd__Wrapper.setResult(const val : Longint);
begin
TWMIconEraseBkgnd(GetRecordPtr^).Result := val;
end;
function __TWMIconEraseBkgnd__Wrapper.getResult : Longint;
begin
result := TWMIconEraseBkgnd(GetRecordPtr^).Result;
end;
function __TWMInitDialog__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMInitDialog__Wrapper.setMsg(const val : Cardinal);
begin
TWMInitDialog(GetRecordPtr^).Msg := val;
end;
function __TWMInitDialog__Wrapper.getMsg : Cardinal;
begin
result := TWMInitDialog(GetRecordPtr^).Msg;
end;
procedure __TWMInitDialog__Wrapper.setInitParam(const val : Longint);
begin
TWMInitDialog(GetRecordPtr^).InitParam := val;
end;
function __TWMInitDialog__Wrapper.getInitParam : Longint;
begin
result := TWMInitDialog(GetRecordPtr^).InitParam;
end;
procedure __TWMInitDialog__Wrapper.setResult(const val : Longint);
begin
TWMInitDialog(GetRecordPtr^).Result := val;
end;
function __TWMInitDialog__Wrapper.getResult : Longint;
begin
result := TWMInitDialog(GetRecordPtr^).Result;
end;
function __TWMInitMenu__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMInitMenu__Wrapper.setMsg(const val : Cardinal);
begin
TWMInitMenu(GetRecordPtr^).Msg := val;
end;
function __TWMInitMenu__Wrapper.getMsg : Cardinal;
begin
result := TWMInitMenu(GetRecordPtr^).Msg;
end;
procedure __TWMInitMenu__Wrapper.setUnused(const val : Longint);
begin
TWMInitMenu(GetRecordPtr^).Unused := val;
end;
function __TWMInitMenu__Wrapper.getUnused : Longint;
begin
result := TWMInitMenu(GetRecordPtr^).Unused;
end;
procedure __TWMInitMenu__Wrapper.setResult(const val : Longint);
begin
TWMInitMenu(GetRecordPtr^).Result := val;
end;
function __TWMInitMenu__Wrapper.getResult : Longint;
begin
result := TWMInitMenu(GetRecordPtr^).Result;
end;
function __TWMInitMenuPopup__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMInitMenuPopup__Wrapper.setMsg(const val : Cardinal);
begin
TWMInitMenuPopup(GetRecordPtr^).Msg := val;
end;
function __TWMInitMenuPopup__Wrapper.getMsg : Cardinal;
begin
result := TWMInitMenuPopup(GetRecordPtr^).Msg;
end;
procedure __TWMInitMenuPopup__Wrapper.setPos(const val : SmallInt);
begin
TWMInitMenuPopup(GetRecordPtr^).Pos := val;
end;
function __TWMInitMenuPopup__Wrapper.getPos : SmallInt;
begin
result := TWMInitMenuPopup(GetRecordPtr^).Pos;
end;
procedure __TWMInitMenuPopup__Wrapper.setSystemMenu(const val : WordBool);
begin
TWMInitMenuPopup(GetRecordPtr^).SystemMenu := val;
end;
function __TWMInitMenuPopup__Wrapper.getSystemMenu : WordBool;
begin
result := TWMInitMenuPopup(GetRecordPtr^).SystemMenu;
end;
procedure __TWMInitMenuPopup__Wrapper.setResult(const val : Longint);
begin
TWMInitMenuPopup(GetRecordPtr^).Result := val;
end;
function __TWMInitMenuPopup__Wrapper.getResult : Longint;
begin
result := TWMInitMenuPopup(GetRecordPtr^).Result;
end;
function __TWMKey__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMKey__Wrapper.setMsg(const val : Cardinal);
begin
TWMKey(GetRecordPtr^).Msg := val;
end;
function __TWMKey__Wrapper.getMsg : Cardinal;
begin
result := TWMKey(GetRecordPtr^).Msg;
end;
procedure __TWMKey__Wrapper.setCharCode(const val : Word);
begin
TWMKey(GetRecordPtr^).CharCode := val;
end;
function __TWMKey__Wrapper.getCharCode : Word;
begin
result := TWMKey(GetRecordPtr^).CharCode;
end;
procedure __TWMKey__Wrapper.setUnused(const val : Word);
begin
TWMKey(GetRecordPtr^).Unused := val;
end;
function __TWMKey__Wrapper.getUnused : Word;
begin
result := TWMKey(GetRecordPtr^).Unused;
end;
procedure __TWMKey__Wrapper.setKeyData(const val : Longint);
begin
TWMKey(GetRecordPtr^).KeyData := val;
end;
function __TWMKey__Wrapper.getKeyData : Longint;
begin
result := TWMKey(GetRecordPtr^).KeyData;
end;
procedure __TWMKey__Wrapper.setResult(const val : Longint);
begin
TWMKey(GetRecordPtr^).Result := val;
end;
function __TWMKey__Wrapper.getResult : Longint;
begin
result := TWMKey(GetRecordPtr^).Result;
end;
function __TWMKeyDown__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMKeyDown__Wrapper.setMsg(const val : Cardinal);
begin
TWMKeyDown(GetRecordPtr^).Msg := val;
end;
function __TWMKeyDown__Wrapper.getMsg : Cardinal;
begin
result := TWMKeyDown(GetRecordPtr^).Msg;
end;
procedure __TWMKeyDown__Wrapper.setCharCode(const val : Word);
begin
TWMKeyDown(GetRecordPtr^).CharCode := val;
end;
function __TWMKeyDown__Wrapper.getCharCode : Word;
begin
result := TWMKeyDown(GetRecordPtr^).CharCode;
end;
procedure __TWMKeyDown__Wrapper.setUnused(const val : Word);
begin
TWMKeyDown(GetRecordPtr^).Unused := val;
end;
function __TWMKeyDown__Wrapper.getUnused : Word;
begin
result := TWMKeyDown(GetRecordPtr^).Unused;
end;
procedure __TWMKeyDown__Wrapper.setKeyData(const val : Longint);
begin
TWMKeyDown(GetRecordPtr^).KeyData := val;
end;
function __TWMKeyDown__Wrapper.getKeyData : Longint;
begin
result := TWMKeyDown(GetRecordPtr^).KeyData;
end;
procedure __TWMKeyDown__Wrapper.setResult(const val : Longint);
begin
TWMKeyDown(GetRecordPtr^).Result := val;
end;
function __TWMKeyDown__Wrapper.getResult : Longint;
begin
result := TWMKeyDown(GetRecordPtr^).Result;
end;
function __TWMKeyUp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMKeyUp__Wrapper.setMsg(const val : Cardinal);
begin
TWMKeyUp(GetRecordPtr^).Msg := val;
end;
function __TWMKeyUp__Wrapper.getMsg : Cardinal;
begin
result := TWMKeyUp(GetRecordPtr^).Msg;
end;
procedure __TWMKeyUp__Wrapper.setCharCode(const val : Word);
begin
TWMKeyUp(GetRecordPtr^).CharCode := val;
end;
function __TWMKeyUp__Wrapper.getCharCode : Word;
begin
result := TWMKeyUp(GetRecordPtr^).CharCode;
end;
procedure __TWMKeyUp__Wrapper.setUnused(const val : Word);
begin
TWMKeyUp(GetRecordPtr^).Unused := val;
end;
function __TWMKeyUp__Wrapper.getUnused : Word;
begin
result := TWMKeyUp(GetRecordPtr^).Unused;
end;
procedure __TWMKeyUp__Wrapper.setKeyData(const val : Longint);
begin
TWMKeyUp(GetRecordPtr^).KeyData := val;
end;
function __TWMKeyUp__Wrapper.getKeyData : Longint;
begin
result := TWMKeyUp(GetRecordPtr^).KeyData;
end;
procedure __TWMKeyUp__Wrapper.setResult(const val : Longint);
begin
TWMKeyUp(GetRecordPtr^).Result := val;
end;
function __TWMKeyUp__Wrapper.getResult : Longint;
begin
result := TWMKeyUp(GetRecordPtr^).Result;
end;
function __TWMKillFocus__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMKillFocus__Wrapper.setMsg(const val : Cardinal);
begin
TWMKillFocus(GetRecordPtr^).Msg := val;
end;
function __TWMKillFocus__Wrapper.getMsg : Cardinal;
begin
result := TWMKillFocus(GetRecordPtr^).Msg;
end;
procedure __TWMKillFocus__Wrapper.setUnused(const val : Longint);
begin
TWMKillFocus(GetRecordPtr^).Unused := val;
end;
function __TWMKillFocus__Wrapper.getUnused : Longint;
begin
result := TWMKillFocus(GetRecordPtr^).Unused;
end;
procedure __TWMKillFocus__Wrapper.setResult(const val : Longint);
begin
TWMKillFocus(GetRecordPtr^).Result := val;
end;
function __TWMKillFocus__Wrapper.getResult : Longint;
begin
result := TWMKillFocus(GetRecordPtr^).Result;
end;
function __TWMLButtonDblClk__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMLButtonDblClk__Wrapper.setMsg(const val : Cardinal);
begin
TWMLButtonDblClk(GetRecordPtr^).Msg := val;
end;
function __TWMLButtonDblClk__Wrapper.getMsg : Cardinal;
begin
result := TWMLButtonDblClk(GetRecordPtr^).Msg;
end;
procedure __TWMLButtonDblClk__Wrapper.setKeys(const val : Longint);
begin
TWMLButtonDblClk(GetRecordPtr^).Keys := val;
end;
function __TWMLButtonDblClk__Wrapper.getKeys : Longint;
begin
result := TWMLButtonDblClk(GetRecordPtr^).Keys;
end;
procedure __TWMLButtonDblClk__Wrapper.setXPos(const val : SmallInt);
begin
TWMLButtonDblClk(GetRecordPtr^).XPos := val;
end;
function __TWMLButtonDblClk__Wrapper.getXPos : SmallInt;
begin
result := TWMLButtonDblClk(GetRecordPtr^).XPos;
end;
procedure __TWMLButtonDblClk__Wrapper.setYPos(const val : SmallInt);
begin
TWMLButtonDblClk(GetRecordPtr^).YPos := val;
end;
function __TWMLButtonDblClk__Wrapper.getYPos : SmallInt;
begin
result := TWMLButtonDblClk(GetRecordPtr^).YPos;
end;
procedure __TWMLButtonDblClk__Wrapper.setResult(const val : Longint);
begin
TWMLButtonDblClk(GetRecordPtr^).Result := val;
end;
function __TWMLButtonDblClk__Wrapper.getResult : Longint;
begin
result := TWMLButtonDblClk(GetRecordPtr^).Result;
end;
function __TWMLButtonDown__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMLButtonDown__Wrapper.setMsg(const val : Cardinal);
begin
TWMLButtonDown(GetRecordPtr^).Msg := val;
end;
function __TWMLButtonDown__Wrapper.getMsg : Cardinal;
begin
result := TWMLButtonDown(GetRecordPtr^).Msg;
end;
procedure __TWMLButtonDown__Wrapper.setKeys(const val : Longint);
begin
TWMLButtonDown(GetRecordPtr^).Keys := val;
end;
function __TWMLButtonDown__Wrapper.getKeys : Longint;
begin
result := TWMLButtonDown(GetRecordPtr^).Keys;
end;
procedure __TWMLButtonDown__Wrapper.setXPos(const val : SmallInt);
begin
TWMLButtonDown(GetRecordPtr^).XPos := val;
end;
function __TWMLButtonDown__Wrapper.getXPos : SmallInt;
begin
result := TWMLButtonDown(GetRecordPtr^).XPos;
end;
procedure __TWMLButtonDown__Wrapper.setYPos(const val : SmallInt);
begin
TWMLButtonDown(GetRecordPtr^).YPos := val;
end;
function __TWMLButtonDown__Wrapper.getYPos : SmallInt;
begin
result := TWMLButtonDown(GetRecordPtr^).YPos;
end;
procedure __TWMLButtonDown__Wrapper.setResult(const val : Longint);
begin
TWMLButtonDown(GetRecordPtr^).Result := val;
end;
function __TWMLButtonDown__Wrapper.getResult : Longint;
begin
result := TWMLButtonDown(GetRecordPtr^).Result;
end;
function __TWMLButtonUp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMLButtonUp__Wrapper.setMsg(const val : Cardinal);
begin
TWMLButtonUp(GetRecordPtr^).Msg := val;
end;
function __TWMLButtonUp__Wrapper.getMsg : Cardinal;
begin
result := TWMLButtonUp(GetRecordPtr^).Msg;
end;
procedure __TWMLButtonUp__Wrapper.setKeys(const val : Longint);
begin
TWMLButtonUp(GetRecordPtr^).Keys := val;
end;
function __TWMLButtonUp__Wrapper.getKeys : Longint;
begin
result := TWMLButtonUp(GetRecordPtr^).Keys;
end;
procedure __TWMLButtonUp__Wrapper.setXPos(const val : SmallInt);
begin
TWMLButtonUp(GetRecordPtr^).XPos := val;
end;
function __TWMLButtonUp__Wrapper.getXPos : SmallInt;
begin
result := TWMLButtonUp(GetRecordPtr^).XPos;
end;
procedure __TWMLButtonUp__Wrapper.setYPos(const val : SmallInt);
begin
TWMLButtonUp(GetRecordPtr^).YPos := val;
end;
function __TWMLButtonUp__Wrapper.getYPos : SmallInt;
begin
result := TWMLButtonUp(GetRecordPtr^).YPos;
end;
procedure __TWMLButtonUp__Wrapper.setResult(const val : Longint);
begin
TWMLButtonUp(GetRecordPtr^).Result := val;
end;
function __TWMLButtonUp__Wrapper.getResult : Longint;
begin
result := TWMLButtonUp(GetRecordPtr^).Result;
end;
function __TWMMButtonDblClk__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMButtonDblClk__Wrapper.setMsg(const val : Cardinal);
begin
TWMMButtonDblClk(GetRecordPtr^).Msg := val;
end;
function __TWMMButtonDblClk__Wrapper.getMsg : Cardinal;
begin
result := TWMMButtonDblClk(GetRecordPtr^).Msg;
end;
procedure __TWMMButtonDblClk__Wrapper.setKeys(const val : Longint);
begin
TWMMButtonDblClk(GetRecordPtr^).Keys := val;
end;
function __TWMMButtonDblClk__Wrapper.getKeys : Longint;
begin
result := TWMMButtonDblClk(GetRecordPtr^).Keys;
end;
procedure __TWMMButtonDblClk__Wrapper.setXPos(const val : SmallInt);
begin
TWMMButtonDblClk(GetRecordPtr^).XPos := val;
end;
function __TWMMButtonDblClk__Wrapper.getXPos : SmallInt;
begin
result := TWMMButtonDblClk(GetRecordPtr^).XPos;
end;
procedure __TWMMButtonDblClk__Wrapper.setYPos(const val : SmallInt);
begin
TWMMButtonDblClk(GetRecordPtr^).YPos := val;
end;
function __TWMMButtonDblClk__Wrapper.getYPos : SmallInt;
begin
result := TWMMButtonDblClk(GetRecordPtr^).YPos;
end;
procedure __TWMMButtonDblClk__Wrapper.setResult(const val : Longint);
begin
TWMMButtonDblClk(GetRecordPtr^).Result := val;
end;
function __TWMMButtonDblClk__Wrapper.getResult : Longint;
begin
result := TWMMButtonDblClk(GetRecordPtr^).Result;
end;
function __TWMMButtonDown__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMButtonDown__Wrapper.setMsg(const val : Cardinal);
begin
TWMMButtonDown(GetRecordPtr^).Msg := val;
end;
function __TWMMButtonDown__Wrapper.getMsg : Cardinal;
begin
result := TWMMButtonDown(GetRecordPtr^).Msg;
end;
procedure __TWMMButtonDown__Wrapper.setKeys(const val : Longint);
begin
TWMMButtonDown(GetRecordPtr^).Keys := val;
end;
function __TWMMButtonDown__Wrapper.getKeys : Longint;
begin
result := TWMMButtonDown(GetRecordPtr^).Keys;
end;
procedure __TWMMButtonDown__Wrapper.setXPos(const val : SmallInt);
begin
TWMMButtonDown(GetRecordPtr^).XPos := val;
end;
function __TWMMButtonDown__Wrapper.getXPos : SmallInt;
begin
result := TWMMButtonDown(GetRecordPtr^).XPos;
end;
procedure __TWMMButtonDown__Wrapper.setYPos(const val : SmallInt);
begin
TWMMButtonDown(GetRecordPtr^).YPos := val;
end;
function __TWMMButtonDown__Wrapper.getYPos : SmallInt;
begin
result := TWMMButtonDown(GetRecordPtr^).YPos;
end;
procedure __TWMMButtonDown__Wrapper.setResult(const val : Longint);
begin
TWMMButtonDown(GetRecordPtr^).Result := val;
end;
function __TWMMButtonDown__Wrapper.getResult : Longint;
begin
result := TWMMButtonDown(GetRecordPtr^).Result;
end;
function __TWMMButtonUp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMButtonUp__Wrapper.setMsg(const val : Cardinal);
begin
TWMMButtonUp(GetRecordPtr^).Msg := val;
end;
function __TWMMButtonUp__Wrapper.getMsg : Cardinal;
begin
result := TWMMButtonUp(GetRecordPtr^).Msg;
end;
procedure __TWMMButtonUp__Wrapper.setKeys(const val : Longint);
begin
TWMMButtonUp(GetRecordPtr^).Keys := val;
end;
function __TWMMButtonUp__Wrapper.getKeys : Longint;
begin
result := TWMMButtonUp(GetRecordPtr^).Keys;
end;
procedure __TWMMButtonUp__Wrapper.setXPos(const val : SmallInt);
begin
TWMMButtonUp(GetRecordPtr^).XPos := val;
end;
function __TWMMButtonUp__Wrapper.getXPos : SmallInt;
begin
result := TWMMButtonUp(GetRecordPtr^).XPos;
end;
procedure __TWMMButtonUp__Wrapper.setYPos(const val : SmallInt);
begin
TWMMButtonUp(GetRecordPtr^).YPos := val;
end;
function __TWMMButtonUp__Wrapper.getYPos : SmallInt;
begin
result := TWMMButtonUp(GetRecordPtr^).YPos;
end;
procedure __TWMMButtonUp__Wrapper.setResult(const val : Longint);
begin
TWMMButtonUp(GetRecordPtr^).Result := val;
end;
function __TWMMButtonUp__Wrapper.getResult : Longint;
begin
result := TWMMButtonUp(GetRecordPtr^).Result;
end;
function __TWMMDIActivate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDIActivate__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDIActivate(GetRecordPtr^).Msg := val;
end;
function __TWMMDIActivate__Wrapper.getMsg : Cardinal;
begin
result := TWMMDIActivate(GetRecordPtr^).Msg;
end;
procedure __TWMMDIActivate__Wrapper.setResult(const val : Longint);
begin
TWMMDIActivate(GetRecordPtr^).Result := val;
end;
function __TWMMDIActivate__Wrapper.getResult : Longint;
begin
result := TWMMDIActivate(GetRecordPtr^).Result;
end;
function __TWMMDICascade__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDICascade__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDICascade(GetRecordPtr^).Msg := val;
end;
function __TWMMDICascade__Wrapper.getMsg : Cardinal;
begin
result := TWMMDICascade(GetRecordPtr^).Msg;
end;
procedure __TWMMDICascade__Wrapper.setCascade(const val : Longint);
begin
TWMMDICascade(GetRecordPtr^).Cascade := val;
end;
function __TWMMDICascade__Wrapper.getCascade : Longint;
begin
result := TWMMDICascade(GetRecordPtr^).Cascade;
end;
procedure __TWMMDICascade__Wrapper.setUnused(const val : Longint);
begin
TWMMDICascade(GetRecordPtr^).Unused := val;
end;
function __TWMMDICascade__Wrapper.getUnused : Longint;
begin
result := TWMMDICascade(GetRecordPtr^).Unused;
end;
procedure __TWMMDICascade__Wrapper.setResult(const val : Longint);
begin
TWMMDICascade(GetRecordPtr^).Result := val;
end;
function __TWMMDICascade__Wrapper.getResult : Longint;
begin
result := TWMMDICascade(GetRecordPtr^).Result;
end;
function __TWMMDICreate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDICreate__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDICreate(GetRecordPtr^).Msg := val;
end;
function __TWMMDICreate__Wrapper.getMsg : Cardinal;
begin
result := TWMMDICreate(GetRecordPtr^).Msg;
end;
procedure __TWMMDICreate__Wrapper.setUnused(const val : Integer);
begin
TWMMDICreate(GetRecordPtr^).Unused := val;
end;
function __TWMMDICreate__Wrapper.getUnused : Integer;
begin
result := TWMMDICreate(GetRecordPtr^).Unused;
end;
procedure __TWMMDICreate__Wrapper.setResult(const val : Longint);
begin
TWMMDICreate(GetRecordPtr^).Result := val;
end;
function __TWMMDICreate__Wrapper.getResult : Longint;
begin
result := TWMMDICreate(GetRecordPtr^).Result;
end;
function __TWMMDIDestroy__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDIDestroy__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDIDestroy(GetRecordPtr^).Msg := val;
end;
function __TWMMDIDestroy__Wrapper.getMsg : Cardinal;
begin
result := TWMMDIDestroy(GetRecordPtr^).Msg;
end;
procedure __TWMMDIDestroy__Wrapper.setUnused(const val : Longint);
begin
TWMMDIDestroy(GetRecordPtr^).Unused := val;
end;
function __TWMMDIDestroy__Wrapper.getUnused : Longint;
begin
result := TWMMDIDestroy(GetRecordPtr^).Unused;
end;
procedure __TWMMDIDestroy__Wrapper.setResult(const val : Longint);
begin
TWMMDIDestroy(GetRecordPtr^).Result := val;
end;
function __TWMMDIDestroy__Wrapper.getResult : Longint;
begin
result := TWMMDIDestroy(GetRecordPtr^).Result;
end;
function __TWMMDIGetActive__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDIGetActive__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDIGetActive(GetRecordPtr^).Msg := val;
end;
function __TWMMDIGetActive__Wrapper.getMsg : Cardinal;
begin
result := TWMMDIGetActive(GetRecordPtr^).Msg;
end;
procedure __TWMMDIGetActive__Wrapper.setResult(const val : Longint);
begin
TWMMDIGetActive(GetRecordPtr^).Result := val;
end;
function __TWMMDIGetActive__Wrapper.getResult : Longint;
begin
result := TWMMDIGetActive(GetRecordPtr^).Result;
end;
function __TWMMDIIconArrange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDIIconArrange__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDIIconArrange(GetRecordPtr^).Msg := val;
end;
function __TWMMDIIconArrange__Wrapper.getMsg : Cardinal;
begin
result := TWMMDIIconArrange(GetRecordPtr^).Msg;
end;
procedure __TWMMDIIconArrange__Wrapper.setResult(const val : Longint);
begin
TWMMDIIconArrange(GetRecordPtr^).Result := val;
end;
function __TWMMDIIconArrange__Wrapper.getResult : Longint;
begin
result := TWMMDIIconArrange(GetRecordPtr^).Result;
end;
function __TWMMDIMaximize__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDIMaximize__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDIMaximize(GetRecordPtr^).Msg := val;
end;
function __TWMMDIMaximize__Wrapper.getMsg : Cardinal;
begin
result := TWMMDIMaximize(GetRecordPtr^).Msg;
end;
procedure __TWMMDIMaximize__Wrapper.setUnused(const val : Longint);
begin
TWMMDIMaximize(GetRecordPtr^).Unused := val;
end;
function __TWMMDIMaximize__Wrapper.getUnused : Longint;
begin
result := TWMMDIMaximize(GetRecordPtr^).Unused;
end;
procedure __TWMMDIMaximize__Wrapper.setResult(const val : Longint);
begin
TWMMDIMaximize(GetRecordPtr^).Result := val;
end;
function __TWMMDIMaximize__Wrapper.getResult : Longint;
begin
result := TWMMDIMaximize(GetRecordPtr^).Result;
end;
function __TWMMDINext__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDINext__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDINext(GetRecordPtr^).Msg := val;
end;
function __TWMMDINext__Wrapper.getMsg : Cardinal;
begin
result := TWMMDINext(GetRecordPtr^).Msg;
end;
procedure __TWMMDINext__Wrapper.setNext(const val : Longint);
begin
TWMMDINext(GetRecordPtr^).Next := val;
end;
function __TWMMDINext__Wrapper.getNext : Longint;
begin
result := TWMMDINext(GetRecordPtr^).Next;
end;
procedure __TWMMDINext__Wrapper.setResult(const val : Longint);
begin
TWMMDINext(GetRecordPtr^).Result := val;
end;
function __TWMMDINext__Wrapper.getResult : Longint;
begin
result := TWMMDINext(GetRecordPtr^).Result;
end;
function __TWMMDIRefreshMenu__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDIRefreshMenu__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDIRefreshMenu(GetRecordPtr^).Msg := val;
end;
function __TWMMDIRefreshMenu__Wrapper.getMsg : Cardinal;
begin
result := TWMMDIRefreshMenu(GetRecordPtr^).Msg;
end;
procedure __TWMMDIRefreshMenu__Wrapper.setResult(const val : Longint);
begin
TWMMDIRefreshMenu(GetRecordPtr^).Result := val;
end;
function __TWMMDIRefreshMenu__Wrapper.getResult : Longint;
begin
result := TWMMDIRefreshMenu(GetRecordPtr^).Result;
end;
function __TWMMDIRestore__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDIRestore__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDIRestore(GetRecordPtr^).Msg := val;
end;
function __TWMMDIRestore__Wrapper.getMsg : Cardinal;
begin
result := TWMMDIRestore(GetRecordPtr^).Msg;
end;
procedure __TWMMDIRestore__Wrapper.setUnused(const val : Longint);
begin
TWMMDIRestore(GetRecordPtr^).Unused := val;
end;
function __TWMMDIRestore__Wrapper.getUnused : Longint;
begin
result := TWMMDIRestore(GetRecordPtr^).Unused;
end;
procedure __TWMMDIRestore__Wrapper.setResult(const val : Longint);
begin
TWMMDIRestore(GetRecordPtr^).Result := val;
end;
function __TWMMDIRestore__Wrapper.getResult : Longint;
begin
result := TWMMDIRestore(GetRecordPtr^).Result;
end;
function __TWMMDISetMenu__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDISetMenu__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDISetMenu(GetRecordPtr^).Msg := val;
end;
function __TWMMDISetMenu__Wrapper.getMsg : Cardinal;
begin
result := TWMMDISetMenu(GetRecordPtr^).Msg;
end;
procedure __TWMMDISetMenu__Wrapper.setResult(const val : Longint);
begin
TWMMDISetMenu(GetRecordPtr^).Result := val;
end;
function __TWMMDISetMenu__Wrapper.getResult : Longint;
begin
result := TWMMDISetMenu(GetRecordPtr^).Result;
end;
function __TWMMDITile__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMDITile__Wrapper.setMsg(const val : Cardinal);
begin
TWMMDITile(GetRecordPtr^).Msg := val;
end;
function __TWMMDITile__Wrapper.getMsg : Cardinal;
begin
result := TWMMDITile(GetRecordPtr^).Msg;
end;
procedure __TWMMDITile__Wrapper.setTile(const val : Longint);
begin
TWMMDITile(GetRecordPtr^).Tile := val;
end;
function __TWMMDITile__Wrapper.getTile : Longint;
begin
result := TWMMDITile(GetRecordPtr^).Tile;
end;
procedure __TWMMDITile__Wrapper.setUnused(const val : Longint);
begin
TWMMDITile(GetRecordPtr^).Unused := val;
end;
function __TWMMDITile__Wrapper.getUnused : Longint;
begin
result := TWMMDITile(GetRecordPtr^).Unused;
end;
procedure __TWMMDITile__Wrapper.setResult(const val : Longint);
begin
TWMMDITile(GetRecordPtr^).Result := val;
end;
function __TWMMDITile__Wrapper.getResult : Longint;
begin
result := TWMMDITile(GetRecordPtr^).Result;
end;
function __TWMMeasureItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMeasureItem__Wrapper.setMsg(const val : Cardinal);
begin
TWMMeasureItem(GetRecordPtr^).Msg := val;
end;
function __TWMMeasureItem__Wrapper.getMsg : Cardinal;
begin
result := TWMMeasureItem(GetRecordPtr^).Msg;
end;
procedure __TWMMeasureItem__Wrapper.setResult(const val : Longint);
begin
TWMMeasureItem(GetRecordPtr^).Result := val;
end;
function __TWMMeasureItem__Wrapper.getResult : Longint;
begin
result := TWMMeasureItem(GetRecordPtr^).Result;
end;
function __TWMMenuChar__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMenuChar__Wrapper.setMsg(const val : Cardinal);
begin
TWMMenuChar(GetRecordPtr^).Msg := val;
end;
function __TWMMenuChar__Wrapper.getMsg : Cardinal;
begin
result := TWMMenuChar(GetRecordPtr^).Msg;
end;
procedure __TWMMenuChar__Wrapper.setUser(const val : Char);
begin
TWMMenuChar(GetRecordPtr^).User := val;
end;
function __TWMMenuChar__Wrapper.getUser : Char;
begin
result := TWMMenuChar(GetRecordPtr^).User;
end;
procedure __TWMMenuChar__Wrapper.setUnused(const val : Byte);
begin
TWMMenuChar(GetRecordPtr^).Unused := val;
end;
function __TWMMenuChar__Wrapper.getUnused : Byte;
begin
result := TWMMenuChar(GetRecordPtr^).Unused;
end;
procedure __TWMMenuChar__Wrapper.setMenuFlag(const val : Word);
begin
TWMMenuChar(GetRecordPtr^).MenuFlag := val;
end;
function __TWMMenuChar__Wrapper.getMenuFlag : Word;
begin
result := TWMMenuChar(GetRecordPtr^).MenuFlag;
end;
procedure __TWMMenuChar__Wrapper.setResult(const val : Longint);
begin
TWMMenuChar(GetRecordPtr^).Result := val;
end;
function __TWMMenuChar__Wrapper.getResult : Longint;
begin
result := TWMMenuChar(GetRecordPtr^).Result;
end;
function __TWMMenuSelect__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMenuSelect__Wrapper.setMsg(const val : Cardinal);
begin
TWMMenuSelect(GetRecordPtr^).Msg := val;
end;
function __TWMMenuSelect__Wrapper.getMsg : Cardinal;
begin
result := TWMMenuSelect(GetRecordPtr^).Msg;
end;
procedure __TWMMenuSelect__Wrapper.setIDItem(const val : Word);
begin
TWMMenuSelect(GetRecordPtr^).IDItem := val;
end;
function __TWMMenuSelect__Wrapper.getIDItem : Word;
begin
result := TWMMenuSelect(GetRecordPtr^).IDItem;
end;
procedure __TWMMenuSelect__Wrapper.setMenuFlag(const val : Word);
begin
TWMMenuSelect(GetRecordPtr^).MenuFlag := val;
end;
function __TWMMenuSelect__Wrapper.getMenuFlag : Word;
begin
result := TWMMenuSelect(GetRecordPtr^).MenuFlag;
end;
procedure __TWMMenuSelect__Wrapper.setResult(const val : Longint);
begin
TWMMenuSelect(GetRecordPtr^).Result := val;
end;
function __TWMMenuSelect__Wrapper.getResult : Longint;
begin
result := TWMMenuSelect(GetRecordPtr^).Result;
end;
function __TWMMouse__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMouse__Wrapper.setMsg(const val : Cardinal);
begin
TWMMouse(GetRecordPtr^).Msg := val;
end;
function __TWMMouse__Wrapper.getMsg : Cardinal;
begin
result := TWMMouse(GetRecordPtr^).Msg;
end;
procedure __TWMMouse__Wrapper.setKeys(const val : Longint);
begin
TWMMouse(GetRecordPtr^).Keys := val;
end;
function __TWMMouse__Wrapper.getKeys : Longint;
begin
result := TWMMouse(GetRecordPtr^).Keys;
end;
procedure __TWMMouse__Wrapper.setXPos(const val : SmallInt);
begin
TWMMouse(GetRecordPtr^).XPos := val;
end;
function __TWMMouse__Wrapper.getXPos : SmallInt;
begin
result := TWMMouse(GetRecordPtr^).XPos;
end;
procedure __TWMMouse__Wrapper.setYPos(const val : SmallInt);
begin
TWMMouse(GetRecordPtr^).YPos := val;
end;
function __TWMMouse__Wrapper.getYPos : SmallInt;
begin
result := TWMMouse(GetRecordPtr^).YPos;
end;
procedure __TWMMouse__Wrapper.setResult(const val : Longint);
begin
TWMMouse(GetRecordPtr^).Result := val;
end;
function __TWMMouse__Wrapper.getResult : Longint;
begin
result := TWMMouse(GetRecordPtr^).Result;
end;
function __TWMMouseActivate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMouseActivate__Wrapper.setMsg(const val : Cardinal);
begin
TWMMouseActivate(GetRecordPtr^).Msg := val;
end;
function __TWMMouseActivate__Wrapper.getMsg : Cardinal;
begin
result := TWMMouseActivate(GetRecordPtr^).Msg;
end;
procedure __TWMMouseActivate__Wrapper.setHitTestCode(const val : Word);
begin
TWMMouseActivate(GetRecordPtr^).HitTestCode := val;
end;
function __TWMMouseActivate__Wrapper.getHitTestCode : Word;
begin
result := TWMMouseActivate(GetRecordPtr^).HitTestCode;
end;
procedure __TWMMouseActivate__Wrapper.setMouseMsg(const val : Word);
begin
TWMMouseActivate(GetRecordPtr^).MouseMsg := val;
end;
function __TWMMouseActivate__Wrapper.getMouseMsg : Word;
begin
result := TWMMouseActivate(GetRecordPtr^).MouseMsg;
end;
procedure __TWMMouseActivate__Wrapper.setResult(const val : Longint);
begin
TWMMouseActivate(GetRecordPtr^).Result := val;
end;
function __TWMMouseActivate__Wrapper.getResult : Longint;
begin
result := TWMMouseActivate(GetRecordPtr^).Result;
end;
function __TWMMouseMove__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMouseMove__Wrapper.setMsg(const val : Cardinal);
begin
TWMMouseMove(GetRecordPtr^).Msg := val;
end;
function __TWMMouseMove__Wrapper.getMsg : Cardinal;
begin
result := TWMMouseMove(GetRecordPtr^).Msg;
end;
procedure __TWMMouseMove__Wrapper.setKeys(const val : Longint);
begin
TWMMouseMove(GetRecordPtr^).Keys := val;
end;
function __TWMMouseMove__Wrapper.getKeys : Longint;
begin
result := TWMMouseMove(GetRecordPtr^).Keys;
end;
procedure __TWMMouseMove__Wrapper.setXPos(const val : SmallInt);
begin
TWMMouseMove(GetRecordPtr^).XPos := val;
end;
function __TWMMouseMove__Wrapper.getXPos : SmallInt;
begin
result := TWMMouseMove(GetRecordPtr^).XPos;
end;
procedure __TWMMouseMove__Wrapper.setYPos(const val : SmallInt);
begin
TWMMouseMove(GetRecordPtr^).YPos := val;
end;
function __TWMMouseMove__Wrapper.getYPos : SmallInt;
begin
result := TWMMouseMove(GetRecordPtr^).YPos;
end;
procedure __TWMMouseMove__Wrapper.setResult(const val : Longint);
begin
TWMMouseMove(GetRecordPtr^).Result := val;
end;
function __TWMMouseMove__Wrapper.getResult : Longint;
begin
result := TWMMouseMove(GetRecordPtr^).Result;
end;
function __TWMMouseWheel__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMouseWheel__Wrapper.setMsg(const val : Cardinal);
begin
TWMMouseWheel(GetRecordPtr^).Msg := val;
end;
function __TWMMouseWheel__Wrapper.getMsg : Cardinal;
begin
result := TWMMouseWheel(GetRecordPtr^).Msg;
end;
procedure __TWMMouseWheel__Wrapper.setKeys(const val : SmallInt);
begin
TWMMouseWheel(GetRecordPtr^).Keys := val;
end;
function __TWMMouseWheel__Wrapper.getKeys : SmallInt;
begin
result := TWMMouseWheel(GetRecordPtr^).Keys;
end;
procedure __TWMMouseWheel__Wrapper.setWheelDelta(const val : SmallInt);
begin
TWMMouseWheel(GetRecordPtr^).WheelDelta := val;
end;
function __TWMMouseWheel__Wrapper.getWheelDelta : SmallInt;
begin
result := TWMMouseWheel(GetRecordPtr^).WheelDelta;
end;
procedure __TWMMouseWheel__Wrapper.setXPos(const val : SmallInt);
begin
TWMMouseWheel(GetRecordPtr^).XPos := val;
end;
function __TWMMouseWheel__Wrapper.getXPos : SmallInt;
begin
result := TWMMouseWheel(GetRecordPtr^).XPos;
end;
procedure __TWMMouseWheel__Wrapper.setYPos(const val : SmallInt);
begin
TWMMouseWheel(GetRecordPtr^).YPos := val;
end;
function __TWMMouseWheel__Wrapper.getYPos : SmallInt;
begin
result := TWMMouseWheel(GetRecordPtr^).YPos;
end;
procedure __TWMMouseWheel__Wrapper.setResult(const val : Longint);
begin
TWMMouseWheel(GetRecordPtr^).Result := val;
end;
function __TWMMouseWheel__Wrapper.getResult : Longint;
begin
result := TWMMouseWheel(GetRecordPtr^).Result;
end;
function __TWMMove__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMMove__Wrapper.setMsg(const val : Cardinal);
begin
TWMMove(GetRecordPtr^).Msg := val;
end;
function __TWMMove__Wrapper.getMsg : Cardinal;
begin
result := TWMMove(GetRecordPtr^).Msg;
end;
procedure __TWMMove__Wrapper.setUnused(const val : Integer);
begin
TWMMove(GetRecordPtr^).Unused := val;
end;
function __TWMMove__Wrapper.getUnused : Integer;
begin
result := TWMMove(GetRecordPtr^).Unused;
end;
procedure __TWMMove__Wrapper.setXPos(const val : SmallInt);
begin
TWMMove(GetRecordPtr^).XPos := val;
end;
function __TWMMove__Wrapper.getXPos : SmallInt;
begin
result := TWMMove(GetRecordPtr^).XPos;
end;
procedure __TWMMove__Wrapper.setYPos(const val : SmallInt);
begin
TWMMove(GetRecordPtr^).YPos := val;
end;
function __TWMMove__Wrapper.getYPos : SmallInt;
begin
result := TWMMove(GetRecordPtr^).YPos;
end;
procedure __TWMMove__Wrapper.setResult(const val : Longint);
begin
TWMMove(GetRecordPtr^).Result := val;
end;
function __TWMMove__Wrapper.getResult : Longint;
begin
result := TWMMove(GetRecordPtr^).Result;
end;
function __TWMNCActivate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCActivate__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCActivate(GetRecordPtr^).Msg := val;
end;
function __TWMNCActivate__Wrapper.getMsg : Cardinal;
begin
result := TWMNCActivate(GetRecordPtr^).Msg;
end;
procedure __TWMNCActivate__Wrapper.setActive(const val : BOOL);
begin
TWMNCActivate(GetRecordPtr^).Active := val;
end;
function __TWMNCActivate__Wrapper.getActive : BOOL;
begin
result := TWMNCActivate(GetRecordPtr^).Active;
end;
procedure __TWMNCActivate__Wrapper.setUnused(const val : Longint);
begin
TWMNCActivate(GetRecordPtr^).Unused := val;
end;
function __TWMNCActivate__Wrapper.getUnused : Longint;
begin
result := TWMNCActivate(GetRecordPtr^).Unused;
end;
procedure __TWMNCActivate__Wrapper.setResult(const val : Longint);
begin
TWMNCActivate(GetRecordPtr^).Result := val;
end;
function __TWMNCActivate__Wrapper.getResult : Longint;
begin
result := TWMNCActivate(GetRecordPtr^).Result;
end;
function __TWMNCCalcSize__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCCalcSize__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCCalcSize(GetRecordPtr^).Msg := val;
end;
function __TWMNCCalcSize__Wrapper.getMsg : Cardinal;
begin
result := TWMNCCalcSize(GetRecordPtr^).Msg;
end;
procedure __TWMNCCalcSize__Wrapper.setCalcValidRects(const val : BOOL);
begin
TWMNCCalcSize(GetRecordPtr^).CalcValidRects := val;
end;
function __TWMNCCalcSize__Wrapper.getCalcValidRects : BOOL;
begin
result := TWMNCCalcSize(GetRecordPtr^).CalcValidRects;
end;
procedure __TWMNCCalcSize__Wrapper.setResult(const val : Longint);
begin
TWMNCCalcSize(GetRecordPtr^).Result := val;
end;
function __TWMNCCalcSize__Wrapper.getResult : Longint;
begin
result := TWMNCCalcSize(GetRecordPtr^).Result;
end;
function __TWMNCCreate__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCCreate__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCCreate(GetRecordPtr^).Msg := val;
end;
function __TWMNCCreate__Wrapper.getMsg : Cardinal;
begin
result := TWMNCCreate(GetRecordPtr^).Msg;
end;
procedure __TWMNCCreate__Wrapper.setUnused(const val : Integer);
begin
TWMNCCreate(GetRecordPtr^).Unused := val;
end;
function __TWMNCCreate__Wrapper.getUnused : Integer;
begin
result := TWMNCCreate(GetRecordPtr^).Unused;
end;
procedure __TWMNCCreate__Wrapper.setResult(const val : Longint);
begin
TWMNCCreate(GetRecordPtr^).Result := val;
end;
function __TWMNCCreate__Wrapper.getResult : Longint;
begin
result := TWMNCCreate(GetRecordPtr^).Result;
end;
function __TWMNCDestroy__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCDestroy__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCDestroy(GetRecordPtr^).Msg := val;
end;
function __TWMNCDestroy__Wrapper.getMsg : Cardinal;
begin
result := TWMNCDestroy(GetRecordPtr^).Msg;
end;
procedure __TWMNCDestroy__Wrapper.setResult(const val : Longint);
begin
TWMNCDestroy(GetRecordPtr^).Result := val;
end;
function __TWMNCDestroy__Wrapper.getResult : Longint;
begin
result := TWMNCDestroy(GetRecordPtr^).Result;
end;
function __TWMNCHitMessage__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCHitMessage__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCHitMessage(GetRecordPtr^).Msg := val;
end;
function __TWMNCHitMessage__Wrapper.getMsg : Cardinal;
begin
result := TWMNCHitMessage(GetRecordPtr^).Msg;
end;
procedure __TWMNCHitMessage__Wrapper.setHitTest(const val : Longint);
begin
TWMNCHitMessage(GetRecordPtr^).HitTest := val;
end;
function __TWMNCHitMessage__Wrapper.getHitTest : Longint;
begin
result := TWMNCHitMessage(GetRecordPtr^).HitTest;
end;
procedure __TWMNCHitMessage__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCHitMessage(GetRecordPtr^).XCursor := val;
end;
function __TWMNCHitMessage__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCHitMessage(GetRecordPtr^).XCursor;
end;
procedure __TWMNCHitMessage__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCHitMessage(GetRecordPtr^).YCursor := val;
end;
function __TWMNCHitMessage__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCHitMessage(GetRecordPtr^).YCursor;
end;
procedure __TWMNCHitMessage__Wrapper.setResult(const val : Longint);
begin
TWMNCHitMessage(GetRecordPtr^).Result := val;
end;
function __TWMNCHitMessage__Wrapper.getResult : Longint;
begin
result := TWMNCHitMessage(GetRecordPtr^).Result;
end;
function __TWMNCHitTest__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCHitTest__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCHitTest(GetRecordPtr^).Msg := val;
end;
function __TWMNCHitTest__Wrapper.getMsg : Cardinal;
begin
result := TWMNCHitTest(GetRecordPtr^).Msg;
end;
procedure __TWMNCHitTest__Wrapper.setUnused(const val : Longint);
begin
TWMNCHitTest(GetRecordPtr^).Unused := val;
end;
function __TWMNCHitTest__Wrapper.getUnused : Longint;
begin
result := TWMNCHitTest(GetRecordPtr^).Unused;
end;
procedure __TWMNCHitTest__Wrapper.setXPos(const val : SmallInt);
begin
TWMNCHitTest(GetRecordPtr^).XPos := val;
end;
function __TWMNCHitTest__Wrapper.getXPos : SmallInt;
begin
result := TWMNCHitTest(GetRecordPtr^).XPos;
end;
procedure __TWMNCHitTest__Wrapper.setYPos(const val : SmallInt);
begin
TWMNCHitTest(GetRecordPtr^).YPos := val;
end;
function __TWMNCHitTest__Wrapper.getYPos : SmallInt;
begin
result := TWMNCHitTest(GetRecordPtr^).YPos;
end;
procedure __TWMNCHitTest__Wrapper.setResult(const val : Longint);
begin
TWMNCHitTest(GetRecordPtr^).Result := val;
end;
function __TWMNCHitTest__Wrapper.getResult : Longint;
begin
result := TWMNCHitTest(GetRecordPtr^).Result;
end;
function __TWMNCLButtonDblClk__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCLButtonDblClk__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCLButtonDblClk(GetRecordPtr^).Msg := val;
end;
function __TWMNCLButtonDblClk__Wrapper.getMsg : Cardinal;
begin
result := TWMNCLButtonDblClk(GetRecordPtr^).Msg;
end;
procedure __TWMNCLButtonDblClk__Wrapper.setHitTest(const val : Longint);
begin
TWMNCLButtonDblClk(GetRecordPtr^).HitTest := val;
end;
function __TWMNCLButtonDblClk__Wrapper.getHitTest : Longint;
begin
result := TWMNCLButtonDblClk(GetRecordPtr^).HitTest;
end;
procedure __TWMNCLButtonDblClk__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCLButtonDblClk(GetRecordPtr^).XCursor := val;
end;
function __TWMNCLButtonDblClk__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCLButtonDblClk(GetRecordPtr^).XCursor;
end;
procedure __TWMNCLButtonDblClk__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCLButtonDblClk(GetRecordPtr^).YCursor := val;
end;
function __TWMNCLButtonDblClk__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCLButtonDblClk(GetRecordPtr^).YCursor;
end;
procedure __TWMNCLButtonDblClk__Wrapper.setResult(const val : Longint);
begin
TWMNCLButtonDblClk(GetRecordPtr^).Result := val;
end;
function __TWMNCLButtonDblClk__Wrapper.getResult : Longint;
begin
result := TWMNCLButtonDblClk(GetRecordPtr^).Result;
end;
function __TWMNCLButtonDown__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCLButtonDown__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCLButtonDown(GetRecordPtr^).Msg := val;
end;
function __TWMNCLButtonDown__Wrapper.getMsg : Cardinal;
begin
result := TWMNCLButtonDown(GetRecordPtr^).Msg;
end;
procedure __TWMNCLButtonDown__Wrapper.setHitTest(const val : Longint);
begin
TWMNCLButtonDown(GetRecordPtr^).HitTest := val;
end;
function __TWMNCLButtonDown__Wrapper.getHitTest : Longint;
begin
result := TWMNCLButtonDown(GetRecordPtr^).HitTest;
end;
procedure __TWMNCLButtonDown__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCLButtonDown(GetRecordPtr^).XCursor := val;
end;
function __TWMNCLButtonDown__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCLButtonDown(GetRecordPtr^).XCursor;
end;
procedure __TWMNCLButtonDown__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCLButtonDown(GetRecordPtr^).YCursor := val;
end;
function __TWMNCLButtonDown__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCLButtonDown(GetRecordPtr^).YCursor;
end;
procedure __TWMNCLButtonDown__Wrapper.setResult(const val : Longint);
begin
TWMNCLButtonDown(GetRecordPtr^).Result := val;
end;
function __TWMNCLButtonDown__Wrapper.getResult : Longint;
begin
result := TWMNCLButtonDown(GetRecordPtr^).Result;
end;
function __TWMNCLButtonUp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCLButtonUp__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCLButtonUp(GetRecordPtr^).Msg := val;
end;
function __TWMNCLButtonUp__Wrapper.getMsg : Cardinal;
begin
result := TWMNCLButtonUp(GetRecordPtr^).Msg;
end;
procedure __TWMNCLButtonUp__Wrapper.setHitTest(const val : Longint);
begin
TWMNCLButtonUp(GetRecordPtr^).HitTest := val;
end;
function __TWMNCLButtonUp__Wrapper.getHitTest : Longint;
begin
result := TWMNCLButtonUp(GetRecordPtr^).HitTest;
end;
procedure __TWMNCLButtonUp__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCLButtonUp(GetRecordPtr^).XCursor := val;
end;
function __TWMNCLButtonUp__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCLButtonUp(GetRecordPtr^).XCursor;
end;
procedure __TWMNCLButtonUp__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCLButtonUp(GetRecordPtr^).YCursor := val;
end;
function __TWMNCLButtonUp__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCLButtonUp(GetRecordPtr^).YCursor;
end;
procedure __TWMNCLButtonUp__Wrapper.setResult(const val : Longint);
begin
TWMNCLButtonUp(GetRecordPtr^).Result := val;
end;
function __TWMNCLButtonUp__Wrapper.getResult : Longint;
begin
result := TWMNCLButtonUp(GetRecordPtr^).Result;
end;
function __TWMNCMButtonDblClk__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCMButtonDblClk__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCMButtonDblClk(GetRecordPtr^).Msg := val;
end;
function __TWMNCMButtonDblClk__Wrapper.getMsg : Cardinal;
begin
result := TWMNCMButtonDblClk(GetRecordPtr^).Msg;
end;
procedure __TWMNCMButtonDblClk__Wrapper.setHitTest(const val : Longint);
begin
TWMNCMButtonDblClk(GetRecordPtr^).HitTest := val;
end;
function __TWMNCMButtonDblClk__Wrapper.getHitTest : Longint;
begin
result := TWMNCMButtonDblClk(GetRecordPtr^).HitTest;
end;
procedure __TWMNCMButtonDblClk__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCMButtonDblClk(GetRecordPtr^).XCursor := val;
end;
function __TWMNCMButtonDblClk__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCMButtonDblClk(GetRecordPtr^).XCursor;
end;
procedure __TWMNCMButtonDblClk__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCMButtonDblClk(GetRecordPtr^).YCursor := val;
end;
function __TWMNCMButtonDblClk__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCMButtonDblClk(GetRecordPtr^).YCursor;
end;
procedure __TWMNCMButtonDblClk__Wrapper.setResult(const val : Longint);
begin
TWMNCMButtonDblClk(GetRecordPtr^).Result := val;
end;
function __TWMNCMButtonDblClk__Wrapper.getResult : Longint;
begin
result := TWMNCMButtonDblClk(GetRecordPtr^).Result;
end;
function __TWMNCMButtonDown__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCMButtonDown__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCMButtonDown(GetRecordPtr^).Msg := val;
end;
function __TWMNCMButtonDown__Wrapper.getMsg : Cardinal;
begin
result := TWMNCMButtonDown(GetRecordPtr^).Msg;
end;
procedure __TWMNCMButtonDown__Wrapper.setHitTest(const val : Longint);
begin
TWMNCMButtonDown(GetRecordPtr^).HitTest := val;
end;
function __TWMNCMButtonDown__Wrapper.getHitTest : Longint;
begin
result := TWMNCMButtonDown(GetRecordPtr^).HitTest;
end;
procedure __TWMNCMButtonDown__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCMButtonDown(GetRecordPtr^).XCursor := val;
end;
function __TWMNCMButtonDown__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCMButtonDown(GetRecordPtr^).XCursor;
end;
procedure __TWMNCMButtonDown__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCMButtonDown(GetRecordPtr^).YCursor := val;
end;
function __TWMNCMButtonDown__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCMButtonDown(GetRecordPtr^).YCursor;
end;
procedure __TWMNCMButtonDown__Wrapper.setResult(const val : Longint);
begin
TWMNCMButtonDown(GetRecordPtr^).Result := val;
end;
function __TWMNCMButtonDown__Wrapper.getResult : Longint;
begin
result := TWMNCMButtonDown(GetRecordPtr^).Result;
end;
function __TWMNCMButtonUp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCMButtonUp__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCMButtonUp(GetRecordPtr^).Msg := val;
end;
function __TWMNCMButtonUp__Wrapper.getMsg : Cardinal;
begin
result := TWMNCMButtonUp(GetRecordPtr^).Msg;
end;
procedure __TWMNCMButtonUp__Wrapper.setHitTest(const val : Longint);
begin
TWMNCMButtonUp(GetRecordPtr^).HitTest := val;
end;
function __TWMNCMButtonUp__Wrapper.getHitTest : Longint;
begin
result := TWMNCMButtonUp(GetRecordPtr^).HitTest;
end;
procedure __TWMNCMButtonUp__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCMButtonUp(GetRecordPtr^).XCursor := val;
end;
function __TWMNCMButtonUp__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCMButtonUp(GetRecordPtr^).XCursor;
end;
procedure __TWMNCMButtonUp__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCMButtonUp(GetRecordPtr^).YCursor := val;
end;
function __TWMNCMButtonUp__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCMButtonUp(GetRecordPtr^).YCursor;
end;
procedure __TWMNCMButtonUp__Wrapper.setResult(const val : Longint);
begin
TWMNCMButtonUp(GetRecordPtr^).Result := val;
end;
function __TWMNCMButtonUp__Wrapper.getResult : Longint;
begin
result := TWMNCMButtonUp(GetRecordPtr^).Result;
end;
function __TWMNCMouseMove__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCMouseMove__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCMouseMove(GetRecordPtr^).Msg := val;
end;
function __TWMNCMouseMove__Wrapper.getMsg : Cardinal;
begin
result := TWMNCMouseMove(GetRecordPtr^).Msg;
end;
procedure __TWMNCMouseMove__Wrapper.setHitTest(const val : Longint);
begin
TWMNCMouseMove(GetRecordPtr^).HitTest := val;
end;
function __TWMNCMouseMove__Wrapper.getHitTest : Longint;
begin
result := TWMNCMouseMove(GetRecordPtr^).HitTest;
end;
procedure __TWMNCMouseMove__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCMouseMove(GetRecordPtr^).XCursor := val;
end;
function __TWMNCMouseMove__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCMouseMove(GetRecordPtr^).XCursor;
end;
procedure __TWMNCMouseMove__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCMouseMove(GetRecordPtr^).YCursor := val;
end;
function __TWMNCMouseMove__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCMouseMove(GetRecordPtr^).YCursor;
end;
procedure __TWMNCMouseMove__Wrapper.setResult(const val : Longint);
begin
TWMNCMouseMove(GetRecordPtr^).Result := val;
end;
function __TWMNCMouseMove__Wrapper.getResult : Longint;
begin
result := TWMNCMouseMove(GetRecordPtr^).Result;
end;
function __TWMNCPaint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCPaint__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCPaint(GetRecordPtr^).Msg := val;
end;
function __TWMNCPaint__Wrapper.getMsg : Cardinal;
begin
result := TWMNCPaint(GetRecordPtr^).Msg;
end;
procedure __TWMNCPaint__Wrapper.setResult(const val : Longint);
begin
TWMNCPaint(GetRecordPtr^).Result := val;
end;
function __TWMNCPaint__Wrapper.getResult : Longint;
begin
result := TWMNCPaint(GetRecordPtr^).Result;
end;
function __TWMNCRButtonDblClk__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCRButtonDblClk__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCRButtonDblClk(GetRecordPtr^).Msg := val;
end;
function __TWMNCRButtonDblClk__Wrapper.getMsg : Cardinal;
begin
result := TWMNCRButtonDblClk(GetRecordPtr^).Msg;
end;
procedure __TWMNCRButtonDblClk__Wrapper.setHitTest(const val : Longint);
begin
TWMNCRButtonDblClk(GetRecordPtr^).HitTest := val;
end;
function __TWMNCRButtonDblClk__Wrapper.getHitTest : Longint;
begin
result := TWMNCRButtonDblClk(GetRecordPtr^).HitTest;
end;
procedure __TWMNCRButtonDblClk__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCRButtonDblClk(GetRecordPtr^).XCursor := val;
end;
function __TWMNCRButtonDblClk__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCRButtonDblClk(GetRecordPtr^).XCursor;
end;
procedure __TWMNCRButtonDblClk__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCRButtonDblClk(GetRecordPtr^).YCursor := val;
end;
function __TWMNCRButtonDblClk__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCRButtonDblClk(GetRecordPtr^).YCursor;
end;
procedure __TWMNCRButtonDblClk__Wrapper.setResult(const val : Longint);
begin
TWMNCRButtonDblClk(GetRecordPtr^).Result := val;
end;
function __TWMNCRButtonDblClk__Wrapper.getResult : Longint;
begin
result := TWMNCRButtonDblClk(GetRecordPtr^).Result;
end;
function __TWMNCRButtonDown__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCRButtonDown__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCRButtonDown(GetRecordPtr^).Msg := val;
end;
function __TWMNCRButtonDown__Wrapper.getMsg : Cardinal;
begin
result := TWMNCRButtonDown(GetRecordPtr^).Msg;
end;
procedure __TWMNCRButtonDown__Wrapper.setHitTest(const val : Longint);
begin
TWMNCRButtonDown(GetRecordPtr^).HitTest := val;
end;
function __TWMNCRButtonDown__Wrapper.getHitTest : Longint;
begin
result := TWMNCRButtonDown(GetRecordPtr^).HitTest;
end;
procedure __TWMNCRButtonDown__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCRButtonDown(GetRecordPtr^).XCursor := val;
end;
function __TWMNCRButtonDown__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCRButtonDown(GetRecordPtr^).XCursor;
end;
procedure __TWMNCRButtonDown__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCRButtonDown(GetRecordPtr^).YCursor := val;
end;
function __TWMNCRButtonDown__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCRButtonDown(GetRecordPtr^).YCursor;
end;
procedure __TWMNCRButtonDown__Wrapper.setResult(const val : Longint);
begin
TWMNCRButtonDown(GetRecordPtr^).Result := val;
end;
function __TWMNCRButtonDown__Wrapper.getResult : Longint;
begin
result := TWMNCRButtonDown(GetRecordPtr^).Result;
end;
function __TWMNCRButtonUp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNCRButtonUp__Wrapper.setMsg(const val : Cardinal);
begin
TWMNCRButtonUp(GetRecordPtr^).Msg := val;
end;
function __TWMNCRButtonUp__Wrapper.getMsg : Cardinal;
begin
result := TWMNCRButtonUp(GetRecordPtr^).Msg;
end;
procedure __TWMNCRButtonUp__Wrapper.setHitTest(const val : Longint);
begin
TWMNCRButtonUp(GetRecordPtr^).HitTest := val;
end;
function __TWMNCRButtonUp__Wrapper.getHitTest : Longint;
begin
result := TWMNCRButtonUp(GetRecordPtr^).HitTest;
end;
procedure __TWMNCRButtonUp__Wrapper.setXCursor(const val : SmallInt);
begin
TWMNCRButtonUp(GetRecordPtr^).XCursor := val;
end;
function __TWMNCRButtonUp__Wrapper.getXCursor : SmallInt;
begin
result := TWMNCRButtonUp(GetRecordPtr^).XCursor;
end;
procedure __TWMNCRButtonUp__Wrapper.setYCursor(const val : SmallInt);
begin
TWMNCRButtonUp(GetRecordPtr^).YCursor := val;
end;
function __TWMNCRButtonUp__Wrapper.getYCursor : SmallInt;
begin
result := TWMNCRButtonUp(GetRecordPtr^).YCursor;
end;
procedure __TWMNCRButtonUp__Wrapper.setResult(const val : Longint);
begin
TWMNCRButtonUp(GetRecordPtr^).Result := val;
end;
function __TWMNCRButtonUp__Wrapper.getResult : Longint;
begin
result := TWMNCRButtonUp(GetRecordPtr^).Result;
end;
function __TWMNextDlgCtl__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNextDlgCtl__Wrapper.setMsg(const val : Cardinal);
begin
TWMNextDlgCtl(GetRecordPtr^).Msg := val;
end;
function __TWMNextDlgCtl__Wrapper.getMsg : Cardinal;
begin
result := TWMNextDlgCtl(GetRecordPtr^).Msg;
end;
procedure __TWMNextDlgCtl__Wrapper.setCtlFocus(const val : Longint);
begin
TWMNextDlgCtl(GetRecordPtr^).CtlFocus := val;
end;
function __TWMNextDlgCtl__Wrapper.getCtlFocus : Longint;
begin
result := TWMNextDlgCtl(GetRecordPtr^).CtlFocus;
end;
procedure __TWMNextDlgCtl__Wrapper.setHandle(const val : WordBool);
begin
TWMNextDlgCtl(GetRecordPtr^).Handle := val;
end;
function __TWMNextDlgCtl__Wrapper.getHandle : WordBool;
begin
result := TWMNextDlgCtl(GetRecordPtr^).Handle;
end;
procedure __TWMNextDlgCtl__Wrapper.setUnused(const val : Word);
begin
TWMNextDlgCtl(GetRecordPtr^).Unused := val;
end;
function __TWMNextDlgCtl__Wrapper.getUnused : Word;
begin
result := TWMNextDlgCtl(GetRecordPtr^).Unused;
end;
procedure __TWMNextDlgCtl__Wrapper.setResult(const val : Longint);
begin
TWMNextDlgCtl(GetRecordPtr^).Result := val;
end;
function __TWMNextDlgCtl__Wrapper.getResult : Longint;
begin
result := TWMNextDlgCtl(GetRecordPtr^).Result;
end;
function __TWMNoParams__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNoParams__Wrapper.setMsg(const val : Cardinal);
begin
TWMNoParams(GetRecordPtr^).Msg := val;
end;
function __TWMNoParams__Wrapper.getMsg : Cardinal;
begin
result := TWMNoParams(GetRecordPtr^).Msg;
end;
procedure __TWMNoParams__Wrapper.setResult(const val : Longint);
begin
TWMNoParams(GetRecordPtr^).Result := val;
end;
function __TWMNoParams__Wrapper.getResult : Longint;
begin
result := TWMNoParams(GetRecordPtr^).Result;
end;
function __TWMNotify__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNotify__Wrapper.setMsg(const val : Cardinal);
begin
TWMNotify(GetRecordPtr^).Msg := val;
end;
function __TWMNotify__Wrapper.getMsg : Cardinal;
begin
result := TWMNotify(GetRecordPtr^).Msg;
end;
procedure __TWMNotify__Wrapper.setIDCtrl(const val : Longint);
begin
TWMNotify(GetRecordPtr^).IDCtrl := val;
end;
function __TWMNotify__Wrapper.getIDCtrl : Longint;
begin
result := TWMNotify(GetRecordPtr^).IDCtrl;
end;
procedure __TWMNotify__Wrapper.setResult(const val : Longint);
begin
TWMNotify(GetRecordPtr^).Result := val;
end;
function __TWMNotify__Wrapper.getResult : Longint;
begin
result := TWMNotify(GetRecordPtr^).Result;
end;
function __TWMNotifyFormat__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMNotifyFormat__Wrapper.setMsg(const val : Cardinal);
begin
TWMNotifyFormat(GetRecordPtr^).Msg := val;
end;
function __TWMNotifyFormat__Wrapper.getMsg : Cardinal;
begin
result := TWMNotifyFormat(GetRecordPtr^).Msg;
end;
procedure __TWMNotifyFormat__Wrapper.setCommand(const val : Longint);
begin
TWMNotifyFormat(GetRecordPtr^).Command := val;
end;
function __TWMNotifyFormat__Wrapper.getCommand : Longint;
begin
result := TWMNotifyFormat(GetRecordPtr^).Command;
end;
procedure __TWMNotifyFormat__Wrapper.setResult(const val : Longint);
begin
TWMNotifyFormat(GetRecordPtr^).Result := val;
end;
function __TWMNotifyFormat__Wrapper.getResult : Longint;
begin
result := TWMNotifyFormat(GetRecordPtr^).Result;
end;
function __TWMPaint__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMPaint__Wrapper.setMsg(const val : Cardinal);
begin
TWMPaint(GetRecordPtr^).Msg := val;
end;
function __TWMPaint__Wrapper.getMsg : Cardinal;
begin
result := TWMPaint(GetRecordPtr^).Msg;
end;
procedure __TWMPaint__Wrapper.setUnused(const val : Longint);
begin
TWMPaint(GetRecordPtr^).Unused := val;
end;
function __TWMPaint__Wrapper.getUnused : Longint;
begin
result := TWMPaint(GetRecordPtr^).Unused;
end;
procedure __TWMPaint__Wrapper.setResult(const val : Longint);
begin
TWMPaint(GetRecordPtr^).Result := val;
end;
function __TWMPaint__Wrapper.getResult : Longint;
begin
result := TWMPaint(GetRecordPtr^).Result;
end;
function __TWMPaintClipboard__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMPaintClipboard__Wrapper.setMsg(const val : Cardinal);
begin
TWMPaintClipboard(GetRecordPtr^).Msg := val;
end;
function __TWMPaintClipboard__Wrapper.getMsg : Cardinal;
begin
result := TWMPaintClipboard(GetRecordPtr^).Msg;
end;
procedure __TWMPaintClipboard__Wrapper.setPaintStruct(const val : THandle);
begin
TWMPaintClipboard(GetRecordPtr^).PaintStruct := val;
end;
function __TWMPaintClipboard__Wrapper.getPaintStruct : THandle;
begin
result := TWMPaintClipboard(GetRecordPtr^).PaintStruct;
end;
procedure __TWMPaintClipboard__Wrapper.setResult(const val : Longint);
begin
TWMPaintClipboard(GetRecordPtr^).Result := val;
end;
function __TWMPaintClipboard__Wrapper.getResult : Longint;
begin
result := TWMPaintClipboard(GetRecordPtr^).Result;
end;
function __TWMPaintIcon__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMPaintIcon__Wrapper.setMsg(const val : Cardinal);
begin
TWMPaintIcon(GetRecordPtr^).Msg := val;
end;
function __TWMPaintIcon__Wrapper.getMsg : Cardinal;
begin
result := TWMPaintIcon(GetRecordPtr^).Msg;
end;
procedure __TWMPaintIcon__Wrapper.setResult(const val : Longint);
begin
TWMPaintIcon(GetRecordPtr^).Result := val;
end;
function __TWMPaintIcon__Wrapper.getResult : Longint;
begin
result := TWMPaintIcon(GetRecordPtr^).Result;
end;
function __TWMPaletteChanged__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMPaletteChanged__Wrapper.setMsg(const val : Cardinal);
begin
TWMPaletteChanged(GetRecordPtr^).Msg := val;
end;
function __TWMPaletteChanged__Wrapper.getMsg : Cardinal;
begin
result := TWMPaletteChanged(GetRecordPtr^).Msg;
end;
procedure __TWMPaletteChanged__Wrapper.setUnused(const val : Longint);
begin
TWMPaletteChanged(GetRecordPtr^).Unused := val;
end;
function __TWMPaletteChanged__Wrapper.getUnused : Longint;
begin
result := TWMPaletteChanged(GetRecordPtr^).Unused;
end;
procedure __TWMPaletteChanged__Wrapper.setResult(const val : Longint);
begin
TWMPaletteChanged(GetRecordPtr^).Result := val;
end;
function __TWMPaletteChanged__Wrapper.getResult : Longint;
begin
result := TWMPaletteChanged(GetRecordPtr^).Result;
end;
function __TWMPaletteIsChanging__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMPaletteIsChanging__Wrapper.setMsg(const val : Cardinal);
begin
TWMPaletteIsChanging(GetRecordPtr^).Msg := val;
end;
function __TWMPaletteIsChanging__Wrapper.getMsg : Cardinal;
begin
result := TWMPaletteIsChanging(GetRecordPtr^).Msg;
end;
procedure __TWMPaletteIsChanging__Wrapper.setUnused(const val : Longint);
begin
TWMPaletteIsChanging(GetRecordPtr^).Unused := val;
end;
function __TWMPaletteIsChanging__Wrapper.getUnused : Longint;
begin
result := TWMPaletteIsChanging(GetRecordPtr^).Unused;
end;
procedure __TWMPaletteIsChanging__Wrapper.setResult(const val : Longint);
begin
TWMPaletteIsChanging(GetRecordPtr^).Result := val;
end;
function __TWMPaletteIsChanging__Wrapper.getResult : Longint;
begin
result := TWMPaletteIsChanging(GetRecordPtr^).Result;
end;
function __TWMParentNotify__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMParentNotify__Wrapper.setMsg(const val : Cardinal);
begin
TWMParentNotify(GetRecordPtr^).Msg := val;
end;
function __TWMParentNotify__Wrapper.getMsg : Cardinal;
begin
result := TWMParentNotify(GetRecordPtr^).Msg;
end;
procedure __TWMParentNotify__Wrapper.setChildID(const val : Word);
begin
TWMParentNotify(GetRecordPtr^).ChildID := val;
end;
function __TWMParentNotify__Wrapper.getChildID : Word;
begin
result := TWMParentNotify(GetRecordPtr^).ChildID;
end;
procedure __TWMParentNotify__Wrapper.setValue(const val : Word);
begin
TWMParentNotify(GetRecordPtr^).Value := val;
end;
function __TWMParentNotify__Wrapper.getValue : Word;
begin
result := TWMParentNotify(GetRecordPtr^).Value;
end;
procedure __TWMParentNotify__Wrapper.setXPos(const val : SmallInt);
begin
TWMParentNotify(GetRecordPtr^).XPos := val;
end;
function __TWMParentNotify__Wrapper.getXPos : SmallInt;
begin
result := TWMParentNotify(GetRecordPtr^).XPos;
end;
procedure __TWMParentNotify__Wrapper.setYPos(const val : SmallInt);
begin
TWMParentNotify(GetRecordPtr^).YPos := val;
end;
function __TWMParentNotify__Wrapper.getYPos : SmallInt;
begin
result := TWMParentNotify(GetRecordPtr^).YPos;
end;
procedure __TWMParentNotify__Wrapper.setValue1(const val : Word);
begin
TWMParentNotify(GetRecordPtr^).Value1 := val;
end;
function __TWMParentNotify__Wrapper.getValue1 : Word;
begin
result := TWMParentNotify(GetRecordPtr^).Value1;
end;
procedure __TWMParentNotify__Wrapper.setValue2(const val : Longint);
begin
TWMParentNotify(GetRecordPtr^).Value2 := val;
end;
function __TWMParentNotify__Wrapper.getValue2 : Longint;
begin
result := TWMParentNotify(GetRecordPtr^).Value2;
end;
procedure __TWMParentNotify__Wrapper.setResult(const val : Longint);
begin
TWMParentNotify(GetRecordPtr^).Result := val;
end;
function __TWMParentNotify__Wrapper.getResult : Longint;
begin
result := TWMParentNotify(GetRecordPtr^).Result;
end;
function __TWMPaste__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMPaste__Wrapper.setMsg(const val : Cardinal);
begin
TWMPaste(GetRecordPtr^).Msg := val;
end;
function __TWMPaste__Wrapper.getMsg : Cardinal;
begin
result := TWMPaste(GetRecordPtr^).Msg;
end;
procedure __TWMPaste__Wrapper.setResult(const val : Longint);
begin
TWMPaste(GetRecordPtr^).Result := val;
end;
function __TWMPaste__Wrapper.getResult : Longint;
begin
result := TWMPaste(GetRecordPtr^).Result;
end;
function __TWMPower__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMPower__Wrapper.setMsg(const val : Cardinal);
begin
TWMPower(GetRecordPtr^).Msg := val;
end;
function __TWMPower__Wrapper.getMsg : Cardinal;
begin
result := TWMPower(GetRecordPtr^).Msg;
end;
procedure __TWMPower__Wrapper.setPowerEvt(const val : Longint);
begin
TWMPower(GetRecordPtr^).PowerEvt := val;
end;
function __TWMPower__Wrapper.getPowerEvt : Longint;
begin
result := TWMPower(GetRecordPtr^).PowerEvt;
end;
procedure __TWMPower__Wrapper.setUnused(const val : Longint);
begin
TWMPower(GetRecordPtr^).Unused := val;
end;
function __TWMPower__Wrapper.getUnused : Longint;
begin
result := TWMPower(GetRecordPtr^).Unused;
end;
procedure __TWMPower__Wrapper.setResult(const val : Longint);
begin
TWMPower(GetRecordPtr^).Result := val;
end;
function __TWMPower__Wrapper.getResult : Longint;
begin
result := TWMPower(GetRecordPtr^).Result;
end;
function __TWMQueryDragIcon__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMQueryDragIcon__Wrapper.setMsg(const val : Cardinal);
begin
TWMQueryDragIcon(GetRecordPtr^).Msg := val;
end;
function __TWMQueryDragIcon__Wrapper.getMsg : Cardinal;
begin
result := TWMQueryDragIcon(GetRecordPtr^).Msg;
end;
procedure __TWMQueryDragIcon__Wrapper.setResult(const val : Longint);
begin
TWMQueryDragIcon(GetRecordPtr^).Result := val;
end;
function __TWMQueryDragIcon__Wrapper.getResult : Longint;
begin
result := TWMQueryDragIcon(GetRecordPtr^).Result;
end;
function __TWMQueryEndSession__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMQueryEndSession__Wrapper.setMsg(const val : Cardinal);
begin
TWMQueryEndSession(GetRecordPtr^).Msg := val;
end;
function __TWMQueryEndSession__Wrapper.getMsg : Cardinal;
begin
result := TWMQueryEndSession(GetRecordPtr^).Msg;
end;
procedure __TWMQueryEndSession__Wrapper.setSource(const val : Longint);
begin
TWMQueryEndSession(GetRecordPtr^).Source := val;
end;
function __TWMQueryEndSession__Wrapper.getSource : Longint;
begin
result := TWMQueryEndSession(GetRecordPtr^).Source;
end;
procedure __TWMQueryEndSession__Wrapper.setUnused(const val : Longint);
begin
TWMQueryEndSession(GetRecordPtr^).Unused := val;
end;
function __TWMQueryEndSession__Wrapper.getUnused : Longint;
begin
result := TWMQueryEndSession(GetRecordPtr^).Unused;
end;
procedure __TWMQueryEndSession__Wrapper.setResult(const val : Longint);
begin
TWMQueryEndSession(GetRecordPtr^).Result := val;
end;
function __TWMQueryEndSession__Wrapper.getResult : Longint;
begin
result := TWMQueryEndSession(GetRecordPtr^).Result;
end;
function __TWMQueryNewPalette__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMQueryNewPalette__Wrapper.setMsg(const val : Cardinal);
begin
TWMQueryNewPalette(GetRecordPtr^).Msg := val;
end;
function __TWMQueryNewPalette__Wrapper.getMsg : Cardinal;
begin
result := TWMQueryNewPalette(GetRecordPtr^).Msg;
end;
procedure __TWMQueryNewPalette__Wrapper.setResult(const val : Longint);
begin
TWMQueryNewPalette(GetRecordPtr^).Result := val;
end;
function __TWMQueryNewPalette__Wrapper.getResult : Longint;
begin
result := TWMQueryNewPalette(GetRecordPtr^).Result;
end;
function __TWMQueryOpen__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMQueryOpen__Wrapper.setMsg(const val : Cardinal);
begin
TWMQueryOpen(GetRecordPtr^).Msg := val;
end;
function __TWMQueryOpen__Wrapper.getMsg : Cardinal;
begin
result := TWMQueryOpen(GetRecordPtr^).Msg;
end;
procedure __TWMQueryOpen__Wrapper.setResult(const val : Longint);
begin
TWMQueryOpen(GetRecordPtr^).Result := val;
end;
function __TWMQueryOpen__Wrapper.getResult : Longint;
begin
result := TWMQueryOpen(GetRecordPtr^).Result;
end;
function __TWMQueueSync__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMQueueSync__Wrapper.setMsg(const val : Cardinal);
begin
TWMQueueSync(GetRecordPtr^).Msg := val;
end;
function __TWMQueueSync__Wrapper.getMsg : Cardinal;
begin
result := TWMQueueSync(GetRecordPtr^).Msg;
end;
procedure __TWMQueueSync__Wrapper.setResult(const val : Longint);
begin
TWMQueueSync(GetRecordPtr^).Result := val;
end;
function __TWMQueueSync__Wrapper.getResult : Longint;
begin
result := TWMQueueSync(GetRecordPtr^).Result;
end;
function __TWMQuit__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMQuit__Wrapper.setMsg(const val : Cardinal);
begin
TWMQuit(GetRecordPtr^).Msg := val;
end;
function __TWMQuit__Wrapper.getMsg : Cardinal;
begin
result := TWMQuit(GetRecordPtr^).Msg;
end;
procedure __TWMQuit__Wrapper.setExitCode(const val : Longint);
begin
TWMQuit(GetRecordPtr^).ExitCode := val;
end;
function __TWMQuit__Wrapper.getExitCode : Longint;
begin
result := TWMQuit(GetRecordPtr^).ExitCode;
end;
procedure __TWMQuit__Wrapper.setUnused(const val : Longint);
begin
TWMQuit(GetRecordPtr^).Unused := val;
end;
function __TWMQuit__Wrapper.getUnused : Longint;
begin
result := TWMQuit(GetRecordPtr^).Unused;
end;
procedure __TWMQuit__Wrapper.setResult(const val : Longint);
begin
TWMQuit(GetRecordPtr^).Result := val;
end;
function __TWMQuit__Wrapper.getResult : Longint;
begin
result := TWMQuit(GetRecordPtr^).Result;
end;
function __TWMRButtonDblClk__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMRButtonDblClk__Wrapper.setMsg(const val : Cardinal);
begin
TWMRButtonDblClk(GetRecordPtr^).Msg := val;
end;
function __TWMRButtonDblClk__Wrapper.getMsg : Cardinal;
begin
result := TWMRButtonDblClk(GetRecordPtr^).Msg;
end;
procedure __TWMRButtonDblClk__Wrapper.setKeys(const val : Longint);
begin
TWMRButtonDblClk(GetRecordPtr^).Keys := val;
end;
function __TWMRButtonDblClk__Wrapper.getKeys : Longint;
begin
result := TWMRButtonDblClk(GetRecordPtr^).Keys;
end;
procedure __TWMRButtonDblClk__Wrapper.setXPos(const val : SmallInt);
begin
TWMRButtonDblClk(GetRecordPtr^).XPos := val;
end;
function __TWMRButtonDblClk__Wrapper.getXPos : SmallInt;
begin
result := TWMRButtonDblClk(GetRecordPtr^).XPos;
end;
procedure __TWMRButtonDblClk__Wrapper.setYPos(const val : SmallInt);
begin
TWMRButtonDblClk(GetRecordPtr^).YPos := val;
end;
function __TWMRButtonDblClk__Wrapper.getYPos : SmallInt;
begin
result := TWMRButtonDblClk(GetRecordPtr^).YPos;
end;
procedure __TWMRButtonDblClk__Wrapper.setResult(const val : Longint);
begin
TWMRButtonDblClk(GetRecordPtr^).Result := val;
end;
function __TWMRButtonDblClk__Wrapper.getResult : Longint;
begin
result := TWMRButtonDblClk(GetRecordPtr^).Result;
end;
function __TWMRButtonDown__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMRButtonDown__Wrapper.setMsg(const val : Cardinal);
begin
TWMRButtonDown(GetRecordPtr^).Msg := val;
end;
function __TWMRButtonDown__Wrapper.getMsg : Cardinal;
begin
result := TWMRButtonDown(GetRecordPtr^).Msg;
end;
procedure __TWMRButtonDown__Wrapper.setKeys(const val : Longint);
begin
TWMRButtonDown(GetRecordPtr^).Keys := val;
end;
function __TWMRButtonDown__Wrapper.getKeys : Longint;
begin
result := TWMRButtonDown(GetRecordPtr^).Keys;
end;
procedure __TWMRButtonDown__Wrapper.setXPos(const val : SmallInt);
begin
TWMRButtonDown(GetRecordPtr^).XPos := val;
end;
function __TWMRButtonDown__Wrapper.getXPos : SmallInt;
begin
result := TWMRButtonDown(GetRecordPtr^).XPos;
end;
procedure __TWMRButtonDown__Wrapper.setYPos(const val : SmallInt);
begin
TWMRButtonDown(GetRecordPtr^).YPos := val;
end;
function __TWMRButtonDown__Wrapper.getYPos : SmallInt;
begin
result := TWMRButtonDown(GetRecordPtr^).YPos;
end;
procedure __TWMRButtonDown__Wrapper.setResult(const val : Longint);
begin
TWMRButtonDown(GetRecordPtr^).Result := val;
end;
function __TWMRButtonDown__Wrapper.getResult : Longint;
begin
result := TWMRButtonDown(GetRecordPtr^).Result;
end;
function __TWMRButtonUp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMRButtonUp__Wrapper.setMsg(const val : Cardinal);
begin
TWMRButtonUp(GetRecordPtr^).Msg := val;
end;
function __TWMRButtonUp__Wrapper.getMsg : Cardinal;
begin
result := TWMRButtonUp(GetRecordPtr^).Msg;
end;
procedure __TWMRButtonUp__Wrapper.setKeys(const val : Longint);
begin
TWMRButtonUp(GetRecordPtr^).Keys := val;
end;
function __TWMRButtonUp__Wrapper.getKeys : Longint;
begin
result := TWMRButtonUp(GetRecordPtr^).Keys;
end;
procedure __TWMRButtonUp__Wrapper.setXPos(const val : SmallInt);
begin
TWMRButtonUp(GetRecordPtr^).XPos := val;
end;
function __TWMRButtonUp__Wrapper.getXPos : SmallInt;
begin
result := TWMRButtonUp(GetRecordPtr^).XPos;
end;
procedure __TWMRButtonUp__Wrapper.setYPos(const val : SmallInt);
begin
TWMRButtonUp(GetRecordPtr^).YPos := val;
end;
function __TWMRButtonUp__Wrapper.getYPos : SmallInt;
begin
result := TWMRButtonUp(GetRecordPtr^).YPos;
end;
procedure __TWMRButtonUp__Wrapper.setResult(const val : Longint);
begin
TWMRButtonUp(GetRecordPtr^).Result := val;
end;
function __TWMRButtonUp__Wrapper.getResult : Longint;
begin
result := TWMRButtonUp(GetRecordPtr^).Result;
end;
function __TWMRenderAllFormats__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMRenderAllFormats__Wrapper.setMsg(const val : Cardinal);
begin
TWMRenderAllFormats(GetRecordPtr^).Msg := val;
end;
function __TWMRenderAllFormats__Wrapper.getMsg : Cardinal;
begin
result := TWMRenderAllFormats(GetRecordPtr^).Msg;
end;
procedure __TWMRenderAllFormats__Wrapper.setResult(const val : Longint);
begin
TWMRenderAllFormats(GetRecordPtr^).Result := val;
end;
function __TWMRenderAllFormats__Wrapper.getResult : Longint;
begin
result := TWMRenderAllFormats(GetRecordPtr^).Result;
end;
function __TWMRenderFormat__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMRenderFormat__Wrapper.setMsg(const val : Cardinal);
begin
TWMRenderFormat(GetRecordPtr^).Msg := val;
end;
function __TWMRenderFormat__Wrapper.getMsg : Cardinal;
begin
result := TWMRenderFormat(GetRecordPtr^).Msg;
end;
procedure __TWMRenderFormat__Wrapper.setFormat(const val : Longint);
begin
TWMRenderFormat(GetRecordPtr^).Format := val;
end;
function __TWMRenderFormat__Wrapper.getFormat : Longint;
begin
result := TWMRenderFormat(GetRecordPtr^).Format;
end;
procedure __TWMRenderFormat__Wrapper.setUnused(const val : Longint);
begin
TWMRenderFormat(GetRecordPtr^).Unused := val;
end;
function __TWMRenderFormat__Wrapper.getUnused : Longint;
begin
result := TWMRenderFormat(GetRecordPtr^).Unused;
end;
procedure __TWMRenderFormat__Wrapper.setResult(const val : Longint);
begin
TWMRenderFormat(GetRecordPtr^).Result := val;
end;
function __TWMRenderFormat__Wrapper.getResult : Longint;
begin
result := TWMRenderFormat(GetRecordPtr^).Result;
end;
function __TWMScroll__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMScroll__Wrapper.setMsg(const val : Cardinal);
begin
TWMScroll(GetRecordPtr^).Msg := val;
end;
function __TWMScroll__Wrapper.getMsg : Cardinal;
begin
result := TWMScroll(GetRecordPtr^).Msg;
end;
procedure __TWMScroll__Wrapper.setScrollCode(const val : SmallInt);
begin
TWMScroll(GetRecordPtr^).ScrollCode := val;
end;
function __TWMScroll__Wrapper.getScrollCode : SmallInt;
begin
result := TWMScroll(GetRecordPtr^).ScrollCode;
end;
procedure __TWMScroll__Wrapper.setPos(const val : SmallInt);
begin
TWMScroll(GetRecordPtr^).Pos := val;
end;
function __TWMScroll__Wrapper.getPos : SmallInt;
begin
result := TWMScroll(GetRecordPtr^).Pos;
end;
procedure __TWMScroll__Wrapper.setResult(const val : Longint);
begin
TWMScroll(GetRecordPtr^).Result := val;
end;
function __TWMScroll__Wrapper.getResult : Longint;
begin
result := TWMScroll(GetRecordPtr^).Result;
end;
function __TWMSetCursor__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSetCursor__Wrapper.setMsg(const val : Cardinal);
begin
TWMSetCursor(GetRecordPtr^).Msg := val;
end;
function __TWMSetCursor__Wrapper.getMsg : Cardinal;
begin
result := TWMSetCursor(GetRecordPtr^).Msg;
end;
procedure __TWMSetCursor__Wrapper.setHitTest(const val : Word);
begin
TWMSetCursor(GetRecordPtr^).HitTest := val;
end;
function __TWMSetCursor__Wrapper.getHitTest : Word;
begin
result := TWMSetCursor(GetRecordPtr^).HitTest;
end;
procedure __TWMSetCursor__Wrapper.setMouseMsg(const val : Word);
begin
TWMSetCursor(GetRecordPtr^).MouseMsg := val;
end;
function __TWMSetCursor__Wrapper.getMouseMsg : Word;
begin
result := TWMSetCursor(GetRecordPtr^).MouseMsg;
end;
procedure __TWMSetCursor__Wrapper.setResult(const val : Longint);
begin
TWMSetCursor(GetRecordPtr^).Result := val;
end;
function __TWMSetCursor__Wrapper.getResult : Longint;
begin
result := TWMSetCursor(GetRecordPtr^).Result;
end;
function __TWMSetFocus__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSetFocus__Wrapper.setMsg(const val : Cardinal);
begin
TWMSetFocus(GetRecordPtr^).Msg := val;
end;
function __TWMSetFocus__Wrapper.getMsg : Cardinal;
begin
result := TWMSetFocus(GetRecordPtr^).Msg;
end;
procedure __TWMSetFocus__Wrapper.setUnused(const val : Longint);
begin
TWMSetFocus(GetRecordPtr^).Unused := val;
end;
function __TWMSetFocus__Wrapper.getUnused : Longint;
begin
result := TWMSetFocus(GetRecordPtr^).Unused;
end;
procedure __TWMSetFocus__Wrapper.setResult(const val : Longint);
begin
TWMSetFocus(GetRecordPtr^).Result := val;
end;
function __TWMSetFocus__Wrapper.getResult : Longint;
begin
result := TWMSetFocus(GetRecordPtr^).Result;
end;
function __TWMSetFont__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSetFont__Wrapper.setMsg(const val : Cardinal);
begin
TWMSetFont(GetRecordPtr^).Msg := val;
end;
function __TWMSetFont__Wrapper.getMsg : Cardinal;
begin
result := TWMSetFont(GetRecordPtr^).Msg;
end;
procedure __TWMSetFont__Wrapper.setRedraw(const val : WordBool);
begin
TWMSetFont(GetRecordPtr^).Redraw := val;
end;
function __TWMSetFont__Wrapper.getRedraw : WordBool;
begin
result := TWMSetFont(GetRecordPtr^).Redraw;
end;
procedure __TWMSetFont__Wrapper.setUnused(const val : Word);
begin
TWMSetFont(GetRecordPtr^).Unused := val;
end;
function __TWMSetFont__Wrapper.getUnused : Word;
begin
result := TWMSetFont(GetRecordPtr^).Unused;
end;
procedure __TWMSetFont__Wrapper.setResult(const val : Longint);
begin
TWMSetFont(GetRecordPtr^).Result := val;
end;
function __TWMSetFont__Wrapper.getResult : Longint;
begin
result := TWMSetFont(GetRecordPtr^).Result;
end;
function __TWMSetHotKey__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSetHotKey__Wrapper.setMsg(const val : Cardinal);
begin
TWMSetHotKey(GetRecordPtr^).Msg := val;
end;
function __TWMSetHotKey__Wrapper.getMsg : Cardinal;
begin
result := TWMSetHotKey(GetRecordPtr^).Msg;
end;
procedure __TWMSetHotKey__Wrapper.setKey(const val : Longint);
begin
TWMSetHotKey(GetRecordPtr^).Key := val;
end;
function __TWMSetHotKey__Wrapper.getKey : Longint;
begin
result := TWMSetHotKey(GetRecordPtr^).Key;
end;
procedure __TWMSetHotKey__Wrapper.setUnused(const val : Longint);
begin
TWMSetHotKey(GetRecordPtr^).Unused := val;
end;
function __TWMSetHotKey__Wrapper.getUnused : Longint;
begin
result := TWMSetHotKey(GetRecordPtr^).Unused;
end;
procedure __TWMSetHotKey__Wrapper.setResult(const val : Longint);
begin
TWMSetHotKey(GetRecordPtr^).Result := val;
end;
function __TWMSetHotKey__Wrapper.getResult : Longint;
begin
result := TWMSetHotKey(GetRecordPtr^).Result;
end;
function __TWMSetIcon__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSetIcon__Wrapper.setMsg(const val : Cardinal);
begin
TWMSetIcon(GetRecordPtr^).Msg := val;
end;
function __TWMSetIcon__Wrapper.getMsg : Cardinal;
begin
result := TWMSetIcon(GetRecordPtr^).Msg;
end;
procedure __TWMSetIcon__Wrapper.setBigIcon(const val : LongBool);
begin
TWMSetIcon(GetRecordPtr^).BigIcon := val;
end;
function __TWMSetIcon__Wrapper.getBigIcon : LongBool;
begin
result := TWMSetIcon(GetRecordPtr^).BigIcon;
end;
procedure __TWMSetIcon__Wrapper.setResult(const val : Longint);
begin
TWMSetIcon(GetRecordPtr^).Result := val;
end;
function __TWMSetIcon__Wrapper.getResult : Longint;
begin
result := TWMSetIcon(GetRecordPtr^).Result;
end;
function __TWMSetRedraw__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSetRedraw__Wrapper.setMsg(const val : Cardinal);
begin
TWMSetRedraw(GetRecordPtr^).Msg := val;
end;
function __TWMSetRedraw__Wrapper.getMsg : Cardinal;
begin
result := TWMSetRedraw(GetRecordPtr^).Msg;
end;
procedure __TWMSetRedraw__Wrapper.setRedraw(const val : Longint);
begin
TWMSetRedraw(GetRecordPtr^).Redraw := val;
end;
function __TWMSetRedraw__Wrapper.getRedraw : Longint;
begin
result := TWMSetRedraw(GetRecordPtr^).Redraw;
end;
procedure __TWMSetRedraw__Wrapper.setUnused(const val : Longint);
begin
TWMSetRedraw(GetRecordPtr^).Unused := val;
end;
function __TWMSetRedraw__Wrapper.getUnused : Longint;
begin
result := TWMSetRedraw(GetRecordPtr^).Unused;
end;
procedure __TWMSetRedraw__Wrapper.setResult(const val : Longint);
begin
TWMSetRedraw(GetRecordPtr^).Result := val;
end;
function __TWMSetRedraw__Wrapper.getResult : Longint;
begin
result := TWMSetRedraw(GetRecordPtr^).Result;
end;
function __TWMSetText__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSetText__Wrapper.setMsg(const val : Cardinal);
begin
TWMSetText(GetRecordPtr^).Msg := val;
end;
function __TWMSetText__Wrapper.getMsg : Cardinal;
begin
result := TWMSetText(GetRecordPtr^).Msg;
end;
procedure __TWMSetText__Wrapper.setUnused(const val : Longint);
begin
TWMSetText(GetRecordPtr^).Unused := val;
end;
function __TWMSetText__Wrapper.getUnused : Longint;
begin
result := TWMSetText(GetRecordPtr^).Unused;
end;
procedure __TWMSetText__Wrapper.setResult(const val : Longint);
begin
TWMSetText(GetRecordPtr^).Result := val;
end;
function __TWMSetText__Wrapper.getResult : Longint;
begin
result := TWMSetText(GetRecordPtr^).Result;
end;
function __TWMSettingChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSettingChange__Wrapper.setMsg(const val : Cardinal);
begin
TWMSettingChange(GetRecordPtr^).Msg := val;
end;
function __TWMSettingChange__Wrapper.getMsg : Cardinal;
begin
result := TWMSettingChange(GetRecordPtr^).Msg;
end;
procedure __TWMSettingChange__Wrapper.setFlag(const val : Integer);
begin
TWMSettingChange(GetRecordPtr^).Flag := val;
end;
function __TWMSettingChange__Wrapper.getFlag : Integer;
begin
result := TWMSettingChange(GetRecordPtr^).Flag;
end;
procedure __TWMSettingChange__Wrapper.setResult(const val : Longint);
begin
TWMSettingChange(GetRecordPtr^).Result := val;
end;
function __TWMSettingChange__Wrapper.getResult : Longint;
begin
result := TWMSettingChange(GetRecordPtr^).Result;
end;
function __TWMShowWindow__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMShowWindow__Wrapper.setMsg(const val : Cardinal);
begin
TWMShowWindow(GetRecordPtr^).Msg := val;
end;
function __TWMShowWindow__Wrapper.getMsg : Cardinal;
begin
result := TWMShowWindow(GetRecordPtr^).Msg;
end;
procedure __TWMShowWindow__Wrapper.setShow(const val : BOOL);
begin
TWMShowWindow(GetRecordPtr^).Show := val;
end;
function __TWMShowWindow__Wrapper.getShow : BOOL;
begin
result := TWMShowWindow(GetRecordPtr^).Show;
end;
procedure __TWMShowWindow__Wrapper.setStatus(const val : Longint);
begin
TWMShowWindow(GetRecordPtr^).Status := val;
end;
function __TWMShowWindow__Wrapper.getStatus : Longint;
begin
result := TWMShowWindow(GetRecordPtr^).Status;
end;
procedure __TWMShowWindow__Wrapper.setResult(const val : Longint);
begin
TWMShowWindow(GetRecordPtr^).Result := val;
end;
function __TWMShowWindow__Wrapper.getResult : Longint;
begin
result := TWMShowWindow(GetRecordPtr^).Result;
end;
function __TWMSize__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSize__Wrapper.setMsg(const val : Cardinal);
begin
TWMSize(GetRecordPtr^).Msg := val;
end;
function __TWMSize__Wrapper.getMsg : Cardinal;
begin
result := TWMSize(GetRecordPtr^).Msg;
end;
procedure __TWMSize__Wrapper.setSizeType(const val : Longint);
begin
TWMSize(GetRecordPtr^).SizeType := val;
end;
function __TWMSize__Wrapper.getSizeType : Longint;
begin
result := TWMSize(GetRecordPtr^).SizeType;
end;
procedure __TWMSize__Wrapper.setWidth(const val : Word);
begin
TWMSize(GetRecordPtr^).Width := val;
end;
function __TWMSize__Wrapper.getWidth : Word;
begin
result := TWMSize(GetRecordPtr^).Width;
end;
procedure __TWMSize__Wrapper.setHeight(const val : Word);
begin
TWMSize(GetRecordPtr^).Height := val;
end;
function __TWMSize__Wrapper.getHeight : Word;
begin
result := TWMSize(GetRecordPtr^).Height;
end;
procedure __TWMSize__Wrapper.setResult(const val : Longint);
begin
TWMSize(GetRecordPtr^).Result := val;
end;
function __TWMSize__Wrapper.getResult : Longint;
begin
result := TWMSize(GetRecordPtr^).Result;
end;
function __TWMSizeClipboard__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSizeClipboard__Wrapper.setMsg(const val : Cardinal);
begin
TWMSizeClipboard(GetRecordPtr^).Msg := val;
end;
function __TWMSizeClipboard__Wrapper.getMsg : Cardinal;
begin
result := TWMSizeClipboard(GetRecordPtr^).Msg;
end;
procedure __TWMSizeClipboard__Wrapper.setRC(const val : THandle);
begin
TWMSizeClipboard(GetRecordPtr^).RC := val;
end;
function __TWMSizeClipboard__Wrapper.getRC : THandle;
begin
result := TWMSizeClipboard(GetRecordPtr^).RC;
end;
procedure __TWMSizeClipboard__Wrapper.setResult(const val : Longint);
begin
TWMSizeClipboard(GetRecordPtr^).Result := val;
end;
function __TWMSizeClipboard__Wrapper.getResult : Longint;
begin
result := TWMSizeClipboard(GetRecordPtr^).Result;
end;
function __TWMSpoolerStatus__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSpoolerStatus__Wrapper.setMsg(const val : Cardinal);
begin
TWMSpoolerStatus(GetRecordPtr^).Msg := val;
end;
function __TWMSpoolerStatus__Wrapper.getMsg : Cardinal;
begin
result := TWMSpoolerStatus(GetRecordPtr^).Msg;
end;
procedure __TWMSpoolerStatus__Wrapper.setJobStatus(const val : Longint);
begin
TWMSpoolerStatus(GetRecordPtr^).JobStatus := val;
end;
function __TWMSpoolerStatus__Wrapper.getJobStatus : Longint;
begin
result := TWMSpoolerStatus(GetRecordPtr^).JobStatus;
end;
procedure __TWMSpoolerStatus__Wrapper.setJobsLeft(const val : Word);
begin
TWMSpoolerStatus(GetRecordPtr^).JobsLeft := val;
end;
function __TWMSpoolerStatus__Wrapper.getJobsLeft : Word;
begin
result := TWMSpoolerStatus(GetRecordPtr^).JobsLeft;
end;
procedure __TWMSpoolerStatus__Wrapper.setUnused(const val : Word);
begin
TWMSpoolerStatus(GetRecordPtr^).Unused := val;
end;
function __TWMSpoolerStatus__Wrapper.getUnused : Word;
begin
result := TWMSpoolerStatus(GetRecordPtr^).Unused;
end;
procedure __TWMSpoolerStatus__Wrapper.setResult(const val : Longint);
begin
TWMSpoolerStatus(GetRecordPtr^).Result := val;
end;
function __TWMSpoolerStatus__Wrapper.getResult : Longint;
begin
result := TWMSpoolerStatus(GetRecordPtr^).Result;
end;
function __TWMStyleChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMStyleChange__Wrapper.setMsg(const val : Cardinal);
begin
TWMStyleChange(GetRecordPtr^).Msg := val;
end;
function __TWMStyleChange__Wrapper.getMsg : Cardinal;
begin
result := TWMStyleChange(GetRecordPtr^).Msg;
end;
procedure __TWMStyleChange__Wrapper.setStyleType(const val : Longint);
begin
TWMStyleChange(GetRecordPtr^).StyleType := val;
end;
function __TWMStyleChange__Wrapper.getStyleType : Longint;
begin
result := TWMStyleChange(GetRecordPtr^).StyleType;
end;
procedure __TWMStyleChange__Wrapper.setResult(const val : Longint);
begin
TWMStyleChange(GetRecordPtr^).Result := val;
end;
function __TWMStyleChange__Wrapper.getResult : Longint;
begin
result := TWMStyleChange(GetRecordPtr^).Result;
end;
function __TWMStyleChanged__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMStyleChanged__Wrapper.setMsg(const val : Cardinal);
begin
TWMStyleChanged(GetRecordPtr^).Msg := val;
end;
function __TWMStyleChanged__Wrapper.getMsg : Cardinal;
begin
result := TWMStyleChanged(GetRecordPtr^).Msg;
end;
procedure __TWMStyleChanged__Wrapper.setStyleType(const val : Longint);
begin
TWMStyleChanged(GetRecordPtr^).StyleType := val;
end;
function __TWMStyleChanged__Wrapper.getStyleType : Longint;
begin
result := TWMStyleChanged(GetRecordPtr^).StyleType;
end;
procedure __TWMStyleChanged__Wrapper.setResult(const val : Longint);
begin
TWMStyleChanged(GetRecordPtr^).Result := val;
end;
function __TWMStyleChanged__Wrapper.getResult : Longint;
begin
result := TWMStyleChanged(GetRecordPtr^).Result;
end;
function __TWMStyleChanging__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMStyleChanging__Wrapper.setMsg(const val : Cardinal);
begin
TWMStyleChanging(GetRecordPtr^).Msg := val;
end;
function __TWMStyleChanging__Wrapper.getMsg : Cardinal;
begin
result := TWMStyleChanging(GetRecordPtr^).Msg;
end;
procedure __TWMStyleChanging__Wrapper.setStyleType(const val : Longint);
begin
TWMStyleChanging(GetRecordPtr^).StyleType := val;
end;
function __TWMStyleChanging__Wrapper.getStyleType : Longint;
begin
result := TWMStyleChanging(GetRecordPtr^).StyleType;
end;
procedure __TWMStyleChanging__Wrapper.setResult(const val : Longint);
begin
TWMStyleChanging(GetRecordPtr^).Result := val;
end;
function __TWMStyleChanging__Wrapper.getResult : Longint;
begin
result := TWMStyleChanging(GetRecordPtr^).Result;
end;
function __TWMSysChar__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSysChar__Wrapper.setMsg(const val : Cardinal);
begin
TWMSysChar(GetRecordPtr^).Msg := val;
end;
function __TWMSysChar__Wrapper.getMsg : Cardinal;
begin
result := TWMSysChar(GetRecordPtr^).Msg;
end;
procedure __TWMSysChar__Wrapper.setCharCode(const val : Word);
begin
TWMSysChar(GetRecordPtr^).CharCode := val;
end;
function __TWMSysChar__Wrapper.getCharCode : Word;
begin
result := TWMSysChar(GetRecordPtr^).CharCode;
end;
procedure __TWMSysChar__Wrapper.setUnused(const val : Word);
begin
TWMSysChar(GetRecordPtr^).Unused := val;
end;
function __TWMSysChar__Wrapper.getUnused : Word;
begin
result := TWMSysChar(GetRecordPtr^).Unused;
end;
procedure __TWMSysChar__Wrapper.setKeyData(const val : Longint);
begin
TWMSysChar(GetRecordPtr^).KeyData := val;
end;
function __TWMSysChar__Wrapper.getKeyData : Longint;
begin
result := TWMSysChar(GetRecordPtr^).KeyData;
end;
procedure __TWMSysChar__Wrapper.setResult(const val : Longint);
begin
TWMSysChar(GetRecordPtr^).Result := val;
end;
function __TWMSysChar__Wrapper.getResult : Longint;
begin
result := TWMSysChar(GetRecordPtr^).Result;
end;
function __TWMSysColorChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSysColorChange__Wrapper.setMsg(const val : Cardinal);
begin
TWMSysColorChange(GetRecordPtr^).Msg := val;
end;
function __TWMSysColorChange__Wrapper.getMsg : Cardinal;
begin
result := TWMSysColorChange(GetRecordPtr^).Msg;
end;
procedure __TWMSysColorChange__Wrapper.setResult(const val : Longint);
begin
TWMSysColorChange(GetRecordPtr^).Result := val;
end;
function __TWMSysColorChange__Wrapper.getResult : Longint;
begin
result := TWMSysColorChange(GetRecordPtr^).Result;
end;
function __TWMSysCommand__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSysCommand__Wrapper.setMsg(const val : Cardinal);
begin
TWMSysCommand(GetRecordPtr^).Msg := val;
end;
function __TWMSysCommand__Wrapper.getMsg : Cardinal;
begin
result := TWMSysCommand(GetRecordPtr^).Msg;
end;
procedure __TWMSysCommand__Wrapper.setKey(const val : Word);
begin
TWMSysCommand(GetRecordPtr^).Key := val;
end;
function __TWMSysCommand__Wrapper.getKey : Word;
begin
result := TWMSysCommand(GetRecordPtr^).Key;
end;
procedure __TWMSysCommand__Wrapper.setXPos(const val : SmallInt);
begin
TWMSysCommand(GetRecordPtr^).XPos := val;
end;
function __TWMSysCommand__Wrapper.getXPos : SmallInt;
begin
result := TWMSysCommand(GetRecordPtr^).XPos;
end;
procedure __TWMSysCommand__Wrapper.setYPos(const val : SmallInt);
begin
TWMSysCommand(GetRecordPtr^).YPos := val;
end;
function __TWMSysCommand__Wrapper.getYPos : SmallInt;
begin
result := TWMSysCommand(GetRecordPtr^).YPos;
end;
procedure __TWMSysCommand__Wrapper.setResult(const val : Longint);
begin
TWMSysCommand(GetRecordPtr^).Result := val;
end;
function __TWMSysCommand__Wrapper.getResult : Longint;
begin
result := TWMSysCommand(GetRecordPtr^).Result;
end;
function __TWMSysDeadChar__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSysDeadChar__Wrapper.setMsg(const val : Cardinal);
begin
TWMSysDeadChar(GetRecordPtr^).Msg := val;
end;
function __TWMSysDeadChar__Wrapper.getMsg : Cardinal;
begin
result := TWMSysDeadChar(GetRecordPtr^).Msg;
end;
procedure __TWMSysDeadChar__Wrapper.setCharCode(const val : Word);
begin
TWMSysDeadChar(GetRecordPtr^).CharCode := val;
end;
function __TWMSysDeadChar__Wrapper.getCharCode : Word;
begin
result := TWMSysDeadChar(GetRecordPtr^).CharCode;
end;
procedure __TWMSysDeadChar__Wrapper.setUnused(const val : Word);
begin
TWMSysDeadChar(GetRecordPtr^).Unused := val;
end;
function __TWMSysDeadChar__Wrapper.getUnused : Word;
begin
result := TWMSysDeadChar(GetRecordPtr^).Unused;
end;
procedure __TWMSysDeadChar__Wrapper.setKeyData(const val : Longint);
begin
TWMSysDeadChar(GetRecordPtr^).KeyData := val;
end;
function __TWMSysDeadChar__Wrapper.getKeyData : Longint;
begin
result := TWMSysDeadChar(GetRecordPtr^).KeyData;
end;
procedure __TWMSysDeadChar__Wrapper.setResult(const val : Longint);
begin
TWMSysDeadChar(GetRecordPtr^).Result := val;
end;
function __TWMSysDeadChar__Wrapper.getResult : Longint;
begin
result := TWMSysDeadChar(GetRecordPtr^).Result;
end;
function __TWMSysKeyDown__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSysKeyDown__Wrapper.setMsg(const val : Cardinal);
begin
TWMSysKeyDown(GetRecordPtr^).Msg := val;
end;
function __TWMSysKeyDown__Wrapper.getMsg : Cardinal;
begin
result := TWMSysKeyDown(GetRecordPtr^).Msg;
end;
procedure __TWMSysKeyDown__Wrapper.setCharCode(const val : Word);
begin
TWMSysKeyDown(GetRecordPtr^).CharCode := val;
end;
function __TWMSysKeyDown__Wrapper.getCharCode : Word;
begin
result := TWMSysKeyDown(GetRecordPtr^).CharCode;
end;
procedure __TWMSysKeyDown__Wrapper.setUnused(const val : Word);
begin
TWMSysKeyDown(GetRecordPtr^).Unused := val;
end;
function __TWMSysKeyDown__Wrapper.getUnused : Word;
begin
result := TWMSysKeyDown(GetRecordPtr^).Unused;
end;
procedure __TWMSysKeyDown__Wrapper.setKeyData(const val : Longint);
begin
TWMSysKeyDown(GetRecordPtr^).KeyData := val;
end;
function __TWMSysKeyDown__Wrapper.getKeyData : Longint;
begin
result := TWMSysKeyDown(GetRecordPtr^).KeyData;
end;
procedure __TWMSysKeyDown__Wrapper.setResult(const val : Longint);
begin
TWMSysKeyDown(GetRecordPtr^).Result := val;
end;
function __TWMSysKeyDown__Wrapper.getResult : Longint;
begin
result := TWMSysKeyDown(GetRecordPtr^).Result;
end;
function __TWMSysKeyUp__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSysKeyUp__Wrapper.setMsg(const val : Cardinal);
begin
TWMSysKeyUp(GetRecordPtr^).Msg := val;
end;
function __TWMSysKeyUp__Wrapper.getMsg : Cardinal;
begin
result := TWMSysKeyUp(GetRecordPtr^).Msg;
end;
procedure __TWMSysKeyUp__Wrapper.setCharCode(const val : Word);
begin
TWMSysKeyUp(GetRecordPtr^).CharCode := val;
end;
function __TWMSysKeyUp__Wrapper.getCharCode : Word;
begin
result := TWMSysKeyUp(GetRecordPtr^).CharCode;
end;
procedure __TWMSysKeyUp__Wrapper.setUnused(const val : Word);
begin
TWMSysKeyUp(GetRecordPtr^).Unused := val;
end;
function __TWMSysKeyUp__Wrapper.getUnused : Word;
begin
result := TWMSysKeyUp(GetRecordPtr^).Unused;
end;
procedure __TWMSysKeyUp__Wrapper.setKeyData(const val : Longint);
begin
TWMSysKeyUp(GetRecordPtr^).KeyData := val;
end;
function __TWMSysKeyUp__Wrapper.getKeyData : Longint;
begin
result := TWMSysKeyUp(GetRecordPtr^).KeyData;
end;
procedure __TWMSysKeyUp__Wrapper.setResult(const val : Longint);
begin
TWMSysKeyUp(GetRecordPtr^).Result := val;
end;
function __TWMSysKeyUp__Wrapper.getResult : Longint;
begin
result := TWMSysKeyUp(GetRecordPtr^).Result;
end;
function __TWMSystemError__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMSystemError__Wrapper.setMsg(const val : Cardinal);
begin
TWMSystemError(GetRecordPtr^).Msg := val;
end;
function __TWMSystemError__Wrapper.getMsg : Cardinal;
begin
result := TWMSystemError(GetRecordPtr^).Msg;
end;
procedure __TWMSystemError__Wrapper.setErrSpec(const val : Word);
begin
TWMSystemError(GetRecordPtr^).ErrSpec := val;
end;
function __TWMSystemError__Wrapper.getErrSpec : Word;
begin
result := TWMSystemError(GetRecordPtr^).ErrSpec;
end;
procedure __TWMSystemError__Wrapper.setUnused(const val : Longint);
begin
TWMSystemError(GetRecordPtr^).Unused := val;
end;
function __TWMSystemError__Wrapper.getUnused : Longint;
begin
result := TWMSystemError(GetRecordPtr^).Unused;
end;
procedure __TWMSystemError__Wrapper.setResult(const val : Longint);
begin
TWMSystemError(GetRecordPtr^).Result := val;
end;
function __TWMSystemError__Wrapper.getResult : Longint;
begin
result := TWMSystemError(GetRecordPtr^).Result;
end;
function __TWMTimeChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMTimeChange__Wrapper.setMsg(const val : Cardinal);
begin
TWMTimeChange(GetRecordPtr^).Msg := val;
end;
function __TWMTimeChange__Wrapper.getMsg : Cardinal;
begin
result := TWMTimeChange(GetRecordPtr^).Msg;
end;
procedure __TWMTimeChange__Wrapper.setResult(const val : Longint);
begin
TWMTimeChange(GetRecordPtr^).Result := val;
end;
function __TWMTimeChange__Wrapper.getResult : Longint;
begin
result := TWMTimeChange(GetRecordPtr^).Result;
end;
function __TWMTimer__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMTimer__Wrapper.setMsg(const val : Cardinal);
begin
TWMTimer(GetRecordPtr^).Msg := val;
end;
function __TWMTimer__Wrapper.getMsg : Cardinal;
begin
result := TWMTimer(GetRecordPtr^).Msg;
end;
procedure __TWMTimer__Wrapper.setTimerID(const val : Longint);
begin
TWMTimer(GetRecordPtr^).TimerID := val;
end;
function __TWMTimer__Wrapper.getTimerID : Longint;
begin
result := TWMTimer(GetRecordPtr^).TimerID;
end;
procedure __TWMTimer__Wrapper.setResult(const val : Longint);
begin
TWMTimer(GetRecordPtr^).Result := val;
end;
function __TWMTimer__Wrapper.getResult : Longint;
begin
result := TWMTimer(GetRecordPtr^).Result;
end;
function __TWMUndo__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMUndo__Wrapper.setMsg(const val : Cardinal);
begin
TWMUndo(GetRecordPtr^).Msg := val;
end;
function __TWMUndo__Wrapper.getMsg : Cardinal;
begin
result := TWMUndo(GetRecordPtr^).Msg;
end;
procedure __TWMUndo__Wrapper.setResult(const val : Longint);
begin
TWMUndo(GetRecordPtr^).Result := val;
end;
function __TWMUndo__Wrapper.getResult : Longint;
begin
result := TWMUndo(GetRecordPtr^).Result;
end;
function __TWMVKeyToItem__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMVKeyToItem__Wrapper.setMsg(const val : Cardinal);
begin
TWMVKeyToItem(GetRecordPtr^).Msg := val;
end;
function __TWMVKeyToItem__Wrapper.getMsg : Cardinal;
begin
result := TWMVKeyToItem(GetRecordPtr^).Msg;
end;
procedure __TWMVKeyToItem__Wrapper.setKey(const val : Word);
begin
TWMVKeyToItem(GetRecordPtr^).Key := val;
end;
function __TWMVKeyToItem__Wrapper.getKey : Word;
begin
result := TWMVKeyToItem(GetRecordPtr^).Key;
end;
procedure __TWMVKeyToItem__Wrapper.setCaretPos(const val : Word);
begin
TWMVKeyToItem(GetRecordPtr^).CaretPos := val;
end;
function __TWMVKeyToItem__Wrapper.getCaretPos : Word;
begin
result := TWMVKeyToItem(GetRecordPtr^).CaretPos;
end;
procedure __TWMVKeyToItem__Wrapper.setResult(const val : Longint);
begin
TWMVKeyToItem(GetRecordPtr^).Result := val;
end;
function __TWMVKeyToItem__Wrapper.getResult : Longint;
begin
result := TWMVKeyToItem(GetRecordPtr^).Result;
end;
function __TWMVScroll__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMVScroll__Wrapper.setMsg(const val : Cardinal);
begin
TWMVScroll(GetRecordPtr^).Msg := val;
end;
function __TWMVScroll__Wrapper.getMsg : Cardinal;
begin
result := TWMVScroll(GetRecordPtr^).Msg;
end;
procedure __TWMVScroll__Wrapper.setScrollCode(const val : SmallInt);
begin
TWMVScroll(GetRecordPtr^).ScrollCode := val;
end;
function __TWMVScroll__Wrapper.getScrollCode : SmallInt;
begin
result := TWMVScroll(GetRecordPtr^).ScrollCode;
end;
procedure __TWMVScroll__Wrapper.setPos(const val : SmallInt);
begin
TWMVScroll(GetRecordPtr^).Pos := val;
end;
function __TWMVScroll__Wrapper.getPos : SmallInt;
begin
result := TWMVScroll(GetRecordPtr^).Pos;
end;
procedure __TWMVScroll__Wrapper.setResult(const val : Longint);
begin
TWMVScroll(GetRecordPtr^).Result := val;
end;
function __TWMVScroll__Wrapper.getResult : Longint;
begin
result := TWMVScroll(GetRecordPtr^).Result;
end;
function __TWMVScrollClipboard__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMVScrollClipboard__Wrapper.setMsg(const val : Cardinal);
begin
TWMVScrollClipboard(GetRecordPtr^).Msg := val;
end;
function __TWMVScrollClipboard__Wrapper.getMsg : Cardinal;
begin
result := TWMVScrollClipboard(GetRecordPtr^).Msg;
end;
procedure __TWMVScrollClipboard__Wrapper.setScollCode(const val : Word);
begin
TWMVScrollClipboard(GetRecordPtr^).ScollCode := val;
end;
function __TWMVScrollClipboard__Wrapper.getScollCode : Word;
begin
result := TWMVScrollClipboard(GetRecordPtr^).ScollCode;
end;
procedure __TWMVScrollClipboard__Wrapper.setThumbPos(const val : Word);
begin
TWMVScrollClipboard(GetRecordPtr^).ThumbPos := val;
end;
function __TWMVScrollClipboard__Wrapper.getThumbPos : Word;
begin
result := TWMVScrollClipboard(GetRecordPtr^).ThumbPos;
end;
procedure __TWMVScrollClipboard__Wrapper.setResult(const val : Longint);
begin
TWMVScrollClipboard(GetRecordPtr^).Result := val;
end;
function __TWMVScrollClipboard__Wrapper.getResult : Longint;
begin
result := TWMVScrollClipboard(GetRecordPtr^).Result;
end;
function __TWMWindowPosChanged__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMWindowPosChanged__Wrapper.setMsg(const val : Cardinal);
begin
TWMWindowPosChanged(GetRecordPtr^).Msg := val;
end;
function __TWMWindowPosChanged__Wrapper.getMsg : Cardinal;
begin
result := TWMWindowPosChanged(GetRecordPtr^).Msg;
end;
procedure __TWMWindowPosChanged__Wrapper.setUnused(const val : Integer);
begin
TWMWindowPosChanged(GetRecordPtr^).Unused := val;
end;
function __TWMWindowPosChanged__Wrapper.getUnused : Integer;
begin
result := TWMWindowPosChanged(GetRecordPtr^).Unused;
end;
procedure __TWMWindowPosChanged__Wrapper.setResult(const val : Longint);
begin
TWMWindowPosChanged(GetRecordPtr^).Result := val;
end;
function __TWMWindowPosChanged__Wrapper.getResult : Longint;
begin
result := TWMWindowPosChanged(GetRecordPtr^).Result;
end;
function __TWMWindowPosChanging__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMWindowPosChanging__Wrapper.setMsg(const val : Cardinal);
begin
TWMWindowPosChanging(GetRecordPtr^).Msg := val;
end;
function __TWMWindowPosChanging__Wrapper.getMsg : Cardinal;
begin
result := TWMWindowPosChanging(GetRecordPtr^).Msg;
end;
procedure __TWMWindowPosChanging__Wrapper.setUnused(const val : Integer);
begin
TWMWindowPosChanging(GetRecordPtr^).Unused := val;
end;
function __TWMWindowPosChanging__Wrapper.getUnused : Integer;
begin
result := TWMWindowPosChanging(GetRecordPtr^).Unused;
end;
procedure __TWMWindowPosChanging__Wrapper.setResult(const val : Longint);
begin
TWMWindowPosChanging(GetRecordPtr^).Result := val;
end;
function __TWMWindowPosChanging__Wrapper.getResult : Longint;
begin
result := TWMWindowPosChanging(GetRecordPtr^).Result;
end;
function __TWMWindowPosMsg__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMWindowPosMsg__Wrapper.setMsg(const val : Cardinal);
begin
TWMWindowPosMsg(GetRecordPtr^).Msg := val;
end;
function __TWMWindowPosMsg__Wrapper.getMsg : Cardinal;
begin
result := TWMWindowPosMsg(GetRecordPtr^).Msg;
end;
procedure __TWMWindowPosMsg__Wrapper.setUnused(const val : Integer);
begin
TWMWindowPosMsg(GetRecordPtr^).Unused := val;
end;
function __TWMWindowPosMsg__Wrapper.getUnused : Integer;
begin
result := TWMWindowPosMsg(GetRecordPtr^).Unused;
end;
procedure __TWMWindowPosMsg__Wrapper.setResult(const val : Longint);
begin
TWMWindowPosMsg(GetRecordPtr^).Result := val;
end;
function __TWMWindowPosMsg__Wrapper.getResult : Longint;
begin
result := TWMWindowPosMsg(GetRecordPtr^).Result;
end;
function __TWMWinIniChange__Wrapper.GetRecordPtr : pointer;
begin
result := @fR;
end;
procedure __TWMWinIniChange__Wrapper.setMsg(const val : Cardinal);
begin
TWMWinIniChange(GetRecordPtr^).Msg := val;
end;
function __TWMWinIniChange__Wrapper.getMsg : Cardinal;
begin
result := TWMWinIniChange(GetRecordPtr^).Msg;
end;
procedure __TWMWinIniChange__Wrapper.setUnused(const val : Integer);
begin
TWMWinIniChange(GetRecordPtr^).Unused := val;
end;
function __TWMWinIniChange__Wrapper.getUnused : Integer;
begin
result := TWMWinIniChange(GetRecordPtr^).Unused;
end;
procedure __TWMWinIniChange__Wrapper.setResult(const val : Longint);
begin
TWMWinIniChange(GetRecordPtr^).Result := val;
end;
function __TWMWinIniChange__Wrapper.getResult : Longint;
begin
result := TWMWinIniChange(GetRecordPtr^).Result;
end;
function _TMessage_ : IDispatch;
begin
  result := __TMessage__Wrapper.Create;
end;
function _TMSHMouseWheel_ : IDispatch;
begin
  result := __TMSHMouseWheel__Wrapper.Create;
end;
function _TWMActivate_ : IDispatch;
begin
  result := __TWMActivate__Wrapper.Create;
end;
function _TWMActivateApp_ : IDispatch;
begin
  result := __TWMActivateApp__Wrapper.Create;
end;
function _TWMAskCBFormatName_ : IDispatch;
begin
  result := __TWMAskCBFormatName__Wrapper.Create;
end;
function _TWMCancelMode_ : IDispatch;
begin
  result := __TWMCancelMode__Wrapper.Create;
end;
function _TWMChangeCBChain_ : IDispatch;
begin
  result := __TWMChangeCBChain__Wrapper.Create;
end;
function _TWMChar_ : IDispatch;
begin
  result := __TWMChar__Wrapper.Create;
end;
function _TWMCharToItem_ : IDispatch;
begin
  result := __TWMCharToItem__Wrapper.Create;
end;
function _TWMChildActivate_ : IDispatch;
begin
  result := __TWMChildActivate__Wrapper.Create;
end;
function _TWMChooseFont_GetLogFont_ : IDispatch;
begin
  result := __TWMChooseFont_GetLogFont__Wrapper.Create;
end;
function _TWMClear_ : IDispatch;
begin
  result := __TWMClear__Wrapper.Create;
end;
function _TWMClose_ : IDispatch;
begin
  result := __TWMClose__Wrapper.Create;
end;
function _TWMCommand_ : IDispatch;
begin
  result := __TWMCommand__Wrapper.Create;
end;
function _TWMCompacting_ : IDispatch;
begin
  result := __TWMCompacting__Wrapper.Create;
end;
function _TWMCompareItem_ : IDispatch;
begin
  result := __TWMCompareItem__Wrapper.Create;
end;
function _TWMCopy_ : IDispatch;
begin
  result := __TWMCopy__Wrapper.Create;
end;
function _TWMCopyData_ : IDispatch;
begin
  result := __TWMCopyData__Wrapper.Create;
end;
function _TWMCreate_ : IDispatch;
begin
  result := __TWMCreate__Wrapper.Create;
end;
function _TWMCtlColor_ : IDispatch;
begin
  result := __TWMCtlColor__Wrapper.Create;
end;
function _TWMCtlColorBtn_ : IDispatch;
begin
  result := __TWMCtlColorBtn__Wrapper.Create;
end;
function _TWMCtlColorDlg_ : IDispatch;
begin
  result := __TWMCtlColorDlg__Wrapper.Create;
end;
function _TWMCtlColorEdit_ : IDispatch;
begin
  result := __TWMCtlColorEdit__Wrapper.Create;
end;
function _TWMCtlColorListbox_ : IDispatch;
begin
  result := __TWMCtlColorListbox__Wrapper.Create;
end;
function _TWMCtlColorMsgbox_ : IDispatch;
begin
  result := __TWMCtlColorMsgbox__Wrapper.Create;
end;
function _TWMCtlColorScrollbar_ : IDispatch;
begin
  result := __TWMCtlColorScrollbar__Wrapper.Create;
end;
function _TWMCtlColorStatic_ : IDispatch;
begin
  result := __TWMCtlColorStatic__Wrapper.Create;
end;
function _TWMCut_ : IDispatch;
begin
  result := __TWMCut__Wrapper.Create;
end;
function _TWMDDE_Ack_ : IDispatch;
begin
  result := __TWMDDE_Ack__Wrapper.Create;
end;
function _TWMDDE_Advise_ : IDispatch;
begin
  result := __TWMDDE_Advise__Wrapper.Create;
end;
function _TWMDDE_Data_ : IDispatch;
begin
  result := __TWMDDE_Data__Wrapper.Create;
end;
function _TWMDDE_Execute_ : IDispatch;
begin
  result := __TWMDDE_Execute__Wrapper.Create;
end;
function _TWMDDE_Initiate_ : IDispatch;
begin
  result := __TWMDDE_Initiate__Wrapper.Create;
end;
function _TWMDDE_Poke_ : IDispatch;
begin
  result := __TWMDDE_Poke__Wrapper.Create;
end;
function _TWMDDE_Request_ : IDispatch;
begin
  result := __TWMDDE_Request__Wrapper.Create;
end;
function _TWMDDE_Terminate_ : IDispatch;
begin
  result := __TWMDDE_Terminate__Wrapper.Create;
end;
function _TWMDDE_Unadvise_ : IDispatch;
begin
  result := __TWMDDE_Unadvise__Wrapper.Create;
end;
function _TWMDeadChar_ : IDispatch;
begin
  result := __TWMDeadChar__Wrapper.Create;
end;
function _TWMDeleteItem_ : IDispatch;
begin
  result := __TWMDeleteItem__Wrapper.Create;
end;
function _TWMDestroy_ : IDispatch;
begin
  result := __TWMDestroy__Wrapper.Create;
end;
function _TWMDestroyClipboard_ : IDispatch;
begin
  result := __TWMDestroyClipboard__Wrapper.Create;
end;
function _TWMDevModeChange_ : IDispatch;
begin
  result := __TWMDevModeChange__Wrapper.Create;
end;
function _TWMDisplayChange_ : IDispatch;
begin
  result := __TWMDisplayChange__Wrapper.Create;
end;
function _TWMDrawClipboard_ : IDispatch;
begin
  result := __TWMDrawClipboard__Wrapper.Create;
end;
function _TWMDrawItem_ : IDispatch;
begin
  result := __TWMDrawItem__Wrapper.Create;
end;
function _TWMDropFiles_ : IDispatch;
begin
  result := __TWMDropFiles__Wrapper.Create;
end;
function _TWMEnable_ : IDispatch;
begin
  result := __TWMEnable__Wrapper.Create;
end;
function _TWMEndSession_ : IDispatch;
begin
  result := __TWMEndSession__Wrapper.Create;
end;
function _TWMEnterIdle_ : IDispatch;
begin
  result := __TWMEnterIdle__Wrapper.Create;
end;
function _TWMEnterMenuLoop_ : IDispatch;
begin
  result := __TWMEnterMenuLoop__Wrapper.Create;
end;
function _TWMEraseBkgnd_ : IDispatch;
begin
  result := __TWMEraseBkgnd__Wrapper.Create;
end;
function _TWMExitMenuLoop_ : IDispatch;
begin
  result := __TWMExitMenuLoop__Wrapper.Create;
end;
function _TWMFontChange_ : IDispatch;
begin
  result := __TWMFontChange__Wrapper.Create;
end;
function _TWMGetDlgCode_ : IDispatch;
begin
  result := __TWMGetDlgCode__Wrapper.Create;
end;
function _TWMGetFont_ : IDispatch;
begin
  result := __TWMGetFont__Wrapper.Create;
end;
function _TWMGetHotKey_ : IDispatch;
begin
  result := __TWMGetHotKey__Wrapper.Create;
end;
function _TWMGetIcon_ : IDispatch;
begin
  result := __TWMGetIcon__Wrapper.Create;
end;
function _TWMGetMinMaxInfo_ : IDispatch;
begin
  result := __TWMGetMinMaxInfo__Wrapper.Create;
end;
function _TWMGetText_ : IDispatch;
begin
  result := __TWMGetText__Wrapper.Create;
end;
function _TWMGetTextLength_ : IDispatch;
begin
  result := __TWMGetTextLength__Wrapper.Create;
end;
function _TWMHelp_ : IDispatch;
begin
  result := __TWMHelp__Wrapper.Create;
end;
function _TWMHotKey_ : IDispatch;
begin
  result := __TWMHotKey__Wrapper.Create;
end;
function _TWMHScroll_ : IDispatch;
begin
  result := __TWMHScroll__Wrapper.Create;
end;
function _TWMHScrollClipboard_ : IDispatch;
begin
  result := __TWMHScrollClipboard__Wrapper.Create;
end;
function _TWMIconEraseBkgnd_ : IDispatch;
begin
  result := __TWMIconEraseBkgnd__Wrapper.Create;
end;
function _TWMInitDialog_ : IDispatch;
begin
  result := __TWMInitDialog__Wrapper.Create;
end;
function _TWMInitMenu_ : IDispatch;
begin
  result := __TWMInitMenu__Wrapper.Create;
end;
function _TWMInitMenuPopup_ : IDispatch;
begin
  result := __TWMInitMenuPopup__Wrapper.Create;
end;
function _TWMKey_ : IDispatch;
begin
  result := __TWMKey__Wrapper.Create;
end;
function _TWMKeyDown_ : IDispatch;
begin
  result := __TWMKeyDown__Wrapper.Create;
end;
function _TWMKeyUp_ : IDispatch;
begin
  result := __TWMKeyUp__Wrapper.Create;
end;
function _TWMKillFocus_ : IDispatch;
begin
  result := __TWMKillFocus__Wrapper.Create;
end;
function _TWMLButtonDblClk_ : IDispatch;
begin
  result := __TWMLButtonDblClk__Wrapper.Create;
end;
function _TWMLButtonDown_ : IDispatch;
begin
  result := __TWMLButtonDown__Wrapper.Create;
end;
function _TWMLButtonUp_ : IDispatch;
begin
  result := __TWMLButtonUp__Wrapper.Create;
end;
function _TWMMButtonDblClk_ : IDispatch;
begin
  result := __TWMMButtonDblClk__Wrapper.Create;
end;
function _TWMMButtonDown_ : IDispatch;
begin
  result := __TWMMButtonDown__Wrapper.Create;
end;
function _TWMMButtonUp_ : IDispatch;
begin
  result := __TWMMButtonUp__Wrapper.Create;
end;
function _TWMMDIActivate_ : IDispatch;
begin
  result := __TWMMDIActivate__Wrapper.Create;
end;
function _TWMMDICascade_ : IDispatch;
begin
  result := __TWMMDICascade__Wrapper.Create;
end;
function _TWMMDICreate_ : IDispatch;
begin
  result := __TWMMDICreate__Wrapper.Create;
end;
function _TWMMDIDestroy_ : IDispatch;
begin
  result := __TWMMDIDestroy__Wrapper.Create;
end;
function _TWMMDIGetActive_ : IDispatch;
begin
  result := __TWMMDIGetActive__Wrapper.Create;
end;
function _TWMMDIIconArrange_ : IDispatch;
begin
  result := __TWMMDIIconArrange__Wrapper.Create;
end;
function _TWMMDIMaximize_ : IDispatch;
begin
  result := __TWMMDIMaximize__Wrapper.Create;
end;
function _TWMMDINext_ : IDispatch;
begin
  result := __TWMMDINext__Wrapper.Create;
end;
function _TWMMDIRefreshMenu_ : IDispatch;
begin
  result := __TWMMDIRefreshMenu__Wrapper.Create;
end;
function _TWMMDIRestore_ : IDispatch;
begin
  result := __TWMMDIRestore__Wrapper.Create;
end;
function _TWMMDISetMenu_ : IDispatch;
begin
  result := __TWMMDISetMenu__Wrapper.Create;
end;
function _TWMMDITile_ : IDispatch;
begin
  result := __TWMMDITile__Wrapper.Create;
end;
function _TWMMeasureItem_ : IDispatch;
begin
  result := __TWMMeasureItem__Wrapper.Create;
end;
function _TWMMenuChar_ : IDispatch;
begin
  result := __TWMMenuChar__Wrapper.Create;
end;
function _TWMMenuSelect_ : IDispatch;
begin
  result := __TWMMenuSelect__Wrapper.Create;
end;
function _TWMMouse_ : IDispatch;
begin
  result := __TWMMouse__Wrapper.Create;
end;
function _TWMMouseActivate_ : IDispatch;
begin
  result := __TWMMouseActivate__Wrapper.Create;
end;
function _TWMMouseMove_ : IDispatch;
begin
  result := __TWMMouseMove__Wrapper.Create;
end;
function _TWMMouseWheel_ : IDispatch;
begin
  result := __TWMMouseWheel__Wrapper.Create;
end;
function _TWMMove_ : IDispatch;
begin
  result := __TWMMove__Wrapper.Create;
end;
function _TWMNCActivate_ : IDispatch;
begin
  result := __TWMNCActivate__Wrapper.Create;
end;
function _TWMNCCalcSize_ : IDispatch;
begin
  result := __TWMNCCalcSize__Wrapper.Create;
end;
function _TWMNCCreate_ : IDispatch;
begin
  result := __TWMNCCreate__Wrapper.Create;
end;
function _TWMNCDestroy_ : IDispatch;
begin
  result := __TWMNCDestroy__Wrapper.Create;
end;
function _TWMNCHitMessage_ : IDispatch;
begin
  result := __TWMNCHitMessage__Wrapper.Create;
end;
function _TWMNCHitTest_ : IDispatch;
begin
  result := __TWMNCHitTest__Wrapper.Create;
end;
function _TWMNCLButtonDblClk_ : IDispatch;
begin
  result := __TWMNCLButtonDblClk__Wrapper.Create;
end;
function _TWMNCLButtonDown_ : IDispatch;
begin
  result := __TWMNCLButtonDown__Wrapper.Create;
end;
function _TWMNCLButtonUp_ : IDispatch;
begin
  result := __TWMNCLButtonUp__Wrapper.Create;
end;
function _TWMNCMButtonDblClk_ : IDispatch;
begin
  result := __TWMNCMButtonDblClk__Wrapper.Create;
end;
function _TWMNCMButtonDown_ : IDispatch;
begin
  result := __TWMNCMButtonDown__Wrapper.Create;
end;
function _TWMNCMButtonUp_ : IDispatch;
begin
  result := __TWMNCMButtonUp__Wrapper.Create;
end;
function _TWMNCMouseMove_ : IDispatch;
begin
  result := __TWMNCMouseMove__Wrapper.Create;
end;
function _TWMNCPaint_ : IDispatch;
begin
  result := __TWMNCPaint__Wrapper.Create;
end;
function _TWMNCRButtonDblClk_ : IDispatch;
begin
  result := __TWMNCRButtonDblClk__Wrapper.Create;
end;
function _TWMNCRButtonDown_ : IDispatch;
begin
  result := __TWMNCRButtonDown__Wrapper.Create;
end;
function _TWMNCRButtonUp_ : IDispatch;
begin
  result := __TWMNCRButtonUp__Wrapper.Create;
end;
function _TWMNextDlgCtl_ : IDispatch;
begin
  result := __TWMNextDlgCtl__Wrapper.Create;
end;
function _TWMNoParams_ : IDispatch;
begin
  result := __TWMNoParams__Wrapper.Create;
end;
function _TWMNotify_ : IDispatch;
begin
  result := __TWMNotify__Wrapper.Create;
end;
function _TWMNotifyFormat_ : IDispatch;
begin
  result := __TWMNotifyFormat__Wrapper.Create;
end;
function _TWMPaint_ : IDispatch;
begin
  result := __TWMPaint__Wrapper.Create;
end;
function _TWMPaintClipboard_ : IDispatch;
begin
  result := __TWMPaintClipboard__Wrapper.Create;
end;
function _TWMPaintIcon_ : IDispatch;
begin
  result := __TWMPaintIcon__Wrapper.Create;
end;
function _TWMPaletteChanged_ : IDispatch;
begin
  result := __TWMPaletteChanged__Wrapper.Create;
end;
function _TWMPaletteIsChanging_ : IDispatch;
begin
  result := __TWMPaletteIsChanging__Wrapper.Create;
end;
function _TWMParentNotify_ : IDispatch;
begin
  result := __TWMParentNotify__Wrapper.Create;
end;
function _TWMPaste_ : IDispatch;
begin
  result := __TWMPaste__Wrapper.Create;
end;
function _TWMPower_ : IDispatch;
begin
  result := __TWMPower__Wrapper.Create;
end;
function _TWMQueryDragIcon_ : IDispatch;
begin
  result := __TWMQueryDragIcon__Wrapper.Create;
end;
function _TWMQueryEndSession_ : IDispatch;
begin
  result := __TWMQueryEndSession__Wrapper.Create;
end;
function _TWMQueryNewPalette_ : IDispatch;
begin
  result := __TWMQueryNewPalette__Wrapper.Create;
end;
function _TWMQueryOpen_ : IDispatch;
begin
  result := __TWMQueryOpen__Wrapper.Create;
end;
function _TWMQueueSync_ : IDispatch;
begin
  result := __TWMQueueSync__Wrapper.Create;
end;
function _TWMQuit_ : IDispatch;
begin
  result := __TWMQuit__Wrapper.Create;
end;
function _TWMRButtonDblClk_ : IDispatch;
begin
  result := __TWMRButtonDblClk__Wrapper.Create;
end;
function _TWMRButtonDown_ : IDispatch;
begin
  result := __TWMRButtonDown__Wrapper.Create;
end;
function _TWMRButtonUp_ : IDispatch;
begin
  result := __TWMRButtonUp__Wrapper.Create;
end;
function _TWMRenderAllFormats_ : IDispatch;
begin
  result := __TWMRenderAllFormats__Wrapper.Create;
end;
function _TWMRenderFormat_ : IDispatch;
begin
  result := __TWMRenderFormat__Wrapper.Create;
end;
function _TWMScroll_ : IDispatch;
begin
  result := __TWMScroll__Wrapper.Create;
end;
function _TWMSetCursor_ : IDispatch;
begin
  result := __TWMSetCursor__Wrapper.Create;
end;
function _TWMSetFocus_ : IDispatch;
begin
  result := __TWMSetFocus__Wrapper.Create;
end;
function _TWMSetFont_ : IDispatch;
begin
  result := __TWMSetFont__Wrapper.Create;
end;
function _TWMSetHotKey_ : IDispatch;
begin
  result := __TWMSetHotKey__Wrapper.Create;
end;
function _TWMSetIcon_ : IDispatch;
begin
  result := __TWMSetIcon__Wrapper.Create;
end;
function _TWMSetRedraw_ : IDispatch;
begin
  result := __TWMSetRedraw__Wrapper.Create;
end;
function _TWMSetText_ : IDispatch;
begin
  result := __TWMSetText__Wrapper.Create;
end;
function _TWMSettingChange_ : IDispatch;
begin
  result := __TWMSettingChange__Wrapper.Create;
end;
function _TWMShowWindow_ : IDispatch;
begin
  result := __TWMShowWindow__Wrapper.Create;
end;
function _TWMSize_ : IDispatch;
begin
  result := __TWMSize__Wrapper.Create;
end;
function _TWMSizeClipboard_ : IDispatch;
begin
  result := __TWMSizeClipboard__Wrapper.Create;
end;
function _TWMSpoolerStatus_ : IDispatch;
begin
  result := __TWMSpoolerStatus__Wrapper.Create;
end;
function _TWMStyleChange_ : IDispatch;
begin
  result := __TWMStyleChange__Wrapper.Create;
end;
function _TWMStyleChanged_ : IDispatch;
begin
  result := __TWMStyleChanged__Wrapper.Create;
end;
function _TWMStyleChanging_ : IDispatch;
begin
  result := __TWMStyleChanging__Wrapper.Create;
end;
function _TWMSysChar_ : IDispatch;
begin
  result := __TWMSysChar__Wrapper.Create;
end;
function _TWMSysColorChange_ : IDispatch;
begin
  result := __TWMSysColorChange__Wrapper.Create;
end;
function _TWMSysCommand_ : IDispatch;
begin
  result := __TWMSysCommand__Wrapper.Create;
end;
function _TWMSysDeadChar_ : IDispatch;
begin
  result := __TWMSysDeadChar__Wrapper.Create;
end;
function _TWMSysKeyDown_ : IDispatch;
begin
  result := __TWMSysKeyDown__Wrapper.Create;
end;
function _TWMSysKeyUp_ : IDispatch;
begin
  result := __TWMSysKeyUp__Wrapper.Create;
end;
function _TWMSystemError_ : IDispatch;
begin
  result := __TWMSystemError__Wrapper.Create;
end;
function _TWMTimeChange_ : IDispatch;
begin
  result := __TWMTimeChange__Wrapper.Create;
end;
function _TWMTimer_ : IDispatch;
begin
  result := __TWMTimer__Wrapper.Create;
end;
function _TWMUndo_ : IDispatch;
begin
  result := __TWMUndo__Wrapper.Create;
end;
function _TWMVKeyToItem_ : IDispatch;
begin
  result := __TWMVKeyToItem__Wrapper.Create;
end;
function _TWMVScroll_ : IDispatch;
begin
  result := __TWMVScroll__Wrapper.Create;
end;
function _TWMVScrollClipboard_ : IDispatch;
begin
  result := __TWMVScrollClipboard__Wrapper.Create;
end;
function _TWMWindowPosChanged_ : IDispatch;
begin
  result := __TWMWindowPosChanged__Wrapper.Create;
end;
function _TWMWindowPosChanging_ : IDispatch;
begin
  result := __TWMWindowPosChanging__Wrapper.Create;
end;
function _TWMWindowPosMsg_ : IDispatch;
begin
  result := __TWMWindowPosMsg__Wrapper.Create;
end;
function _TWMWinIniChange_ : IDispatch;
begin
  result := __TWMWinIniChange__Wrapper.Create;
end;

type __TMessage__Wrapper__ = class(__TMessage__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMessage__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMessageToVariant(var R : TMessage) : OleVariant;
var
__rw : __TMessage__Wrapper__;
begin
__rw := __TMessage__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMessage(const V : OleVariant) : TMessage;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMessage((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TMSHMouseWheel__Wrapper__ = class(__TMSHMouseWheel__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TMSHMouseWheel__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTMSHMouseWheelToVariant(var R : TMSHMouseWheel) : OleVariant;
var
__rw : __TMSHMouseWheel__Wrapper__;
begin
__rw := __TMSHMouseWheel__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTMSHMouseWheel(const V : OleVariant) : TMSHMouseWheel;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TMSHMouseWheel((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMActivate__Wrapper__ = class(__TWMActivate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMActivate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMActivateToVariant(var R : TWMActivate) : OleVariant;
var
__rw : __TWMActivate__Wrapper__;
begin
__rw := __TWMActivate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMActivate(const V : OleVariant) : TWMActivate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMActivate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMActivateApp__Wrapper__ = class(__TWMActivateApp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMActivateApp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMActivateAppToVariant(var R : TWMActivateApp) : OleVariant;
var
__rw : __TWMActivateApp__Wrapper__;
begin
__rw := __TWMActivateApp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMActivateApp(const V : OleVariant) : TWMActivateApp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMActivateApp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMAskCBFormatName__Wrapper__ = class(__TWMAskCBFormatName__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMAskCBFormatName__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMAskCBFormatNameToVariant(var R : TWMAskCBFormatName) : OleVariant;
var
__rw : __TWMAskCBFormatName__Wrapper__;
begin
__rw := __TWMAskCBFormatName__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMAskCBFormatName(const V : OleVariant) : TWMAskCBFormatName;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMAskCBFormatName((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCancelMode__Wrapper__ = class(__TWMCancelMode__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCancelMode__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCancelModeToVariant(var R : TWMCancelMode) : OleVariant;
var
__rw : __TWMCancelMode__Wrapper__;
begin
__rw := __TWMCancelMode__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCancelMode(const V : OleVariant) : TWMCancelMode;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCancelMode((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMChangeCBChain__Wrapper__ = class(__TWMChangeCBChain__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMChangeCBChain__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMChangeCBChainToVariant(var R : TWMChangeCBChain) : OleVariant;
var
__rw : __TWMChangeCBChain__Wrapper__;
begin
__rw := __TWMChangeCBChain__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMChangeCBChain(const V : OleVariant) : TWMChangeCBChain;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMChangeCBChain((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMChar__Wrapper__ = class(__TWMChar__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMChar__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCharToVariant(var R : TWMChar) : OleVariant;
var
__rw : __TWMChar__Wrapper__;
begin
__rw := __TWMChar__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMChar(const V : OleVariant) : TWMChar;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMChar((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCharToItem__Wrapper__ = class(__TWMCharToItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCharToItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCharToItemToVariant(var R : TWMCharToItem) : OleVariant;
var
__rw : __TWMCharToItem__Wrapper__;
begin
__rw := __TWMCharToItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCharToItem(const V : OleVariant) : TWMCharToItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCharToItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMChildActivate__Wrapper__ = class(__TWMChildActivate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMChildActivate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMChildActivateToVariant(var R : TWMChildActivate) : OleVariant;
var
__rw : __TWMChildActivate__Wrapper__;
begin
__rw := __TWMChildActivate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMChildActivate(const V : OleVariant) : TWMChildActivate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMChildActivate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMChooseFont_GetLogFont__Wrapper__ = class(__TWMChooseFont_GetLogFont__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMChooseFont_GetLogFont__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMChooseFont_GetLogFontToVariant(var R : TWMChooseFont_GetLogFont) : OleVariant;
var
__rw : __TWMChooseFont_GetLogFont__Wrapper__;
begin
__rw := __TWMChooseFont_GetLogFont__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMChooseFont_GetLogFont(const V : OleVariant) : TWMChooseFont_GetLogFont;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMChooseFont_GetLogFont((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMClear__Wrapper__ = class(__TWMClear__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMClear__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMClearToVariant(var R : TWMClear) : OleVariant;
var
__rw : __TWMClear__Wrapper__;
begin
__rw := __TWMClear__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMClear(const V : OleVariant) : TWMClear;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMClear((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMClose__Wrapper__ = class(__TWMClose__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMClose__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCloseToVariant(var R : TWMClose) : OleVariant;
var
__rw : __TWMClose__Wrapper__;
begin
__rw := __TWMClose__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMClose(const V : OleVariant) : TWMClose;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMClose((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCommand__Wrapper__ = class(__TWMCommand__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCommand__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCommandToVariant(var R : TWMCommand) : OleVariant;
var
__rw : __TWMCommand__Wrapper__;
begin
__rw := __TWMCommand__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCommand(const V : OleVariant) : TWMCommand;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCommand((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCompacting__Wrapper__ = class(__TWMCompacting__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCompacting__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCompactingToVariant(var R : TWMCompacting) : OleVariant;
var
__rw : __TWMCompacting__Wrapper__;
begin
__rw := __TWMCompacting__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCompacting(const V : OleVariant) : TWMCompacting;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCompacting((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCompareItem__Wrapper__ = class(__TWMCompareItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCompareItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCompareItemToVariant(var R : TWMCompareItem) : OleVariant;
var
__rw : __TWMCompareItem__Wrapper__;
begin
__rw := __TWMCompareItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCompareItem(const V : OleVariant) : TWMCompareItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCompareItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCopy__Wrapper__ = class(__TWMCopy__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCopy__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCopyToVariant(var R : TWMCopy) : OleVariant;
var
__rw : __TWMCopy__Wrapper__;
begin
__rw := __TWMCopy__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCopy(const V : OleVariant) : TWMCopy;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCopy((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCopyData__Wrapper__ = class(__TWMCopyData__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCopyData__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCopyDataToVariant(var R : TWMCopyData) : OleVariant;
var
__rw : __TWMCopyData__Wrapper__;
begin
__rw := __TWMCopyData__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCopyData(const V : OleVariant) : TWMCopyData;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCopyData((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCreate__Wrapper__ = class(__TWMCreate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCreate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCreateToVariant(var R : TWMCreate) : OleVariant;
var
__rw : __TWMCreate__Wrapper__;
begin
__rw := __TWMCreate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCreate(const V : OleVariant) : TWMCreate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCreate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCtlColor__Wrapper__ = class(__TWMCtlColor__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCtlColor__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCtlColorToVariant(var R : TWMCtlColor) : OleVariant;
var
__rw : __TWMCtlColor__Wrapper__;
begin
__rw := __TWMCtlColor__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCtlColor(const V : OleVariant) : TWMCtlColor;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCtlColor((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCtlColorBtn__Wrapper__ = class(__TWMCtlColorBtn__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCtlColorBtn__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCtlColorBtnToVariant(var R : TWMCtlColorBtn) : OleVariant;
var
__rw : __TWMCtlColorBtn__Wrapper__;
begin
__rw := __TWMCtlColorBtn__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCtlColorBtn(const V : OleVariant) : TWMCtlColorBtn;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCtlColorBtn((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCtlColorDlg__Wrapper__ = class(__TWMCtlColorDlg__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCtlColorDlg__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCtlColorDlgToVariant(var R : TWMCtlColorDlg) : OleVariant;
var
__rw : __TWMCtlColorDlg__Wrapper__;
begin
__rw := __TWMCtlColorDlg__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCtlColorDlg(const V : OleVariant) : TWMCtlColorDlg;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCtlColorDlg((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCtlColorEdit__Wrapper__ = class(__TWMCtlColorEdit__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCtlColorEdit__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCtlColorEditToVariant(var R : TWMCtlColorEdit) : OleVariant;
var
__rw : __TWMCtlColorEdit__Wrapper__;
begin
__rw := __TWMCtlColorEdit__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCtlColorEdit(const V : OleVariant) : TWMCtlColorEdit;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCtlColorEdit((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCtlColorListbox__Wrapper__ = class(__TWMCtlColorListbox__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCtlColorListbox__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCtlColorListboxToVariant(var R : TWMCtlColorListbox) : OleVariant;
var
__rw : __TWMCtlColorListbox__Wrapper__;
begin
__rw := __TWMCtlColorListbox__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCtlColorListbox(const V : OleVariant) : TWMCtlColorListbox;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCtlColorListbox((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCtlColorMsgbox__Wrapper__ = class(__TWMCtlColorMsgbox__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCtlColorMsgbox__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCtlColorMsgboxToVariant(var R : TWMCtlColorMsgbox) : OleVariant;
var
__rw : __TWMCtlColorMsgbox__Wrapper__;
begin
__rw := __TWMCtlColorMsgbox__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCtlColorMsgbox(const V : OleVariant) : TWMCtlColorMsgbox;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCtlColorMsgbox((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCtlColorScrollbar__Wrapper__ = class(__TWMCtlColorScrollbar__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCtlColorScrollbar__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCtlColorScrollbarToVariant(var R : TWMCtlColorScrollbar) : OleVariant;
var
__rw : __TWMCtlColorScrollbar__Wrapper__;
begin
__rw := __TWMCtlColorScrollbar__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCtlColorScrollbar(const V : OleVariant) : TWMCtlColorScrollbar;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCtlColorScrollbar((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCtlColorStatic__Wrapper__ = class(__TWMCtlColorStatic__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCtlColorStatic__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCtlColorStaticToVariant(var R : TWMCtlColorStatic) : OleVariant;
var
__rw : __TWMCtlColorStatic__Wrapper__;
begin
__rw := __TWMCtlColorStatic__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCtlColorStatic(const V : OleVariant) : TWMCtlColorStatic;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCtlColorStatic((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMCut__Wrapper__ = class(__TWMCut__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMCut__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMCutToVariant(var R : TWMCut) : OleVariant;
var
__rw : __TWMCut__Wrapper__;
begin
__rw := __TWMCut__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMCut(const V : OleVariant) : TWMCut;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMCut((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Ack__Wrapper__ = class(__TWMDDE_Ack__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Ack__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_AckToVariant(var R : TWMDDE_Ack) : OleVariant;
var
__rw : __TWMDDE_Ack__Wrapper__;
begin
__rw := __TWMDDE_Ack__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Ack(const V : OleVariant) : TWMDDE_Ack;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Ack((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Advise__Wrapper__ = class(__TWMDDE_Advise__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Advise__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_AdviseToVariant(var R : TWMDDE_Advise) : OleVariant;
var
__rw : __TWMDDE_Advise__Wrapper__;
begin
__rw := __TWMDDE_Advise__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Advise(const V : OleVariant) : TWMDDE_Advise;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Advise((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Data__Wrapper__ = class(__TWMDDE_Data__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Data__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_DataToVariant(var R : TWMDDE_Data) : OleVariant;
var
__rw : __TWMDDE_Data__Wrapper__;
begin
__rw := __TWMDDE_Data__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Data(const V : OleVariant) : TWMDDE_Data;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Data((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Execute__Wrapper__ = class(__TWMDDE_Execute__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Execute__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_ExecuteToVariant(var R : TWMDDE_Execute) : OleVariant;
var
__rw : __TWMDDE_Execute__Wrapper__;
begin
__rw := __TWMDDE_Execute__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Execute(const V : OleVariant) : TWMDDE_Execute;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Execute((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Initiate__Wrapper__ = class(__TWMDDE_Initiate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Initiate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_InitiateToVariant(var R : TWMDDE_Initiate) : OleVariant;
var
__rw : __TWMDDE_Initiate__Wrapper__;
begin
__rw := __TWMDDE_Initiate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Initiate(const V : OleVariant) : TWMDDE_Initiate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Initiate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Poke__Wrapper__ = class(__TWMDDE_Poke__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Poke__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_PokeToVariant(var R : TWMDDE_Poke) : OleVariant;
var
__rw : __TWMDDE_Poke__Wrapper__;
begin
__rw := __TWMDDE_Poke__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Poke(const V : OleVariant) : TWMDDE_Poke;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Poke((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Request__Wrapper__ = class(__TWMDDE_Request__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Request__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_RequestToVariant(var R : TWMDDE_Request) : OleVariant;
var
__rw : __TWMDDE_Request__Wrapper__;
begin
__rw := __TWMDDE_Request__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Request(const V : OleVariant) : TWMDDE_Request;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Request((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Terminate__Wrapper__ = class(__TWMDDE_Terminate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Terminate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_TerminateToVariant(var R : TWMDDE_Terminate) : OleVariant;
var
__rw : __TWMDDE_Terminate__Wrapper__;
begin
__rw := __TWMDDE_Terminate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Terminate(const V : OleVariant) : TWMDDE_Terminate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Terminate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDDE_Unadvise__Wrapper__ = class(__TWMDDE_Unadvise__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDDE_Unadvise__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDDE_UnadviseToVariant(var R : TWMDDE_Unadvise) : OleVariant;
var
__rw : __TWMDDE_Unadvise__Wrapper__;
begin
__rw := __TWMDDE_Unadvise__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDDE_Unadvise(const V : OleVariant) : TWMDDE_Unadvise;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDDE_Unadvise((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDeadChar__Wrapper__ = class(__TWMDeadChar__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDeadChar__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDeadCharToVariant(var R : TWMDeadChar) : OleVariant;
var
__rw : __TWMDeadChar__Wrapper__;
begin
__rw := __TWMDeadChar__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDeadChar(const V : OleVariant) : TWMDeadChar;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDeadChar((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDeleteItem__Wrapper__ = class(__TWMDeleteItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDeleteItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDeleteItemToVariant(var R : TWMDeleteItem) : OleVariant;
var
__rw : __TWMDeleteItem__Wrapper__;
begin
__rw := __TWMDeleteItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDeleteItem(const V : OleVariant) : TWMDeleteItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDeleteItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDestroy__Wrapper__ = class(__TWMDestroy__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDestroy__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDestroyToVariant(var R : TWMDestroy) : OleVariant;
var
__rw : __TWMDestroy__Wrapper__;
begin
__rw := __TWMDestroy__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDestroy(const V : OleVariant) : TWMDestroy;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDestroy((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDestroyClipboard__Wrapper__ = class(__TWMDestroyClipboard__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDestroyClipboard__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDestroyClipboardToVariant(var R : TWMDestroyClipboard) : OleVariant;
var
__rw : __TWMDestroyClipboard__Wrapper__;
begin
__rw := __TWMDestroyClipboard__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDestroyClipboard(const V : OleVariant) : TWMDestroyClipboard;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDestroyClipboard((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDevModeChange__Wrapper__ = class(__TWMDevModeChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDevModeChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDevModeChangeToVariant(var R : TWMDevModeChange) : OleVariant;
var
__rw : __TWMDevModeChange__Wrapper__;
begin
__rw := __TWMDevModeChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDevModeChange(const V : OleVariant) : TWMDevModeChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDevModeChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDisplayChange__Wrapper__ = class(__TWMDisplayChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDisplayChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDisplayChangeToVariant(var R : TWMDisplayChange) : OleVariant;
var
__rw : __TWMDisplayChange__Wrapper__;
begin
__rw := __TWMDisplayChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDisplayChange(const V : OleVariant) : TWMDisplayChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDisplayChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDrawClipboard__Wrapper__ = class(__TWMDrawClipboard__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDrawClipboard__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDrawClipboardToVariant(var R : TWMDrawClipboard) : OleVariant;
var
__rw : __TWMDrawClipboard__Wrapper__;
begin
__rw := __TWMDrawClipboard__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDrawClipboard(const V : OleVariant) : TWMDrawClipboard;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDrawClipboard((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDrawItem__Wrapper__ = class(__TWMDrawItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDrawItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDrawItemToVariant(var R : TWMDrawItem) : OleVariant;
var
__rw : __TWMDrawItem__Wrapper__;
begin
__rw := __TWMDrawItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDrawItem(const V : OleVariant) : TWMDrawItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDrawItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMDropFiles__Wrapper__ = class(__TWMDropFiles__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMDropFiles__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMDropFilesToVariant(var R : TWMDropFiles) : OleVariant;
var
__rw : __TWMDropFiles__Wrapper__;
begin
__rw := __TWMDropFiles__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMDropFiles(const V : OleVariant) : TWMDropFiles;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMDropFiles((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMEnable__Wrapper__ = class(__TWMEnable__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMEnable__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMEnableToVariant(var R : TWMEnable) : OleVariant;
var
__rw : __TWMEnable__Wrapper__;
begin
__rw := __TWMEnable__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMEnable(const V : OleVariant) : TWMEnable;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMEnable((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMEndSession__Wrapper__ = class(__TWMEndSession__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMEndSession__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMEndSessionToVariant(var R : TWMEndSession) : OleVariant;
var
__rw : __TWMEndSession__Wrapper__;
begin
__rw := __TWMEndSession__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMEndSession(const V : OleVariant) : TWMEndSession;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMEndSession((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMEnterIdle__Wrapper__ = class(__TWMEnterIdle__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMEnterIdle__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMEnterIdleToVariant(var R : TWMEnterIdle) : OleVariant;
var
__rw : __TWMEnterIdle__Wrapper__;
begin
__rw := __TWMEnterIdle__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMEnterIdle(const V : OleVariant) : TWMEnterIdle;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMEnterIdle((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMEnterMenuLoop__Wrapper__ = class(__TWMEnterMenuLoop__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMEnterMenuLoop__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMEnterMenuLoopToVariant(var R : TWMEnterMenuLoop) : OleVariant;
var
__rw : __TWMEnterMenuLoop__Wrapper__;
begin
__rw := __TWMEnterMenuLoop__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMEnterMenuLoop(const V : OleVariant) : TWMEnterMenuLoop;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMEnterMenuLoop((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMEraseBkgnd__Wrapper__ = class(__TWMEraseBkgnd__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMEraseBkgnd__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMEraseBkgndToVariant(var R : TWMEraseBkgnd) : OleVariant;
var
__rw : __TWMEraseBkgnd__Wrapper__;
begin
__rw := __TWMEraseBkgnd__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMEraseBkgnd(const V : OleVariant) : TWMEraseBkgnd;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMEraseBkgnd((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMExitMenuLoop__Wrapper__ = class(__TWMExitMenuLoop__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMExitMenuLoop__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMExitMenuLoopToVariant(var R : TWMExitMenuLoop) : OleVariant;
var
__rw : __TWMExitMenuLoop__Wrapper__;
begin
__rw := __TWMExitMenuLoop__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMExitMenuLoop(const V : OleVariant) : TWMExitMenuLoop;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMExitMenuLoop((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMFontChange__Wrapper__ = class(__TWMFontChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMFontChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMFontChangeToVariant(var R : TWMFontChange) : OleVariant;
var
__rw : __TWMFontChange__Wrapper__;
begin
__rw := __TWMFontChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMFontChange(const V : OleVariant) : TWMFontChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMFontChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMGetDlgCode__Wrapper__ = class(__TWMGetDlgCode__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMGetDlgCode__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMGetDlgCodeToVariant(var R : TWMGetDlgCode) : OleVariant;
var
__rw : __TWMGetDlgCode__Wrapper__;
begin
__rw := __TWMGetDlgCode__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMGetDlgCode(const V : OleVariant) : TWMGetDlgCode;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMGetDlgCode((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMGetFont__Wrapper__ = class(__TWMGetFont__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMGetFont__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMGetFontToVariant(var R : TWMGetFont) : OleVariant;
var
__rw : __TWMGetFont__Wrapper__;
begin
__rw := __TWMGetFont__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMGetFont(const V : OleVariant) : TWMGetFont;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMGetFont((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMGetHotKey__Wrapper__ = class(__TWMGetHotKey__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMGetHotKey__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMGetHotKeyToVariant(var R : TWMGetHotKey) : OleVariant;
var
__rw : __TWMGetHotKey__Wrapper__;
begin
__rw := __TWMGetHotKey__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMGetHotKey(const V : OleVariant) : TWMGetHotKey;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMGetHotKey((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMGetIcon__Wrapper__ = class(__TWMGetIcon__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMGetIcon__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMGetIconToVariant(var R : TWMGetIcon) : OleVariant;
var
__rw : __TWMGetIcon__Wrapper__;
begin
__rw := __TWMGetIcon__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMGetIcon(const V : OleVariant) : TWMGetIcon;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMGetIcon((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMGetMinMaxInfo__Wrapper__ = class(__TWMGetMinMaxInfo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMGetMinMaxInfo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMGetMinMaxInfoToVariant(var R : TWMGetMinMaxInfo) : OleVariant;
var
__rw : __TWMGetMinMaxInfo__Wrapper__;
begin
__rw := __TWMGetMinMaxInfo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMGetMinMaxInfo(const V : OleVariant) : TWMGetMinMaxInfo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMGetMinMaxInfo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMGetText__Wrapper__ = class(__TWMGetText__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMGetText__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMGetTextToVariant(var R : TWMGetText) : OleVariant;
var
__rw : __TWMGetText__Wrapper__;
begin
__rw := __TWMGetText__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMGetText(const V : OleVariant) : TWMGetText;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMGetText((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMGetTextLength__Wrapper__ = class(__TWMGetTextLength__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMGetTextLength__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMGetTextLengthToVariant(var R : TWMGetTextLength) : OleVariant;
var
__rw : __TWMGetTextLength__Wrapper__;
begin
__rw := __TWMGetTextLength__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMGetTextLength(const V : OleVariant) : TWMGetTextLength;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMGetTextLength((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMHelp__Wrapper__ = class(__TWMHelp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMHelp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMHelpToVariant(var R : TWMHelp) : OleVariant;
var
__rw : __TWMHelp__Wrapper__;
begin
__rw := __TWMHelp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMHelp(const V : OleVariant) : TWMHelp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMHelp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMHotKey__Wrapper__ = class(__TWMHotKey__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMHotKey__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMHotKeyToVariant(var R : TWMHotKey) : OleVariant;
var
__rw : __TWMHotKey__Wrapper__;
begin
__rw := __TWMHotKey__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMHotKey(const V : OleVariant) : TWMHotKey;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMHotKey((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMHScroll__Wrapper__ = class(__TWMHScroll__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMHScroll__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMHScrollToVariant(var R : TWMHScroll) : OleVariant;
var
__rw : __TWMHScroll__Wrapper__;
begin
__rw := __TWMHScroll__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMHScroll(const V : OleVariant) : TWMHScroll;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMHScroll((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMHScrollClipboard__Wrapper__ = class(__TWMHScrollClipboard__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMHScrollClipboard__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMHScrollClipboardToVariant(var R : TWMHScrollClipboard) : OleVariant;
var
__rw : __TWMHScrollClipboard__Wrapper__;
begin
__rw := __TWMHScrollClipboard__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMHScrollClipboard(const V : OleVariant) : TWMHScrollClipboard;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMHScrollClipboard((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMIconEraseBkgnd__Wrapper__ = class(__TWMIconEraseBkgnd__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMIconEraseBkgnd__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMIconEraseBkgndToVariant(var R : TWMIconEraseBkgnd) : OleVariant;
var
__rw : __TWMIconEraseBkgnd__Wrapper__;
begin
__rw := __TWMIconEraseBkgnd__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMIconEraseBkgnd(const V : OleVariant) : TWMIconEraseBkgnd;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMIconEraseBkgnd((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMInitDialog__Wrapper__ = class(__TWMInitDialog__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMInitDialog__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMInitDialogToVariant(var R : TWMInitDialog) : OleVariant;
var
__rw : __TWMInitDialog__Wrapper__;
begin
__rw := __TWMInitDialog__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMInitDialog(const V : OleVariant) : TWMInitDialog;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMInitDialog((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMInitMenu__Wrapper__ = class(__TWMInitMenu__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMInitMenu__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMInitMenuToVariant(var R : TWMInitMenu) : OleVariant;
var
__rw : __TWMInitMenu__Wrapper__;
begin
__rw := __TWMInitMenu__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMInitMenu(const V : OleVariant) : TWMInitMenu;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMInitMenu((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMInitMenuPopup__Wrapper__ = class(__TWMInitMenuPopup__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMInitMenuPopup__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMInitMenuPopupToVariant(var R : TWMInitMenuPopup) : OleVariant;
var
__rw : __TWMInitMenuPopup__Wrapper__;
begin
__rw := __TWMInitMenuPopup__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMInitMenuPopup(const V : OleVariant) : TWMInitMenuPopup;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMInitMenuPopup((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMKey__Wrapper__ = class(__TWMKey__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMKey__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMKeyToVariant(var R : TWMKey) : OleVariant;
var
__rw : __TWMKey__Wrapper__;
begin
__rw := __TWMKey__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMKey(const V : OleVariant) : TWMKey;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMKey((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMKeyDown__Wrapper__ = class(__TWMKeyDown__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMKeyDown__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMKeyDownToVariant(var R : TWMKeyDown) : OleVariant;
var
__rw : __TWMKeyDown__Wrapper__;
begin
__rw := __TWMKeyDown__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMKeyDown(const V : OleVariant) : TWMKeyDown;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMKeyDown((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMKeyUp__Wrapper__ = class(__TWMKeyUp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMKeyUp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMKeyUpToVariant(var R : TWMKeyUp) : OleVariant;
var
__rw : __TWMKeyUp__Wrapper__;
begin
__rw := __TWMKeyUp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMKeyUp(const V : OleVariant) : TWMKeyUp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMKeyUp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMKillFocus__Wrapper__ = class(__TWMKillFocus__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMKillFocus__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMKillFocusToVariant(var R : TWMKillFocus) : OleVariant;
var
__rw : __TWMKillFocus__Wrapper__;
begin
__rw := __TWMKillFocus__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMKillFocus(const V : OleVariant) : TWMKillFocus;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMKillFocus((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMLButtonDblClk__Wrapper__ = class(__TWMLButtonDblClk__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMLButtonDblClk__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMLButtonDblClkToVariant(var R : TWMLButtonDblClk) : OleVariant;
var
__rw : __TWMLButtonDblClk__Wrapper__;
begin
__rw := __TWMLButtonDblClk__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMLButtonDblClk(const V : OleVariant) : TWMLButtonDblClk;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMLButtonDblClk((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMLButtonDown__Wrapper__ = class(__TWMLButtonDown__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMLButtonDown__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMLButtonDownToVariant(var R : TWMLButtonDown) : OleVariant;
var
__rw : __TWMLButtonDown__Wrapper__;
begin
__rw := __TWMLButtonDown__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMLButtonDown(const V : OleVariant) : TWMLButtonDown;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMLButtonDown((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMLButtonUp__Wrapper__ = class(__TWMLButtonUp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMLButtonUp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMLButtonUpToVariant(var R : TWMLButtonUp) : OleVariant;
var
__rw : __TWMLButtonUp__Wrapper__;
begin
__rw := __TWMLButtonUp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMLButtonUp(const V : OleVariant) : TWMLButtonUp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMLButtonUp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMButtonDblClk__Wrapper__ = class(__TWMMButtonDblClk__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMButtonDblClk__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMButtonDblClkToVariant(var R : TWMMButtonDblClk) : OleVariant;
var
__rw : __TWMMButtonDblClk__Wrapper__;
begin
__rw := __TWMMButtonDblClk__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMButtonDblClk(const V : OleVariant) : TWMMButtonDblClk;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMButtonDblClk((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMButtonDown__Wrapper__ = class(__TWMMButtonDown__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMButtonDown__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMButtonDownToVariant(var R : TWMMButtonDown) : OleVariant;
var
__rw : __TWMMButtonDown__Wrapper__;
begin
__rw := __TWMMButtonDown__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMButtonDown(const V : OleVariant) : TWMMButtonDown;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMButtonDown((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMButtonUp__Wrapper__ = class(__TWMMButtonUp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMButtonUp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMButtonUpToVariant(var R : TWMMButtonUp) : OleVariant;
var
__rw : __TWMMButtonUp__Wrapper__;
begin
__rw := __TWMMButtonUp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMButtonUp(const V : OleVariant) : TWMMButtonUp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMButtonUp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDIActivate__Wrapper__ = class(__TWMMDIActivate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDIActivate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDIActivateToVariant(var R : TWMMDIActivate) : OleVariant;
var
__rw : __TWMMDIActivate__Wrapper__;
begin
__rw := __TWMMDIActivate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDIActivate(const V : OleVariant) : TWMMDIActivate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDIActivate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDICascade__Wrapper__ = class(__TWMMDICascade__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDICascade__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDICascadeToVariant(var R : TWMMDICascade) : OleVariant;
var
__rw : __TWMMDICascade__Wrapper__;
begin
__rw := __TWMMDICascade__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDICascade(const V : OleVariant) : TWMMDICascade;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDICascade((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDICreate__Wrapper__ = class(__TWMMDICreate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDICreate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDICreateToVariant(var R : TWMMDICreate) : OleVariant;
var
__rw : __TWMMDICreate__Wrapper__;
begin
__rw := __TWMMDICreate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDICreate(const V : OleVariant) : TWMMDICreate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDICreate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDIDestroy__Wrapper__ = class(__TWMMDIDestroy__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDIDestroy__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDIDestroyToVariant(var R : TWMMDIDestroy) : OleVariant;
var
__rw : __TWMMDIDestroy__Wrapper__;
begin
__rw := __TWMMDIDestroy__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDIDestroy(const V : OleVariant) : TWMMDIDestroy;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDIDestroy((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDIGetActive__Wrapper__ = class(__TWMMDIGetActive__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDIGetActive__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDIGetActiveToVariant(var R : TWMMDIGetActive) : OleVariant;
var
__rw : __TWMMDIGetActive__Wrapper__;
begin
__rw := __TWMMDIGetActive__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDIGetActive(const V : OleVariant) : TWMMDIGetActive;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDIGetActive((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDIIconArrange__Wrapper__ = class(__TWMMDIIconArrange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDIIconArrange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDIIconArrangeToVariant(var R : TWMMDIIconArrange) : OleVariant;
var
__rw : __TWMMDIIconArrange__Wrapper__;
begin
__rw := __TWMMDIIconArrange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDIIconArrange(const V : OleVariant) : TWMMDIIconArrange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDIIconArrange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDIMaximize__Wrapper__ = class(__TWMMDIMaximize__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDIMaximize__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDIMaximizeToVariant(var R : TWMMDIMaximize) : OleVariant;
var
__rw : __TWMMDIMaximize__Wrapper__;
begin
__rw := __TWMMDIMaximize__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDIMaximize(const V : OleVariant) : TWMMDIMaximize;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDIMaximize((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDINext__Wrapper__ = class(__TWMMDINext__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDINext__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDINextToVariant(var R : TWMMDINext) : OleVariant;
var
__rw : __TWMMDINext__Wrapper__;
begin
__rw := __TWMMDINext__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDINext(const V : OleVariant) : TWMMDINext;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDINext((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDIRefreshMenu__Wrapper__ = class(__TWMMDIRefreshMenu__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDIRefreshMenu__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDIRefreshMenuToVariant(var R : TWMMDIRefreshMenu) : OleVariant;
var
__rw : __TWMMDIRefreshMenu__Wrapper__;
begin
__rw := __TWMMDIRefreshMenu__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDIRefreshMenu(const V : OleVariant) : TWMMDIRefreshMenu;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDIRefreshMenu((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDIRestore__Wrapper__ = class(__TWMMDIRestore__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDIRestore__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDIRestoreToVariant(var R : TWMMDIRestore) : OleVariant;
var
__rw : __TWMMDIRestore__Wrapper__;
begin
__rw := __TWMMDIRestore__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDIRestore(const V : OleVariant) : TWMMDIRestore;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDIRestore((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDISetMenu__Wrapper__ = class(__TWMMDISetMenu__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDISetMenu__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDISetMenuToVariant(var R : TWMMDISetMenu) : OleVariant;
var
__rw : __TWMMDISetMenu__Wrapper__;
begin
__rw := __TWMMDISetMenu__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDISetMenu(const V : OleVariant) : TWMMDISetMenu;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDISetMenu((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMDITile__Wrapper__ = class(__TWMMDITile__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMDITile__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMDITileToVariant(var R : TWMMDITile) : OleVariant;
var
__rw : __TWMMDITile__Wrapper__;
begin
__rw := __TWMMDITile__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMDITile(const V : OleVariant) : TWMMDITile;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMDITile((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMeasureItem__Wrapper__ = class(__TWMMeasureItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMeasureItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMeasureItemToVariant(var R : TWMMeasureItem) : OleVariant;
var
__rw : __TWMMeasureItem__Wrapper__;
begin
__rw := __TWMMeasureItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMeasureItem(const V : OleVariant) : TWMMeasureItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMeasureItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMenuChar__Wrapper__ = class(__TWMMenuChar__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMenuChar__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMenuCharToVariant(var R : TWMMenuChar) : OleVariant;
var
__rw : __TWMMenuChar__Wrapper__;
begin
__rw := __TWMMenuChar__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMenuChar(const V : OleVariant) : TWMMenuChar;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMenuChar((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMenuSelect__Wrapper__ = class(__TWMMenuSelect__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMenuSelect__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMenuSelectToVariant(var R : TWMMenuSelect) : OleVariant;
var
__rw : __TWMMenuSelect__Wrapper__;
begin
__rw := __TWMMenuSelect__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMenuSelect(const V : OleVariant) : TWMMenuSelect;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMenuSelect((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMouse__Wrapper__ = class(__TWMMouse__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMouse__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMouseToVariant(var R : TWMMouse) : OleVariant;
var
__rw : __TWMMouse__Wrapper__;
begin
__rw := __TWMMouse__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMouse(const V : OleVariant) : TWMMouse;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMouse((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMouseActivate__Wrapper__ = class(__TWMMouseActivate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMouseActivate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMouseActivateToVariant(var R : TWMMouseActivate) : OleVariant;
var
__rw : __TWMMouseActivate__Wrapper__;
begin
__rw := __TWMMouseActivate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMouseActivate(const V : OleVariant) : TWMMouseActivate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMouseActivate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMouseMove__Wrapper__ = class(__TWMMouseMove__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMouseMove__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMouseMoveToVariant(var R : TWMMouseMove) : OleVariant;
var
__rw : __TWMMouseMove__Wrapper__;
begin
__rw := __TWMMouseMove__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMouseMove(const V : OleVariant) : TWMMouseMove;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMouseMove((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMouseWheel__Wrapper__ = class(__TWMMouseWheel__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMouseWheel__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMouseWheelToVariant(var R : TWMMouseWheel) : OleVariant;
var
__rw : __TWMMouseWheel__Wrapper__;
begin
__rw := __TWMMouseWheel__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMouseWheel(const V : OleVariant) : TWMMouseWheel;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMouseWheel((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMMove__Wrapper__ = class(__TWMMove__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMMove__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMMoveToVariant(var R : TWMMove) : OleVariant;
var
__rw : __TWMMove__Wrapper__;
begin
__rw := __TWMMove__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMMove(const V : OleVariant) : TWMMove;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMMove((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCActivate__Wrapper__ = class(__TWMNCActivate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCActivate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCActivateToVariant(var R : TWMNCActivate) : OleVariant;
var
__rw : __TWMNCActivate__Wrapper__;
begin
__rw := __TWMNCActivate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCActivate(const V : OleVariant) : TWMNCActivate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCActivate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCCalcSize__Wrapper__ = class(__TWMNCCalcSize__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCCalcSize__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCCalcSizeToVariant(var R : TWMNCCalcSize) : OleVariant;
var
__rw : __TWMNCCalcSize__Wrapper__;
begin
__rw := __TWMNCCalcSize__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCCalcSize(const V : OleVariant) : TWMNCCalcSize;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCCalcSize((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCCreate__Wrapper__ = class(__TWMNCCreate__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCCreate__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCCreateToVariant(var R : TWMNCCreate) : OleVariant;
var
__rw : __TWMNCCreate__Wrapper__;
begin
__rw := __TWMNCCreate__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCCreate(const V : OleVariant) : TWMNCCreate;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCCreate((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCDestroy__Wrapper__ = class(__TWMNCDestroy__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCDestroy__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCDestroyToVariant(var R : TWMNCDestroy) : OleVariant;
var
__rw : __TWMNCDestroy__Wrapper__;
begin
__rw := __TWMNCDestroy__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCDestroy(const V : OleVariant) : TWMNCDestroy;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCDestroy((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCHitMessage__Wrapper__ = class(__TWMNCHitMessage__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCHitMessage__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCHitMessageToVariant(var R : TWMNCHitMessage) : OleVariant;
var
__rw : __TWMNCHitMessage__Wrapper__;
begin
__rw := __TWMNCHitMessage__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCHitMessage(const V : OleVariant) : TWMNCHitMessage;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCHitMessage((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCHitTest__Wrapper__ = class(__TWMNCHitTest__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCHitTest__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCHitTestToVariant(var R : TWMNCHitTest) : OleVariant;
var
__rw : __TWMNCHitTest__Wrapper__;
begin
__rw := __TWMNCHitTest__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCHitTest(const V : OleVariant) : TWMNCHitTest;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCHitTest((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCLButtonDblClk__Wrapper__ = class(__TWMNCLButtonDblClk__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCLButtonDblClk__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCLButtonDblClkToVariant(var R : TWMNCLButtonDblClk) : OleVariant;
var
__rw : __TWMNCLButtonDblClk__Wrapper__;
begin
__rw := __TWMNCLButtonDblClk__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCLButtonDblClk(const V : OleVariant) : TWMNCLButtonDblClk;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCLButtonDblClk((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCLButtonDown__Wrapper__ = class(__TWMNCLButtonDown__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCLButtonDown__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCLButtonDownToVariant(var R : TWMNCLButtonDown) : OleVariant;
var
__rw : __TWMNCLButtonDown__Wrapper__;
begin
__rw := __TWMNCLButtonDown__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCLButtonDown(const V : OleVariant) : TWMNCLButtonDown;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCLButtonDown((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCLButtonUp__Wrapper__ = class(__TWMNCLButtonUp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCLButtonUp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCLButtonUpToVariant(var R : TWMNCLButtonUp) : OleVariant;
var
__rw : __TWMNCLButtonUp__Wrapper__;
begin
__rw := __TWMNCLButtonUp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCLButtonUp(const V : OleVariant) : TWMNCLButtonUp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCLButtonUp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCMButtonDblClk__Wrapper__ = class(__TWMNCMButtonDblClk__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCMButtonDblClk__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCMButtonDblClkToVariant(var R : TWMNCMButtonDblClk) : OleVariant;
var
__rw : __TWMNCMButtonDblClk__Wrapper__;
begin
__rw := __TWMNCMButtonDblClk__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCMButtonDblClk(const V : OleVariant) : TWMNCMButtonDblClk;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCMButtonDblClk((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCMButtonDown__Wrapper__ = class(__TWMNCMButtonDown__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCMButtonDown__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCMButtonDownToVariant(var R : TWMNCMButtonDown) : OleVariant;
var
__rw : __TWMNCMButtonDown__Wrapper__;
begin
__rw := __TWMNCMButtonDown__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCMButtonDown(const V : OleVariant) : TWMNCMButtonDown;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCMButtonDown((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCMButtonUp__Wrapper__ = class(__TWMNCMButtonUp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCMButtonUp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCMButtonUpToVariant(var R : TWMNCMButtonUp) : OleVariant;
var
__rw : __TWMNCMButtonUp__Wrapper__;
begin
__rw := __TWMNCMButtonUp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCMButtonUp(const V : OleVariant) : TWMNCMButtonUp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCMButtonUp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCMouseMove__Wrapper__ = class(__TWMNCMouseMove__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCMouseMove__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCMouseMoveToVariant(var R : TWMNCMouseMove) : OleVariant;
var
__rw : __TWMNCMouseMove__Wrapper__;
begin
__rw := __TWMNCMouseMove__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCMouseMove(const V : OleVariant) : TWMNCMouseMove;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCMouseMove((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCPaint__Wrapper__ = class(__TWMNCPaint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCPaint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCPaintToVariant(var R : TWMNCPaint) : OleVariant;
var
__rw : __TWMNCPaint__Wrapper__;
begin
__rw := __TWMNCPaint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCPaint(const V : OleVariant) : TWMNCPaint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCPaint((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCRButtonDblClk__Wrapper__ = class(__TWMNCRButtonDblClk__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCRButtonDblClk__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCRButtonDblClkToVariant(var R : TWMNCRButtonDblClk) : OleVariant;
var
__rw : __TWMNCRButtonDblClk__Wrapper__;
begin
__rw := __TWMNCRButtonDblClk__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCRButtonDblClk(const V : OleVariant) : TWMNCRButtonDblClk;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCRButtonDblClk((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCRButtonDown__Wrapper__ = class(__TWMNCRButtonDown__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCRButtonDown__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCRButtonDownToVariant(var R : TWMNCRButtonDown) : OleVariant;
var
__rw : __TWMNCRButtonDown__Wrapper__;
begin
__rw := __TWMNCRButtonDown__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCRButtonDown(const V : OleVariant) : TWMNCRButtonDown;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCRButtonDown((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNCRButtonUp__Wrapper__ = class(__TWMNCRButtonUp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNCRButtonUp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNCRButtonUpToVariant(var R : TWMNCRButtonUp) : OleVariant;
var
__rw : __TWMNCRButtonUp__Wrapper__;
begin
__rw := __TWMNCRButtonUp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNCRButtonUp(const V : OleVariant) : TWMNCRButtonUp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNCRButtonUp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNextDlgCtl__Wrapper__ = class(__TWMNextDlgCtl__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNextDlgCtl__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNextDlgCtlToVariant(var R : TWMNextDlgCtl) : OleVariant;
var
__rw : __TWMNextDlgCtl__Wrapper__;
begin
__rw := __TWMNextDlgCtl__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNextDlgCtl(const V : OleVariant) : TWMNextDlgCtl;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNextDlgCtl((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNoParams__Wrapper__ = class(__TWMNoParams__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNoParams__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNoParamsToVariant(var R : TWMNoParams) : OleVariant;
var
__rw : __TWMNoParams__Wrapper__;
begin
__rw := __TWMNoParams__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNoParams(const V : OleVariant) : TWMNoParams;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNoParams((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNotify__Wrapper__ = class(__TWMNotify__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNotify__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNotifyToVariant(var R : TWMNotify) : OleVariant;
var
__rw : __TWMNotify__Wrapper__;
begin
__rw := __TWMNotify__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNotify(const V : OleVariant) : TWMNotify;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNotify((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMNotifyFormat__Wrapper__ = class(__TWMNotifyFormat__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMNotifyFormat__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMNotifyFormatToVariant(var R : TWMNotifyFormat) : OleVariant;
var
__rw : __TWMNotifyFormat__Wrapper__;
begin
__rw := __TWMNotifyFormat__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMNotifyFormat(const V : OleVariant) : TWMNotifyFormat;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMNotifyFormat((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMPaint__Wrapper__ = class(__TWMPaint__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMPaint__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMPaintToVariant(var R : TWMPaint) : OleVariant;
var
__rw : __TWMPaint__Wrapper__;
begin
__rw := __TWMPaint__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMPaint(const V : OleVariant) : TWMPaint;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMPaint((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMPaintClipboard__Wrapper__ = class(__TWMPaintClipboard__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMPaintClipboard__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMPaintClipboardToVariant(var R : TWMPaintClipboard) : OleVariant;
var
__rw : __TWMPaintClipboard__Wrapper__;
begin
__rw := __TWMPaintClipboard__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMPaintClipboard(const V : OleVariant) : TWMPaintClipboard;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMPaintClipboard((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMPaintIcon__Wrapper__ = class(__TWMPaintIcon__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMPaintIcon__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMPaintIconToVariant(var R : TWMPaintIcon) : OleVariant;
var
__rw : __TWMPaintIcon__Wrapper__;
begin
__rw := __TWMPaintIcon__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMPaintIcon(const V : OleVariant) : TWMPaintIcon;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMPaintIcon((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMPaletteChanged__Wrapper__ = class(__TWMPaletteChanged__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMPaletteChanged__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMPaletteChangedToVariant(var R : TWMPaletteChanged) : OleVariant;
var
__rw : __TWMPaletteChanged__Wrapper__;
begin
__rw := __TWMPaletteChanged__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMPaletteChanged(const V : OleVariant) : TWMPaletteChanged;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMPaletteChanged((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMPaletteIsChanging__Wrapper__ = class(__TWMPaletteIsChanging__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMPaletteIsChanging__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMPaletteIsChangingToVariant(var R : TWMPaletteIsChanging) : OleVariant;
var
__rw : __TWMPaletteIsChanging__Wrapper__;
begin
__rw := __TWMPaletteIsChanging__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMPaletteIsChanging(const V : OleVariant) : TWMPaletteIsChanging;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMPaletteIsChanging((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMParentNotify__Wrapper__ = class(__TWMParentNotify__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMParentNotify__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMParentNotifyToVariant(var R : TWMParentNotify) : OleVariant;
var
__rw : __TWMParentNotify__Wrapper__;
begin
__rw := __TWMParentNotify__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMParentNotify(const V : OleVariant) : TWMParentNotify;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMParentNotify((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMPaste__Wrapper__ = class(__TWMPaste__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMPaste__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMPasteToVariant(var R : TWMPaste) : OleVariant;
var
__rw : __TWMPaste__Wrapper__;
begin
__rw := __TWMPaste__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMPaste(const V : OleVariant) : TWMPaste;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMPaste((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMPower__Wrapper__ = class(__TWMPower__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMPower__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMPowerToVariant(var R : TWMPower) : OleVariant;
var
__rw : __TWMPower__Wrapper__;
begin
__rw := __TWMPower__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMPower(const V : OleVariant) : TWMPower;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMPower((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMQueryDragIcon__Wrapper__ = class(__TWMQueryDragIcon__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMQueryDragIcon__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMQueryDragIconToVariant(var R : TWMQueryDragIcon) : OleVariant;
var
__rw : __TWMQueryDragIcon__Wrapper__;
begin
__rw := __TWMQueryDragIcon__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMQueryDragIcon(const V : OleVariant) : TWMQueryDragIcon;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMQueryDragIcon((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMQueryEndSession__Wrapper__ = class(__TWMQueryEndSession__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMQueryEndSession__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMQueryEndSessionToVariant(var R : TWMQueryEndSession) : OleVariant;
var
__rw : __TWMQueryEndSession__Wrapper__;
begin
__rw := __TWMQueryEndSession__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMQueryEndSession(const V : OleVariant) : TWMQueryEndSession;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMQueryEndSession((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMQueryNewPalette__Wrapper__ = class(__TWMQueryNewPalette__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMQueryNewPalette__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMQueryNewPaletteToVariant(var R : TWMQueryNewPalette) : OleVariant;
var
__rw : __TWMQueryNewPalette__Wrapper__;
begin
__rw := __TWMQueryNewPalette__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMQueryNewPalette(const V : OleVariant) : TWMQueryNewPalette;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMQueryNewPalette((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMQueryOpen__Wrapper__ = class(__TWMQueryOpen__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMQueryOpen__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMQueryOpenToVariant(var R : TWMQueryOpen) : OleVariant;
var
__rw : __TWMQueryOpen__Wrapper__;
begin
__rw := __TWMQueryOpen__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMQueryOpen(const V : OleVariant) : TWMQueryOpen;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMQueryOpen((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMQueueSync__Wrapper__ = class(__TWMQueueSync__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMQueueSync__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMQueueSyncToVariant(var R : TWMQueueSync) : OleVariant;
var
__rw : __TWMQueueSync__Wrapper__;
begin
__rw := __TWMQueueSync__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMQueueSync(const V : OleVariant) : TWMQueueSync;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMQueueSync((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMQuit__Wrapper__ = class(__TWMQuit__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMQuit__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMQuitToVariant(var R : TWMQuit) : OleVariant;
var
__rw : __TWMQuit__Wrapper__;
begin
__rw := __TWMQuit__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMQuit(const V : OleVariant) : TWMQuit;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMQuit((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMRButtonDblClk__Wrapper__ = class(__TWMRButtonDblClk__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMRButtonDblClk__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMRButtonDblClkToVariant(var R : TWMRButtonDblClk) : OleVariant;
var
__rw : __TWMRButtonDblClk__Wrapper__;
begin
__rw := __TWMRButtonDblClk__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMRButtonDblClk(const V : OleVariant) : TWMRButtonDblClk;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMRButtonDblClk((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMRButtonDown__Wrapper__ = class(__TWMRButtonDown__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMRButtonDown__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMRButtonDownToVariant(var R : TWMRButtonDown) : OleVariant;
var
__rw : __TWMRButtonDown__Wrapper__;
begin
__rw := __TWMRButtonDown__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMRButtonDown(const V : OleVariant) : TWMRButtonDown;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMRButtonDown((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMRButtonUp__Wrapper__ = class(__TWMRButtonUp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMRButtonUp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMRButtonUpToVariant(var R : TWMRButtonUp) : OleVariant;
var
__rw : __TWMRButtonUp__Wrapper__;
begin
__rw := __TWMRButtonUp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMRButtonUp(const V : OleVariant) : TWMRButtonUp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMRButtonUp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMRenderAllFormats__Wrapper__ = class(__TWMRenderAllFormats__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMRenderAllFormats__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMRenderAllFormatsToVariant(var R : TWMRenderAllFormats) : OleVariant;
var
__rw : __TWMRenderAllFormats__Wrapper__;
begin
__rw := __TWMRenderAllFormats__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMRenderAllFormats(const V : OleVariant) : TWMRenderAllFormats;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMRenderAllFormats((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMRenderFormat__Wrapper__ = class(__TWMRenderFormat__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMRenderFormat__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMRenderFormatToVariant(var R : TWMRenderFormat) : OleVariant;
var
__rw : __TWMRenderFormat__Wrapper__;
begin
__rw := __TWMRenderFormat__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMRenderFormat(const V : OleVariant) : TWMRenderFormat;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMRenderFormat((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMScroll__Wrapper__ = class(__TWMScroll__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMScroll__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMScrollToVariant(var R : TWMScroll) : OleVariant;
var
__rw : __TWMScroll__Wrapper__;
begin
__rw := __TWMScroll__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMScroll(const V : OleVariant) : TWMScroll;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMScroll((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSetCursor__Wrapper__ = class(__TWMSetCursor__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSetCursor__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSetCursorToVariant(var R : TWMSetCursor) : OleVariant;
var
__rw : __TWMSetCursor__Wrapper__;
begin
__rw := __TWMSetCursor__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSetCursor(const V : OleVariant) : TWMSetCursor;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSetCursor((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSetFocus__Wrapper__ = class(__TWMSetFocus__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSetFocus__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSetFocusToVariant(var R : TWMSetFocus) : OleVariant;
var
__rw : __TWMSetFocus__Wrapper__;
begin
__rw := __TWMSetFocus__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSetFocus(const V : OleVariant) : TWMSetFocus;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSetFocus((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSetFont__Wrapper__ = class(__TWMSetFont__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSetFont__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSetFontToVariant(var R : TWMSetFont) : OleVariant;
var
__rw : __TWMSetFont__Wrapper__;
begin
__rw := __TWMSetFont__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSetFont(const V : OleVariant) : TWMSetFont;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSetFont((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSetHotKey__Wrapper__ = class(__TWMSetHotKey__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSetHotKey__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSetHotKeyToVariant(var R : TWMSetHotKey) : OleVariant;
var
__rw : __TWMSetHotKey__Wrapper__;
begin
__rw := __TWMSetHotKey__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSetHotKey(const V : OleVariant) : TWMSetHotKey;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSetHotKey((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSetIcon__Wrapper__ = class(__TWMSetIcon__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSetIcon__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSetIconToVariant(var R : TWMSetIcon) : OleVariant;
var
__rw : __TWMSetIcon__Wrapper__;
begin
__rw := __TWMSetIcon__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSetIcon(const V : OleVariant) : TWMSetIcon;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSetIcon((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSetRedraw__Wrapper__ = class(__TWMSetRedraw__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSetRedraw__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSetRedrawToVariant(var R : TWMSetRedraw) : OleVariant;
var
__rw : __TWMSetRedraw__Wrapper__;
begin
__rw := __TWMSetRedraw__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSetRedraw(const V : OleVariant) : TWMSetRedraw;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSetRedraw((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSetText__Wrapper__ = class(__TWMSetText__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSetText__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSetTextToVariant(var R : TWMSetText) : OleVariant;
var
__rw : __TWMSetText__Wrapper__;
begin
__rw := __TWMSetText__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSetText(const V : OleVariant) : TWMSetText;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSetText((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSettingChange__Wrapper__ = class(__TWMSettingChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSettingChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSettingChangeToVariant(var R : TWMSettingChange) : OleVariant;
var
__rw : __TWMSettingChange__Wrapper__;
begin
__rw := __TWMSettingChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSettingChange(const V : OleVariant) : TWMSettingChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSettingChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMShowWindow__Wrapper__ = class(__TWMShowWindow__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMShowWindow__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMShowWindowToVariant(var R : TWMShowWindow) : OleVariant;
var
__rw : __TWMShowWindow__Wrapper__;
begin
__rw := __TWMShowWindow__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMShowWindow(const V : OleVariant) : TWMShowWindow;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMShowWindow((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSize__Wrapper__ = class(__TWMSize__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSize__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSizeToVariant(var R : TWMSize) : OleVariant;
var
__rw : __TWMSize__Wrapper__;
begin
__rw := __TWMSize__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSize(const V : OleVariant) : TWMSize;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSize((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSizeClipboard__Wrapper__ = class(__TWMSizeClipboard__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSizeClipboard__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSizeClipboardToVariant(var R : TWMSizeClipboard) : OleVariant;
var
__rw : __TWMSizeClipboard__Wrapper__;
begin
__rw := __TWMSizeClipboard__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSizeClipboard(const V : OleVariant) : TWMSizeClipboard;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSizeClipboard((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSpoolerStatus__Wrapper__ = class(__TWMSpoolerStatus__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSpoolerStatus__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSpoolerStatusToVariant(var R : TWMSpoolerStatus) : OleVariant;
var
__rw : __TWMSpoolerStatus__Wrapper__;
begin
__rw := __TWMSpoolerStatus__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSpoolerStatus(const V : OleVariant) : TWMSpoolerStatus;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSpoolerStatus((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMStyleChange__Wrapper__ = class(__TWMStyleChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMStyleChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMStyleChangeToVariant(var R : TWMStyleChange) : OleVariant;
var
__rw : __TWMStyleChange__Wrapper__;
begin
__rw := __TWMStyleChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMStyleChange(const V : OleVariant) : TWMStyleChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMStyleChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMStyleChanged__Wrapper__ = class(__TWMStyleChanged__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMStyleChanged__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMStyleChangedToVariant(var R : TWMStyleChanged) : OleVariant;
var
__rw : __TWMStyleChanged__Wrapper__;
begin
__rw := __TWMStyleChanged__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMStyleChanged(const V : OleVariant) : TWMStyleChanged;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMStyleChanged((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMStyleChanging__Wrapper__ = class(__TWMStyleChanging__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMStyleChanging__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMStyleChangingToVariant(var R : TWMStyleChanging) : OleVariant;
var
__rw : __TWMStyleChanging__Wrapper__;
begin
__rw := __TWMStyleChanging__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMStyleChanging(const V : OleVariant) : TWMStyleChanging;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMStyleChanging((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSysChar__Wrapper__ = class(__TWMSysChar__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSysChar__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSysCharToVariant(var R : TWMSysChar) : OleVariant;
var
__rw : __TWMSysChar__Wrapper__;
begin
__rw := __TWMSysChar__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSysChar(const V : OleVariant) : TWMSysChar;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSysChar((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSysColorChange__Wrapper__ = class(__TWMSysColorChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSysColorChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSysColorChangeToVariant(var R : TWMSysColorChange) : OleVariant;
var
__rw : __TWMSysColorChange__Wrapper__;
begin
__rw := __TWMSysColorChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSysColorChange(const V : OleVariant) : TWMSysColorChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSysColorChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSysCommand__Wrapper__ = class(__TWMSysCommand__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSysCommand__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSysCommandToVariant(var R : TWMSysCommand) : OleVariant;
var
__rw : __TWMSysCommand__Wrapper__;
begin
__rw := __TWMSysCommand__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSysCommand(const V : OleVariant) : TWMSysCommand;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSysCommand((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSysDeadChar__Wrapper__ = class(__TWMSysDeadChar__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSysDeadChar__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSysDeadCharToVariant(var R : TWMSysDeadChar) : OleVariant;
var
__rw : __TWMSysDeadChar__Wrapper__;
begin
__rw := __TWMSysDeadChar__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSysDeadChar(const V : OleVariant) : TWMSysDeadChar;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSysDeadChar((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSysKeyDown__Wrapper__ = class(__TWMSysKeyDown__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSysKeyDown__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSysKeyDownToVariant(var R : TWMSysKeyDown) : OleVariant;
var
__rw : __TWMSysKeyDown__Wrapper__;
begin
__rw := __TWMSysKeyDown__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSysKeyDown(const V : OleVariant) : TWMSysKeyDown;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSysKeyDown((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSysKeyUp__Wrapper__ = class(__TWMSysKeyUp__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSysKeyUp__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSysKeyUpToVariant(var R : TWMSysKeyUp) : OleVariant;
var
__rw : __TWMSysKeyUp__Wrapper__;
begin
__rw := __TWMSysKeyUp__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSysKeyUp(const V : OleVariant) : TWMSysKeyUp;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSysKeyUp((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMSystemError__Wrapper__ = class(__TWMSystemError__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMSystemError__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMSystemErrorToVariant(var R : TWMSystemError) : OleVariant;
var
__rw : __TWMSystemError__Wrapper__;
begin
__rw := __TWMSystemError__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMSystemError(const V : OleVariant) : TWMSystemError;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMSystemError((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMTimeChange__Wrapper__ = class(__TWMTimeChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMTimeChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMTimeChangeToVariant(var R : TWMTimeChange) : OleVariant;
var
__rw : __TWMTimeChange__Wrapper__;
begin
__rw := __TWMTimeChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMTimeChange(const V : OleVariant) : TWMTimeChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMTimeChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMTimer__Wrapper__ = class(__TWMTimer__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMTimer__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMTimerToVariant(var R : TWMTimer) : OleVariant;
var
__rw : __TWMTimer__Wrapper__;
begin
__rw := __TWMTimer__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMTimer(const V : OleVariant) : TWMTimer;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMTimer((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMUndo__Wrapper__ = class(__TWMUndo__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMUndo__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMUndoToVariant(var R : TWMUndo) : OleVariant;
var
__rw : __TWMUndo__Wrapper__;
begin
__rw := __TWMUndo__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMUndo(const V : OleVariant) : TWMUndo;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMUndo((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMVKeyToItem__Wrapper__ = class(__TWMVKeyToItem__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMVKeyToItem__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMVKeyToItemToVariant(var R : TWMVKeyToItem) : OleVariant;
var
__rw : __TWMVKeyToItem__Wrapper__;
begin
__rw := __TWMVKeyToItem__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMVKeyToItem(const V : OleVariant) : TWMVKeyToItem;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMVKeyToItem((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMVScroll__Wrapper__ = class(__TWMVScroll__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMVScroll__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMVScrollToVariant(var R : TWMVScroll) : OleVariant;
var
__rw : __TWMVScroll__Wrapper__;
begin
__rw := __TWMVScroll__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMVScroll(const V : OleVariant) : TWMVScroll;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMVScroll((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMVScrollClipboard__Wrapper__ = class(__TWMVScrollClipboard__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMVScrollClipboard__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMVScrollClipboardToVariant(var R : TWMVScrollClipboard) : OleVariant;
var
__rw : __TWMVScrollClipboard__Wrapper__;
begin
__rw := __TWMVScrollClipboard__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMVScrollClipboard(const V : OleVariant) : TWMVScrollClipboard;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMVScrollClipboard((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMWindowPosChanged__Wrapper__ = class(__TWMWindowPosChanged__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMWindowPosChanged__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMWindowPosChangedToVariant(var R : TWMWindowPosChanged) : OleVariant;
var
__rw : __TWMWindowPosChanged__Wrapper__;
begin
__rw := __TWMWindowPosChanged__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMWindowPosChanged(const V : OleVariant) : TWMWindowPosChanged;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMWindowPosChanged((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMWindowPosChanging__Wrapper__ = class(__TWMWindowPosChanging__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMWindowPosChanging__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMWindowPosChangingToVariant(var R : TWMWindowPosChanging) : OleVariant;
var
__rw : __TWMWindowPosChanging__Wrapper__;
begin
__rw := __TWMWindowPosChanging__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMWindowPosChanging(const V : OleVariant) : TWMWindowPosChanging;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMWindowPosChanging((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMWindowPosMsg__Wrapper__ = class(__TWMWindowPosMsg__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMWindowPosMsg__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMWindowPosMsgToVariant(var R : TWMWindowPosMsg) : OleVariant;
var
__rw : __TWMWindowPosMsg__Wrapper__;
begin
__rw := __TWMWindowPosMsg__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMWindowPosMsg(const V : OleVariant) : TWMWindowPosMsg;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMWindowPosMsg((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;

type __TWMWinIniChange__Wrapper__ = class(__TWMWinIniChange__Wrapper)
private
fRPtr : pointer;
function GetRecordPtr : pointer; override;
end;
function __TWMWinIniChange__Wrapper__.GetRecordPtr : pointer;
begin
result := fRPtr;
end;
function ConvertTWMWinIniChangeToVariant(var R : TWMWinIniChange) : OleVariant;
var
__rw : __TWMWinIniChange__Wrapper__;
begin
__rw := __TWMWinIniChange__Wrapper__.Create;
__rw.fRPtr := @R;
result := IDispatch(__rw);
end;
function ConvertVariantToTWMWinIniChange(const V : OleVariant) : TWMWinIniChange;
var
_idisp : IDispatch;
begin
_idisp := VarToInterface(v);
if _idisp = nil then exit;
result := TWMWinIniChange((_idisp as IDCRecordWrapper).GetRecordPtr^);
end;
procedure __RegisterProps;
begin
end;

const __ConstNames0 : array[0..385] of string = (
'WM_NULL'
,'WM_CREATE'
,'WM_DESTROY'
,'WM_MOVE'
,'WM_SIZE'
,'WM_ACTIVATE'
,'WM_SETFOCUS'
,'WM_KILLFOCUS'
,'WM_ENABLE'
,'WM_SETREDRAW'
,'WM_SETTEXT'
,'WM_GETTEXT'
,'WM_GETTEXTLENGTH'
,'WM_PAINT'
,'WM_CLOSE'
,'WM_QUERYENDSESSION'
,'WM_QUIT'
,'WM_QUERYOPEN'
,'WM_ERASEBKGND'
,'WM_SYSCOLORCHANGE'
,'WM_ENDSESSION'
,'WM_SYSTEMERROR'
,'WM_SHOWWINDOW'
,'WM_CTLCOLOR'
,'WM_WININICHANGE'
,'WM_SETTINGCHANGE'
,'WM_DEVMODECHANGE'
,'WM_ACTIVATEAPP'
,'WM_FONTCHANGE'
,'WM_TIMECHANGE'
,'WM_CANCELMODE'
,'WM_SETCURSOR'
,'WM_MOUSEACTIVATE'
,'WM_CHILDACTIVATE'
,'WM_QUEUESYNC'
,'WM_GETMINMAXINFO'
,'WM_PAINTICON'
,'WM_ICONERASEBKGND'
,'WM_NEXTDLGCTL'
,'WM_SPOOLERSTATUS'
,'WM_DRAWITEM'
,'WM_MEASUREITEM'
,'WM_DELETEITEM'
,'WM_VKEYTOITEM'
,'WM_CHARTOITEM'
,'WM_SETFONT'
,'WM_GETFONT'
,'WM_SETHOTKEY'
,'WM_GETHOTKEY'
,'WM_QUERYDRAGICON'
,'WM_COMPAREITEM'
,'WM_GETOBJECT'
,'WM_COMPACTING'
,'WM_COMMNOTIFY'
,'WM_WINDOWPOSCHANGING'
,'WM_WINDOWPOSCHANGED'
,'WM_POWER'
,'WM_COPYDATA'
,'WM_CANCELJOURNAL'
,'WM_NOTIFY'
,'WM_INPUTLANGCHANGEREQUEST'
,'WM_INPUTLANGCHANGE'
,'WM_TCARD'
,'WM_HELP'
,'WM_USERCHANGED'
,'WM_NOTIFYFORMAT'
,'WM_CONTEXTMENU'
,'WM_STYLECHANGING'
,'WM_STYLECHANGED'
,'WM_DISPLAYCHANGE'
,'WM_GETICON'
,'WM_SETICON'
,'WM_NCCREATE'
,'WM_NCDESTROY'
,'WM_NCCALCSIZE'
,'WM_NCHITTEST'
,'WM_NCPAINT'
,'WM_NCACTIVATE'
,'WM_GETDLGCODE'
,'WM_NCMOUSEMOVE'
,'WM_NCLBUTTONDOWN'
,'WM_NCLBUTTONUP'
,'WM_NCLBUTTONDBLCLK'
,'WM_NCRBUTTONDOWN'
,'WM_NCRBUTTONUP'
,'WM_NCRBUTTONDBLCLK'
,'WM_NCMBUTTONDOWN'
,'WM_NCMBUTTONUP'
,'WM_NCMBUTTONDBLCLK'
,'WM_KEYFIRST'
,'WM_KEYDOWN'
,'WM_KEYUP'
,'WM_CHAR'
,'WM_DEADCHAR'
,'WM_SYSKEYDOWN'
,'WM_SYSKEYUP'
,'WM_SYSCHAR'
,'WM_SYSDEADCHAR'
,'WM_KEYLAST'
,'WM_INITDIALOG'
,'WM_COMMAND'
,'WM_SYSCOMMAND'
,'WM_TIMER'
,'WM_HSCROLL'
,'WM_VSCROLL'
,'WM_INITMENU'
,'WM_INITMENUPOPUP'
,'WM_MENUSELECT'
,'WM_MENUCHAR'
,'WM_ENTERIDLE'
,'WM_MENURBUTTONUP'
,'WM_MENUDRAG'
,'WM_MENUGETOBJECT'
,'WM_UNINITMENUPOPUP'
,'WM_MENUCOMMAND'
,'WM_CTLCOLORMSGBOX'
,'WM_CTLCOLOREDIT'
,'WM_CTLCOLORLISTBOX'
,'WM_CTLCOLORBTN'
,'WM_CTLCOLORDLG'
,'WM_CTLCOLORSCROLLBAR'
,'WM_CTLCOLORSTATIC'
,'WM_MOUSEFIRST'
,'WM_MOUSEMOVE'
,'WM_LBUTTONDOWN'
,'WM_LBUTTONUP'
,'WM_LBUTTONDBLCLK'
,'WM_RBUTTONDOWN'
,'WM_RBUTTONUP'
,'WM_RBUTTONDBLCLK'
,'WM_MBUTTONDOWN'
,'WM_MBUTTONUP'
,'WM_MBUTTONDBLCLK'
,'WM_MOUSEWHEEL'
,'WM_MOUSELAST'
,'WM_PARENTNOTIFY'
,'WM_ENTERMENULOOP'
,'WM_EXITMENULOOP'
,'WM_NEXTMENU'
,'WM_SIZING'
,'WM_CAPTURECHANGED'
,'WM_MOVING'
,'WM_POWERBROADCAST'
,'WM_DEVICECHANGE'
,'WM_IME_STARTCOMPOSITION'
,'WM_IME_ENDCOMPOSITION'
,'WM_IME_COMPOSITION'
,'WM_IME_KEYLAST'
,'WM_IME_SETCONTEXT'
,'WM_IME_NOTIFY'
,'WM_IME_CONTROL'
,'WM_IME_COMPOSITIONFULL'
,'WM_IME_SELECT'
,'WM_IME_CHAR'
,'WM_IME_REQUEST'
,'WM_IME_KEYDOWN'
,'WM_IME_KEYUP'
,'WM_MDICREATE'
,'WM_MDIDESTROY'
,'WM_MDIACTIVATE'
,'WM_MDIRESTORE'
,'WM_MDINEXT'
,'WM_MDIMAXIMIZE'
,'WM_MDITILE'
,'WM_MDICASCADE'
,'WM_MDIICONARRANGE'
,'WM_MDIGETACTIVE'
,'WM_MDISETMENU'
,'WM_ENTERSIZEMOVE'
,'WM_EXITSIZEMOVE'
,'WM_DROPFILES'
,'WM_MDIREFRESHMENU'
,'WM_MOUSEHOVER'
,'WM_MOUSELEAVE'
,'WM_CUT'
,'WM_COPY'
,'WM_PASTE'
,'WM_CLEAR'
,'WM_UNDO'
,'WM_RENDERFORMAT'
,'WM_RENDERALLFORMATS'
,'WM_DESTROYCLIPBOARD'
,'WM_DRAWCLIPBOARD'
,'WM_PAINTCLIPBOARD'
,'WM_VSCROLLCLIPBOARD'
,'WM_SIZECLIPBOARD'
,'WM_ASKCBFORMATNAME'
,'WM_CHANGECBCHAIN'
,'WM_HSCROLLCLIPBOARD'
,'WM_QUERYNEWPALETTE'
,'WM_PALETTEISCHANGING'
,'WM_PALETTECHANGED'
,'WM_HOTKEY'
,'WM_PRINT'
,'WM_PRINTCLIENT'
,'WM_HANDHELDFIRST'
,'WM_HANDHELDLAST'
,'WM_PENWINFIRST'
,'WM_PENWINLAST'
,'WM_COALESCE_FIRST'
,'WM_COALESCE_LAST'
,'WM_DDE_FIRST'
,'WM_DDE_INITIATE'
,'WM_DDE_TERMINATE'
,'WM_DDE_ADVISE'
,'WM_DDE_UNADVISE'
,'WM_DDE_ACK'
,'WM_DDE_DATA'
,'WM_DDE_REQUEST'
,'WM_DDE_POKE'
,'WM_DDE_EXECUTE'
,'WM_DDE_LAST'
,'WM_APP'
,'WM_USER'
,'BN_CLICKED'
,'BN_PAINT'
,'BN_HILITE'
,'BN_UNHILITE'
,'BN_DISABLE'
,'BN_DOUBLECLICKED'
,'BN_PUSHED'
,'BN_UNPUSHED'
,'BN_DBLCLK'
,'BN_SETFOCUS'
,'BN_KILLFOCUS'
,'BM_GETCHECK'
,'BM_SETCHECK'
,'BM_GETSTATE'
,'BM_SETSTATE'
,'BM_SETSTYLE'
,'BM_CLICK'
,'BM_GETIMAGE'
,'BM_SETIMAGE'
,'LBN_ERRSPACE'
,'LBN_SELCHANGE'
,'LBN_DBLCLK'
,'LBN_SELCANCEL'
,'LBN_SETFOCUS'
,'LBN_KILLFOCUS'
,'LB_ADDSTRING'
,'LB_INSERTSTRING'
,'LB_DELETESTRING'
,'LB_SELITEMRANGEEX'
,'LB_RESETCONTENT'
,'LB_SETSEL'
,'LB_SETCURSEL'
,'LB_GETSEL'
,'LB_GETCURSEL'
,'LB_GETTEXT'
,'LB_GETTEXTLEN'
,'LB_GETCOUNT'
,'LB_SELECTSTRING'
,'LB_DIR'
,'LB_GETTOPINDEX'
,'LB_FINDSTRING'
,'LB_GETSELCOUNT'
,'LB_GETSELITEMS'
,'LB_SETTABSTOPS'
,'LB_GETHORIZONTALEXTENT'
,'LB_SETHORIZONTALEXTENT'
,'LB_SETCOLUMNWIDTH'
,'LB_ADDFILE'
,'LB_SETTOPINDEX'
,'LB_GETITEMRECT'
,'LB_GETITEMDATA'
,'LB_SETITEMDATA'
,'LB_SELITEMRANGE'
,'LB_SETANCHORINDEX'
,'LB_GETANCHORINDEX'
,'LB_SETCARETINDEX'
,'LB_GETCARETINDEX'
,'LB_SETITEMHEIGHT'
,'LB_GETITEMHEIGHT'
,'LB_FINDSTRINGEXACT'
,'LB_SETLOCALE'
,'LB_GETLOCALE'
,'LB_SETCOUNT'
,'LB_INITSTORAGE'
,'LB_ITEMFROMPOINT'
,'LB_MSGMAX'
,'CBN_ERRSPACE'
,'CBN_SELCHANGE'
,'CBN_DBLCLK'
,'CBN_SETFOCUS'
,'CBN_KILLFOCUS'
,'CBN_EDITCHANGE'
,'CBN_EDITUPDATE'
,'CBN_DROPDOWN'
,'CBN_CLOSEUP'
,'CBN_SELENDOK'
,'CBN_SELENDCANCEL'
,'CB_GETEDITSEL'
,'CB_LIMITTEXT'
,'CB_SETEDITSEL'
,'CB_ADDSTRING'
,'CB_DELETESTRING'
,'CB_DIR'
,'CB_GETCOUNT'
,'CB_GETCURSEL'
,'CB_GETLBTEXT'
,'CB_GETLBTEXTLEN'
,'CB_INSERTSTRING'
,'CB_RESETCONTENT'
,'CB_FINDSTRING'
,'CB_SELECTSTRING'
,'CB_SETCURSEL'
,'CB_SHOWDROPDOWN'
,'CB_GETITEMDATA'
,'CB_SETITEMDATA'
,'CB_GETDROPPEDCONTROLRECT'
,'CB_SETITEMHEIGHT'
,'CB_GETITEMHEIGHT'
,'CB_SETEXTENDEDUI'
,'CB_GETEXTENDEDUI'
,'CB_GETDROPPEDSTATE'
,'CB_FINDSTRINGEXACT'
,'CB_SETLOCALE'
,'CB_GETLOCALE'
,'CB_GETTOPINDEX'
,'CB_SETTOPINDEX'
,'CB_GETHORIZONTALEXTENT'
,'CB_SETHORIZONTALEXTENT'
,'CB_GETDROPPEDWIDTH'
,'CB_SETDROPPEDWIDTH'
,'CB_INITSTORAGE'
,'CB_MSGMAX'
,'EN_SETFOCUS'
,'EN_KILLFOCUS'
,'EN_CHANGE'
,'EN_UPDATE'
,'EN_ERRSPACE'
,'EN_MAXTEXT'
,'EN_HSCROLL'
,'EN_VSCROLL'
,'EM_GETSEL'
,'EM_SETSEL'
,'EM_GETRECT'
,'EM_SETRECT'
,'EM_SETRECTNP'
,'EM_SCROLL'
,'EM_LINESCROLL'
,'EM_SCROLLCARET'
,'EM_GETMODIFY'
,'EM_SETMODIFY'
,'EM_GETLINECOUNT'
,'EM_LINEINDEX'
,'EM_SETHANDLE'
,'EM_GETHANDLE'
,'EM_GETTHUMB'
,'EM_LINELENGTH'
,'EM_REPLACESEL'
,'EM_GETLINE'
,'EM_LIMITTEXT'
,'EM_CANUNDO'
,'EM_UNDO'
,'EM_FMTLINES'
,'EM_LINEFROMCHAR'
,'EM_SETTABSTOPS'
,'EM_SETPASSWORDCHAR'
,'EM_EMPTYUNDOBUFFER'
,'EM_GETFIRSTVISIBLELINE'
,'EM_SETREADONLY'
,'EM_SETWORDBREAKPROC'
,'EM_GETWORDBREAKPROC'
,'EM_GETPASSWORDCHAR'
,'EM_SETMARGINS'
,'EM_GETMARGINS'
,'EM_SETLIMITTEXT'
,'EM_GETLIMITTEXT'
,'EM_POSFROMCHAR'
,'EM_CHARFROMPOS'
,'EM_SETIMESTATUS'
,'EM_GETIMESTATUS'
,'SBM_SETPOS'
,'SBM_GETPOS'
,'SBM_SETRANGE'
,'SBM_SETRANGEREDRAW'
,'SBM_GETRANGE'
,'SBM_ENABLE_ARROWS'
,'SBM_SETSCROLLINFO'
,'SBM_GETSCROLLINFO'
,'DM_GETDEFID'
,'DM_SETDEFID'
,'DM_REPOSITION'
,'PSM_PAGEINFO'
,'PSM_SHEETINFO'
);
var __RegisteredConstsList0 : TList;
procedure __RegisterConsts0;
begin
__RegisteredConstsList0 := TList.Create;
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[0] ,WM_NULL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[1] ,WM_CREATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[2] ,WM_DESTROY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[3] ,WM_MOVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[4] ,WM_SIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[5] ,WM_ACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[6] ,WM_SETFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[7] ,WM_KILLFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[8] ,WM_ENABLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[9] ,WM_SETREDRAW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[10] ,WM_SETTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[11] ,WM_GETTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[12] ,WM_GETTEXTLENGTH));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[13] ,WM_PAINT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[14] ,WM_CLOSE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[15] ,WM_QUERYENDSESSION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[16] ,WM_QUIT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[17] ,WM_QUERYOPEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[18] ,WM_ERASEBKGND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[19] ,WM_SYSCOLORCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[20] ,WM_ENDSESSION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[21] ,WM_SYSTEMERROR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[22] ,WM_SHOWWINDOW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[23] ,WM_CTLCOLOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[24] ,WM_WININICHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[25] ,WM_SETTINGCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[26] ,WM_DEVMODECHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[27] ,WM_ACTIVATEAPP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[28] ,WM_FONTCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[29] ,WM_TIMECHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[30] ,WM_CANCELMODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[31] ,WM_SETCURSOR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[32] ,WM_MOUSEACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[33] ,WM_CHILDACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[34] ,WM_QUEUESYNC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[35] ,WM_GETMINMAXINFO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[36] ,WM_PAINTICON));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[37] ,WM_ICONERASEBKGND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[38] ,WM_NEXTDLGCTL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[39] ,WM_SPOOLERSTATUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[40] ,WM_DRAWITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[41] ,WM_MEASUREITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[42] ,WM_DELETEITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[43] ,WM_VKEYTOITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[44] ,WM_CHARTOITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[45] ,WM_SETFONT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[46] ,WM_GETFONT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[47] ,WM_SETHOTKEY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[48] ,WM_GETHOTKEY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[49] ,WM_QUERYDRAGICON));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[50] ,WM_COMPAREITEM));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[51] ,WM_GETOBJECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[52] ,WM_COMPACTING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[53] ,WM_COMMNOTIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[54] ,WM_WINDOWPOSCHANGING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[55] ,WM_WINDOWPOSCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[56] ,WM_POWER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[57] ,WM_COPYDATA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[58] ,WM_CANCELJOURNAL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[59] ,WM_NOTIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[60] ,WM_INPUTLANGCHANGEREQUEST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[61] ,WM_INPUTLANGCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[62] ,WM_TCARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[63] ,WM_HELP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[64] ,WM_USERCHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[65] ,WM_NOTIFYFORMAT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[66] ,WM_CONTEXTMENU));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[67] ,WM_STYLECHANGING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[68] ,WM_STYLECHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[69] ,WM_DISPLAYCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[70] ,WM_GETICON));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[71] ,WM_SETICON));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[72] ,WM_NCCREATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[73] ,WM_NCDESTROY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[74] ,WM_NCCALCSIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[75] ,WM_NCHITTEST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[76] ,WM_NCPAINT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[77] ,WM_NCACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[78] ,WM_GETDLGCODE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[79] ,WM_NCMOUSEMOVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[80] ,WM_NCLBUTTONDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[81] ,WM_NCLBUTTONUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[82] ,WM_NCLBUTTONDBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[83] ,WM_NCRBUTTONDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[84] ,WM_NCRBUTTONUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[85] ,WM_NCRBUTTONDBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[86] ,WM_NCMBUTTONDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[87] ,WM_NCMBUTTONUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[88] ,WM_NCMBUTTONDBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[89] ,WM_KEYFIRST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[90] ,WM_KEYDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[91] ,WM_KEYUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[92] ,WM_CHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[93] ,WM_DEADCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[94] ,WM_SYSKEYDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[95] ,WM_SYSKEYUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[96] ,WM_SYSCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[97] ,WM_SYSDEADCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[98] ,WM_KEYLAST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[99] ,WM_INITDIALOG));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[100] ,WM_COMMAND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[101] ,WM_SYSCOMMAND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[102] ,WM_TIMER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[103] ,WM_HSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[104] ,WM_VSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[105] ,WM_INITMENU));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[106] ,WM_INITMENUPOPUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[107] ,WM_MENUSELECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[108] ,WM_MENUCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[109] ,WM_ENTERIDLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[110] ,WM_MENURBUTTONUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[111] ,WM_MENUDRAG));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[112] ,WM_MENUGETOBJECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[113] ,WM_UNINITMENUPOPUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[114] ,WM_MENUCOMMAND));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[115] ,WM_CTLCOLORMSGBOX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[116] ,WM_CTLCOLOREDIT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[117] ,WM_CTLCOLORLISTBOX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[118] ,WM_CTLCOLORBTN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[119] ,WM_CTLCOLORDLG));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[120] ,WM_CTLCOLORSCROLLBAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[121] ,WM_CTLCOLORSTATIC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[122] ,WM_MOUSEFIRST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[123] ,WM_MOUSEMOVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[124] ,WM_LBUTTONDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[125] ,WM_LBUTTONUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[126] ,WM_LBUTTONDBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[127] ,WM_RBUTTONDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[128] ,WM_RBUTTONUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[129] ,WM_RBUTTONDBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[130] ,WM_MBUTTONDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[131] ,WM_MBUTTONUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[132] ,WM_MBUTTONDBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[133] ,WM_MOUSEWHEEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[134] ,WM_MOUSELAST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[135] ,WM_PARENTNOTIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[136] ,WM_ENTERMENULOOP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[137] ,WM_EXITMENULOOP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[138] ,WM_NEXTMENU));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[139] ,WM_SIZING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[140] ,WM_CAPTURECHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[141] ,WM_MOVING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[142] ,WM_POWERBROADCAST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[143] ,WM_DEVICECHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[144] ,WM_IME_STARTCOMPOSITION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[145] ,WM_IME_ENDCOMPOSITION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[146] ,WM_IME_COMPOSITION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[147] ,WM_IME_KEYLAST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[148] ,WM_IME_SETCONTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[149] ,WM_IME_NOTIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[150] ,WM_IME_CONTROL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[151] ,WM_IME_COMPOSITIONFULL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[152] ,WM_IME_SELECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[153] ,WM_IME_CHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[154] ,WM_IME_REQUEST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[155] ,WM_IME_KEYDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[156] ,WM_IME_KEYUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[157] ,WM_MDICREATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[158] ,WM_MDIDESTROY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[159] ,WM_MDIACTIVATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[160] ,WM_MDIRESTORE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[161] ,WM_MDINEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[162] ,WM_MDIMAXIMIZE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[163] ,WM_MDITILE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[164] ,WM_MDICASCADE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[165] ,WM_MDIICONARRANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[166] ,WM_MDIGETACTIVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[167] ,WM_MDISETMENU));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[168] ,WM_ENTERSIZEMOVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[169] ,WM_EXITSIZEMOVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[170] ,WM_DROPFILES));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[171] ,WM_MDIREFRESHMENU));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[172] ,WM_MOUSEHOVER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[173] ,WM_MOUSELEAVE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[174] ,WM_CUT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[175] ,WM_COPY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[176] ,WM_PASTE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[177] ,WM_CLEAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[178] ,WM_UNDO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[179] ,WM_RENDERFORMAT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[180] ,WM_RENDERALLFORMATS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[181] ,WM_DESTROYCLIPBOARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[182] ,WM_DRAWCLIPBOARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[183] ,WM_PAINTCLIPBOARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[184] ,WM_VSCROLLCLIPBOARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[185] ,WM_SIZECLIPBOARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[186] ,WM_ASKCBFORMATNAME));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[187] ,WM_CHANGECBCHAIN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[188] ,WM_HSCROLLCLIPBOARD));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[189] ,WM_QUERYNEWPALETTE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[190] ,WM_PALETTEISCHANGING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[191] ,WM_PALETTECHANGED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[192] ,WM_HOTKEY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[193] ,WM_PRINT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[194] ,WM_PRINTCLIENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[195] ,WM_HANDHELDFIRST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[196] ,WM_HANDHELDLAST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[197] ,WM_PENWINFIRST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[198] ,WM_PENWINLAST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[199] ,WM_COALESCE_FIRST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[200] ,WM_COALESCE_LAST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[201] ,WM_DDE_FIRST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[202] ,WM_DDE_INITIATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[203] ,WM_DDE_TERMINATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[204] ,WM_DDE_ADVISE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[205] ,WM_DDE_UNADVISE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[206] ,WM_DDE_ACK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[207] ,WM_DDE_DATA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[208] ,WM_DDE_REQUEST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[209] ,WM_DDE_POKE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[210] ,WM_DDE_EXECUTE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[211] ,WM_DDE_LAST));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[212] ,WM_APP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[213] ,WM_USER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[214] ,BN_CLICKED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[215] ,BN_PAINT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[216] ,BN_HILITE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[217] ,BN_UNHILITE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[218] ,BN_DISABLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[219] ,BN_DOUBLECLICKED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[220] ,BN_PUSHED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[221] ,BN_UNPUSHED));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[222] ,BN_DBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[223] ,BN_SETFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[224] ,BN_KILLFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[225] ,BM_GETCHECK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[226] ,BM_SETCHECK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[227] ,BM_GETSTATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[228] ,BM_SETSTATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[229] ,BM_SETSTYLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[230] ,BM_CLICK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[231] ,BM_GETIMAGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[232] ,BM_SETIMAGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[233] ,LBN_ERRSPACE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[234] ,LBN_SELCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[235] ,LBN_DBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[236] ,LBN_SELCANCEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[237] ,LBN_SETFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[238] ,LBN_KILLFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[239] ,LB_ADDSTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[240] ,LB_INSERTSTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[241] ,LB_DELETESTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[242] ,LB_SELITEMRANGEEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[243] ,LB_RESETCONTENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[244] ,LB_SETSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[245] ,LB_SETCURSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[246] ,LB_GETSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[247] ,LB_GETCURSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[248] ,LB_GETTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[249] ,LB_GETTEXTLEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[250] ,LB_GETCOUNT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[251] ,LB_SELECTSTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[252] ,LB_DIR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[253] ,LB_GETTOPINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[254] ,LB_FINDSTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[255] ,LB_GETSELCOUNT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[256] ,LB_GETSELITEMS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[257] ,LB_SETTABSTOPS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[258] ,LB_GETHORIZONTALEXTENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[259] ,LB_SETHORIZONTALEXTENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[260] ,LB_SETCOLUMNWIDTH));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[261] ,LB_ADDFILE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[262] ,LB_SETTOPINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[263] ,LB_GETITEMRECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[264] ,LB_GETITEMDATA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[265] ,LB_SETITEMDATA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[266] ,LB_SELITEMRANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[267] ,LB_SETANCHORINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[268] ,LB_GETANCHORINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[269] ,LB_SETCARETINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[270] ,LB_GETCARETINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[271] ,LB_SETITEMHEIGHT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[272] ,LB_GETITEMHEIGHT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[273] ,LB_FINDSTRINGEXACT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[274] ,LB_SETLOCALE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[275] ,LB_GETLOCALE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[276] ,LB_SETCOUNT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[277] ,LB_INITSTORAGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[278] ,LB_ITEMFROMPOINT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[279] ,LB_MSGMAX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[280] ,CBN_ERRSPACE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[281] ,CBN_SELCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[282] ,CBN_DBLCLK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[283] ,CBN_SETFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[284] ,CBN_KILLFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[285] ,CBN_EDITCHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[286] ,CBN_EDITUPDATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[287] ,CBN_DROPDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[288] ,CBN_CLOSEUP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[289] ,CBN_SELENDOK));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[290] ,CBN_SELENDCANCEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[291] ,CB_GETEDITSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[292] ,CB_LIMITTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[293] ,CB_SETEDITSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[294] ,CB_ADDSTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[295] ,CB_DELETESTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[296] ,CB_DIR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[297] ,CB_GETCOUNT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[298] ,CB_GETCURSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[299] ,CB_GETLBTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[300] ,CB_GETLBTEXTLEN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[301] ,CB_INSERTSTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[302] ,CB_RESETCONTENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[303] ,CB_FINDSTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[304] ,CB_SELECTSTRING));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[305] ,CB_SETCURSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[306] ,CB_SHOWDROPDOWN));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[307] ,CB_GETITEMDATA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[308] ,CB_SETITEMDATA));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[309] ,CB_GETDROPPEDCONTROLRECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[310] ,CB_SETITEMHEIGHT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[311] ,CB_GETITEMHEIGHT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[312] ,CB_SETEXTENDEDUI));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[313] ,CB_GETEXTENDEDUI));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[314] ,CB_GETDROPPEDSTATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[315] ,CB_FINDSTRINGEXACT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[316] ,CB_SETLOCALE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[317] ,CB_GETLOCALE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[318] ,CB_GETTOPINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[319] ,CB_SETTOPINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[320] ,CB_GETHORIZONTALEXTENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[321] ,CB_SETHORIZONTALEXTENT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[322] ,CB_GETDROPPEDWIDTH));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[323] ,CB_SETDROPPEDWIDTH));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[324] ,CB_INITSTORAGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[325] ,CB_MSGMAX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[326] ,EN_SETFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[327] ,EN_KILLFOCUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[328] ,EN_CHANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[329] ,EN_UPDATE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[330] ,EN_ERRSPACE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[331] ,EN_MAXTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[332] ,EN_HSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[333] ,EN_VSCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[334] ,EM_GETSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[335] ,EM_SETSEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[336] ,EM_GETRECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[337] ,EM_SETRECT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[338] ,EM_SETRECTNP));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[339] ,EM_SCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[340] ,EM_LINESCROLL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[341] ,EM_SCROLLCARET));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[342] ,EM_GETMODIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[343] ,EM_SETMODIFY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[344] ,EM_GETLINECOUNT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[345] ,EM_LINEINDEX));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[346] ,EM_SETHANDLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[347] ,EM_GETHANDLE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[348] ,EM_GETTHUMB));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[349] ,EM_LINELENGTH));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[350] ,EM_REPLACESEL));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[351] ,EM_GETLINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[352] ,EM_LIMITTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[353] ,EM_CANUNDO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[354] ,EM_UNDO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[355] ,EM_FMTLINES));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[356] ,EM_LINEFROMCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[357] ,EM_SETTABSTOPS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[358] ,EM_SETPASSWORDCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[359] ,EM_EMPTYUNDOBUFFER));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[360] ,EM_GETFIRSTVISIBLELINE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[361] ,EM_SETREADONLY));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[362] ,EM_SETWORDBREAKPROC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[363] ,EM_GETWORDBREAKPROC));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[364] ,EM_GETPASSWORDCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[365] ,EM_SETMARGINS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[366] ,EM_GETMARGINS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[367] ,EM_SETLIMITTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[368] ,EM_GETLIMITTEXT));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[369] ,EM_POSFROMCHAR));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[370] ,EM_CHARFROMPOS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[371] ,EM_SETIMESTATUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[372] ,EM_GETIMESTATUS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[373] ,SBM_SETPOS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[374] ,SBM_GETPOS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[375] ,SBM_SETRANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[376] ,SBM_SETRANGEREDRAW));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[377] ,SBM_GETRANGE));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[378] ,SBM_ENABLE_ARROWS));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[379] ,SBM_SETSCROLLINFO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[380] ,SBM_GETSCROLLINFO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[381] ,DM_GETDEFID));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[382] ,DM_SETDEFID));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[383] ,DM_REPOSITION));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[384] ,PSM_PAGEINFO));
__RegisteredConstsList0.Add(RegisterConst(__ConstNames0[385] ,PSM_SHEETINFO));
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
const MethodNames : array[0..170] of string = (
'TMessage'
,'TMSHMouseWheel'
,'TWMActivate'
,'TWMActivateApp'
,'TWMAskCBFormatName'
,'TWMCancelMode'
,'TWMChangeCBChain'
,'TWMChar'
,'TWMCharToItem'
,'TWMChildActivate'
,'TWMChooseFont_GetLogFont'
,'TWMClear'
,'TWMClose'
,'TWMCommand'
,'TWMCompacting'
,'TWMCompareItem'
,'TWMCopy'
,'TWMCopyData'
,'TWMCreate'
,'TWMCtlColor'
,'TWMCtlColorBtn'
,'TWMCtlColorDlg'
,'TWMCtlColorEdit'
,'TWMCtlColorListbox'
,'TWMCtlColorMsgbox'
,'TWMCtlColorScrollbar'
,'TWMCtlColorStatic'
,'TWMCut'
,'TWMDDE_Ack'
,'TWMDDE_Advise'
,'TWMDDE_Data'
,'TWMDDE_Execute'
,'TWMDDE_Initiate'
,'TWMDDE_Poke'
,'TWMDDE_Request'
,'TWMDDE_Terminate'
,'TWMDDE_Unadvise'
,'TWMDeadChar'
,'TWMDeleteItem'
,'TWMDestroy'
,'TWMDestroyClipboard'
,'TWMDevModeChange'
,'TWMDisplayChange'
,'TWMDrawClipboard'
,'TWMDrawItem'
,'TWMDropFiles'
,'TWMEnable'
,'TWMEndSession'
,'TWMEnterIdle'
,'TWMEnterMenuLoop'
,'TWMEraseBkgnd'
,'TWMExitMenuLoop'
,'TWMFontChange'
,'TWMGetDlgCode'
,'TWMGetFont'
,'TWMGetHotKey'
,'TWMGetIcon'
,'TWMGetMinMaxInfo'
,'TWMGetText'
,'TWMGetTextLength'
,'TWMHelp'
,'TWMHotKey'
,'TWMHScroll'
,'TWMHScrollClipboard'
,'TWMIconEraseBkgnd'
,'TWMInitDialog'
,'TWMInitMenu'
,'TWMInitMenuPopup'
,'TWMKey'
,'TWMKeyDown'
,'TWMKeyUp'
,'TWMKillFocus'
,'TWMLButtonDblClk'
,'TWMLButtonDown'
,'TWMLButtonUp'
,'TWMMButtonDblClk'
,'TWMMButtonDown'
,'TWMMButtonUp'
,'TWMMDIActivate'
,'TWMMDICascade'
,'TWMMDICreate'
,'TWMMDIDestroy'
,'TWMMDIGetActive'
,'TWMMDIIconArrange'
,'TWMMDIMaximize'
,'TWMMDINext'
,'TWMMDIRefreshMenu'
,'TWMMDIRestore'
,'TWMMDISetMenu'
,'TWMMDITile'
,'TWMMeasureItem'
,'TWMMenuChar'
,'TWMMenuSelect'
,'TWMMouse'
,'TWMMouseActivate'
,'TWMMouseMove'
,'TWMMouseWheel'
,'TWMMove'
,'TWMNCActivate'
,'TWMNCCalcSize'
,'TWMNCCreate'
,'TWMNCDestroy'
,'TWMNCHitMessage'
,'TWMNCHitTest'
,'TWMNCLButtonDblClk'
,'TWMNCLButtonDown'
,'TWMNCLButtonUp'
,'TWMNCMButtonDblClk'
,'TWMNCMButtonDown'
,'TWMNCMButtonUp'
,'TWMNCMouseMove'
,'TWMNCPaint'
,'TWMNCRButtonDblClk'
,'TWMNCRButtonDown'
,'TWMNCRButtonUp'
,'TWMNextDlgCtl'
,'TWMNoParams'
,'TWMNotify'
,'TWMNotifyFormat'
,'TWMPaint'
,'TWMPaintClipboard'
,'TWMPaintIcon'
,'TWMPaletteChanged'
,'TWMPaletteIsChanging'
,'TWMParentNotify'
,'TWMPaste'
,'TWMPower'
,'TWMQueryDragIcon'
,'TWMQueryEndSession'
,'TWMQueryNewPalette'
,'TWMQueryOpen'
,'TWMQueueSync'
,'TWMQuit'
,'TWMRButtonDblClk'
,'TWMRButtonDown'
,'TWMRButtonUp'
,'TWMRenderAllFormats'
,'TWMRenderFormat'
,'TWMScroll'
,'TWMSetCursor'
,'TWMSetFocus'
,'TWMSetFont'
,'TWMSetHotKey'
,'TWMSetIcon'
,'TWMSetRedraw'
,'TWMSetText'
,'TWMSettingChange'
,'TWMShowWindow'
,'TWMSize'
,'TWMSizeClipboard'
,'TWMSpoolerStatus'
,'TWMStyleChange'
,'TWMStyleChanged'
,'TWMStyleChanging'
,'TWMSysChar'
,'TWMSysColorChange'
,'TWMSysCommand'
,'TWMSysDeadChar'
,'TWMSysKeyDown'
,'TWMSysKeyUp'
,'TWMSystemError'
,'TWMTimeChange'
,'TWMTimer'
,'TWMUndo'
,'TWMVKeyToItem'
,'TWMVScroll'
,'TWMVScrollClipboard'
,'TWMWindowPosChanged'
,'TWMWindowPosChanging'
,'TWMWindowPosMsg'
,'TWMWinIniChange'
);

procedure __UnregisterProcs;
var i : integer;
begin
__RegisteredMethods.Free;
end;

procedure _mreg_0;
begin
__RegisteredMethods.Add(RegisterRWProc(MethodNames[0],Addr(_TMessage_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[1],Addr(_TMSHMouseWheel_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[2],Addr(_TWMActivate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[3],Addr(_TWMActivateApp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[4],Addr(_TWMAskCBFormatName_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[5],Addr(_TWMCancelMode_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[6],Addr(_TWMChangeCBChain_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[7],Addr(_TWMChar_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[8],Addr(_TWMCharToItem_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[9],Addr(_TWMChildActivate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[10],Addr(_TWMChooseFont_GetLogFont_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[11],Addr(_TWMClear_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[12],Addr(_TWMClose_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[13],Addr(_TWMCommand_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[14],Addr(_TWMCompacting_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[15],Addr(_TWMCompareItem_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[16],Addr(_TWMCopy_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[17],Addr(_TWMCopyData_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[18],Addr(_TWMCreate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[19],Addr(_TWMCtlColor_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[20],Addr(_TWMCtlColorBtn_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[21],Addr(_TWMCtlColorDlg_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[22],Addr(_TWMCtlColorEdit_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[23],Addr(_TWMCtlColorListbox_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[24],Addr(_TWMCtlColorMsgbox_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[25],Addr(_TWMCtlColorScrollbar_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[26],Addr(_TWMCtlColorStatic_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[27],Addr(_TWMCut_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[28],Addr(_TWMDDE_Ack_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[29],Addr(_TWMDDE_Advise_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[30],Addr(_TWMDDE_Data_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[31],Addr(_TWMDDE_Execute_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[32],Addr(_TWMDDE_Initiate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[33],Addr(_TWMDDE_Poke_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[34],Addr(_TWMDDE_Request_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[35],Addr(_TWMDDE_Terminate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[36],Addr(_TWMDDE_Unadvise_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[37],Addr(_TWMDeadChar_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[38],Addr(_TWMDeleteItem_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[39],Addr(_TWMDestroy_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[40],Addr(_TWMDestroyClipboard_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[41],Addr(_TWMDevModeChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[42],Addr(_TWMDisplayChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[43],Addr(_TWMDrawClipboard_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[44],Addr(_TWMDrawItem_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[45],Addr(_TWMDropFiles_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[46],Addr(_TWMEnable_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[47],Addr(_TWMEndSession_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[48],Addr(_TWMEnterIdle_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[49],Addr(_TWMEnterMenuLoop_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[50],Addr(_TWMEraseBkgnd_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[51],Addr(_TWMExitMenuLoop_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[52],Addr(_TWMFontChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[53],Addr(_TWMGetDlgCode_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[54],Addr(_TWMGetFont_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[55],Addr(_TWMGetHotKey_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[56],Addr(_TWMGetIcon_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[57],Addr(_TWMGetMinMaxInfo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[58],Addr(_TWMGetText_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[59],Addr(_TWMGetTextLength_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[60],Addr(_TWMHelp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[61],Addr(_TWMHotKey_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[62],Addr(_TWMHScroll_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[63],Addr(_TWMHScrollClipboard_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[64],Addr(_TWMIconEraseBkgnd_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[65],Addr(_TWMInitDialog_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[66],Addr(_TWMInitMenu_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[67],Addr(_TWMInitMenuPopup_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[68],Addr(_TWMKey_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[69],Addr(_TWMKeyDown_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[70],Addr(_TWMKeyUp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[71],Addr(_TWMKillFocus_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[72],Addr(_TWMLButtonDblClk_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[73],Addr(_TWMLButtonDown_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[74],Addr(_TWMLButtonUp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[75],Addr(_TWMMButtonDblClk_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[76],Addr(_TWMMButtonDown_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[77],Addr(_TWMMButtonUp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[78],Addr(_TWMMDIActivate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[79],Addr(_TWMMDICascade_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[80],Addr(_TWMMDICreate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[81],Addr(_TWMMDIDestroy_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[82],Addr(_TWMMDIGetActive_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[83],Addr(_TWMMDIIconArrange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[84],Addr(_TWMMDIMaximize_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[85],Addr(_TWMMDINext_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[86],Addr(_TWMMDIRefreshMenu_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[87],Addr(_TWMMDIRestore_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[88],Addr(_TWMMDISetMenu_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[89],Addr(_TWMMDITile_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[90],Addr(_TWMMeasureItem_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[91],Addr(_TWMMenuChar_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[92],Addr(_TWMMenuSelect_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[93],Addr(_TWMMouse_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[94],Addr(_TWMMouseActivate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[95],Addr(_TWMMouseMove_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[96],Addr(_TWMMouseWheel_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[97],Addr(_TWMMove_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[98],Addr(_TWMNCActivate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[99],Addr(_TWMNCCalcSize_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[100],Addr(_TWMNCCreate_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[101],Addr(_TWMNCDestroy_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[102],Addr(_TWMNCHitMessage_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[103],Addr(_TWMNCHitTest_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[104],Addr(_TWMNCLButtonDblClk_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[105],Addr(_TWMNCLButtonDown_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[106],Addr(_TWMNCLButtonUp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[107],Addr(_TWMNCMButtonDblClk_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[108],Addr(_TWMNCMButtonDown_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[109],Addr(_TWMNCMButtonUp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[110],Addr(_TWMNCMouseMove_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[111],Addr(_TWMNCPaint_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[112],Addr(_TWMNCRButtonDblClk_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[113],Addr(_TWMNCRButtonDown_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[114],Addr(_TWMNCRButtonUp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[115],Addr(_TWMNextDlgCtl_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[116],Addr(_TWMNoParams_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[117],Addr(_TWMNotify_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[118],Addr(_TWMNotifyFormat_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[119],Addr(_TWMPaint_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[120],Addr(_TWMPaintClipboard_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[121],Addr(_TWMPaintIcon_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[122],Addr(_TWMPaletteChanged_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[123],Addr(_TWMPaletteIsChanging_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[124],Addr(_TWMParentNotify_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[125],Addr(_TWMPaste_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[126],Addr(_TWMPower_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[127],Addr(_TWMQueryDragIcon_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[128],Addr(_TWMQueryEndSession_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[129],Addr(_TWMQueryNewPalette_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[130],Addr(_TWMQueryOpen_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[131],Addr(_TWMQueueSync_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[132],Addr(_TWMQuit_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[133],Addr(_TWMRButtonDblClk_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[134],Addr(_TWMRButtonDown_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[135],Addr(_TWMRButtonUp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[136],Addr(_TWMRenderAllFormats_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[137],Addr(_TWMRenderFormat_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[138],Addr(_TWMScroll_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[139],Addr(_TWMSetCursor_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[140],Addr(_TWMSetFocus_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[141],Addr(_TWMSetFont_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[142],Addr(_TWMSetHotKey_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[143],Addr(_TWMSetIcon_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[144],Addr(_TWMSetRedraw_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[145],Addr(_TWMSetText_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[146],Addr(_TWMSettingChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[147],Addr(_TWMShowWindow_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[148],Addr(_TWMSize_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[149],Addr(_TWMSizeClipboard_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[150],Addr(_TWMSpoolerStatus_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[151],Addr(_TWMStyleChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[152],Addr(_TWMStyleChanged_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[153],Addr(_TWMStyleChanging_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[154],Addr(_TWMSysChar_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[155],Addr(_TWMSysColorChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[156],Addr(_TWMSysCommand_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[157],Addr(_TWMSysDeadChar_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[158],Addr(_TWMSysKeyDown_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[159],Addr(_TWMSysKeyUp_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[160],Addr(_TWMSystemError_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[161],Addr(_TWMTimeChange_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[162],Addr(_TWMTimer_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[163],Addr(_TWMUndo_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[164],Addr(_TWMVKeyToItem_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[165],Addr(_TWMVScroll_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[166],Addr(_TWMVScrollClipboard_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[167],Addr(_TWMWindowPosChanged_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[168],Addr(_TWMWindowPosChanging_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[169],Addr(_TWMWindowPosMsg_)));
__RegisteredMethods.Add(RegisterRWProc(MethodNames[170],Addr(_TWMWinIniChange_)));
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
