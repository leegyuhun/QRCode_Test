unit Form_Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DelphiZXingQRCode, CurvyControls,
  Vcl.ExtCtrls;

type
  TForm3 = class(TForm)
    PaintBox1: TPaintBox;
    edtCode: TCurvyEdit;
    edtQuietZone: TCurvyEdit;
    procedure PaintBox1Paint(Sender: TObject);
    procedure edtCodeChange(Sender: TObject);
    procedure edtQuietZoneChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    QRCodeBitmap: TBitmap;
    procedure Update;
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

{ TForm3 }

procedure TForm3.edtCodeChange(Sender: TObject);
begin
  if edtCode.Text <> '' then
    Update;
end;

procedure TForm3.edtQuietZoneChange(Sender: TObject);
begin
  if edtCode.Text <> '' then
    Update;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
  QRCodeBitmap := TBitmap.Create;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  Update;
end;

procedure TForm3.PaintBox1Paint(Sender: TObject);
var
  Scale: Double;
begin
  PaintBox1.Canvas.Brush.Color := clWhite;
  PaintBox1.Canvas.FillRect(Rect(0, 0, PaintBox1.Width, PaintBox1.Height));
  if ((QRCodeBitmap.Width > 0) and (QRCodeBitmap.Height > 0)) then
  begin
    if (PaintBox1.Width < PaintBox1.Height) then
    begin
      Scale := PaintBox1.Width / QRCodeBitmap.Width;
    end else
    begin
      Scale := PaintBox1.Height / QRCodeBitmap.Height;
    end;
    PaintBox1.Canvas.StretchDraw(Rect(0, 0, Trunc(Scale * QRCodeBitmap.Width), Trunc(Scale * QRCodeBitmap.Height)), QRCodeBitmap);
  end;
end;

procedure TForm3.Update;
var
  QRcode: TDelphiZXingQRCode;
  Row, Col: Integer;
begin
  QRcode := TDelphiZXingQRCode.Create;
  try
    QRcode.Data := edtCode.Text;
    QRcode.Encoding := TQRCodeEncoding.qrAuto;
    QRcode.QuietZone := StrToIntDef(edtQuietZone.Text, 4);
    QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Col := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Col]) then
        begin
          QRCodeBitmap.Canvas.Pixels[Col, Row] := clBlack;
        end else
        begin
          QRCodeBitmap.Canvas.Pixels[Col, Row] := clWhite;
        end;
      end;
    end;
  finally
    QRcode.Free;
  end;
  PaintBox1.Repaint;
end;

end.
