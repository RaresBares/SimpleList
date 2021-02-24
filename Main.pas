(*
 * Project: untitled32
 * User: Rares
 * Date: 23.02.2021
 *)
program Main;
type
  listenRefElement = ^listenElement;
  listenElement = record
  next:listenRefElement;
    value:Real;
  before:listenRefElement;
  end;
  
  var
    ListenBegin:listenRefElement;



Procedure display;
var
  tmp:listenRefElement;
begin
tmp := ListenBegin;
  while tmp <> nil do
  begin
    WriteLn('Zahl: ',(tmp^.value));
    tmp := tmp^.next;
  end;
end;
  
Procedure add;
  
  var
    akt:listenRefElement;
  
  
  begin
    New(akt);
    akt^.next := nil;
    akt^.value := 2;
    ListenBegin^.next := akt;
  end;
  
begin
  new(ListenBegin);
  ListenBegin^.value := 1;
  ListenBegin^.before := nil;
  
  add();
//  (ListenBegin^.next)^.before := ListenBegin;
  display()
end.

