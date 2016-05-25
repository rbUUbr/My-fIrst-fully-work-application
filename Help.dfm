object HelpFrame: THelpFrame
  Left = 257
  Top = 163
  BorderStyle = bsNone
  Caption = 'HelpFrame'
  ClientHeight = 453
  ClientWidth = 912
  Color = clSkyBlue
  TransparentColorValue = clGreen
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object imgFirst: TImage
    Left = 48
    Top = 32
    Width = 505
    Height = 305
    Stretch = True
  end
  object imgSecond: TImage
    Left = 840
    Top = 32
    Width = 505
    Height = 305
    Stretch = True
  end
  object imgThird: TImage
    Left = 48
    Top = 32
    Width = 505
    Height = 337
    Stretch = True
    Visible = False
  end
  object imgFourth: TImage
    Left = 840
    Top = 32
    Width = 505
    Height = 337
    Stretch = True
    Visible = False
  end
  object lblHelp1: TLabel
    Left = 80
    Top = 56
    Width = 57
    Height = 57
    AutoSize = False
    Caption = '1'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -47
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
  end
  object lblHelp2: TLabel
    Left = 848
    Top = 40
    Width = 57
    Height = 57
    AutoSize = False
    Caption = '2'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -47
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
  end
  object lblHelp3: TLabel
    Left = 80
    Top = 48
    Width = 57
    Height = 57
    AutoSize = False
    Caption = '3'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -47
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lblHelp4: TLabel
    Left = 855
    Top = 40
    Width = 57
    Height = 57
    AutoSize = False
    Caption = '4'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -47
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object lblGoToPrevious: TLabel
    Left = 0
    Top = 568
    Width = 290
    Height = 55
    Caption = #1042#1099#1081#1090#1080' '#1074' '#1084#1077#1085#1102
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -47
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    OnClick = lblGoToPreviousClick
  end
  object lblGoNext: TLabel
    Left = 1200
    Top = 568
    Width = 135
    Height = 55
    Caption = #1044#1072#1083#1077#1077
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -47
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    WordWrap = True
    OnClick = lblGoNextClick
  end
  object lblFirstText: TLabel
    Left = 48
    Top = 368
    Width = 1297
    Height = 193
    AutoSize = False
    Caption = 
      #1042' '#1076#1072#1085#1085#1086#1084' '#1087#1088#1080#1083#1086#1078#1077#1085#1080#1080' '#1074#1072#1084' '#1085#1077#1086#1073#1093#1086#1076#1080#1084#1086' '#1091#1087#1088#1072#1074#1083#1103#1090#1100' '#1074#1099#1089#1086#1090#1086#1081' '#1087#1086#1083#1077#1090#1072' '#1087#1090#1080#1094 +
      #1099' '#1087#1088#1080' '#1087#1086#1084#1086#1097#1080' '#1082#1085#1086#1087#1086#1082' "'#1089#1090#1088#1077#1083#1082#1072' '#1074#1074#1077#1088#1093'" '#1080'"'#1089#1090#1088#1077#1083#1082#1072' '#1074#1085#1080#1079'"(1). '#1042#1072#1084' '#1085#1077#1086#1073 +
      #1093#1086#1076#1080#1084#1086' '#1087#1086#1089#1072#1076#1080#1090#1100' '#1077#1105' '#1085#1072' '#1079#1077#1084#1083#1102' '#1084#1077#1078#1076#1091' '#1090#1088#1091#1073#1072#1084#1080', '#1074' '#1101#1090#1086#1084' '#1089#1083#1091#1095#1072#1077' '#1074#1072#1084' '#1074#1099#1074 +
      #1077#1076#1077#1090#1089#1103' '#1089#1086#1086#1073#1097#1077#1085#1080#1077' '#1086' '#1087#1086#1073#1077#1076#1077'(2) '#1080' '#1074#1099#1073#1091#1076#1077#1090#1077' '#1087#1077#1088#1077#1085#1072#1087#1088#1072#1074#1083#1077#1085#1099' '#1074' '#1075#1083#1072#1074#1085#1086#1077 +
      ' '#1084#1077#1085#1102' '
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWhite
    Font.Height = -37
    Font.Name = 'Small Fonts'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
end
