unit ps4_libSceLoginService;

{$mode ObjFPC}{$H+}

interface


uses
  ps4_program,
  Classes,
  SysUtils;

implementation

function ps4_sceLoginServiceInitialize():Integer; SysV_ABI_CDecl;
begin
 Result:=0;
end;

function Load_libSceLoginService(Const name:RawByteString):TElf_node;
var
 lib:PLIBRARY;
begin
 Result:=TElf_node.Create;
 Result.pFileName:=name;
 lib:=Result._add_lib('libSceLoginService');
 lib^.set_proc($4FDFCDB921C0BDC4,@ps4_sceLoginServiceInitialize);
end;

initialization
 ps4_app.RegistredPreLoad('libSceLoginService.prx',@Load_libSceLoginService);

end.

