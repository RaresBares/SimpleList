program Matrix;
type
  tRefMatrix = ^tMatrix;

  tMatrix = record

    content: array of array of Integer;
    Mx: Integer;
    My: Integer;
  end;

  tRefMList = ^tMList;

  tMList = record
    value: tRefMatrix;
    next: tRefMatrix;
    name: string;
  end;

var
  MainMatrix: tRefMatrix;
  SecondMatrix: tRefMatrix;
  bef: string;
  refer: string = '1';

  localInt1: Integer;
  localInt2: Integer;

procedure display(matrix: tRefMatrix);

var
  x: Integer = 0;
  y: Integer = 0;
begin
  while y < matrix^.My do
  begin
    Write('| ');
    while x < matrix^.Mx do
    begin
      Write(matrix^.content[x][y], ' ');
      x := x + 1;

    end;
    y := y + 1;
    x := 0;

    Write('|');
    WriteLn();
  end;


end;

procedure insertCon(matrix: tRefMatrix; px: Integer; py: Integer);

var
  x: Integer = 0;
  y: Integer = 0;
  number: Integer;

begin
  matrix^.My := py;
  matrix^.Mx := px;
  SetLength(matrix^.content, px, py);
  while y <= (matrix^.My - 1) do
  begin


    while x <= (matrix^.Mx - 1) do
    begin
      WriteLn('Geben sie die Zahl ein mit Position (', x + 1, ' ', y + 1, ')');
      ReadLn(number);
      matrix^.content[x][y] := number;
      x := x + 1;
    end;
    WriteLn(y + 1, '-te Zeile abgeschlossen');
    y := y + 1;
    x := 0;
  end;
  WriteLn('Fertig');

end;

procedure multiply(var fMatrix: tRefMatrix; sMatrix: tRefMatrix);
var
  res: tRefMatrix;
  rx: Integer  = 0;
  ry: Integer = 0;
  elRes: Integer = 0;
  lx: Integer  = 0;
  ly: Integer = 0;
begin
  if(fMatrix^.Mx <> sMatrix^.My) then
  begin
    WriteLn('Matrices dont match');
  end else
  begin

    New(res);
    res^.Mx := sMatrix^.Mx;
    res^.My := fMatrix^.My;
    SetLength(res^.content, res^.Mx, res^.My);
    while ry < res^.My do
    begin
      while rx < res^.Mx do
      begin
        while ly < sMatrix^.My do
        begin
          while lx < fMatrix^.Mx do
          begin


            elRes := elRes + fMatrix^.content[lx][ry] * sMatrix^.content[rx][ly];


            lx := lx + 1;
          end;
          ly := ly + 1;
        end;
        res^.content[rx][ry] := elRes;
        elRes := 0;
        lx := 0;
        ly := 0;
        rx := rx + 1;
      end;
      rx := 0;
      ry := ry + 1;
    end;


    fMatrix := res;
  end;

end;

procedure add(var fMatrix: tRefMatrix; sMatrix: tRefMatrix);
var
  res: tRefMatrix;
  x: Integer = 0;
  y: Integer = 0;
begin
  if (fMatrix^.Mx <> sMatrix^.Mx) or (fMatrix^.My <> sMatrix^.My) then
  begin
    WriteLn('Matrices dont match');
  end else
  begin
    New(res);
    res^.Mx := fMatrix^.Mx;
    res^.My := fMatrix^.My;
    SetLength(res^.content, res^.Mx, res^.My);


    while y < res^.My do
    begin

      while x < res^.Mx do
      begin

        res^.content[x][y] := fMatrix^.content[x][y] + sMatrix^.content[x][y];

        x := x + 1;

      end;
      y := y + 1;
      x := 0;


    end;
    fMatrix := res;
  end;
end;


procedure sub(var fMatrix: tRefMatrix; sMatrix: tRefMatrix);
var
  res: tRefMatrix;
  x: Integer = 0;
  y: Integer = 0;
begin
  if (fMatrix^.Mx <> sMatrix^.Mx) or (fMatrix^.My <> sMatrix^.My) then
  begin
    WriteLn('Matrices dont match');
  end else
  begin
    New(res);
    res^.Mx := fMatrix^.Mx;
    res^.My := fMatrix^.My;
    SetLength(res^.content, res^.Mx, res^.My);


    while y < res^.My do
    begin

      while x < res^.Mx do
      begin

        res^.content[x][y] := fMatrix^.content[x][y] - sMatrix^.content[x][y];

        x := x + 1;

      end;
      y := y + 1;
      x := 0;


    end;
    fMatrix := res;
  end;
