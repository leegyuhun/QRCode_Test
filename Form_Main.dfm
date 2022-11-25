object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    635
    299)
  PixelsPerInch = 96
  TextHeight = 13
  object PaintBox1: TPaintBox
    Left = 384
    Top = 32
    Width = 230
    Height = 242
    Anchors = [akLeft, akTop, akRight, akBottom]
    OnPaint = PaintBox1Paint
  end
  object edtCode: TCurvyEdit
    Left = 24
    Top = 32
    Width = 354
    Height = 24
    Rounding = 1
    TabOrder = 0
    TabStop = False
    Version = '1.2.2.2'
    Controls = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Dotum'
    Font.Style = []
    ImeName = ''
    IndentLeft = 3
    TextTop = 6
    ParentFont = False
    Text = '88012145785'
    OnChange = edtCodeChange
  end
  object edtQuietZone: TCurvyEdit
    Left = 344
    Top = 62
    Width = 34
    Height = 24
    Rounding = 1
    TabOrder = 1
    TabStop = False
    Version = '1.2.2.2'
    Controls = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Dotum'
    Font.Style = []
    ImeName = ''
    IndentLeft = 3
    TextTop = 6
    NumbersOnly = True
    ParentFont = False
    Text = '4'
    OnChange = edtQuietZoneChange
  end
end
