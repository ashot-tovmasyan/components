//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop
USERES("thrddemo_c3.res");
USEFORMNS("Unit2.pas", Unit2, Form1);
USEFORMNS("ThSort.pas", Thsort, ThreadSortForm);
USEUNIT("SortThds.pas");
//---------------------------------------------------------------------------
WINAPI WinMain(HINSTANCE, HINSTANCE, LPSTR, int)
{
        try
        {
                 Application->Initialize();
                 Application->CreateForm(__classid(TThreadSortForm), &ThreadSortForm);
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
