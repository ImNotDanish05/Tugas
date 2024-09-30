#include <iostream>
#include <iomanip>

using namespace std;

int main(){
    double c, f, r;
    cout << "Please put an number in Celcius: ";
    cin >> c;
    r = c * 4 / 5;
    f = (c * 1.8) + 32;
    cout << fixed << setprecision(2);
    cout << "Celcius: " << c << endl;
    cout << "Reamur: " << r << endl;
    cout << "Fahrenheit: " << f << endl;
    cout << " " << endl;
    return 0;
}