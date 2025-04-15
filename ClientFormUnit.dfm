object ClientForm: TClientForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Client GraphQL'
  ClientHeight = 314
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object LabelRequest: TLabel
    Left = 24
    Top = 32
    Width = 71
    Height = 25
    Caption = 'Request'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelRespons: TLabel
    Left = 240
    Top = 32
    Width = 74
    Height = 25
    Caption = 'Respons'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 7
    Top = 5
    Width = 46
    Height = 25
    Caption = 'URL: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelAfterParsing: TLabel
    Left = 224
    Top = 181
    Width = 117
    Height = 25
    Caption = 'After parsing'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ButtonSend: TButton
    Left = 0
    Top = 263
    Width = 185
    Height = 50
    Caption = 'Send'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = ButtonSendClick
  end
  object MemoRequest: TMemo
    Left = 0
    Top = 63
    Width = 185
    Height = 194
    Lines.Strings = (
      '')
    TabOrder = 1
  end
  object MemoResponse: TMemo
    Left = 191
    Top = 63
    Width = 185
    Height = 114
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 2
  end
  object EditServerURL: TEdit
    Left = 59
    Top = 2
    Width = 309
    Height = 33
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clGreen
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    Text = 'http://localhost:8080/graphql/'
  end
  object MemoAfterParsing: TMemo
    Left = 191
    Top = 216
    Width = 185
    Height = 97
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 4
  end
  object IdHTTP1: TIdHTTP
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = -1
    Request.ContentRangeStart = -1
    Request.ContentRangeInstanceLength = -1
    Request.Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Request.Ranges.Units = 'bytes'
    Request.Ranges = <>
    HTTPOptions = [hoForceEncodeParams]
    Left = 208
    Top = 248
  end
end
