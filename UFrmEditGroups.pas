unit UFrmEditGroups;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, DBTypes;

type
  TFrmEditGroups = class(TForm)
    DBEditGroupName: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBG: TDBGrid;
    LblEditGroupName: TLabel;
    FDTGroups: TFDTable;
    DSGroups: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmEditGroups: TFrmEditGroups;

implementation

USES UFrmMain;

{$R *.dfm}

procedure TFrmEditGroups.FormActivate(Sender: TObject);
begin
  FrmMain.mm.Lines.Add('TFrmEditGroups.FormActivate');
  if Not FrmMain.FDConnection.Connected then Exit;
  if Not FDTGroups.Active then FDTGroups.Open;
end;

procedure TFrmEditGroups.FormCreate(Sender: TObject);
begin
  FDTGroups.TableName  := arTabNameStr[tnGroupsTable];
end;

end.
