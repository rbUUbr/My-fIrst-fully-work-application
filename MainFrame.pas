unit MainFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, jpeg, pngimage, MPlayer;

type
  TMain = class(TForm)
    btnStart: TButton;
    tmrRender: TTimer;
    btnSpeed1: TButton;
    btnSpeed2: TButton;
    btnSpeed3: TButton;
    tmrBoom: TTimer;
    imgBoom: TImage;
    imgFirstSpeed: TImage;
    imgSecondSpeed: TImage;
    imgThirdSpeed: TImage;
    imgFourthSpeed: TImage;
    imgFifthSpeed: TImage;
    imgSixthSpeed: TImage;
    imgSeventhSpeed: TImage;
    imgEithSpeed: TImage;
    imgNinthSpeed: TImage;
    imgNullSpeed: TImage;
    btnNullSpeed: TButton;
    btnSpeed4: TButton;
    btnSpeed5: TButton;
    btnSpeed6: TButton;
    btnSpeed7: TButton;
    btnSpeed8: TButton;
    btnSpeed9: TButton;
    imgBird: TImage;
    lblPause: TLabel;
    lblSpeed: TLabel;
    lblContinue: TLabel;
    lblExit: TLabel;
    lblWin: TLabel;
    tmrReturn: TTimer;
    procedure btnStartClick(Sender: TObject);
    procedure Cloud;
    procedure Earth;
    procedure FormCreate(Sender: TObject);
    procedure tmrRenderTimer(Sender: TObject);
    procedure btnSpeed1Click(Sender: TObject);
    procedure btnSpeed2Click(Sender: TObject);
    procedure btnSpeed3Click(Sender: TObject);
    procedure earthMove;
    procedure save;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure loadPicture(pictureName: string);
    procedure tmrBoomTimer(Sender: TObject);
    function getBirdX: integer;
    procedure imgNullSpeedClick(Sender: TObject);
    procedure btnNullSpeedClick(Sender: TObject);
    procedure imgFirstSpeedClick(Sender: TObject);
    procedure imgSecondSpeedClick(Sender: TObject);
    procedure imgThirdSpeedClick(Sender: TObject);
    procedure btnSpeed4Click(Sender: TObject);
    procedure btnSpeed5Click(Sender: TObject);
    procedure btnSpeed6Click(Sender: TObject);
    procedure btnSpeed7Click(Sender: TObject);
    procedure btnSpeed8Click(Sender: TObject);
    procedure btnSpeed9Click(Sender: TObject);
    procedure imgFourthSpeedClick(Sender: TObject);
    procedure imgFifthSpeedClick(Sender: TObject);
    procedure imgSixthSpeedClick(Sender: TObject);
    procedure imgSeventhSpeedClick(Sender: TObject);
    procedure imgEithSpeedClick(Sender: TObject);
    procedure imgNinthSpeedClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblPauseClick(Sender: TObject);
    procedure lblContinueClick(Sender: TObject);
    procedure lblExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrReturnTimer(Sender: TObject);
  private
     coordinateX: integer;
     coordinateY: integer;
  public
    { Public declarations }
  end;

var
  Main: TMain;
  skyArray: array of TImage;
  earthArray: array of TImage;
  savePlace:TImage;
  checkUpdate: byte;
  birdX, birdY, troubleX, troubleY: Integer;
implementation

{$R *.dfm}
uses MainMenu;
procedure TMain.btnStartClick(Sender: TObject);
const
   NUMBER_OF_STARS = 100;
var
   i: integer;
begin
   coordinateX := 0;
   coordinateY := 50;
   tmrRenderTimer(sender);
   tmrRender.Enabled := true;
end;

procedure TMain.Cloud;
var
   i: Byte;
begin
   for i := 0 to Length(skyArray) - 1 do
   begin
      skyArray[i] := TImage.Create(Main);
      skyArray[i].Parent := Main;
      skyArray[i].Stretch := true;
      skyArray[i].Width := 81;
      skyArray[i].Height := 73;
      skyArray[i].Picture.LoadFromFile('Sky_Label.png');
      if (i = 0) then
         skyArray[i].Left := ClientWidth - 70
      else
         skyArray[i].Left := skyArray[i - 1].Left + 80;
      if (i mod 2 = 0) then
         skyArray[i].Top := 100;
      if (i mod  3 = 0) then
         skyArray[i].Top := 200;
      if (i mod  5 = 0) then
         skyArray[i].Top := 350;
   end;
end;


