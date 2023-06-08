unit UFrmSelectWebPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.CheckLst,
  JvExCheckLst, JvCheckListBox, Vcl.Buttons;

type
  TFrmSelectWebPage = class(TForm)
    JvChListBoxWebPage: TJvCheckListBox;
    BBtnOk: TBitBtn;
    BBtnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure InitShowModal;
  end;

var
  FrmSelectWebPage: TFrmSelectWebPage;

implementation

USES UFrmMain;

{$R *.dfm}

{ TFrmSelectWebPage }

procedure TFrmSelectWebPage.InitShowModal;
begin
  JvChListBoxWebPage.Items.Text := FrmMain.DBMemoWebPage.Text;
  ShowModal;
end;

end.
