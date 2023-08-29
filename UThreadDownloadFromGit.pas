unit UThreadDownloadFromGit;

interface

uses
  System.Classes, System.SysUtils, System.JSON, System.IOUtils, REST.Types, REST.Client,
  Vcl.Dialogs, FileNameInc;

type
  TRestFilesRec = Record
  FileLinkURL  : String;  //
  ContentType  : String;  //
  FileName     : String;  //
  FileSave     : String;  //
  RESTStatCode : Integer; //
End;
  PRestFilesRec = ^TRestFilesRec;

type
  ThreadReleasDownload = class(TThread)
  private
    RESTClient   : TRESTClient;
    RESTRequest  : TRESTRequest;
    RESTResponse : TRESTResponse;
    FPRestFiles  : PRestFilesRec;
    FDownLoadDir : string;
    FSaveFileName: string;
    FStusCode    : Integer;
  protected
    procedure Execute; override;
    procedure ResultOut;
  public
    constructor Create(DownLoadDir: string; P: PRestFilesRec; CreateSuspended: Boolean);
    destructor  Destroy;
  end;

implementation

USES UFrmMain, UFrmGitUpdate;

constructor ThreadReleasDownload.Create(DownLoadDir: string; P: PRestFilesRec; CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  RESTClient   := TRESTClient.Create(Nil);
  RESTRequest  := TRESTRequest.Create(Nil);
  RESTResponse := TRESTResponse.Create(Nil);
  RESTRequest.Client   := RESTClient;
  RESTRequest.Response := RESTResponse;
  RESTResponse.RootElement := '';
  FPRestFiles  := P;
  FDownLoadDir := IncludeTrailingPathDelimiter(DownLoadDir);
end;

destructor ThreadReleasDownload.Destroy;
begin
  inherited Destroy;
  RESTClient.Free;
  RESTRequest.Free;
  RESTResponse.Free;
end;

procedure ThreadReleasDownload.Execute;
begin

  if (FPRestFiles^.FileLinkURL = '') then Exit;

  RESTClient.BaseURL       := FPRestFiles^.FileLinkURL;
  RESTClient.Accept        := FPRestFiles^.ContentType;
  try
    RESTRequest.Execute;
  except
    //
  end;

  FStusCode := RESTResponse.StatusCode;
  if FStusCode = 200 then
  begin
    FSaveFileName := FDownLoadDir + FPRestFiles^.FileName;
    FSaveFileName := FileNameIncrement(FSaveFileName);
    TFile.WriteAllBytes(FSaveFileName, RESTResponse.RawBytes);
  end;
  Synchronize(ResultOut);
end;

procedure ThreadReleasDownload.ResultOut;
begin
  FPRestFiles^.FileSave     := FSaveFileName;
  FPRestFiles^.RESTStatCode := FStusCode;
end;

end.
