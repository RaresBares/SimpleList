{$R+}
{$B+}

program ArrayList;
type
  tRefList = ^tList;

  tList = record
    zahl: Integer;
    next: tRefList;
  end;
var
  bef: string;
  mList: tRefList;
  lpos: Integer;
  lZahl: Integer;

procedure print(iList: tRefList);
var
  akt: tRefList;

begin
  akt := iList^.next;
  if iList = nil then
  begin
    WriteLn('[]');
  end else
  begin

    while akt <> nil do
    begin

      Write(akt^.zahl, ' ');
      akt := akt^.next;
    end;
    WriteLn();


  end;
end;

procedure add(var iList: tRefList);
var
  akt: tRefList;
  neu: tRefList;
  iloc: Integer= 1;
BEGIN

  New(neu);
  neu^.zahl := lZahl;
  neu^.next := nil;

  akt := iList;
  if iList = nil then
  begin
    iList := neu;
  end else begin

    while (iloc < lpos) and (akt^.next <> nil) do
    begin

      akt := akt^.next;
      iloc := iloc + 1;


    end;

    if (akt^.next = nil) then
    begin
      akt^.next := neu;
    end else
    begin
      neu^.next := akt^.next;
      akt^.next := neu^.next;
    end;
  end;

end;

procedure remove(var iList: tRefList);
var
  akt: tRefList;
  neu: tRefList;
  iloc: Integer= 1;
begin

  New(neu);
  neu^.zahl := lZahl;
  neu^.next := nil;

  akt := iList;
  if lpos = 1 then
  begin
    iList := iList^.next;
  end else begin

    while (iloc < lpos - 1) and (akt^.next^.next <> nil) do
    begin

      akt := akt^.next;
      iloc := iloc + 1;


    end;

    if (akt^.next^.next = nil) then
    begin
      WriteLn('t');
      akt^.next := nil;
    end else
    begin
      WriteLn('t2');
      akt^.next^.next := akt^.next^.next^.next;
    end;
  end;

end;
  
  function val(iList:tRefList):Integer;
  var
    akt: tRefList;
    neu: tRefList;
    iloc: Integer= 1;
  begin

    New(neu);
    neu^.zahl := lZahl;
    neu^.next := nil;

    akt := iList;
    if iList = nil then
    begin
      WriteLn('test');
      val := 0;
    end else begin

      while (iloc < lpos) and (akt^.next <> nil) do
      begin

        akt := akt^.next;
        iloc := iloc + 1;


      end;

      if (akt^.next = nil) then
      begin
        val := -7;
      end else
      begin
        
        val := akt^.next^.zahl;     
      end;
    end;

  end;
  
function minimumLoc(iList: tRefList): Integer;

var
  akt: tRefList;
  minimumZahl:Integer;
  lauf:Integer=1;
  minimumPos:Integer=1;
begin

   minimumZahl := (iList^.zahl);
begin
  akt := iList^.next;
  if akt = nil then
  begin
    minimumLoc := minimumPos;
  end else
  begin

    while akt <> nil do
    begin

      if akt^.zahl < minimumZahl then
      begin
        minimumPos := lauf;
      end;
        akt := akt^.next;
        lauf := lauf + 1;
      
    end;
    
    minimumLoc := minimumPos;


  end;
end;
end;
  
  procedure sort(var iList:tRefList);
  var
    sorted:tRefList;
    sPos:Integer=1;
    minPos:Integer;
    minVal:Integer;
  begin

    while iList^.next <> nil do
    begin
      minPos := minimumLoc(iList);
      lpos := minPos;
      minVal := val(iList);
      remove(iList);
      WriteLn('Sorted', minVal, ' at ', minPos);
      lpos := sPos;
      lZahl := minVal;
      add(sorted);
     
      sPos := sPos +1;
    end;
    iList := sorted;
    
  end;
begin

  readln(bef);
  while bef <> 'q' do
  begin
    if (bef = 'print') then
    begin
      print(mList);
    end;

    if (bef = 'x') then
    begin
      mList := nil;
    end;
    
    if bef = 'add' then
    begin
      write('Add an Position ');
      readln(lpos);
      write('Die Zahl ');
      readln(lZahl);
      add(mList);
    end;
    if bef = 'remove' then
    begin
      write('Add an Position ');
      readln(lpos);
      remove(mList);
    end;

    if bef = 'value' then
    begin
      write('Add an Position ');
      readln(lpos);
      WriteLn('minimum: ' , val(mList));
    end;

    if bef = 'sort' then
    begin
      sort(mList);
    end;

    if bef = 'min' then
    begin
    
      WriteLn('minimum: ' , minimumLoc(mList));
    end;

    if bef = 's' then
    begin
      add(mList);
      lpos := 1;
      lZahl := 1;
      add(mList);
      lpos := 2;
      lZahl := 2;
      add(mList);
      lpos := 3;
      lZahl := 3;
      add(mList);
      lpos := 4;
      lZahl := -4;
      add(mList);
    end;
    readln(bef);
  end;

end.
