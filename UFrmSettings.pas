unit UFrmSettings;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Themes, Vcl.ExtCtrls,
  Vcl.Buttons;

type
  TFrmSettings = class(TForm)
    GrBoxTheme: TGroupBox;
    CmBoxVclStyle: TComboBox;
    BBtnCancel: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure CmBoxVclStyleSelect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmSettings: TFrmSettings;

implementation

USES UFrmMain;

{$R *.dfm}

procedure TFrmSettings.CmBoxVclStyleSelect(Sender: TObject);
begin
  TStyleManager.SetStyle(CmBoxVclStyle.Text);
  SystemColorWindow := StyleServices.GetSystemColor(clWindow);
  FrmMain.JvImagesViewer.Color := SystemColorWindow;
end;

procedure TFrmSettings.FormCreate(Sender: TObject);
var
  StyleName: string;
begin
  for StyleName in TStyleManager.StyleNames do CmBoxVclStyle.Items.Add(StyleName);
end;

end.
