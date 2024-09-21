unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.StrUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Mask, System.Types;

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
    ImportFromFile: TButton;
    KSPan: TPanel;
    Label2: TLabel;
    CalcKS: TButton;
    KS1OutE: TEdit;
    K2Pan: TPanel;
    Label3: TLabel;
    CalcK2But: TButton;
    K2Output: TEdit;
    Find_F: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    CalcF1But: TButton;
    CalcF2But: TButton;
    CalcF3But: TButton;
    F1Out: TEdit;
    F2Out: TEdit;
    F3Out: TEdit;
    procedure UinEChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SubmitFClick(Sender: TObject);
    procedure CalcXplusButClick(Sender: TObject);
    procedure CalcK1ButClick(Sender: TObject);
    procedure ImportFromFileClick(Sender: TObject);
    procedure CalcKSClick(Sender: TObject);
    procedure CalcK2ButClick(Sender: TObject);
    procedure CalcF1ButClick(Sender: TObject);
    procedure CalcF2ButClick(Sender: TObject);
    procedure CalcF3ButClick(Sender: TObject);
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
  F1:Ptr;
  F2:Ptr;
  F3:Ptr;
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

function getRelation(F:PTR; rev:Boolean=false; relName:String='F'):String;
var
  o:String;
  buffer:String;
  temp:PTR;
begin
  temp:=F;
  while (temp<>nil) do
    begin
      buffer:=MGT2STR(temp.VT)+'→'+MGT2STR(temp.VP)+';  ';
      if rev then
        o:=o+buffer
      else
        o:=buffer+o;
      temp:=temp.Next;
    end;

    o:=relName+'={ '+o;
    o:=o+' }';
    result:=o;
end;
procedure appendNode(left:MGT; right:MGT; var l:PTR);
var
  tp:Ptr;
begin
  new(tp);
  tp.VT := left;
  tp.VP := right;
  tp.Next := nil;
  tp.Active := true;

  if l=nil then
    begin
      l:=tp;
    end
  else
    begin
      tp.Next:=l;
      l:=tp;
    end;
end;

procedure clearList(var l:ptr);
var
tp:Ptr;
begin
  tp:=l;

  while l<>nil do
  begin
    l:=l.Next;
    FreeMemory(tp);
    tp:=l;
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
  appendNode(lval, rval, f);
end;

function deduplicate(S:string):string;
begin
  result:=MGT2STR(STR2MGT(s));
end;

function calcXplus(x:MGT; l:PTR=nil):MGT;   //X+
var
KQ:MGT;
KQ2:MGT;
tp:PTR;

begin
  if l = nil then //Making default Value (this is suck af)
    l:=F;
  x := x*u;
  KQ := x;
  KQ2 := [];
  while KQ<>KQ2 do
    begin
      tp := l;

      KQ2:=KQ;
      while (tp<>nil) and (KQ<>U) do
        begin
          if not tp.Active then
          begin
             //Oh yea another fucking dummy code :/
          end
          else if tp.VT<=KQ then
            KQ:=KQ+tp.VP;

          tp:=tp.Next;
        end;
    end;

  result:=KQ;
end;

function isSuperKey(k:MGT):Boolean;     //Sieu khoa
begin
  result:=calcXplus(k)=u;
end;

function isKey(k:MGT):Boolean; //Sieu khoa toi thieu
var
  c:char;
begin

  if not isSuperKey(k) then
    exit(false);

  for c in k do
    if isSuperKey(k-[c]) then
      exit(false);

  result:=true;
end;

function calcK1(k:MGT):MGT;
var
  c:char;
begin
  if isKey(k) then
    exit(k)
  else
    for c in k do
      if isSuperKey(k-[c]) then
        exit(calcK1(k-[c]));
  exit([]);
end;

function calcK2():MGT;
var
  c:char;
  H:MGT; //Hieu
  G:MGT; //Giao (trung gian)
  LEFT:MGT;
  RIGHT:MGT;
  temp:PTR;
  K:MGT;
