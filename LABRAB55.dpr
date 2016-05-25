program LABRAB55;

uses
  Forms,
  MainFrame in 'MainFrame.pas' {Main},
  MainMenu in 'MainMenu.pas' {Menu},
  Help in 'Help.pas' {HelpFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMenu, Menu);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(THelpFrame, HelpFrame);
  Application.Run;
end.
