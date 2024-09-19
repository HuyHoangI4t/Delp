object CSDL: TCSDL
  Left = 0
  Top = 0
  Caption = 'CSDL'
  ClientHeight = 544
  ClientWidth = 874
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clBlue
  Font.Height = -17
  Font.Name = 'Times New Roman'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Splitter1: TSplitter
    Left = 0
    Top = 129
    Width = 874
    Height = 3
    Cursor = crVSplit
    Align = alTop
    ExplicitLeft = 1
    ExplicitTop = 208
  end
  object TopPanel: TPanel
    Left = 0
    Top = 0
    Width = 874
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
      ExplicitLeft = -2
      ExplicitTop = 0
      ExplicitHeight = 207
      object UinP: TPanel
        Left = 1
        Top = 64
        Width = 278
        Height = 62
        Align = alBottom
        TabOrder = 0
        ExplicitLeft = -1
        ExplicitTop = 144
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
          EditMask = '>lllllllllllllllll;1;_'
          MaxLength = 17
          TabOrder = 0
          Text = '                 '
          OnChange = UinEChange
          ExplicitLeft = 80
        end
      end
      object UoutP: TPanel
        Left = 1
        Top = 1
        Width = 278
        Height = 64
        Align = alTop
        TabOrder = 1
        ExplicitLeft = -1
        ExplicitTop = 0
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
      Width = 589
      Height = 127
      Align = alClient
      Lines.Strings = (
        'Memo1')
      ReadOnly = True
      TabOrder = 1
      ExplicitLeft = 285
      ExplicitTop = 0
      ExplicitHeight = 207
    end
  end
  object BottomPanel: TPanel
    Left = 0
    Top = 132
    Width = 874
    Height = 412
    Align = alClient
    TabOrder = 1
    ExplicitTop = 212
    ExplicitHeight = 332
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 872
      Height = 410
      ActivePage = Home
      Align = alClient
      MultiLine = True
      TabOrder = 0
      TabWidth = 100
      object Home: TTabSheet
        Caption = 'Home'
        ExplicitLeft = 8
        ExplicitTop = 24
        ExplicitHeight = 382
        object Splitter3: TSplitter
          Left = 276
          Top = 0
          Height = 376
          ExplicitLeft = 384
          ExplicitTop = 344
          ExplicitHeight = 100
        end
        object AddF: TPanel
          Left = 0
          Top = 0
          Width = 276
          Height = 376
          Align = alLeft
          TabOrder = 0
          ExplicitLeft = -3
          object AddFY: TPanel
            Left = 1
            Top = 49
            Width = 274
            Height = 48
            Align = alTop
            TabOrder = 0
            ExplicitLeft = -4
            ExplicitTop = 51
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
              EditMask = '>lllllllllllllllll;1;_'
              MaxLength = 17
              TabOrder = 0
              Text = '                 '
              OnChange = UinEChange
              ExplicitLeft = 76
              ExplicitTop = -4
            end
          end
          object AddFX: TPanel
            Left = 1
            Top = 1
            Width = 274
            Height = 48
            Align = alTop
            TabOrder = 1
            ExplicitLeft = -1
            ExplicitTop = -4
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
              EditMask = '>lllllllllllllllll;1;_'
              MaxLength = 17
              TabOrder = 0
              Text = '                 '
              OnChange = UinEChange
              ExplicitLeft = 76
              ExplicitTop = -3
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
            ExplicitLeft = -1
            ExplicitTop = 102
          end
        end
        object XPlusPanel: TPanel
          Left = 279
          Top = 0
          Width = 585
          Height = 376
          Align = alClient
          TabOrder = 1
          ExplicitLeft = 280
        end
      end
    end
  end
end
