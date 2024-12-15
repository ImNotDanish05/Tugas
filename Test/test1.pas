program PlayMP4Video;

uses
  SysUtils, Classes, Process;

var
  VideoPath: AnsiString;  // Ubah menjadi AnsiString
  Process: TProcess;

begin
  // Meminta input path video dari user
  Write('Masukkan path video MP4: ');
  ReadLn(VideoPath);

  // Mengecek apakah file ada
  if not FileExists(VideoPath) then
  begin
    WriteLn('File tidak ditemukan: ', VideoPath);
    Exit;
  end;

  // Membuat objek proses
  Process := TProcess.Create(nil);
  try
    // Menentukan executable dan argumen
    Process.Executable := 'vlc';  // Ganti dengan path lengkap VLC jika tidak dalam PATH
    Process.Parameters.Add(VideoPath);

    // Jalankan proses secara asynchronous
    Process.Options := Process.Options + [poWaitOnExit];
    Process.Execute;

    WriteLn('Video selesai diputar.');
  finally
    Process.Free;
  end;
end.
