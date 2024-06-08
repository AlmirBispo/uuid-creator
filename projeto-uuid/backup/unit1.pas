unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Spin,strutils,math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Memo1: TMemo;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    SaveDialog1: TSaveDialog;
    SpinEdit1: TSpinEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation
//{$i inthex.txt}
{$i GUID_FUNCTIONS.pas}
{
//Gera GUID usando o formato pascal ou generico em upper ou lower case
function GUIDGen(resultopt,acase:string):string;
var t1,t2,t3,t4,t5,t6,t7,t8:integer;
    s1,s2,s3,s4,s5,s6,s7,s8:string;
     myGUID:string;
begin
    randomize;
t1:= random(65365);s1 := intparahex( t1,'0');
t2:= random(65365);s2 := intparahex( t2,'0');
t3:= random(65365);s3 := intparahex( t3,'0');
t4:= random(65365);s4 := intparahex( t4,'0');
t5:= random(65365);s5 := intparahex( t5,'0');
t6:= random(65365);s6 := intparahex( t6,'0');
t7:= random(65365);s7 := intparahex( t7,'0');
t8:= random(65365);s8 := intparahex( t8,'0');
if ansilowercase(resultopt) =('pascal') then
begin
myGUID := '{'+s1+s2 +'-'+s3+'-'+s4+'-'+s5 +'-' +s6+s7+s8 + '}';
end;

if ansilowercase(resultopt) <>('pascal') then
begin
myGUID := s1+s2 +'-'+s3+'-'+s4+'-'+s5 +'-' +s6+s7+s8 ;
end;
if acase = ansilowercase('lowercase') then
begin
myGUID:=ansilowercase(myGUID);
end;

if acase = ansilowercase('uppercase') then
begin
myGUID:=ansiuppercase(myGUID);
end;
result := myGUID;

end;
//Gera GUID unicos de forma massiva
function GUIDMassive(GUIDCOUNT:integer ; astyle , acase:string):string;
var Glist:Tstringlist;
     G:string;
begin
Glist := Tstringlist.create;
while (Glist.count < GUIDCOUNT) do
  begin
   G := GUIDgen(astyle,acase);
   if ( Glist.IndexOf(G) =-1 )then
    begin
    Glist.add( G );
    end;
  end;
result:= Glist.text;
Glist.free;
end;
}
{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var qtd:integer;
     Gstyle,scase:string;
begin
qtd := (spinedit1.Value);
if radiobutton1.Checked then
 Gstyle :='pascal';

if radiobutton2.Checked then
 Gstyle :='notpascal';

if radiobutton3.Checked then
 scase:='uppercase';
if radiobutton4.Checked then
 scase:='lowercase';

if radiobutton5.Checked then
 begin
 memo1.Text:= GUIDmassiveCSV( qtd,scase);
 end;

if  not radiobutton5.Checked then
 begin
memo1.Text:= GUIDmassive( qtd,Gstyle,scase);
 end;
  showmessage('Gerados: '+ inttostr(memo1.lines.count)+' GUIDs únicos');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if savedialog1.Execute then
   begin
   memo1.Lines.SaveToFile(savedialog1.FileName);
   showmessage('Arquivo salvo');
   end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
application.Terminate;
end;

end.

