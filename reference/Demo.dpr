program Demo;

{$APPTYPE CONSOLE}

uses
  SysUtils, Irbis64_Client;

const

  // ������ ������
  BIG_ENOUGH = 32678;

  // ������ ��� ����������� � �������
  HOST = '127.0.0.1';
  PORT = '6666';
  USER = 'librarian';
  PASSWORD = 'secret';
  ARM = 'A';
  DB = 'IBIS';

var iniText: PAnsiChar;
  recordBuffer: PAnsiChar;
  retCode: Integer;

begin

  try

  // ������ ����������� ����,
  // �������� � ����������� ����� �������
  IC_set_blocksocket(1);

  GetMem(iniText, BIG_ENOUGH);
  retCode := IC_reg(HOST, PORT, ARM, USER, PASSWORD,
    iniText, BIG_ENOUGH);
  if retCode < 0 then
  begin
    Writeln('Can''t connect!');
    Exit;
  end;

  Writeln('Connected');
  Writeln;
  Writeln(iniText);
  Writeln;

  GetMem(recordBuffer, BIG_ENOUGH);
  IC_recdummy(recordBuffer, BIG_ENOUGH);
  IC_fldadd(recordBuffer, 700, 0, '^aAuthor', BIG_ENOUGH);
  IC_fldadd(recordBuffer, 200, 0,
    '^aTitle^eSubtitle^fResponsibility', BIG_ENOUGH);
  IC_fldadd(recordBuffer, 300, 0, 'Some comment', BIG_ENOUGH);
  IC_fldadd(recordBuffer, 900, 0, 'PAZK', BIG_ENOUGH);
  Writeln(recordBuffer);

  retCode := IC_update(DB, 0, 1, recordBuffer, BIG_ENOUGH);
  Writeln('IC_update=', retCode);

  IC_unreg('librarian');
  Writeln('Disconnected');

  except

      on e: Exception do
        Writeln(e.message);

  end;

end.
