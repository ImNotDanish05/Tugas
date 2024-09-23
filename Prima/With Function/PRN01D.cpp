#include <iostream>
using namespace std;

bool PrimaChecker(int x){
    for (int i = 2; i < x ; i++ ){
        if (x % i == 0){//Jikalau tidak ada sisa = bukan prima
        return false;
        }
    }return true;
}

int main(){ // 1 == TRUE 0 == FALSE
    int Result, Counter, Add;
    bool Prima;
    cout << "Menghitung penjumlahan prima" << endl;
    cout << "Maksimal prima: ";
    cin >> Counter;
    
    Result = 2;
    Add = 3;
    for (int i = 0; Add < Counter; i++){
        cout << " " << endl;
        if(PrimaChecker(Add)){
            cout << "Prima: " << Add << endl;
            cout << Result << " + " << Add << " = " << Result + Add << " | Angka ke: " << i << endl;
            Result = Result + Add;
        }else{
            i--;
            cout << "Bukan Prima: " << Add << endl;
        }Add = Add + 2;
    }
    cout << " " << endl;
    cout << "Hasil penjumlahan: " << Result << endl;
}