begin
  temp:=f;
  LEFT := [];
  RIGHT := [];
  
  while temp<>nil do
  begin
    LEFT := LEFT + temp.VT;
    RIGHT := RIGHT + temp.VP;
    
    temp:=temp.Next;
  end;

  H:= U-RIGHT;
  G:= LEFT*RIGHT;

  K:=H+G;

  for c in K do
    if isSuperKey(K-[c]) then
      K:=K-[c];

  result:=K;
end;

function calcKS1(k:MGT; s:string=''):String;
var 
  c:char;
begin
  if not isSuperKey(k) then
    exit(s);
  if isKey(k) and not s.Contains(MGT2STR(k)) then
    exit(s+MGT2STR(k)+'; ');

  for c in k do
    s:=calcKS1(k-[c],s);

  result:=s;
end;

procedure CalcF1;
var
  tp:Ptr;
  c:char;
begin
  clearList(F1);

  tp:=F;

  while tp<>Nil do
  begin
    for c in tp.VP do
      appendNode(tp.VT, [c], F1);

    tp:=tp.Next;
  end;
end;

procedure calcF2;
var
  c:char;
  tp:Ptr;
  LEFT:MGT;
begin
  if F1=nil then
    calcF1;

  clearList(F2);
  tp:=F1;
  while tp<> nil do
  begin
    LEFT:=tp.VT;
    for c in LEFT do
      if (tp.VP <= calcXplus(LEFT-[c], f1)) then
        LEFT:=LEFT-[c];

    appendNode(LEFT, tp.VP, F2);

    tp:=tp.Next;
  end;
end;
procedure calcF3;
var
  tp:PTR;
begin
  if F2=nil then
    calcF2;

  tp:=F2;

  while tp<>nil do
  begin
    tp.Active:=false;

    if tp.VP<=calcXplus(tp.VT,F2) then
      tp.Active:=false //Not matter but good as a dummy =))
    else
    begin
      appendNode(tp.VT, tp.VP,F3);
      tp.Active:=true;
    end;
    tp:=tp.Next;
  end;
end;

procedure TCSDL.CalcF1ButClick(Sender: TObject);
begin
  CalcF1;
  F1Out.Text := getRelation(F1,true,'F1');
end;
procedure TCSDL.CalcF2ButClick(Sender: TObject);
begin
  calcF2;
  F2Out.Text:=getRelation(F2,false,'F2');
end;

procedure TCSDL.CalcF3ButClick(Sender: TObject);
begin
  calcF3;
  F3Out.Text:=getRelation(F3,true, 'F3=Fc');
end;

procedure TCSDL.CalcK1ButClick(Sender: TObject);
begin
  K1OutPut.Text := MGT2STR(CalcK1(u))
end;

procedure TCSDL.CalcK2ButClick(Sender: TObject);
begin
  K2Output.Text:=MGT2STR(CalcK2);
end;

procedure TCSDL.CalcKSClick(Sender: TObject);
begin
  KS1OutE.Text:=calcKS1(u);
end;

procedure TCSDL.CalcXplusButClick(Sender: TObject);
begin
  XplusOut.Text := MGT2STR(calcXplus(STR2MGT(XplusE.Text)));
end;

procedure TCSDL.FormShow(Sender: TObject);
begin
  mFRelations.Lines.Clear;
end;

procedure TCSDL.ImportFromFileClick(Sender: TObject);
var
  fileName:String;
  txt:TextFile;
  s:String;
  rel: TStringDynArray;
begin
  mFRelations.Lines.Clear;
  fileName:='input.txt';

  if not FileExists(fileName) then
  begin
    mFRelations.Lines.Add('input.txt not found! Please put check x32/Debug');
    exit();
  end;

  AssignFile(txt,fileName);
  Reset(txt);
  Readln(txt, s);
  U:=STR2MGT(s);
  UoutE.Text:=s;
  UinE.Text:=s;

  clearList(f);

  while not Eof(txt) do
  begin
    ReadLn(txt, s);

    rel := SplitString(s, ' ');
    addRelation(rel[0], rel[1]);
  end;

  mFRelations.Lines.Add(getRelation(F));
  CloseFile(txt);
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
