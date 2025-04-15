unit ClientFormUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  IdHTTP, IdSSLOpenSSL, IdBaseComponent, System.JSON,
  IdSSL, IdComponent, IdTCPConnection, IdTCPClient;
  const
    STRING_QUERY='query { hello(name: "World") }';
    CONTENT_TYP_FOR_JSON='application/json';
type
  TClientForm  = class(TForm)
    ButtonSend: TButton;
    MemoRequest: TMemo;
    MemoResponse: TMemo;
    LabelRequest: TLabel;
    LabelRespons: TLabel;
    EditServerURL: TEdit;
    IdHTTP1: TIdHTTP;
    Label3: TLabel;
    MemoAfterParsing: TMemo;
    LabelAfterParsing: TLabel;
    procedure ButtonSendClick(Sender: TObject);
    function ParseJSON(const JSONString: string): string;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
 ClientForm: TClientForm;

implementation

{$R *.dfm}

procedure TClientForm.ButtonSendClick(Sender: TObject);
var
  LJSONRequest: TJSONObject;
  LResponse: string;
  LStream: TStringStream;
begin
  LJSONRequest := TJSONObject.Create;
  try
    LJSONRequest.AddPair('query', TJSONString.Create(STRING_QUERY));
    LStream := TStringStream.Create('');
    try
       LStream.WriteString(LJSONRequest.ToString);
      LStream.Position := 0;
      IdHTTP1.Request.ContentType :=CONTENT_TYP_FOR_JSON ;
      try
        LResponse := IdHTTP1.Post(EditServerURL.Text, LStream);
        MemoResponse.Text :=LResponse;
        MemoAfterParsing.Text  :=ParseJSON(LResponse);
        except
        on E : Exception do
        MemoResponse.Text := 'Error: ' + E.Message;
      end;
      MemoRequest.Text := LStream.DataString;
    finally
      LStream.Free;
    end;
  finally
    LJSONRequest.Free;
  end;
end;
function TClientForm.ParseJSON(const JSONString: string): string;
var
  JSONObject: TJSONObject;
  DataPair: TJSONPair;
  HelloPair: TJSONPair;
  HelloValue: string;
begin
  JSONObject := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(JSONString), 0) as TJSONObject;
  try
    if JSONObject <> nil then
    begin
      DataPair := JSONObject.Get('data');
      if DataPair <> nil then
      begin
        JSONObject := DataPair.JsonValue as TJSONObject;
        if JSONObject <> nil then
        begin
          HelloPair := JSONObject.Get('hello');
          if HelloPair <> nil then
          begin
            HelloValue := HelloPair.JsonValue.Value;
            Result:= HelloValue;
          end else begin
            ShowMessage('Pair "hello" not found');
          end;
        end else begin
          ShowMessage('Object "data" is not a JSON object');
        end;
      end else begin
        ShowMessage('Pair "data" not found');
      end;
    end else begin
      ShowMessage('Invalid JSON string');
    end;
  finally
    JSONObject.Free;
  end;
end;
end.

