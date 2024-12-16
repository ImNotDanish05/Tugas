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
        Dangerous: integer;
        value: integer;
    end;

var
    i, j: integer;
    Waktui: integer;
    Player: TCharacter;
    Key: char;
    ConsoleHandle: HWND;
    Musuh: array[1..20] of TNPC;
    MusuhY: integer;
    Score: integer;
    Result: Boolean;
    RandomXD: integer;

    { Konfigurasi }
    Street_Animation: Boolean = false;
    Music: Boolean = true;
    Kecepatan: Integer = 950; {Maximum: 1000}

    { Luas Lapangan }
    PanjangX: integer = 100;
    PanjangY: integer = 40;
    WarnaLapangan: integer = 8;
    CharLapangan: string = 'X';

    { Street }
    StreetColor1: integer = 1;
    StreetColor2: integer = 15;
    StreetChar: string = '[]';
    StreetLeftLine: integer = 10;
    StreetRightLine: integer = 90;
    StreetBool1: Boolean = true;
    
    { Musuh }
    MusuhNilaiMax: Integer = 9;

    { Level }
    LevelPlayer: integer = 1;
    LevelXP: integer = 0;
    LevelTopXP: integer = 20;
    LevelMulti: integer = 3;

    {Loses}
    LosesButtonChoose: integer;

procedure CursorMove();
begin
    gotoxy(PanjangX + 5, PanjangY + 5);
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

procedure setup;
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
    for j := Low(Musuh) to High(Musuh) do
    begin
        Musuh[j].Y := SmallInt(Round(j * PanjangY / High(Musuh)));
        RandomXD := StreetRightLine - StreetLeftLine - 2;
        RandomXD := Random(RandomXD);
        RandomXD := RandomXD + StreetLeftLine + 2;
        Musuh[j].X := RandomXD;
        Musuh[j].Dangerous := 0;
    end;
    if Music then PlaySound('Backsound.WAV', 0, SND_ASYNC or SND_FILENAME or SND_LOOP);
end;

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
        CursorMove();
    end;
end;

procedure KalahScreen();
var
    TengahX: integer;
    TengahY: integer;
begin
    clrscr;
    TengahX := round(PanjangX / 2);
    TengahY := round(PanjangY / 2);
    LapanganPrint;
    gotoxy(TengahX, TengahY);
    textcolor(12);
    if Music then
    PlaySound('Kalah.WAV', 0, SND_ASYNC or SND_FILENAME or SND_LOOP);
    write('KALAH YAHAHA!');
    gotoxy(TengahX, TengahY + 1);
    write('Level: ', LevelPlayer);
    gotoxy(TengahX, TengahY + 2);
    write('Score: ', Score);
    gotoxy(TengahX - round(length('Never Gonna Give you up!') / 2), TengahY + 5);
    textcolor(12);
    write('Never Gonna Give you up!');
    gotoxy(TengahX - round(length('Actually Give Up') / 2), TengahY + 6);
    textcolor(12);
    write('Actually Give Up');
    repeat
        if KeyPressed then
        begin
            Key := ReadKey;  // Membaca tombol yang ditekan
            case Key of
            'w', 'W':
            begin
                gotoxy(TengahX - round(length('Never Gonna Give you up!') / 2), TengahY + 5);
                textcolor(14);
                write('Never Gonna Give you up!');
                gotoxy(TengahX - round(length('Actually Give Up') / 2), TengahY + 6);
                textcolor(12);
                write('Actually Give Up');
                LosesButtonChoose := 1;
            end;
            's', 'S':
            begin
                gotoxy(TengahX - round(length('Actually Give Up') / 2), TengahY + 6);
                textcolor(14);
                write('Actually Give Up');
                gotoxy(TengahX - round(length('Never Gonna Give you up!') / 2), TengahY + 5);
                textcolor(12);
                write('Never Gonna Give you up!');
                LosesButtonChoose := 2;
            end;
            #13:
            begin
                ClrScr;
                if (LosesButtonChoose = 1) then
                begin
                    setup;
                    exit;
                end
                else if (LosesButtonChoose = 2) then 
                begin
                    clrscr;
                    halt;
                end;

            end;
            end;
        end;
    until (False);
    Readln;
    setup;
    jalan(Street_Animation);
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
    CursorMove();
end;

procedure Level();
begin
    gotoxy(PanjangX + 5, 6);
    textcolor(white);
    if (LevelXP > LevelTopXP) then
    begin
        LevelXP := 0;
        Inc(LevelPlayer);
        LevelTopXP := LevelTopXP * 3;
    end;
    write('Level: ', LevelPlayer);
    gotoxy(PanjangX + 5, 7);
    write('XP: ', LevelXP, '/', LevelTopXP, '          ');
    gotoxy(PanjangX + 5, 8);
    write('Multi: ', LevelPlayer, 'x', '      ');
end;

procedure Rintangan(CounterRintangan: Integer);
var
    randomx: integer;
    iXD: integer;
begin
        for i := Low(Musuh) to High(Musuh) do
        begin
            if (Musuh[i].value = 0) then
            begin
                randomx := Random(MusuhNilaiMax);
                Musuh[i].value := randomx;
            end;
            for j := -1 to 1 do
            begin
                if (Musuh[i].X = Player.X + j ) and (Musuh[i].Y = Player.Y - 2) then
                begin
                    case Musuh[i].Dangerous of
                        0: 
                        begin
                            gotoxy(PanjangX + 5, 4);
                            Textcolor(3);
                            write('+', Musuh[i].value);
                            textcolor(15);
                            Score := Score + Musuh[i].value * LevelPlayer;
                            gotoxy(PanjangX + 5, 3);
                            write('Score: ', Score);
                            gotoxy(Musuh[i].X, Musuh[i].Y - 1);
                            write(' ');
                            Musuh[i].Y := PanjangY + 4;
                            LevelXP := LevelXP + Musuh[i].value * LevelPlayer;
                            Level();
                        end;
                        1:
                        begin
                            gotoxy(PanjangX + 5, 5);
                            write('Hit Red');
                            KalahScreen();
                        end;
                    end;
                end;
            end;
            if (CounterRintangan > 1000 - Kecepatan - LevelPlayer) then
            begin
                case Musuh[i].Dangerous of
                    1: textcolor(12);
                    0: textcolor(3);
                end;
                gotoxy(Musuh[i].X, Musuh[i].Y - 1);
                write(' ');
                gotoxy(Musuh[i].X, Musuh[i].Y);
                write(Musuh[i].value);
                inc(Musuh[i].Y);
                if (Musuh[i].Y > PanjangY) then
                begin
                    gotoxy(Musuh[i].X, Musuh[i].Y - 1);
                    write(' ');
                    Musuh[i].Y := 3;
                    randomx := StreetRightLine - StreetLeftLine - 2;
                    randomx := Random(randomx);
                    randomx := randomx + StreetLeftLine + 2;
                    Musuh[i].X := randomx;
                    randomx := Random(MusuhNilaiMax);
                    Musuh[i].value := randomx;
                    iXD := random(2);
                    Musuh[i].Dangerous := iXD;
                end;
            end;
        end;
    CursorMove();
end;

{ Main Code }
begin
    cursoroff;
    LapanganPrint;
    setup;
    
    Jalan(StreetBool1);
    repeat
        Rintangan(Waktui);
        if(Waktui > 1000 - Kecepatan) then Waktui := 1;
        Inc(Waktui);
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