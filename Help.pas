unit Help;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  THelpFrame = class(TForm)
    imgFirst: TImage;
    imgSecond: TImage;
    imgThird: TImage;
    imgFourth: TImage;
    lblHelp1: TLabel;
    lblHelp2: TLabel;
    lblHelp3: TLabel;
    lblHelp4: TLabel;
    lblGoToPrevious: TLabel;
    lblGoNext: TLabel;
    lblFirstText: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblGoNextClick(Sender: TObject);
    procedure lblGoToPreviousClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  HelpFrame: THelpFrame;

implementation
uses MainMenu;
{$R *.dfm}

procedure THelpFrame.FormCreate(Sender: TObject);
begin
   imgFirst.Picture.LoadFromFile('Help1.png');
   imgSecond.Picture.LoadFromFile('Help2.png');
   imgThird.Picture.LoadFromFile('Help3.png');
   imgFourth.Picture.LoadFromFile('Help4.png');
   Screen.Cursor := crNone;
end;

procedure THelpFrame.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   MainMenu.Menu.Close;
end;

procedure THelpFrame.lblGoNextClick(Sender: TObject);
const
   SECOND_HELP = '� ������ ������������ � ������������ ��� ��������� ��������� � �������(3). ����� �� ������ ������� ���� �����(Esc) ��� ����, ����� �������� �������� �������� �����������';
   FIRST_HELP = '� ������ ���������� ��� ���������� ��������� ������� ������ ����� ��� ������ ������ "������� �����" �"������� ����"(1).';
   SECOND_HALF_OF_FIRST = ' ��� ���������� �������� � �� ����� ����� �������, � ���� ������ ��� ��������� ��������� � ������(2) � �������� �������������� � ������� ����';
begin
   if imgFirst.Visible then
   begin
      imgThird.Visible := True;
      imgFourth.Visible := true;
      lblHelp3.Visible := true;
      lblHelp4.Visible := true;
      imgFIrst.Visible := false;
      imgSecond.Visible := false;
      lblHelp1.Visible := false;
      lblHelp2.Visible := false;
      lblGoNext.Caption := '����� � ����';
      lblGoToPrevious.Visible := true;
      lblGoToPrevious.Caption := '�����';
      lblFirstText.Visible := true;
      lblFirstText.Caption := SECOND_HELP;
   end
   else
   begin
      imgThird.Visible := false;
      imgFourth.Visible := false;
      lblHelp3.Visible := false;
      lblHelp4.Visible := false;
      imgFIrst.Visible := true;
      imgSecond.Visible := true;
      lblHelp1.Visible := true;
      lblHelp2.Visible := true;
      lblGoNext.Caption := '�����';
      lblGoToPrevious.Visible := true;
      lblGoToPrevious.Caption := '����� � ����';
      lblFirstText.Visible := true;
      lblFirstText.Caption := FIRST_HELP + SECOND_HALF_OF_FIRST;
      HelpFrame.hide;
      MainMenu.Menu.Show;
      lblGoNext.Caption := '�����';
   end;
end;

procedure THelpFrame.lblGoToPreviousClick(Sender: TObject);
const
   SECOND_HELP = '� ������ ������������ � ������������ ��� ��������� ��������� � �������(3). ����� �� ������ ������� ���� �����(Esc) ��� ����, ����� �������� �������� �������� �����������';
   FIRST_HELP = '� ������ ���������� ��� ���������� ��������� ������� ������ ����� ��� ������ ������ "������� �����" �"������� ����"(1).';
   SECOND_HALF_OF_FIRST = ' ��� ���������� �������� � �� ����� ����� �������, � ���� ������ ��� ��������� ��������� � ������(2) � �������� �������������� � ������� ����';
begin
   if imgFirst.Visible then
   begin
      HelpFrame.hide;
      MainMenu.Menu.Show;
   end
   else
   begin
      imgThird.Visible := false;
      imgFourth.Visible := false;
      lblHelp3.Visible := false;
      lblHelp4.Visible := false;
      imgFIrst.Visible := true;
      imgSecond.Visible := true;
      lblHelp1.Visible := true;
      lblHelp2.Visible := true;
      lblGoNext.Caption := '�����';
      lblGoToPrevious.Caption := '����� � ����';
      lblGoToPrevious.Visible := true;
      lblFirstText.Visible := true;
      lblFirstText.Caption := FIRST_HELP + SECOND_HALF_OF_FIRST;
   end;
end;

procedure THelpFrame.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_RIGHT: lblGoNextClick(sender);
      VK_Left: lblGoToPreviousClick(sender);
   end;
end;
end.
