(*
 * Project: untitled32
 * User: Rares
 * Date: 24.02.2021
 *)
program Uni;


type
  tRefListe = ^tListe;

  tListe = record
    next: tRefListe;
    value: Integer;

  end;

var
  lentgh: Integer;
  position: integer;
  zahl: integer;
  befehl: string;
  liste: tRefListe;
  minimum: Integer;
procedure len(ioList: tRefListe);
var
  i: Integer = 0;
  akt: tRefListe;
begin
  akt := ioList;
  while akt <> nil do
  begin
    i := i + 1;
    akt := akt^.next;


  end;
  lentgh := i;
end;

procedure  wert(position: Integer; var ioliste: tRefListe);
var
  akt: tRefListe;
  i: Integer = 0;
begin
  akt := ioliste;
  while (i <> position) and (akt^.next <> nil) do
  begin
    akt := akt^.next;
    i := i + 1;
  end;
  minimum := akt^.value;
  WriteLn('Value: ', akt^.value);
end;

procedure add(hposition: Integer; value: Integer; var ioliste: tRefListe);
var
  akt: tRefListe;
  neu: tRefListe;

  i: Integer = 0;
begin
  akt := ioliste;
  New(neu);
  neu^.value := value;


  if akt = nil then
  begin
    neu^.next := nil;
    ioliste := neu;
  end
  else
  begin


    while (i <>
    hposition - 1) and
    (akt^.next <> nil)  do
    begin
      i := i + 1;
      akt := akt^.next;
    end;
    neu^.next := akt^.next;
    akt^.next := neu;
  end;
end;

procedure print(hliste: tRefListe);
var
  akt: tRefListe;

begin


  akt := hliste;

  while (akt <> nil) do
  begin

    WriteLn('Zahl: ', akt^.value);

    akt := akt^.next;

  end;


end;

procedure remove(var hposition: Integer; var ioliste: tRefListe);
var
  ind: Integer = 1;
  akt: tRefListe;


begin
  akt := ioliste;
  if (hposition = 0) then
  begin
    ioliste := ioliste^.next;
  end
  else
  begin

 

    len(ioliste);
    if hposition > lentgh then
    begin
    hposition := lentgh -1
    end;
      while (ind <> hposition) do
      begin
        WriteLn('-----------');
        print(ioliste);
        WriteLn('----------------');
        ind := ind + 1;
        akt := akt^.next;
      end;
    if (akt^.next)^.next = nil then
    begin
      akt^.next := (akt^.next)^.next;
    end else begin
      akt^.next := nil;
    end;


  end;


end;

procedure  minimumPosition(ioliste: tRefListe);
var
  minValue: Integer;
  minPos: Integer;
  akt: tRefListe;
  im: Integer = 0;
  bool: Boolean = true;
begin
  minPos := 0;
  im := 0;
  minValue := ioliste^.value;
  akt := ioliste;

  while (akt^.next <> nil) and bool do
  begin
    im := im + 1;

    akt := akt^.next;
    if(akt^.next = nil) then
    begin
      bool := false;
    end;
    if (akt^.value < minValue) then
    begin
      minPos := im;
      minValue := akt^.value;
    end

  end;


end;

procedure sort(var ioliste: tRefListe);
var
  neuListe: tRefListe;
  i: Integer = 0;
  lange: Integer = 1;
begin
  len(ioliste);
  while lange <= 4  do
  begin

    WriteLn('-');
    minimumPosition(ioliste);
    i := minimum;
    WriteLn('MINIMUM BEI ', i);
    wert(i, ioliste);
    add(lange, minimum, neuliste);
    remove(i, liste);

  end;
  ioliste := neuListe;
end;

begin
  liste := nil;
  readln(befehl);
  while befehl <> 'q' do
  begin
    if befehl = 'add' then
    begin
      write('Add an Position ');
      readln(position);
      write('Die Zahl ');
      readln(zahl);
      add(position, zahl, liste);
    end;

    if befehl = 'print' then
    begin
      print(liste)
    end;


    if befehl = 'sort' then
    begin
      sort(liste)
    end;

    if befehl = 'value' then
    begin
      write('Value an Position ');
      readln(position);
      wert(position, liste)
    end;
    if befehl = 'remove' then
    begin
      write('Value an Position ');
      readln(position);
      remove(position, liste)
    end;

    if befehl = 'min' then
    begin

      minimumPosition(liste);
      WriteLn('min ', minimum);
    end;

    if befehl = 'len' then
    begin

      len(liste);
      WriteLn('lentgh ', lentgh);
    end;


    if befehl = 'standart' then
    begin
      position := 1;
      zahl := 1;
      add(position, zahl, liste);
      position := 2;
      zahl := 3;
      add(position, zahl, liste);
      position := 3;
      zahl := 2;

      add(position, zahl, liste);
      position := 4;
      zahl := 4;
      add(position, zahl, liste);

    end;
    readln(befehl);
  end;
end.