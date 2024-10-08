#include <iostream>
#include <iomanip>

using namespace std;

void PerfectLine(){
    cout << " " << endl;
    cout << "-=-=-=-=-=-=-=-=-=-=-" << endl;
    cout << " " << endl;
}

int main(){
    /*
    si = Tipe Input
    so = Tipe Output

    i = Input
    o = Output
    */
    double i, o;
    int si, so;
    cout << "Input: ";
    cin >> i;
    PerfectLine();
    do {
        cout << "=== Selection Input Type ===" << endl;
        cout << "1 - Celcius" << endl;
        cout << "2 - Fahrentheit" << endl;
        cout << "3 - Reamur" << endl;
        cout << "Satuan apa untuk output?" << endl;
        cout << "Input: ";
        cin >> si;

        // Cek apakah input valid
        if (si < 1 || si > 3) {
            PerfectLine();
            cout << "Input tidak valid. Silakan pilih tipe input yang benar (1-3)." << endl;
        }

    } while (si < 1 || si > 3);  // Jika tidak valid, ulangi lagi.
    PerfectLine();

    do {
        cout << "=== Selection Output Type ===" << endl;
        cout << "1/C - Celcius" << endl;
        cout << "2/F - Fahrentheit" << endl;
        cout << "3/R - Reamur" << endl;
        cout << "Satuan apa untuk output?" << endl;
        cout << "Output: ";
        cin >> so;

        // Cek apakah input valid
        if (so < 1 || so > 3) {
            PerfectLine();
            cout << "Input tidak valid. Silakan pilih tipe input yang benar. Tolong hanya pilih diantara 1 hingga 3" << endl;
        }

    } while (so < 1 || so > 3);  // Jika tidak valid, ulangi lagi.
    PerfectLine();

    if (si == 1) { // Jika input Celcius
        if (so == 1) {
            o = i; // Celcius ke Celcius
        } else if (so == 2) {
            o = (i * 9/5) + 32; // Celcius ke Fahrenheit
        } else if (so == 3) {
            o = i * 4/5; // Celcius ke Reamur
        }
    } else if (si == 2) { // Jika input Fahrenheit
        if (so == 1) {
            o = (i - 32) * 5/9; // Fahrenheit ke Celcius
        } else if (so == 2) {
            o = i; // Fahrenheit ke Fahrenheit
        } else if (so == 3) {
            o = (i - 32) * 4/9; // Fahrenheit ke Reamur
        }
    } else if (si == 3) { // Jika input Reamur
        if (so == 1) {
            o = i * 5/4; // Reamur ke Celcius
        } else if (so == 2) {
            o = (i * 9/4) + 32; // Reamur ke Fahrenheit
        } else if (so == 3) {
            o = i; // Reamur ke Reamur
        }
    }

    // Tampilkan hasil
    PerfectLine();
    cout << "Inputnya: " << fixed << setprecision(2) << i << si << endl;
    cout << "Hasil Konversi: " << fixed << setprecision(2) << o << so << endl;

    return 0;
}