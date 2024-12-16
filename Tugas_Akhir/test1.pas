uses SysUtils;

var
  RandomNumber: Integer;
  i: Integer;

begin
  for i := 0 to 100 do
  begin
  RandomNumber := Random(2); // Menghasilkan angka antara 0 dan 1
  WriteLn('Random number (0 or 1): ', RandomNumber);
  end;
end.
