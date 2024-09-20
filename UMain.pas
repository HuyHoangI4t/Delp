﻿unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Mask;

type
  TCSDL = class(TForm)
    Splitter1: TSplitter;
    TopPanel: TPanel;
    mFRelations: TMemo;
    UinOut: TPanel;
    Splitter2: TSplitter;
    BottomPanel: TPanel;
    PageControl1: TPageControl;
    Home: TTabSheet;
    UinP: TPanel;
    UoutP: TPanel;
    Uin: TLabel;
    Uout: TLabel;
    UinE: TMaskEdit;
    UoutE: TMaskEdit;
    AddF: TPanel;
    Splitter3: TSplitter;
    AddFY: TPanel;
    AddFX: TPanel;
    Xlabel: TLabel;
    Ylabel: TLabel;
    XPlusPanel: TPanel;
    Xinput: TMaskEdit;
    Yinput: TMaskEdit;
    SubmitF: TButton;
    CalcXPlusP: TPanel;
    Label1: TLabel;
    XplusE: TMaskEdit;
    CalcXplusBut: TButton;
    XplusOut: TEdit;
    Key: TTabSheet;
    PanK1: TPanel;
    K1: TLabel;
    CalcK1But: TButton;
    K1OutPut: TEdit;
    procedure UinEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SubmitFClick(Sender: TObject);
    procedure CalcXplusButClick(Sender: TObject);
    procedure CalcK1ButClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
type
  MGT=set of char;
  PTR=^Node;
  Node = Record
    VT:MGT;
    VP:MGT;
    Next:Ptr;
    Active:Boolean;
  End;
var
  CSDL: TCSDL;
  F:Ptr;
  tail:Ptr;
  U:MGT;

implementation

{$R *.dfm}

function STR2MGT(S:string):MGT;
var
  Mu:MGT;
  i:integer;
begin
  Mu:=[];
  for I := 1 to length(S) do
    if S[I]<>' ' then
      Mu:= Mu + [S[i]];

  result:=Mu;
end;

function MGT2STR(Mu:MGT):string;
var
  S:string;
  i:char;
begin
  S:='';
  for i in Mu do
    S:=S+i;
  result:=S;
end;

function getRelation(F:PTR):String;
var
  o:String;
  temp:PTR;
begin
  temp:=F;
  o:='F={';
  while (temp<>nil) do
    begin
      o:=' ' + o+MGT2STR(temp.VT)+'->'+MGT2STR(temp.VP)+';';
      temp:=temp.Next;
    end;

    o:=o+' }';
    result:=o;
end;
procedure appendNode(left:MGT; right:MGT);
var
  tp:Ptr;
begin
  new(tp);
  tp.VT := left;
  tp.VP := right;
  tp.Next := nil;
  tp.Active := true;

  if F=nil then
    begin
      F:=tp;
      tail:=tp;
    end
  else
    begin
      tail.Next:=tp;
      tail := tail.Next;
    end;
end;

procedure addRelation(left:string; right:string);
var
  lval:MGT;
  rval:MGT;
begin
  lval:=STR2MGT(left)*U;
  rval:=STR2MGT(right)*U;

  if (lval=[]) or (rval=[]) then
    exit();   //Early return
  appendNode(lval, rval);
end;

function deduplicate(S:string):string;
begin
  result:=MGT2STR(STR2MGT(s));
end;

function calcXplus(x:MGT):MGT;
var
KQ:MGT;
tp:PTR;
changed:Boolean;
begin
  KQ := x*u;
  changed := true;
  while (changed) and (KQ<>U) do
    begin
      tp := F;
      changed := false;
      while (tp<>nil) and (KQ<>U) do
        begin
          if tp.VP <= KQ then
            begin
              //Just do nothing
            end
          else if (tp.VT<=KQ) then
            begin
              KQ := KQ+tp.VP;
              changed := true;
            end;

          tp := tp.Next;
        end;
    end;

  result:=KQ;
end;

function isKey(k:MGT):Boolean;
var kq:MGT;
begin
  kq:=calcXplus(k);
  exit(kq=u);
end;

function calcK1(k:MGT):MGT;
var
  c:char;
begin
  for c in k do
    if isKey(k-[c]) then
      exit(calcK1(k-[c]));

  exit(k);
end;

procedure TCSDL.CalcK1ButClick(Sender: TObject);
begin
  K1OutPut.Text := MGT2STR(CalcK1(u))
end;

procedure TCSDL.CalcXplusButClick(Sender: TObject);
begin
  XplusOut.Text := MGT2STR(calcXplus(STR2MGT(XplusE.Text)));
end;

procedure TCSDL.FormShow(Sender: TObject);
begin
  mFRelations.Lines.Clear;
end;

procedure TCSDL.SubmitFClick(Sender: TObject);
begin
  addRelation(Xinput.Text, Yinput.Text);

  Xinput.Text := '';
  Yinput.Text := '';

  mFRelations.Lines.Clear;
  mFRelations.Lines.Add(getRelation(F));

  Xinput.SetFocus;
end;

procedure TCSDL.UinEChange(Sender: TObject);
var t:char;
begin
  U:=STR2MGT(UinE.Text);
  UoutE.Text := MGT2STR(U);
end;


end.