procedure TMain.FormCreate(Sender: TObject);
begin
   DoubleBuffered := true;
   Setlength(skyArray, 23);
   Setlength(earthArray, 6);
   Cloud;
   earth;
   save;
   Main.Color := clSkyBlue;
   checkUpdate := 0;
   imgBoom.Picture.LoadFromFile('Бах.png');
   tmrRenderTimer(sender);
   imgNullSpeed.Picture.LoadFromFile('0.png');
   imgFirstSpeed.Picture.LoadFromFile('1.png');
   imgSecondSpeed.Picture.LoadFromFile('2.png');
   imgThirdSpeed.Picture.LoadFromFile('3.png');
   imgFourthSpeed.Picture.LoadFromFile('4.png');
   imgFifthSpeed.Picture.LoadFromFile('5.png');
   imgSixthSpeed.Picture.LoadFromFile('6.png');
   imgSeventhSpeed.Picture.LoadFromFile('7.png');
   imgEithSpeed.Picture.LoadFromFile('8.png');
   imgNinthSpeed.Picture.LoadFromFile('9.png');

end;

procedure TMain.tmrRenderTimer(Sender: TObject);
var
   i, j: Byte;
begin
   if (imgBird.Top + imgBird.Height > Main.ClientHeight - 80 ) then
   begin
      lblWin.Caption := 'Вы победили! Вы успешно посадили птицу в безопасную зону!';
      lblWin.Visible := true;
      tmrRender.Enabled := false;
      tmrReturn.Enabled := true;
      lblWin.BringToFront;
   end;
   for i := 0 to Length(skyArray) - 1 do
   begin
      skyArray[i].Left := skyArray[i].Left - 5;
      if (skyArray[i].Left + skyArray[i].Width  < Main.Left) then
      begin
         skyArray[i].Left := ClientWidth - 50;
      end;
   end;
   for j := 0 to length(earthArray) - 1 do
   begin
      earthArray[j].Left := earthArray[j].Left - 5;
      if (earthArray[j].Left + earthArray[j].Width < Main.Left ) then
      begin
         earthArray[j].Left := ClientWidth - 100;
      end;
      if (imgBird.top + imgBird.Height >= earthArray[j].top ) and
         (imgBird.Left  <= earthArray[j].left)and
          (imgBird.Left + imgBird.Width >= earthArray[j].left)  then
      begin
         imgBoom.Visible := true;
         imgBoom.Left := imgBird.Left;
         imgBoom.Top := imgBird.Top;
         tmrRender.Enabled := false;
         tmrBoom.Enabled := true;
         imgBird.Visible := false;
         imgBird.Enabled := false;
         lblWin.Caption := 'Вы столкнулись с препятсвием! Попробуйте сыграть снова!';
         lblWin.Visible := true;
         lblWin.BringToFront;
         tmrReturn.Enabled := true;
      end;
   end;
end;

procedure TMain.btnSpeed1Click(Sender: TObject);
begin
   tmrRender.Interval := 100;
end;

procedure TMain.btnSpeed2Click(Sender: TObject);
begin
   tmrRender.Interval := 90;
end;

procedure TMain.btnSpeed3Click(Sender: TObject);
begin
   tmrRender.Interval := 80;
end;

procedure TMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case key of
   VK_UP:
      if (imgBird.Top > 0) then
         imgBird.Top := imgBird.Top - 10;
   VK_DOWN:
      if (imgBird.Top < Main.Height + Main.Top) then
         imgBird.Top := imgBird.Top + 10;

   end;
end;
procedure TMain.Earth;
var
   i: Byte;
begin
   for i := 0 to Length(earthArray) - 1 do
   begin
      earthArray[i] := TImage.Create(Main);
      earthArray[i].Parent := Main;
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
procedure TMain.earthMove;
var
   i: Byte;
begin

end;

procedure TMain.save;
var
   i: Byte;
begin
   savePlace := TImage.Create(Main);
   savePlace.Parent := Main;
   savePlace.Stretch := true;
   savePlace.Width := ClientWidth;
   savePlace.Height := 64;
   savePlace.Top := Main.Top + ClientHeight;
   savePlace.Picture.LoadFromFile('maxresdefault.jpg');
end;


procedure TMain.loadPicture(pictureName: string);
begin
   imgBoom.Picture.LoadFromFile(pictureName);
end;

procedure TMain.tmrBoomTimer(Sender: TObject);
var
   i: byte;
begin
   inc(checkUpdate);
   if (checkUpdate = 3) then
   begin
      checkUpdate := 3;
      loadPicture('Бум.png');
   end
   else
      tmrBoom.Enabled := true;
   if (checkUpdate = 6) then
   begin
      checkUpdate := 6;
      loadPicture('ЗатБах.png')
   end
   else
      tmrBoom.Enabled := true;
   if (checkUpdate = 9) then
   begin
      checkUpdate := 9;
      loadPicture('ЗатБум.png');
   end
   else
      tmrBoom.Enabled := true;
   if (checkUpdate = 12) then
   begin
      checkUpdate := 12;
      imgBoom.Picture := nil;
      tmrBoom.Enabled := false;
   end
   else
      tmrBoom.Enabled := true;
end;



function TMain.getBirdX: integer;
begin
   birdX := imgBird.Left;
   result := birdX;
