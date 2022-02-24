#include <bits/stdc++.h>
// #include "Edge.cpp"
using namespace std;
 
class DijkstraVertex{
public:
    int vertexNo;
    int p;
    long long int d;
    DijkstraVertex(int vn){
        vertexNo = vn;
        p = -1;
        d = LONG_LONG_MAX;
    }
    DijkstraVertex(){
        vertexNo = -1;
        p = -1;
        d = LONG_LONG_MAX;
    }
    void print(){
        cout<<"Vertex No: "<<vertexNo<<", P: "<<p<<", D: "<<d<<endl;
    }
};
class ascComparatorDijkVertex{
public:
    bool operator() (const DijkstraVertex& v1, const DijkstraVertex& v2){
        return v1.d > v2.d;
    }
};
 
vector<DijkstraVertex> dijkstra(int n, const vector<vector<pair<int, long long int> > > & adj, int s){  
    vector<DijkstraVertex> vertex(n+1);
    for(int i=0; i<=n; i++){
        vertex[i].vertexNo = i;
        vertex[i].d = LONG_LONG_MAX;
        vertex[i].p = -1;
    }
    vertex[s].d = 0;
    priority_queue<DijkstraVertex, vector<DijkstraVertex>, ascComparatorDijkVertex> q;
    q.push(vertex[s]);
    while(!q.empty()){
        DijkstraVertex dv = q.top();
        q.pop();
		if(vertex[dv.vertexNo].d < dv.d) continue;
        // cout<<"Popped: ";
        // dv.print();
        int size = adj[dv.vertexNo].size();
        for(int i=0; i<size; i++){
            if(vertex[adj[dv.vertexNo][i].first].d > dv.d + adj[dv.vertexNo][i].second){
                vertex[adj[dv.vertexNo][i].first].d = dv.d + adj[dv.vertexNo][i].second;
                vertex[adj[dv.vertexNo][i].first].p = dv.vertexNo;
                // cout<<"Pushing: ";
                // vertex[adj[dv.vertexNo][i].first].print();
                q.push(vertex[adj[dv.vertexNo][i].first]);
            }
        }
    }
    return vertex;
}
 
void printPath(vector<DijkstraVertex>& vertexes, int s, int t){
    vector<int> path;
    int tt = t;
    while(vertexes[t].p != -1){
        path.push_back(vertexes[t].p);
        t = vertexes[t].p;
    }
    reverse(path.begin(), path.end());
    int sz = path.size();
    for(int i=0; i<sz; i++)cout<<path[i]<<" -> ";
    cout<<tt<<endl;
}
 
int main()
{
    int n, m;
    cin>>n>>m; 
    vector<vector<pair<int, long long int> > > adj(n+1);
    for(int i=0; i<m; i++){
        int x, y;
        long long int w;
        cin>>x>>y>>w;
        adj[x].push_back(make_pair(y, w));
    }
 
    // for(int i=0; i<n; i++){
    //     cout<<i<<": ";
    //     for(int j=0; j<adj[i].size(); j++){
    //         cout<<adj[i][j].first<<"-"<<adj[i][j].second<<", ";
    //     }
    //     cout<<endl;
    // }
 
    int s, t;
    // cin>>s>>t;
    vector<DijkstraVertex> ans = dijkstra(n, adj, 1);
    for(int i=1; i<=n; i++){
        cout<<ans[i].d<<" ";
    }
    // for(int i=0; i<n; i++){
    //     ans[i].print();
    // }
    // cout<<"Shortest path cost: "<<ans[t].d<<endl;
    // printPath(ans, s, t);
}