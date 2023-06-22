Unit FileNameInc;

interface

Uses
  System.SysUtils;

function FileNameIncrement(FileName: String): string;

implementation

function FileNameIncrement(FileName: String): string;
var
  cnt  : Word;
  Name : String;
  ext  : String;
begin
  Name := FileName;
  ext  := ExtractFileExt(FileName);
  cnt  := 1;
  while FileExists(Name) do
  begin
    Name := ChangeFileExt(FileName, '(' + IntToStr(cnt) + ')' + ext);
    inc(cnt);
  end;
  Result := Name;
end;

end.