end;

procedure TMain.imgNullSpeedClick(Sender: TObject);
begin
   btnNullSpeedClick(sender);
end;

procedure TMain.btnNullSpeedClick(Sender: TObject);
begin
   tmrRender.Interval := 110;
end;

procedure TMain.imgFirstSpeedClick(Sender: TObject);
begin
   btnSpeed1Click(sender);
end;

procedure TMain.imgSecondSpeedClick(Sender: TObject);
begin
   btnSpeed2click(Sender);
end;

procedure TMain.imgThirdSpeedClick(Sender: TObject);
begin
   btnSpeed3Click(sender);
end;

procedure TMain.btnSpeed4Click(Sender: TObject);
begin
   tmrRender.Interval := 70;
end;

procedure TMain.btnSpeed5Click(Sender: TObject);
begin
   tmrRender.Interval := 60;
end;

procedure TMain.btnSpeed6Click(Sender: TObject);
begin
   tmrRender.Interval := 50;
end;

procedure TMain.btnSpeed7Click(Sender: TObject);
begin
   tmrRender.Interval := 40;
end;

procedure TMain.btnSpeed8Click(Sender: TObject);
begin
   tmrRender.Interval := 30;
end;

procedure TMain.btnSpeed9Click(Sender: TObject);
begin
   tmrRender.Interval := 30;
end;

procedure TMain.imgFourthSpeedClick(Sender: TObject);
begin
   btnSpeed4click(Sender);
end;

procedure TMain.imgFifthSpeedClick(Sender: TObject);
begin
   btnSpeed5click(Sender);
end;

procedure TMain.imgSixthSpeedClick(Sender: TObject);
begin
   btnSpeed6click(Sender);
end;

procedure TMain.imgSeventhSpeedClick(Sender: TObject);
begin
   btnSpeed7click(Sender);
end;

procedure TMain.imgEithSpeedClick(Sender: TObject);
begin
   btnSpeed8click(Sender);
end;

procedure TMain.imgNinthSpeedClick(Sender: TObject);
begin
   btnSpeed9click(Sender);
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Application.Terminate;
end;

procedure TMain.lblPauseClick(Sender: TObject);
begin
   tmrRender.Enabled := False;
   lblExit.Visible := true;
   imgBird.Enabled := False;
   imgNullSpeed.Visible := true;
   imgFirstSpeed.Visible := true;
   imgSecondSpeed.Visible := true;
   imgThirdSpeed.Visible := true;
   imgFourthSpeed.Visible := true;
   imgFifthSpeed.Visible := true;
   imgSixthSpeed.Visible := true;
   imgSeventhSpeed.Visible := true;
   imgEithSpeed.Visible := true;
   imgNinthSpeed.Visible := true;
   lblPause.Visible := False;
   lblSpeed.Visible := true;
   lblContinue.Visible := true;
   lblExit.BringToFront;
   lblContinue.BringToFront;
   lblSpeed.BringToFront;
end;

procedure TMain.lblContinueClick(Sender: TObject);
begin
   tmrRender.Enabled := true;
   lblExit.Visible := False;
   imgBird.Enabled := true;
   imgNullSpeed.Visible := False;
   imgFirstSpeed.Visible := False;
   imgSecondSpeed.Visible := False;
   imgThirdSpeed.Visible := False;
   imgFourthSpeed.Visible := False;
   imgFifthSpeed.Visible := False;
   imgSixthSpeed.Visible := False;
   imgSeventhSpeed.Visible := False;
   imgEithSpeed.Visible := False;
   imgNinthSpeed.Visible := False;
   lblPause.Visible := true;
   lblSpeed.Visible := False;
   lblContinue.Visible := False;
end;

procedure TMain.lblExitClick(Sender: TObject);
begin
   MainMenu.Menu.Show;
   Main.hide;
end;

procedure TMain.FormShow(Sender: TObject);
begin
   tmrRender.Enabled := true;
   lblExit.Visible := false;
   lblSpeed.Visible := false;
   lblContinue.Visible := false;
   imgBird.Enabled := true;
   imgNullSpeed.Visible := False;
   imgFirstSpeed.Visible := False;
   imgSecondSpeed.Visible := False;
   imgThirdSpeed.Visible := False;
   imgFourthSpeed.Visible := False;
   imgFifthSpeed.Visible := False;
   imgSixthSpeed.Visible := False;
   imgSeventhSpeed.Visible := False;
   imgEithSpeed.Visible := False;
   imgNinthSpeed.Visible := False;
   lblPause.Visible := true;
end;

procedure TMain.tmrReturnTimer(Sender: TObject);
begin
   MainMenu.Menu.Show;
   MainMenu.Menu.Enabled := true;
   tmrRender.Enabled := false;
   lblWin.Visible := false;
   tmrReturn.Enabled := false;
end;

end.
