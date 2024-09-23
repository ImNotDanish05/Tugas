#include <iostream>

using namespace std;

#include <iostream>

using namespace std;

int main() {
    int a = 1, b = 2; // Satu-satunya variabel
    while(b <= 10){
        cout << a << " + " << b << " = " << a + b << endl;
        cout << " " << endl;
        a += b;
        b++;
    }
    cout << "Hasil: " << a;
    return 0;
}

// int main() {
//     int a = 1; // Satu-satunya variabel
//     for (int b = 2; b <= 10; b++){
//         cout << a << " + " << b << " = " << a + b << endl;
//         cout << " " << endl;
//         a = a + b;
//     }
//     cout << "Hasil: " << a;
//     return 0;
// }