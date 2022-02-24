#include <bits/stdc++.h>
using namespace std;
 
typedef long long int lli;
string s1, s2;
 
lli dp[5003][5003];
 
lli editDistance(lli l1, lli l2)
{
    if(dp[l1][l2] != -1) return dp[l1][l2];
    if(l1 == 0) return dp[l1][l2] = l2;
    else if(l2 == 0) return dp[l1][l2] = l1;
    if(s1[l1 - 1] == s2[l2-1]){
        return dp[l1][l2] = editDistance(l1-1, l2-1);
    }
    lli rv1 = editDistance(l1-1, l2-1); //replace
    lli rv2 = editDistance(l1, l2-1);   //add
    lli rv3 = editDistance(l1-1, l2);   //remove
    return dp[l1][l2] = (1 + min(min(rv1, rv2), rv3));
}
 
 
 
int main()
{
    memset(dp, -1, sizeof dp);
    cin>>s1;
    cin>>s2;
    cout<<editDistance(s1.size(), s2.size());
}