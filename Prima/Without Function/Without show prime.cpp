#include <iostream>
using namespace std;
int main(){
    int Result, Counter, Add;
    bool Prima;
    string Out = "2", Helper;
    cout << "Menghitung penjumlahan prima" << endl;
    cout << "Berapa banyak untuk menjumlah: ";
    cin >> Counter;
    Result = 2;
    for (int Add = 3 ; Add < Counter; Add += 2){
        cout << " " << endl;
        for (int j = 2; j < Add ; j++ ){
            if (Add % j == 0){
            Prima = false;
            break;
        }else{
            Prima = true;
        }
        }
        if(Prima){
            cout << "Prima: " << Add << endl;
            cout << Result << " + " << Add << " = " << Result + Add << endl;
            Result = Result + Add;
        }else{
            cout << "Bukan Prima: " << Add << endl;
        }
    }
    cout << "Hasil penjumlahan" << endl;
    return 0;
} 
