program ShoppingBase;

uses
  Vcl.Forms,
  UFrmMain in 'UFrmMain.pas' {FrmMain},
  Vcl.Themes,
  Vcl.Styles,
  UFrmEditGroups in 'UFrmEditGroups.pas' {FrmEditGroups},
  UFrmSelectWebPage in 'UFrmSelectWebPage.pas' {FrmSelectWebPage},
  UFrmSettings in 'UFrmSettings.pas' {FrmSettings},
  UFrmImageViewer in 'UFrmImageViewer.pas' {FrmImageViewer},
  UFrmGitUpdate in 'UFrmGitUpdate.pas',
  DBTypes in 'DBTypes.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmEditGroups, FrmEditGroups);
  Application.CreateForm(TFrmSelectWebPage, FrmSelectWebPage);
  Application.CreateForm(TFrmSettings, FrmSettings);
  Application.CreateForm(TFrmImageViewer, FrmImageViewer);
  Application.CreateForm(TFrmGitUpdate, FrmGitUpdate);
  Application.Run;
end.
