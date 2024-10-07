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
    double i, j, k;
    int si;
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
    }

    // Tampilkan hasil
    PerfectLine();
    return 0;
}