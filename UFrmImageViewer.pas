unit UFrmImageViewer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFrmImageViewer = class(TForm)
    Image: TImage;
    BitBtnCansel: TBitBtn;
    PanelNavigation: TPanel;
    BtnRight: TButton;
    BtnLeft: TButton;
    procedure FormActivate(Sender: TObject);
    procedure BtnRightClick(Sender: TObject);
    procedure BtnLeftClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmImageViewer: TFrmImageViewer;
  PositionImage: SmallInt;

implementation

Uses UFrmMain;

{$R *.dfm}

procedure TFrmImageViewer.BtnLeftClick(Sender: TObject);
begin
  if PositionImage = 0 then
    PositionImage := FrmMain.JvImagesViewer.Count -1
  else
    Dec(PositionImage);
  Image.Picture.Assign(FrmMain.JvImagesViewer.Items[PositionImage].Picture);
end;

procedure TFrmImageViewer.BtnRightClick(Sender: TObject);
begin
  if PositionImage = FrmMain.JvImagesViewer.Count -1 then
    PositionImage := 0
  else
    inc(PositionImage);
  Image.Picture.Assign(FrmMain.JvImagesViewer.Items[PositionImage].Picture);
end;

procedure TFrmImageViewer.FormActivate(Sender: TObject);
begin
  FrmMain.mm.Lines.Add('TFrmImageViewer.FormActivate');
  PositionImage := FrmMain.JvImagesViewer.SelectedIndex;
  Image.Picture.Assign(FrmMain.JvImagesViewer.Items[PositionImage].Picture);
  //FrmMain.JvImagesViewer.Items[FrmMain.JvImagesViewer.SelectedIndex].FileName;
end;

procedure TFrmImageViewer.FormCreate(Sender: TObject);
begin
  PanelNavigation.Left  := (Width - PanelNavigation.Width) div 2;
  Constraints.MinWidth  := 450;
  Constraints.MinHeight := 400;
end;

end.
