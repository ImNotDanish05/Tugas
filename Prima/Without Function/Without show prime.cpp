#include <iostream>
using namespace std;
int main(){
    int Result, Counter, Add;
    bool Prima;
    cout << "Menghitung penjumlahan prima" << endl;
    cout << "Berapa banyak untuk menjumlah: ";
    cin >> Counter;
    Result = 2;
    for (int Add = 3 ; Add <= Counter; Add += 2){
        cout << " " << endl;
        Prima = true;
        for (int j = 2; j < Add ; j++ ){
            if (Add % j == 0){
            Prima = false;
            break;
            }
        }
        if(Prima){
            cout << "Prima: " << Add << endl;
            cout << Result << " + " << Add << " = " << Result + Add << endl;
            Result += Add;
        }else{
            cout << "Bukan Prima: " << Add << endl;
        }
    }
    cout << "Hasil penjumlahan: " << Result << endl;
    return 0;
} 


// Start{
//   masukkan counter;
//   Result = 2;
//   for(Add = 3 ; Add <= Counter ; Add += 2){
//     Prima = true;
//     for(j = 2 ; j < Add ; j++){
//       if(Sisa dari Add bagi j adalah 0){
//         Prima = false;
//         break;
//       }
//     }if(Prima adalah true){
//       Result = Result + Add;
//     }
//   }Print Result;
// }

// Done;
