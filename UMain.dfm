object CSDL: TCSDL
  Left = 390
  Top = 110
  Caption = 'CSDL23103083_Nguyen_Dinh_Trung'
  ClientHeight = 490
  ClientWidth = 815
  Color = clWhite
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlue
  Font.Height = -17
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Splitter1: TSplitter
    Left = 0
    Top = 129
    Width = 815
    Height = 3
    Cursor = crVSplit
    Align = alTop
    Color = clDefault
    ParentColor = False
    ExplicitLeft = 1
    ExplicitTop = 208
    ExplicitWidth = 874
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 815
    Height = 129
    Align = alTop
    Caption = 'TopPanel'
    ShowCaption = False
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 281
      Top = 1
      Height = 127
      ExplicitLeft = 265
      ExplicitHeight = 207
    end
    object UinOut: TPanel
      Left = 1
      Top = 1
      Width = 280
      Height = 127
      Align = alLeft
      TabOrder = 0
      object UinP: TPanel
        Left = 1
        Top = 65
        Width = 278
        Height = 62
        Align = alTop
        TabOrder = 0
        object Uin: TLabel
          Left = 1
          Top = 1
          Width = 80
          Height = 60
          Align = alLeft
          AutoSize = False
          Caption = 'NH'#7852'P U: '
          ExplicitLeft = 0
        end
        object UinE: TMaskEdit
          Left = 81
          Top = 1
          Width = 196
          Height = 60
          Align = alClient
          BorderStyle = bsNone
          EditMask = '>lllllllllllllllll;1;_'
          MaxLength = 17
          TabOrder = 0
          Text = '                 '
          OnChange = UinEChange
        end
      end
      object UoutP: TPanel
        Left = 1
        Top = 1
        Width = 278
        Height = 64
        Align = alTop
        TabOrder = 1
        object Uout: TLabel
          Left = 1
          Top = 1
          Width = 80
          Height = 62
          Align = alLeft
          AutoSize = False
          Caption = 'U:'
          ExplicitLeft = 9
          ExplicitTop = 2
        end
        object UoutE: TMaskEdit
          Left = 81
          Top = 1
          Width = 196
          Height = 62
          TabStop = False
          Align = alClient
          BorderStyle = bsNone
          ParentColor = True
          TabOrder = 0
          Text = ''
        end
      end
    end
    object mFRelations: TMemo
      Left = 284
      Top = 1
      Width = 530
      Height = 127
      TabStop = False
      Align = alClient
      Lines.Strings = (
        'Memo1')
      ReadOnly = True
      TabOrder = 1
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 132
    Width = 815
    Height = 358
    Align = alClient
    Color = 10526884
    ParentBackground = False
    TabOrder = 1
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 813
      Height = 356
      ActivePage = Find_F
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabWidth = 75
      object Home: TTabSheet
        Caption = 'Home'
        object Splitter3: TSplitter
          Left = 276
          Top = 0
          Height = 322
          ExplicitLeft = 384
          ExplicitTop = 344
          ExplicitHeight = 100
        end
        object AddF: TPanel
          Left = 0
          Top = 0
          Width = 276
          Height = 322
          Align = alLeft
          TabOrder = 0
          object AddFY: TPanel
            Left = 1
            Top = 49
            Width = 274
            Height = 48
            Align = alTop
            TabOrder = 1
            object Ylabel: TLabel
              Left = 1
              Top = 1
              Width = 76
              Height = 46
              Align = alLeft
              AutoSize = False
              Caption = 'NH'#7852'P Y: '
              ExplicitLeft = -5
              ExplicitTop = 5
            end
            object Yinput: TMaskEdit
              Left = 77
              Top = 1
              Width = 196
              Height = 46
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              EditMask = '>lllllllllllllllll;1;_'
              MaxLength = 17
              TabOrder = 0
              Text = '                 '
              OnChange = UinEChange
              ExplicitHeight = 27
            end
          end
          object AddFX: TPanel
            Left = 1
            Top = 1
            Width = 274
            Height = 48
            Align = alTop
            TabOrder = 0
            object Xlabel: TLabel
              Left = 1
              Top = 1
              Width = 76
              Height = 46
              Align = alLeft
              AutoSize = False
              Caption = 'NH'#7852'P X: '
              ExplicitTop = -3
            end
            object Xinput: TMaskEdit
              Left = 77
              Top = 1
              Width = 196
              Height = 46
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              EditMask = '>lllllllllllllllll;1;_'
              MaxLength = 17
              TabOrder = 0
              Text = '                 '
              OnChange = UinEChange
              ExplicitHeight = 27
            end
          end
          object SubmitF: TButton
            Left = 1
            Top = 97
            Width = 274
            Height = 40
            Align = alTop
            Caption = 'Nh'#7853'p F'
            TabOrder = 2
            OnClick = SubmitFClick
          end
          object ImportFromFile: TButton
            Left = 1
            Top = 137
            Width = 274
            Height = 40
            Align = alTop
            Caption = 'Nh'#7853'p t'#7915' File'
            TabOrder = 3
            OnClick = ImportFromFileClick
          end
        end
        object XPlusPanel: TPanel
          Left = 279
          Top = 0
          Width = 526
          Height = 322
          Align = alClient
          TabOrder = 1
          object CalcXPlusP: TPanel
            Left = 1
            Top = 1
            Width = 524
            Height = 41
            Align = alTop
            TabOrder = 0
            object Label1: TLabel
              Left = 1
              Top = 1
              Width = 69
              Height = 39
              Align = alLeft
              Caption = 'T'#205'NH X+:'
              Layout = tlCenter
              ExplicitHeight = 19
            end
            object XplusE: TMaskEdit
              Left = 87
              Top = 8
              Width = 120
              Height = 27
              EditMask = '>lllllllllllllllll;1;_'
              MaxLength = 17
              TabOrder = 0
              Text = '                 '
              TextHint = 'Nh'#7853'p X+'
            end
            object CalcXplusBut: TButton
              Left = 213
              Top = 8
              Width = 75
              Height = 25
              Caption = 'Calc'
              TabOrder = 1
              OnClick = CalcXplusButClick
            end
            object XplusOut: TEdit
              Left = 320
              Top = 8
              Width = 121
              Height = 27
              TabStop = False
              ReadOnly = True
              TabOrder = 2
            end
          end
        end
      end
      object Key: TTabSheet
        Caption = 'Key'
        ImageIndex = 1
        object PanK1: TPanel
          Left = 0
          Top = 0
          Width = 805
          Height = 41
          Align = alTop
          TabOrder = 0
          object K1: TLabel
            Left = 1
            Top = 1
            Width = 81
            Height = 39
            Align = alLeft
            AutoSize = False
            Caption = 'T'#205'NH K1:'
            Layout = tlCenter
          end
          object CalcK1But: TButton
            Left = 103
            Top = 10
            Width = 75
            Height = 25
            Caption = 'Calc'
            TabOrder = 0
            OnClick = CalcK1ButClick
          end
          object K1OutPut: TEdit
            Left = 184
            Top = 8
            Width = 569
            Height = 27
            TabStop = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object KSPan: TPanel
          Left = 0
          Top = 41
          Width = 805
          Height = 41
          Align = alTop
          TabOrder = 1
          object Label2: TLabel
            Left = 1
            Top = 1
            Width = 81
            Height = 39
            Align = alLeft
            AutoSize = False
            Caption = 'T'#205'NH KS1: '
            Layout = tlCenter
            ExplicitHeight = 19
          end
          object CalcKS: TButton
            Left = 103
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Calc'
            TabOrder = 0
            OnClick = CalcKSClick
          end
          object KS1OutE: TEdit
            Left = 184
            Top = 6
            Width = 569
            Height = 27
            TabStop = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object K2Pan: TPanel
          Left = 0
          Top = 82
          Width = 805
          Height = 41
          Align = alTop
          TabOrder = 2
          object Label3: TLabel
            Left = 1
            Top = 1
            Width = 81
            Height = 39
            Align = alLeft
            AutoSize = False
            Caption = 'T'#205'NH K2:'
            Layout = tlCenter
          end
          object CalcK2But: TButton
            Left = 103
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Calc'
            TabOrder = 0
            OnClick = CalcK2ButClick
          end
          object K2Output: TEdit
            Left = 184
            Top = 6
            Width = 569
            Height = 27
            TabStop = False
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      object Find_F: TTabSheet
        Caption = 'Find_F'
        ImageIndex = 2
        object Panel1: TPanel
          Left = 0
          Top = 82
          Width = 805
          Height = 41
          Align = alTop
          TabOrder = 0
          object CalcF3But: TButton
            Left = 1
            Top = 1
            Width = 75
            Height = 39
            Align = alLeft
            Caption = 'T'#205'NH F3'
            TabOrder = 0
            OnClick = CalcF3ButClick
          end
          object F3Out: TEdit
            Left = 76
            Top = 1
            Width = 728
            Height = 39
            Align = alClient
            ReadOnly = True
            TabOrder = 1
            ExplicitHeight = 27
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 805
          Height = 41
          Align = alTop
          TabOrder = 1
          object CalcF1But: TButton
            Left = 1
            Top = 1
            Width = 75
            Height = 39
            Align = alLeft
            Caption = 'T'#205'NH F1'
            TabOrder = 0
            OnClick = CalcF1ButClick
          end
          object F1Out: TEdit
            Left = 76
            Top = 1
            Width = 728
            Height = 39
            Align = alClient
            ReadOnly = True
            TabOrder = 1
            ExplicitHeight = 27
          end
        end
        object Panel3: TPanel
          Left = 0
          Top = 41
          Width = 805
          Height = 41
          Align = alTop
          TabOrder = 2
          object CalcF2But: TButton
            Left = 1
            Top = 1
            Width = 75
            Height = 39
            Align = alLeft
            Caption = 'T'#205'NH F2'
            TabOrder = 0
            OnClick = CalcF2ButClick
          end
          object F2Out: TEdit
            Left = 76
            Top = 1
            Width = 728
            Height = 39
            Align = alClient
            ReadOnly = True
            TabOrder = 1
            ExplicitHeight = 27
          end
        end
      end
    end
  end
end
