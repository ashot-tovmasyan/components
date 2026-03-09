//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("Project1_c3.res");
USEFORM("Unit1.cpp", Form1);
USEFORM("Unit2.cpp", DataModule2); /* TDataModule: DesignClass */
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
    try
    {
        Application->Initialize();
        Application->CreateForm(__classid(TDataModule2), &DataModule2);
                 Application->CreateForm(__classid(TForm1), &Form1);
                 Application->Run();
    }
    catch (Exception &exception)
    {
        Application->ShowException(&exception);
    }
    return 0;
}
//---------------------------------------------------------------------------
