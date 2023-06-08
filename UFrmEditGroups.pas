unit UFrmEditGroups;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  TFrmEditGroups = class(TForm)
    DBEditGroupName: TDBEdit;
    DBNavigator1: TDBNavigator;
    DBG: TDBGrid;
    LblEditGroupName: TLabel;
    FDTGroups: TFDTable;
    DSGroups: TDataSource;
    procedure FormCreate(Sender: TObject);
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

procedure TFrmEditGroups.FormCreate(Sender: TObject);
begin

  if FrmMain.FDConnection.Connected then
  begin
    FDTGroups.Connection := FrmMain.FDConnection;
    FDTGroups.TableName  := arTabNameStr[tnGroupsTable];
    FDTGroups.Active     := True;



  end;

end;

end.
