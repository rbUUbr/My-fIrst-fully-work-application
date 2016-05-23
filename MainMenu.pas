unit MainMenu;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, MPlayer;

type
  TMenu = class(TForm)
    lblStart: TLabel;
    imgHelp: TImage;
    lblHelp: TLabel;
    lblExit: TLabel;
    mpMenu: TMediaPlayer;
    procedure FormCreate(Sender: TObject);
    procedure troublesCreate;
    procedure cloudsCreate;
    procedure lblStartClick(Sender: TObject);
    procedure lblExitClick(Sender: TObject);
    procedure mpMenuNotify(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Menu: TMenu;

implementation

{$R *.dfm}
uses
   bass, MainFrame;
var
   check: Boolean;
procedure TMenu.cloudsCreate;
var
   i: Byte;
   skyArray: array of TImage;
begin
   SetLength(skyArray, 9);
   for i := 0 to Length(skyArray) - 1 do
   begin
      skyArray[i] := TImage.Create(Menu);
      skyArray[i].Parent := MainMenu.Menu;
      skyArray[i].Stretch := true;
      skyArray[i].Width := 81;
      skyArray[i].Height := 73;
      skyArray[i].Top := ClientHeight - 650;
      skyArray[i].Picture.LoadFromFile('Sky_Label.png');
      if (i = 0) then
         skyArray[i].Left := 40
      else
         skyArray[i].Left := skyArray[i - 1].Left + 160;
   end;
end;


procedure TMenu.FormCreate(Sender: TObject);
begin
   imgHelp.Top := MainMenu.Menu.Top + ClientHeight;
   troublesCreate;
   cloudsCreate;
   if not check then
   begin
   mpMenu.FileName := 'Menu.mp3';
   mpMenu.open;
   mpMenu.Play;
   end;
end;

procedure TMenu.troublesCreate;
var
   i: Byte;
   earthArray: array of TImage;
begin
   SetLength(earthArray, 6);
   for i := 0 to Length(earthArray) - 1 do
   begin
      earthArray[i] := TImage.Create(Menu);
      earthArray[i].Parent := MainMenu.Menu;
      earthArray[i].Stretch := true;
      earthArray[i].Width := 60;
      earthArray[i].Height := 170;
      earthArray[i].Top := ClientHeight - 170;
      earthArray[i].Picture.LoadFromFile('troubles.jpg');
      if (i = 0) then
         earthArray[i].Left := 20
      else
         earthArray[i].Left := earthArray[i - 1].Left + 250;
   end;

end;

procedure TMenu.lblStartClick(Sender: TObject);
begin
   Main.Show;
   MainMenu.Menu.hide;
   Main.imgBird.Visible := true;
   Main.tmrRender.Enabled := True;
   Main.imgBird.Top := 100;
   check := True;
end;

procedure TMenu.lblExitClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TMenu.mpMenuNotify(Sender: TObject);
begin

   mpMenu.FileName := 'Menu.mp3';
   mpMenu.open;
   mpMenu.Play;
   mpMenu.Wait := true;
   mpMenu.Notify := false;
end;

end.
