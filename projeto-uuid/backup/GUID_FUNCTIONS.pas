{
função para geração de GUID unicos
Autor:Almir Bispo
Data:04/06/2024
Sloga:Yehovah é o Nome do Santo
dependencias:math,strutils;
}
function Intparahex(intvalor:integer;forma:string):string;
var o1,o2,o3,o4:tstringlist;
   i,ii,iii,iiii,ord:integer;
   str,formato:string;
begin
if forma='0' then begin formato:='';end;
if forma='1' then begin formato:='0x';end;
o1:=tstringlist.create;
o2:=tstringlist.create;
o3:=tstringlist.create;
o4:=tstringlist.create;
o1.Delimiter:=char(';');
o2.Delimiter:=char(';');
o3.Delimiter:=char(';');
o4.Delimiter:=char(';');

o1.DelimitedText:=('0;1;2;3;4;5;6;7;8;9;a;b;c;d;e;f');
o2.DelimitedText:=('0;1;2;3;4;5;6;7;8;9;a;b;c;d;e;f');
o3.DelimitedText:=('0;1;2;3;4;5;6;7;8;9;a;b;c;d;e;f');
o4.DelimitedText:=('0;1;2;3;4;5;6;7;8;9;a;b;c;d;e;f');
ord:=0;
for i:= 0 to o1.Count-1 do
begin
  for ii:= 0 to o2.count-1 do
  begin
    for iii:= 0 to o3.count-1 do
    begin
      for iiii:= 0 to o4.count-1 do
      begin
        if ord =intvalor then
        begin
        str:=o1.Strings[i]+o2.strings[ii]+o3.strings[iii]+o4.strings[iiii];
          Result :=formato+str;
        exit;
        end;
        inc(ord);
      end;
    end;
  end;

end;
   o1.free;
   o2.free;
   o3.free;
   o4.free;

end;

/////////////////////////GUID CSV Comp DB/////////////////////////////////
//Gera GUID usando o formato pascal ou generico em upper ou lower case
function GUIDGenCSV(acase:string):string;
var t1,t2,t3,t4,t6,t7,t8:integer;
    s1,s2,s3,s4,s6,s7,s8:string;
     myGUID:string;
begin
    randomize;
t1:= random(65365);s1 := intparahex( t1,'0');
t2:= random(65365);s2 := intparahex( t2,'0');
t3:= random(65365);s3 := intparahex( t3,'0');
t4:= random(65365);s4 := intparahex( t4,'0');
t6:= random(65365);s6 := intparahex( t6,'0');
t7:= random(65365);s7 := intparahex( t7,'0');
t8:= random(65365);s8 := intparahex( t8,'0');


myGUID := s1+s2 +'-'+s3+'-'+s4+'-'+s6+s7+s8 ;

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

//Gera GUID unicos de forma massiva   csv comp db
function GUIDMassiveCSV(GUIDCOUNT:integer ; astyle , acase:string):string;
var Glist:Tstringlist;
     G:string;
begin
Glist := Tstringlist.create;
while (Glist.count < GUIDCOUNT) do
  begin
   G := GUIDgenCSV(acase);
   if ( Glist.IndexOf(G) =-1 )then
    begin
    Glist.add( G );
    end;
  end;
result:= Glist.text;
Glist.free;
end;
/////////////////////////GUID/////////////////////////////////
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

//Gera GUID unicos de forma massiva universal
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
