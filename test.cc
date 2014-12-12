#include<iostream>
#include<string>
#include<vector>
#include<queue>
#include<stdlib.h>
#include<time.h>
using namespace std;

int root;
int *path;
void generate(int n,int e,char **edge)
{
    for (int i = 1;i<n;i++)
    {
	int j = rand() % i;
	edge[i][j] = 1;
	edge[j][i] = 1;
    }
    for (int i = 0;i< e - n + 1; i++)
    {
	int end = rand() % n;
	int head = rand() % n;
	while (head == end || edge[end][head] == 1)
	{
	    end = rand() % n;
	    head = rand()% n;
	}

	edge[end][head] = 1;
	edge[head][end] = 1;

    }

    return;
}
int min_bfst(int n, int e, char **edge)
{
    int time;
    char **recieve_table;
    vector<int> *candidate;
    vector<int> *broadcast_list;
    int time0;
    queue<int> waiting_list;
    time = 0;
    path = new int[n];
    recieve_table = new char*[n];
    for (int i = 0; i<n; i++)
    {
	recieve_table[i] = new char[n];
	path[i] = -1;
	for (int j = 0; j<n; j++)
	    recieve_table[i][j] = 0;
	recieve_table[i][i] = 1;
    }
    candidate = new vector<int>[n];
    broadcast_list = new vector<int>[n];
    time0 = 0;

    while (time0 == 0)
    {
	int i;
	int temp;
	int nn;

	/// Update Phase
	if (time == 0)
	    for (i = 0; i < n; i++)
	    {
		broadcast_list[i].push_back(i);
	    }
	else if (time0 == 0)
	    for (i = 0; i < n; i++)
	    {
		nn = 0;
		while (!candidate[i].empty()) {

		    temp = candidate[i][candidate[i].size()-1];

		    candidate[i].pop_back();
		    if (temp != i && recieve_table[i][temp] == 0)
		    {
			nn+=1;
			recieve_table[i][temp] = 1;
			broadcast_list[i].push_back(temp);
		    }

		}
		if (nn == 0 && time0 == 0)
		{

		    root = i;
		    time0 = time;
		    waiting_list.push(i);

		}
	    }

	/// Broadcast phase
	if (time0==0)
	    for (i = 0; i< n; i++)
	    {
		for (int j = 0; j < n; j++)
		    if (edge[i][j])
			candidate[j].insert(candidate[j].end(),
				broadcast_list[i].begin(),broadcast_list[i].end());
		broadcast_list[i].clear();
	    }
	else
	    while (!waiting_list.empty())
	    {
		i = waiting_list.front();
		waiting_list.pop();
		for (int j = 0; j < n; j++)
		    if (path[j] == -1 &&edge[i][j])
		    {
			path[j] = i;
			waiting_list.push(j);
		    }
	    }


	time += 1;
    }
    delete[]candidate;
    delete[]broadcast_list;
    for (int i = 0; i<n; i++)
	delete[]recieve_table[i];
    delete[]recieve_table;
    return time0;

}
int eval_qu(int n, int e, char **edge)
{
    int *pack, *pack_update;
    int i;
    int time = 0;
    pack = new int[n];
    pack_update = new int[n];
    for (i = 0; i < n; i++)
    {
	pack_update[i] = 0;
	pack[i] = 1;
    }
    while (pack[root] != n){

	for (i = 0; i< n; i++)
	    if (pack[i] > 0 && i != root)
	    {
		pack[i] = pack[i] - 1;
		pack_update[path[i]]++;
	    }
	for (i = 0; i < n; i++)
	{
	    pack[i] += pack_update[i];
	    pack_update[i] = 0;
	}
	time++;
    }
    delete[]pack;
    delete[]pack_update;
    return time;
}
int eval_luk(int n, int e, char **edge)
{
    int *pack, *pack_update;
    int i;
    int time = 0;
    bool flag = 1;
    pack = new int[n];
    pack_update = new int[n];
    for (i = 0; i < n; i++)
    {
	pack_update[i] = 0;
	pack[i] = 1;
    }
    while (flag){

	for (i = 0; i< n; i++)
	    if (pack[i] > 0 && i != root )
	    {
		pack[i] = pack[i] - 1;
		pack_update[path[i]]++;
	    }
	for (i = 0; i < n; i++)
	{
	    pack[i] += pack_update[i];
	    pack[i] = pack[i]/2+pack[i] % 2;
	    pack_update[i] = 0;
	}
	time++;
	flag = 0;
	for (i = 0; i<n;i++)
	    if(i != root && pack[i] >0)
		flag = 1;
	if (pack[root] >1)
	    flag = 1;

    }
    delete[]pack;
    delete[]pack_update;
    return time;
}
int main(int argc,char **argv)
{
    int n,e,seed;
    double par;

    cin >> n >> par >>seed;
    e = int(n-1+(n-2)*(n-1)*par/2);

    char **edge;
    edge = new char*[n];
    for (int i = 0; i<n; i++)
    {
	edge[i] = new char[n];
	for (int j = 0; j<n; j++)
	    edge[i][j] = 0;
    }
    srand (seed);
    generate(n,e,edge);

    int depth;
    depth = min_bfst(n,e,edge) - 1;



    int time_qu,time_luk;
    time_qu = eval_qu(n,e,edge);
    time_luk = eval_luk(n,e,edge);

    cout << depth << ' ' << time_qu << ' ' << time_luk << endl;

    delete[]path;
    for (int i = 0; i<n; i++)
	delete[]edge[i];
    delete[]edge;
    return 0;
}
