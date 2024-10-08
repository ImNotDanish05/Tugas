#include <iostream>
#include <iomanip>
#include <limits>

using namespace std;

void PerfectLine(){
    cout << " " << endl;
    cout << "-=-=-=-=-=-=-=-=-=-=-" << endl;
    cout << " " << endl;
}

int main(){
    /*
    si = Tipe Input
    i = Input
    */
    double i, j, k;
    int si;
    bool check;
    PerfectLine();
    cout << "SELAMAT DATANG DI KONVERSI SUHU" << endl;
    do{
    cout << "Masukan angka di sini untuk dihitung" << endl;
    cout << "Input: ";
    cin >> i;
    check = cin.fail();
    if(check) {
            cin.clear(); // Menghapus error flag
            cin.ignore(numeric_limits<std::streamsize>::max(), '\n'); // Mengabaikan karakter yang salah
            PerfectLine();
            cout << "Rak sah aneh-aneh, masuke angka wae" << endl;
        }
    } while (check);
    PerfectLine();
    check = false;
    do {
        cout << "=== Selection Input Type ===" << endl;
        cout << "1 - Celcius" << endl;
        cout << "2 - Fahrentheit" << endl;
        cout << "3 - Reamur" << endl;
        cout << "0 - Exit" << endl;
        cout << "Satuan apa untuk output?" << endl;
        cout << "Input: ";
        cin >> si;
        check = cin.fail();
        // Cek apakah input valid
        if (check) {
            cin.clear();
            cin.ignore(numeric_limits<std::streamsize>::max(), '\n');
            PerfectLine();
            cout << "Rak sah aneh2, masuke angka wae" << endl;
        }else if (si == 0){
            break;
        }else if (si < 1 || si > 3){
            PerfectLine();
            cout << "Input tidak valid. Silakan pilih tipe input yang benar (0-3)." << endl;
        }

    } while (si < 0 || si > 3 || check );  // Jika tidak valid, ulangi lagi.
    PerfectLine();

    if (si == 1) { // Jika input Celcius
        j = (i * 9/5) + 32; // Celcius ke Fahrenheit
        k = i * 4/5; // Celcius ke Reamur
        cout << "Celcius : " << fixed << setprecision(2) << i << endl;
        cout << "Fahrenheit : " << fixed << setprecision(2) << j << endl;
        cout << "Reamur : " << fixed << setprecision(2) << k << endl;
        
    } else if (si == 2) { // Jika input Fahrenheit
        j = (i - 32) * 5/9; // Fahrenheit ke Celcius
        k = (i - 32) * 4/9; // Fahrenheit ke Reamur
        cout << "Fahrenheit : " << fixed << setprecision(2) << i << endl;
        cout << "Celcius : " << fixed << setprecision(2) << j << endl;
        cout << "Reamur : " << fixed << setprecision(2) << k << endl;
    } else if (si == 3) { // Jika input Reamur
        j = i * 5/4; // Reamur ke Celcius
        k = (i * 9/4) + 32; // Reamur ke Fahrenheit
        cout << "Reamur : " << fixed << setprecision(2) << i << endl;
        cout << "Celcius : " << fixed << setprecision(2) << j << endl;
        cout << "Fahrenheit : " << fixed << setprecision(2) << k << endl;
    } else if (si == 0){
        cout << "Program Ditutup" << endl;
    }

    // Tampilkan hasil
    return 0;
}