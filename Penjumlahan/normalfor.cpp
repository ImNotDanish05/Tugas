#include <iostream>

using namespace std;

int main() {
    int a = 1; // Satu-satunya variabel
    for (int b = 2; b <= 10; b++){
        cout << a << " + " << b << " = " << a + b << endl;
        cout << " " << endl;
        a = a + b;
    }
    cout << "Hasil: " << a;
    return 0;
}