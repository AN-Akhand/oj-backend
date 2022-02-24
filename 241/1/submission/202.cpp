#include<bits/stdc++.h>

using namespace std;

int main(){
    int t;
    cin >> t;
    while(t--){
        int c1,r1,c2,r2;
        cin >> c1 >> r1 >> c2 >> r2;
        if((c1+r1)%2 == (c2+r2)%2) cout << "YES\n";
        else cout << "NO\n";
    }
    return 0;
}