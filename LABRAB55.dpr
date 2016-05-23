program LABRAB55;

uses
  Forms,
  MainFrame in 'MainFrame.pas' {Main},
  MainMenu in 'MainMenu.pas' {Menu},
  Help in 'Help.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMenu, Menu);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
