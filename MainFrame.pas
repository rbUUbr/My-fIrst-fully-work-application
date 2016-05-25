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
    lblDot1: TLabel;
    lblDot2: TLabel;
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
    procedure FormKeyPress(Sender: TObject; var Key: Char);
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
   Screen.Cursor := crNone;
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
      Main.Enabled := False;
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
const
   BIRD_MOVE = 10;
   CONTINUE_POS = 24;
   EXIT_POS = 140;
begin
   case key of
   VK_UP:
      if not lblContinue.Visible then
      begin
      if (imgBird.Top > 0) then
         imgBird.Top := imgBird.Top - BIRD_MOVE;
      end
        else
      begin
         imgBird.Top := imgBird.Top;
         if (lblDot1.Top = CONTINUE_POS) then
         begin
            lblDot1.Top := EXIT_POS;
            lblDot2.top := EXIT_POS;
         end
         else
         begin
            lblDot1.Top := CONTINUE_POS;
            lblDot2.top := CONTINUE_POS;
         end;
      end;
   VK_DOWN:
      if not lblContinue.Visible then
      begin
      if (imgBird.Top < Main.Height + Main.Top) then
         imgBird.Top := imgBird.Top + BIRD_MOVE;
      end
      else
      begin
         imgBird.Top := imgBird.Top;
         if (lblDot1.Top = CONTINUE_POS) then
         begin
            lblDot1.Top := EXIT_POS;
            lblDot2.top := EXIT_POS;
         end
         else
         begin
            lblDot1.Top := CONTINUE_POS;
            lblDot2.top := CONTINUE_POS;
         end;
      end;
   VK_RETURN: begin
                 if not tmrReturn.Enabled then
                    case lblDot1.Top of
                       CONTINUE_POS: lblContinueClick(sender);
                       EXIT_POS: lblExitClick(sender);
                    end;
              end;
   end;
end;
procedure TMain.Earth;
const
   WIDTH = 60;
   HEIGHT = 170;
   BIAS = 250;
   STARTER_POSITION = 20;
var
   i: Byte;
begin
   for i := 0 to Length(earthArray) - 1 do
   begin
      earthArray[i] := TImage.Create(Main);
      earthArray[i].Parent := Main;
      earthArray[i].Stretch := true;
      earthArray[i].Width := WIDTH;
      earthArray[i].Height := HEIGHT;
      earthArray[i].Top := ClientHeight - HEIGHT;
      earthArray[i].Picture.LoadFromFile('troubles.jpg');
      if (i = 0) then
         earthArray[i].Left := STARTER_POSITION
      else
         earthArray[i].Left := earthArray[i - 1].Left + BIAS;
   end;

end;
procedure TMain.earthMove;
var
   i: Byte;
begin

end;

procedure TMain.save;
const
   HEIGHT = 64;
   SAVE_PICTURE_NAME = 'maxresdefault.jpg';
begin
   savePlace := TImage.Create(Main);
   savePlace.Parent := Main;
   savePlace.Stretch := true;
   savePlace.Width := ClientWidth;
   savePlace.Height := HEIGHT;
   savePlace.Top := Main.Top + ClientHeight;;
   savePlace.Picture.LoadFromFile(SAVE_PICTURE_NAME);
end;


procedure TMain.loadPicture(pictureName: string);
begin
   imgBoom.Picture.LoadFromFile(pictureName);
end;

procedure TMain.tmrBoomTimer(Sender: TObject);

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
      checkUpdate := 0;
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
   lblDot1.Visible := true;
   lblDot2.Visible := true;
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
const
   TOP_POSITION = 24;
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
   lblDot1.Visible := false;
   lblDot2.Visible := false;
   lblDot1.Top := TOP_POSITION;
   lblDot2.Top := TOP_POSITION;
end;

procedure TMain.lblExitClick(Sender: TObject);
const
   TOP_POSITION = 24;
begin
   MainMenu.Menu.Show;
   Main.hide;
   lblDot1.Top := TOP_POSITION;
   lblDot2.top := TOP_POSITION;
end;

procedure TMain.FormShow(Sender: TObject);
begin
   tmrRender.Enabled := true;
   lblExit.Visible := false;
   lblSpeed.Visible := false;
   lblContinue.Visible := false;
   imgBird.Enabled := true;
   lblWin.Visible := false;
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
   imgBoom.Picture.LoadFromFile('Бах.png');
   lblDot1.Visible := false;
   lblDot2.Visible := false;
end;

procedure TMain.tmrReturnTimer(Sender: TObject);
begin
   MainMenu.Menu.Show;
   tmrRender.Enabled := false;
   lblWin.Visible := false;
   tmrReturn.Enabled := false;
   Main.Enabled := false;
end;

procedure TMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
   case Key of
   '0':
      btnNullSpeedClick(sender);
   '1':
      btnSpeed1Click(Sender);
   '2':
      btnSpeed2Click(Sender);
   '3':
      btnSpeed3Click(Sender);
   '4':
      btnSpeed4Click(Sender);
   '5':
      btnSpeed5Click(Sender);
   '6':
      btnSpeed6Click(Sender);
   '7':
      btnSpeed7Click(Sender);
   '8':
      btnSpeed8Click(Sender);
   '9':
      btnSpeed9Click(Sender);
   #27: begin
           if tmrReturn.Enabled then
           begin
              MainMenu.Menu.Show;
              Main.Hide;
              tmrReturn.Enabled := false;
              imgBoom.Visible := False;
           end;
           if not lblContinue.Visible then
              lblPauseClick(sender)
           else
              lblContinueClick(sender);
        end;
   end;
end;
end.
