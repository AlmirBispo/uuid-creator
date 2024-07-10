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
    Label1: TLabel;
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

{$i GUID_FUNCTIONS.pas}

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

