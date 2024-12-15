
uses Graph, Crt;

var
  gd, gm: Integer;    // Grafik driver dan mode
  x, y: Integer;      // Posisi gambar
  key: Char;          // Input keyboard

procedure DrawImage(x, y: Integer);
begin
  // Gambar representasi sederhana
  SetColor(LightBlue);
  SetFillStyle(SolidFill, LightBlue);
  Bar(x, y, x + 50, y + 100); // Kotak ukuran 50x50
end;

procedure ClearImage(x, y: Integer);
begin
  // Bersihkan area sebelumnya
  SetColor(Black);
  SetFillStyle(SolidFill, Black);
//   Bar(0, 0, GetMaxX, GetMaxY);
end;

begin
  // Inisialisasi mode grafis
  gd := Detect;
  InitGraph(gd, gm, 'C:\BGI');
  if GraphResult <> grOk then
  begin
    WriteLn('Graphics error: ', GraphErrorMsg(GraphResult));
    Halt(1);
  end;

  // Posisi awal
  x := 200;
  y := 200;

  // Tampilkan gambar awal
  DrawImage(x, y);

  // Loop untuk mendeteksi input dan memindahkan gambar
  repeat
    if KeyPressed then
    begin
      key := ReadKey; // Baca input
      ClearImage(x, y); // Hapus gambar lama

      case key of
        'w': y := y - 10; // Naik
        's': y := y + 10; // Turun
        'a': x := x - 10; // Kiri
        'd': x := x + 10; // Kanan
      end;

      // Gambar ulang di posisi baru
      DrawImage(x, y);
    end;
  until key = #27; // Keluar dengan tombol ESC

  CloseGraph; // Tutup mode grafis
end.
