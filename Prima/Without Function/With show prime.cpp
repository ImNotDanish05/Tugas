#include <iostream>
using namespace std;

//YASS BERHASILLL XDD

int main(){ // 1 == TRUE 0 == FALSE
    int Result, Counter, Add;
    bool Prima;
    string Out = "2", Helper;
    cout << "Menghitung penjumlahan prima" << endl;
    cout << "Berapa banyak untuk menjumlah: ";
    cin >> Counter;
    Result = 2;
    Add = 3;
    for (int i = 1; i < Counter; i++){
        for (int j = 2; j < Add ; j++ ){
            if (Add % j == 0){//Jikalau tidak ada sisa = bukan prima
            Prima = false;
            break;
        }else{
            Prima = true;
        }
        }
        if(Prima){
            cout << "Prima: " << Add << endl;
            cout << Result << " + " << Add << " = " << Result + Add << " | Angka ke: " << i << endl;
            Result = Result + Add;
            Helper = " + " + to_string(Add);
            Out = Out + Helper;
        }else{
            i--;
            cout << "Bukan Prima: " << Add << endl;
        }Add = Add + 2;
    }
    // cout << PrimaChecker(Counter) << " = " << Counter;
    cout << "Hasil penjumlahan" << endl;
    cout << Out << " = " << Result;
    return 0;
} 
