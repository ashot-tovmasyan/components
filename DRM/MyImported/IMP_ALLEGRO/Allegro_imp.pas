unit Allegro_imp;

interface

uses
  AccTreeGrid_imp, dcntree_imp {я добавил для импорта событий DCTreeGrid-а},
  DBGridA_imp,
 // ibscript_imp,
  RefQuery_imp,
  AlgCtrls_imp,
  bal_imp;
  {При генерации import-файлов dcimporter-ом не включать птичку
   "добавлять регистрацию элементов"!
   Правда при этом не формируется список всех файлов,
   подлежащих импорту, но зато
   не происходит и вызовов UnregisterVars в файлах импорта,
   которые почему-то приводят к выходу списка за границы диапазона
   при завершении работы всего приложения}
implementation

end.
