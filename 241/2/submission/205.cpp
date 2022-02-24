#include <bits/stdc++.h>
using namespace std;
typedef long long int lli;
typedef unsigned long long int ull;
 
#define kthBit(n, k) (n & ((ull)1 << k) ? 1 : 0)
#define onBit(n, k) (n | ((ull)1 << k))
#define offBit(n, k) (n & (~((ull)1 << k)))
 
bool board[9][9];
lli ans;
 
void solve(int i, int col, int dig1, int dig2, int cans){
    if(cans == 8){
        ans++;
        return;
    }
    for(int j=0; j<8; j++){
        if(board[i][j]) continue;
        bool ok = kthBit(col, j) || kthBit(dig1, i+j) || kthBit(dig2, i-j+7);
        if(!ok){
            solve(i+1, onBit(col, j), onBit(dig1, i+j), onBit(dig2, i-j+7), cans+1);
        }
    }
}
 
int main(){
 
    for(int i=0; i<8; i++){
        string s;
        cin>>s;
        for(int j=0; j<8; j++){
            if(s[j] == '*') board[i][j] = 1;
        }
    }
    solve(0, 0, 0, 0, 0);
    cout<<ans<<endl;
}