end;

procedure clearConsole();
var
  IntI: Integer;
begin
  for intI := 1 to 100 do
    WriteLn();


end;

procedure transform(var fMatrix: tRefMatrix);
var
  res: tRefMatrix;
  x: Integer = 0;
  y: Integer = 0;
begin

  New(res);
  res^.Mx := fMatrix^.My;
  res^.My := fMatrix^.Mx;
  SetLength(res^.content, res^.Mx, res^.My);


  while y < res^.My do
  begin

    while x < res^.Mx do
    begin

      res^.content[x][y] := fMatrix^.content[y][x];

      x := x + 1;

    end;
    y := y + 1;
    x := 0;


  end;
  fMatrix := res;
end;


begin
  New(MainMatrix);
  New(SecondMatrix);
  WriteLn('Enter your command or type "help","h" or "?" for help...');
  ReadLn(bef);
  while bef <> 'quit' do
  begin
    if(bef = 'help') or (bef = 'h') or (bef = '?') then
    begin
      clearConsole();
      WriteLn('-----------------------------------------------------------------------');
      WriteLn('| "insert" - Insert the values in your matrix');
      WriteLn('| "add" - add your matrices                                          ( " Selected = Selected + Other")');
      WriteLn('| "substract" - substract your matrices                              ( " Selected = Selected - Other")');
      WriteLn('| "multiply" - multiply your matrices                                ( " Selected = Selected * Other")');
      WriteLn('| "transform" - transform your selected matrix                       ( " Selected = Selected^T")');
      WriteLn('| "switch" - You have to handle 2 matrices. Switch between them!');
      WriteLn('-----------------------------------------------------------------------');
      ReadLn(bef);
    end else begin
      if(bef = 'print') then
     
    begin
      clearConsole();
      if refer = '1' then
      begin
        display(MainMatrix);
      end;
      if refer = '2' then
      begin
        display(SecondMatrix);
      end;
    end;

      if(bef = 'transform') then
   
    begin
      clearConsole();
      if refer = '1' then
      begin
        transform(MainMatrix);
      end;
      if refer = '2' then
      begin
        transform(SecondMatrix);
      end;
      clearConsole();
      WriteLn('action performed!')
    end;

      if(bef = 'multiply') then
      begin
        clearConsole();
        if refer = '1' then
        begin
          multiply(MainMatrix, SecondMatrix);
        end;
        if refer = '2' then
        begin
          multiply(SecondMatrix, MainMatrix);
        end;
        clearConsole();
        WriteLn('action performed!')
      end;


      if(bef = 'add') then
      begin
        clearConsole();
        if refer = '1' then
        begin
          add(MainMatrix, SecondMatrix);
        end;
        if refer = '2' then
        begin
          add(SecondMatrix, MainMatrix);
        end;
        WriteLn('Action performed!');
      end;

      if(bef = 'substract') then
    begin
   
      clearConsole();
      if refer = '1' then
      begin
        sub(MainMatrix, SecondMatrix);
      end;
      if refer = '2' then
      begin
        sub(SecondMatrix, MainMatrix);
      end;

      WriteLn('action performed!')
    end;

      if(bef = 'insert') then
      begin
        clearConsole();
        if refer = '1' then
        begin


          WriteLn('Please enter the number of coloumns: ');
          ReadLn(localInt1);
          clearConsole();
          WriteLn('Please enter the number of rows: ');
          ReadLn(localInt2);
          clearConsole();
          insertCon(MainMatrix, localInt1, localInt2);
        end;

        if refer = '2' then
        begin

          WriteLn('geben Sie die Spaltenanzahl ein: ');
          ReadLn(localInt1);
          WriteLn('geben Sie die Zeilenanzahl ein: ');
          ReadLn(localInt2);
          clearConsole();
          insertCon(SecondMatrix, localInt1, localInt2);
        end;
        clearConsole();
        WriteLn('action performed!');
      end;
      if(bef = 'switch') then
      begin
        clearConsole();
        if (refer = '1') then
        begin

          WriteLn('Success!');
          WriteLn('Selected: "SecondMatrix"!');

          refer := '2';
        end else
          if (refer = '2') then
          begin

            WriteLn('Success!');
            WriteLn('Selected: "MainMatrix"!');
            refer := '1';
          end;
      end;
      ReadLn(bef);
    end;
  end;


end.