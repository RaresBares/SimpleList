program List;
type
  tRefList = ^tList;

  tList = record
    next: tRefList;
    value: Integer;
  end;
var
  iList: tRefList;
  bef: string;
  refPos: Integer;
  refVal: Integer;



procedure print(List: tRefList);
var
  akt: tRefList;

begin
  if(List = nil) then
  begin
    WriteLn('[]');
  end else
  begin
    akt := List;
    Write('[ ');
    while akt <> nil do
    begin
      Write(akt^.value, ' ');
      akt := akt^.next;
    end;

    Write(']');
    WriteLn();

  end
end;

procedure add(position: Integer; value: Integer; var List: tRefList);
var
  akt: tRefList;
  neu: tRefList;
  lauf: Integer;
begin
  if List = nil then
  begin
    New(List);
    List^.next := nil;
    List^.value := value;
  end else begin
    New(neu);
    neu^.value := value;
    akt := List;
    if position <> 1 then
    begin

      for lauf := 1 to position - 2 do
      begin
        if akt^.next <> nil then
        begin
          akt := akt^.next;
        end;
      end;
      neu^.next := akt^.next;
      akt^.next := neu;
    end else begin

      neu^.value := akt^.value;
      akt^.value := value;
      neu^.next := akt^.next;
      akt^.next := neu;
    end;

  end;
end;

procedure clearConsole();
var
  IntI: Integer;
begin
  for intI := 1 to 100 do
    WriteLn();


end;

procedure remove(position: Integer; var List: tRefList);
var
  akt: tRefList;
  lauf: Integer;
begin
  if List = nil then
  begin
    New(List);
    List^.next := nil;
    List^.value := position;
  end else begin


    akt := List;
    if position <> 1 then
    begin
      for lauf := 1 to position - 2 do
      begin
        if akt^.next^.next <> nil then
        begin

          akt := akt^.next;
        end;
      end;

      akt^.next := akt^.next^.next;
    end else begin

      iList := iList^.next;

    end;

  end;
end;

function iMinPos(List: tRefList): Integer;
var
  minVal: Integer;
  minPos: Integer;
  lauf: Integer = 1;
  akt: tRefList;

begin

  minVal := List^.value;
  minPos := 1;

  if(List = nil) then
  begin
    iMinPos := 0;
  end else
  begin
    akt := List;

    while akt <> nil do
    begin
      if(akt^.value < minVal) then
      begin
        minVal := akt^.value;
        minPos := lauf;
      end;
      akt := akt^.next;
      lauf := lauf + 1;
    end;


    iMinPos := minPos;
  end


end;

function  val(position: Integer; var List: tRefList): Integer;
var
  akt: tRefList;
  lauf: Integer;
begin
  if List = nil then
  begin
    New(List);
    List^.next := nil;
    List^.value := position;
  end else begin


    akt := List;
    if position <> 1 then
    begin
      for lauf := 1 to position - 1 do
      begin
        if akt^.next <> nil then
        begin

          akt := akt^.next;
        end;
      end;
      val := akt^.value;
    end else begin
      val := iList^.value;
    end;

  end;
end;

procedure sort(var List: tRefList);
var
  sorted: tRefList;
  minPos: Integer = 0;
  minVal: Integer = 0;
  lauf: Integer = 2;
begin


  while List <> nil do
  begin
    lauf := lauf + 1;
    minPos := iMinPos(List);
    minVal := val(minPos, List);
    add(lauf, minVal, sorted);
    remove(minPos, List);

  end;

  List := sorted;

end;

begin


  WriteLn('Enter your command or type "help","h" or "?" for help...');
  ReadLn(bef);
  while bef <> 'q' do
  begin


    if(bef = 'help') or (bef = 'h') or (bef = '?') then
    begin
      clearConsole();
      WriteLn('--------------------------------------------------------------------------');
      WriteLn('| "display"/"print" - display/print your list                             ');
      WriteLn('| "add" - adds a number to your list                                      ');
      WriteLn('| "remove" - removes a number from your list                              ');
      WriteLn('| "value"/"wert" - get the value of the i-th number on your list          ');
      WriteLn('| "sort" - sort your list                                                 ');
      WriteLn('| "minimum"/"minpos" - get the position of the smalest number on your list');
      WriteLn('--------------------------------------------------------------------------');
    end;

    if bef = 'add' then
    begin
      clearConsole();
      write('Enter the position, where you want to add a number: ');
      readln(refPos);
      clearConsole();
      write('Enter the value of the number, you want to enter: ');
      readln(refVal);
      clearConsole();
      add(refPos, refVal, iList);
      WriteLn('Number added!');
    end;


    if (bef = 'minimum') or (bef = 'minpos') then
    begin

      clearConsole();
      WriteLn('Minimum located at: ', iMinPos(iList))
    end;

    if bef = 'sort' then
    begin
      clearConsole();
      sort(iList);
      WriteLn('List sorted!');
    end;

    if bef = 'x' then
    begin
      clearConsole();
      iList := nil;
      WriteLn('List cleared!');
    end;

    if bef = 'remove' then
    begin
      clearConsole();
      write('Enter the position, where you want to remove a number: ');
      readln(refPos);
      clearConsole();
      remove(refPos, iList);
      WriteLn('Number removed!');
    end;


    if (bef = 'value') or (bef = 'wert') then
    begin
      clearConsole();
      write('Enter the position, where you want to get the value from');
      readln(refPos);
      clearConsole();
      WriteLn('The Value of the ', refPos, 'th number: ', val(refPos, iList));
    end;


    if (bef = 'display') or (bef = 'print') then
    begin
      clearConsole();
      print(iList);
    end;

    ReadLn(bef);
  end;

end.