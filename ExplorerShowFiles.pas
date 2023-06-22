Unit ExplorerShowFiles;

interface

uses
  System.SysUtils, System.Classes, Winapi.ShlObj;

procedure ShowFilesOnExplorer(const OpenDir : String; const STFileList : TStrings);

implementation

procedure ShowFilesOnExplorer(const OpenDir : String; const STFileList : TStrings);
var FileList : array of PItemIDList;
    pDir     : PItemIDList;
    ShowFile : String;
    I        : Cardinal;
begin
  if not Assigned(STFileList) or (OpenDir = '') then Exit;
  SetLength(FileList, STFileList.Count);
  for I := 0 to STFileList.count -1 do begin
    ShowFile := IncludeTrailingPathDelimiter(OpenDir) + STFileList.Strings[I];
    if not FileExists(ShowFile) then continue;
    FileList[I] := ILCreateFromPath(PWideChar(ShowFile));
  end;
  pDir := ILCreateFromPath(PWideChar(OpenDir));
  SHOpenFolderAndSelectItems(pDir, Length(FileList), PItemIDList(FileList), 0);
  for I := 0 to Length(FileList) -1 do begin
    if Assigned(FileList[I]) then
      ILFree(FileList[I]);
  end;
  ILFree(pDir);
end;

end.
