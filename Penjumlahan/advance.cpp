#include <iostream>

using namespace std;

int main() {
    int a = 0; // Satu-satunya variabel
    for (int b = 1; b < 10; b++){
        cout << a << " + " << b << " = ";
        a = a + b;
        cout << a << " Loop ke: " << b << endl;
    }
    cout << "Hasil: " << a;
    return 0;
}