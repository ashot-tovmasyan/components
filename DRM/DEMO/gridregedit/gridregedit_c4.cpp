//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("gridregedit_c4.res");
USEFORMNS("EdDWUnit.pas", Eddwunit, EdDWordForm);
USEFORMNS("EdStrUnit.pas", Edstrunit, EdStrForm);
USEFORMNS("Unit1.pas", Unit1, Form1);
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TForm1), &Form1);
                 Application->CreateForm(__classid(TEdDWordForm), &EdDWordForm);
                 Application->CreateForm(__classid(TEdStrForm), &EdStrForm);
                 Application->Run();
        }
        catch (Exception &exception)
        {
                 Application->ShowException(&exception);
        }
        return 0;
}
//---------------------------------------------------------------------------
