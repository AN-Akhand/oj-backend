#include <bits/stdc++.h>
using namespace std;
 
#define INF 1e13
 
void printMatrix(int n, const vector<vector<long long int> > &adjMatrix){
    cout<<":::::::::::::::::::::::::::::::"<<endl;
    for(int i=0; i<=n; i++){
        for(int j=0; j<=n; j++){
            cout<<adjMatrix[i][j]<<"\t";
        }
        cout<<endl;
    }
    cout<<":::::::::::::::::::::::::::::::"<<endl;
}
 
void floydWarshal(int n, vector<vector<long long int> > &adjMatrix){
    for(int k=0; k<=n; k++){
        for(int i=0; i<=n; i++){
            for(int j=0; j<=n; j++){
                long long int dist = adjMatrix[i][k] + adjMatrix[k][j];
                if(adjMatrix[i][j] > dist) {
                    adjMatrix[i][j] = dist;
                }
            }
        }
    }
}
 
int main(){
    int n, m;
    int tc;
    scanf("%d %d %d", &n, &m, &tc);
    vector<vector<long long int> > adjMatrix(n+1);
    vector<vector<int> > pathMatrix(n+1);
    for(int i=0; i<=n; i++)
        for(int j=0; j<=n; j++){
            adjMatrix[i].push_back(i==j?0:INF);
            pathMatrix[i].push_back(j);
        }
 
//    printMatrix(n, adjMatrix);
 
    for(int i=0; i<m; i++){
        int x, y;
        long long int w;
//        cin>>x>>y>>w;
        scanf("%d %d %lld", &x, &y, &w);
        if(adjMatrix[x][y] > w){
            adjMatrix[x][y] = w;
            adjMatrix[y][x] = w;
        }
    }
//    printMatrix(n, adjMatrix);
 
    floydWarshal(n, adjMatrix);
//    printMatrix(n, adjMatrix);
    for(int i=0; i<tc; i++){
        int x, y;
        scanf("%d %d", &x, &y);
        printf("%lld\n", adjMatrix[x][y] == INF ? -1 : adjMatrix[x][y]);
    }
 
}