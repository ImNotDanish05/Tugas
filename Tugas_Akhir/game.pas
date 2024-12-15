program game;

uses SysUtils, Math, StrUtils, Crt, MMSystem, ShellApi, Windows;

type
    TCharacter = record
        X: integer;
        Y: integer;
        XB: integer;
        YB: integer;
        Design: array[1..12] of integer;
        Char: string;
    end;
    TNPC = record
        X: integer;
        Y: integer;
        XB: integer;
        YB: integer;
    end;

var
    i: integer;
    Player: TCharacter;
    Key: char;
    ConsoleHandle: HWND;

    //Konfigurasi
    Street_Animation: Boolean = false;
    Music: Boolean = false;

    { Luas Lapangan}
    PanjangX: integer = 100;
    PanjangY: integer = 40;
    WarnaLapangan: integer = 8;
    CharLapangan: string = 'O';

    { Street }
    StreetColor1: integer = 1;
    StreetColor2: integer = 15;
    StreetChar: string = '[]';
    StreetLeftLine: integer = 10;
    StreetRightLine: integer = 90;
    StreetBool1: Boolean = true;
    
procedure Jalan(putar: Boolean);
var
    y: integer;
begin
    for i := 0 to PanjangY - 2 do
    begin
        gotoxy( StreetLeftLine , i + 2);
        case putar of
            True: begin
            textcolor(StreetColor1);
            putar := False;
            end;
            False: begin 
            textcolor(StreetColor2);
            putar := True;
            end;
        end;
        write(StreetChar);
        gotoxy(StreetRightLine , i + 2);
        write(StreetChar);
    end;
end;

procedure MobilGambar(x: Integer; y: Integer; xb: Integer; yb: Integer; arr: array of Integer);
var
  a: Integer; //Counter X
  b: Integer; //Counter Y
begin
    a := -1;
    b := -2;
    for i := Low(arr) to High(arr) do
    begin
        gotoxy(1 , 1);
        if (a > 1) then
        begin
            a := -1;
            Inc(b);
        end;
            gotoxy(x + a, y + b);
            TextColor(arr[i]);
            write(Player.char);
        Inc(a);
    end;
    a := -1;
    b := -2;
    for i := Low(arr) to High(arr) do
    begin
        gotoxy(1 , 1);
        if (a > 1) then
        begin
            a := -1;
            Inc(b);
        end;
        if (x + a <> xb + a) or (y + b <> yb + b) then
        begin
            gotoxy(xb + a, yb + b);
            writeln(' ');
        end;
        Inc(a);
    end;
end;


procedure LapanganPrint;
begin
    //Player Character
    {
    14 = Yellow
    8 = Dark Gray
    7 = Light Gray
    }
    // Player.Design := ( 14, 8, 14, 8, 8, 8, 7, 7, 7, 7, 7, 7, 8, 8, 8);
    TextColor(WarnaLapangan);
    gotoxy(1, 1);
    for i := 0 to PanjangX do
    begin
        write(CharLapangan);
    end;
    for i:= 2 to PanjangY do
    begin
        gotoxy(1 , i);
        write(CharLapangan);
        gotoxy(PanjangX + 1, i);
        write(CharLapangan);
    end;
    gotoxy(1, PanjangY + 1);
    for i := 0 to PanjangX do
    begin
        write(CharLapangan);
    end;
end;

procedure Rintangan();
var
    Musuh: array[1..5] of integer;
begin
    // a
end;


{ Main Code }
begin
    Player.X := Round(PanjangX / 2);
    Player.Y := Round(PanjangY / 2);
    Player.XB := Player.X;
    Player.YB := Player.Y;
    ClrScr;
    LapanganPrint;
    Player.Char := CharLapangan;
    Player.Design[1] := 14; Player.Design[2] := 8; Player.Design[3] := 14;
    Player.Design[4] := 8; Player.Design[5] := 8; Player.Design[6] := 8;
    Player.Design[7] := 7; Player.Design[8] := 7; Player.Design[9] := 7;
    Player.Design[10] := 4; Player.Design[11] := 8; Player.Design[12] := 4;
    if Music then PlaySound('Backsound.WAV', 0, SND_ASYNC or SND_FILENAME or SND_LOOP);
    Jalan(StreetBool1);
    repeat
    // Menampilkan posisi pemain
        if (Player.X < StreetLeftLine + 3) then
        begin
            Player.X := StreetLeftLine + 3;
        end;
        if (Player.Y < 4) then
        begin
            Player.Y := 4;
        end;
        if (Player.X > StreetRightLine- 2) then
        begin
            Player.X := StreetRightLine - 2;
        end;
        if (Player.Y > PanjangY - 1) then
        begin
            Player.Y := PanjangY - 1;
        end;
        // if (Player.X <> Player.XB) or (Player.Y <> Player.YB) then
        // begin
        mobilgambar(Player.X, Player.Y, Player.XB, Player.YB, Player.Design);
        // end;
        // gotoxy(Player.X, Player.Y);  // Menempatkan cursor di baris ke-3
        // writeln(Player.Char);
        // if (Player.X <> Player.XB) or (Player.Y <> Player.YB) then
        // begin
        //     gotoxy(Player.XB, Player.YB);
        //     writeln(' ');
        // end;
        Player.XB := Player.X;
        Player.YB := Player.Y;
        if KeyPressed then
        begin
            Key := ReadKey;  // Membaca tombol yang ditekan
            case Key of
            'w', 'W': Player.Y := Player.Y - 1;  // Gerakkan ke atas
            's', 'S': Player.Y := Player.Y + 1;  // Gerakkan ke bawah
            'a', 'A': Player.X := Player.X - 1;  // Gerakkan ke kiri
            'd', 'D': Player.X := Player.X + 1;  // Gerakkan ke kanan
            'x', 'X': begin break; PlaySound(nil, 0, 0); end;
            end;
        end;
        if Street_Animation then
        begin
            Jalan(StreetBool1);
            case StreetBool1 of
                True: begin
                StreetBool1 := False;
                end;
                False: begin 
                textcolor(StreetColor2);
                StreetBool1 := True;
                end;
            end;
        end;
    until Key = 'q';  // Tekan 'q' untuk keluar dari program
end.