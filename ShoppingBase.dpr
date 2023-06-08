program ShoppingBase;

uses
  Vcl.Forms,
  UFrmMain in 'UFrmMain.pas' {FrmMain},
  Vcl.Themes,
  Vcl.Styles,
  UFrmEditGroups in 'UFrmEditGroups.pas' {FrmEditGroups},
  UFrmSelectWebPage in 'UFrmSelectWebPage.pas' {FrmSelectWebPage};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Iceberg Classico');
  Application.CreateForm(TFrmMain, FrmMain);
  Application.CreateForm(TFrmEditGroups, FrmEditGroups);
  Application.CreateForm(TFrmSelectWebPage, FrmSelectWebPage);
  Application.Run;
end.
