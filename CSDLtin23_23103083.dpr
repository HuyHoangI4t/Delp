program CSDLtin23_23103083;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {CSDL};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCSDL, CSDL);
  Application.Run;
end.
