unit MyShellAPI;

interface

uses ShellAPI;

const
  { ShowWindow() Commands }
  {$EXTERNALSYM SW_HIDE}
  SW_HIDE = 0;
  {$EXTERNALSYM SW_SHOWNORMAL}
  SW_SHOWNORMAL = 1;
  {$EXTERNALSYM SW_NORMAL}
  SW_NORMAL = 1;
  {$EXTERNALSYM SW_SHOWMINIMIZED}
  SW_SHOWMINIMIZED = 2;
  {$EXTERNALSYM SW_SHOWMAXIMIZED}
  SW_SHOWMAXIMIZED = 3;
  {$EXTERNALSYM SW_MAXIMIZE}
  SW_MAXIMIZE = 3;
  {$EXTERNALSYM SW_SHOWNOACTIVATE}
  SW_SHOWNOACTIVATE = 4;
  {$EXTERNALSYM SW_SHOW}
  SW_SHOW = 5;
  {$EXTERNALSYM SW_MINIMIZE}
  SW_MINIMIZE = 6;
  {$EXTERNALSYM SW_SHOWMINNOACTIVE}
  SW_SHOWMINNOACTIVE = 7;
  {$EXTERNALSYM SW_SHOWNA}
  SW_SHOWNA = 8;
  {$EXTERNALSYM SW_RESTORE}
  SW_RESTORE = 9;
  {$EXTERNALSYM SW_SHOWDEFAULT}
  SW_SHOWDEFAULT = 10;
  {$EXTERNALSYM SW_MAX}
  SW_MAX = 10;

  { The system cannot find the file specified. }
  ERROR_FILE_NOT_FOUND = 2;
  { The system cannot find the path specified. }
  ERROR_PATH_NOT_FOUND = 3;
  { An attempt was made to load a program with an incorrect format. }
  ERROR_BAD_FORMAT = 11;

  SE_ERR_FNF              = 2;       { file not found }
  {$EXTERNALSYM SE_ERR_PNF}
  SE_ERR_PNF              = 3;       { path not found }
  {$EXTERNALSYM SE_ERR_ACCESSDENIED}
  SE_ERR_ACCESSDENIED     = 5;       { access denied }
  {$EXTERNALSYM SE_ERR_OOM}
  SE_ERR_OOM              = 8;       { out of memory }
  {$EXTERNALSYM SE_ERR_DLLNOTFOUND}
  SE_ERR_DLLNOTFOUND      = 32;
{ error values for ShellExecute() beyond the regular WinExec() codes }
  {$EXTERNALSYM SE_ERR_SHARE}
  SE_ERR_SHARE                    = 26;
  {$EXTERNALSYM SE_ERR_ASSOCINCOMPLETE}
  SE_ERR_ASSOCINCOMPLETE          = 27;
  {$EXTERNALSYM SE_ERR_DDETIMEOUT}
  SE_ERR_DDETIMEOUT               = 28;
  {$EXTERNALSYM SE_ERR_DDEFAIL}
  SE_ERR_DDEFAIL                  = 29;
  {$EXTERNALSYM SE_ERR_DDEBUSY}
  SE_ERR_DDEBUSY                  = 30;
  {$EXTERNALSYM SE_ERR_NOASSOC}
  SE_ERR_NOASSOC                  = 31;

function ExecuteFile(const Operation, FileName, Parameters,
  Directory: string; ShowCmd: Integer): integer;

implementation

function ExecuteFile(const Operation, FileName, Parameters,
  Directory: string; ShowCmd: Integer): integer;
begin
  Result := ShellExecute(0, PChar(Operation), PChar(FileName), PChar(Parameters), PChar(Directory), ShowCmd);
end;

end.
