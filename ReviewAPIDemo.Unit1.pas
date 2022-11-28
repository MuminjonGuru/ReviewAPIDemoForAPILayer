unit ReviewAPIDemo.Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo,
  REST.Types, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, REST.Response.Adapter,
  REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, System.Rtti,
  FMX.Grid.Style, FMX.Bind.Grid, System.Bindings.Outputs, FMX.Bind.Editors,
  Data.Bind.EngExt, FMX.Bind.DBEngExt, Data.Bind.Grid, FMX.Grid,
  Data.Bind.DBScope;

type
  TFormReviewAPI = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    RESTClient1: TRESTClient;
    RESTRequest1: TRESTRequest;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    FDMemTable1: TFDMemTable;
    BindSourceDB1: TBindSourceDB;
    StringGridBindSourceDB1: TStringGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    BindingList1: TBindingsList;
    StyleBook1: TStyleBook;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReviewAPI: TFormReviewAPI;

implementation

{$R *.fmx}

procedure TFormReviewAPI.Button1Click(Sender: TObject);
begin
  RESTClient1.ResetToDefaults;
  RESTClient1.Accept := 'application/json, text/plain; q=0.9, text/html;q=0.8,';
  RESTClient1.AcceptCharset := 'utf-8, *;q=0.8';
  RESTClient1.ContentType := 'application/json';
  RESTClient1.BaseURL :=
    'https://app.reviewapi.io/api/v1/reviews?apikey=71d1c3f0-6e2e-11ed-8aac-3d127315a101&url='
    + Edit1.Text + '&amount=10';    // provide the URL for scraping!


  RESTRequest1.ClearBody;
  RESTRequest1.Params.Clear;

  RESTRequest1.Execute;

  Memo1.Lines.Clear;
  Memo1.Lines.Add(RESTResponse1.Content);
end;

procedure TFormReviewAPI.FormCreate(Sender: TObject);
begin
  RESTRequest1.Execute;
end;

end.
