program QRCode_Test;

uses
  Vcl.Forms,
  Form_Main in 'Form_Main.pas' {Form3},
  DelphiZXIngQRCode in 'DelphiZXIngQRCode.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
