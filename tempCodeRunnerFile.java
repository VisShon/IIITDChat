package com.company;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Scanner;

class Main{
    static class BipGraph{
        int m;
        ArrayList<Integer>[] adj;
        int[] pairU, pairV, dist;

        static int hopcroftKarp(){
            pairU = new int[m + 1];
            pairV = new int[m + 1];
            dist = new int[m + 1];
            for (int i = 0; i <= m; i++)
                pairU[i] = 0;
            for (int i = 0; i <= m; i++)
                pairV[i] = 0;
            int result = 0;
            while (bfs()){
                for(int u = 1; u <= m; u++){
                    if ((pairU[u] == 0) && dfs(u)){
                        result++;
                    }
                }
            }
            return result;
        }
        static boolean bfs()
        {
            Queue<Integer> Q = new arrayDeque<Integer>();
            for(int u = 1; u <= m; u++)
            {
                if (pairU[u] == 0)
                {
                    dist[u] = 0;
                    Q.add(u);
                }
                else
                    dist[u] = Integer.MAX_VALUE;
            }
            dist[0] = Integer.MAX_VALUE;
            while (!Q.isEmpty())
            {
                int u = Q.poll();
                if (dist[u] < dist[0])
                {
                    for(int i : adj[u])
                    {
                        int v = i;
                        if (dist[pairV[v]] == Integer.MAX_VALUE)
                        {
                            dist[pairV[v]] = dist[u] + 1;
                            Q.add(pairV[v]);
                        }
                    }
                }
            }
            return (dist[0] != Integer.MAX_VALUE);
        }
        static boolean dfs(int u)
        {
            if (u != 0)
            {
                for(int i : adj[u])
                {
                    int v = i;
                    if (dist[pairV[v]] ==( dist[u] + 1))
                    {
                        if (dfs(pairV[v]) == true)
                        {
                            pairV[v] = u;
                            pairU[u] = v;
                            return true;
                        }
                    }
                }
     
                dist[u] = Integer.MAX_VALUE;
                return false;
            }
            return true;
        }

        public BipGraph(int m)
        {
            this.m = m;
            adj = new ArrayList[m + 1];
            Arrays.fill(adj, new ArrayList<>());
        }
        static void addEdge(int u, int v)
        {
            adj[u].add(v);
        }
    }

     public static void main(String[] args) throws IOException
    {
        Scanner sc = new Scanner(System.in);
        int t = sc.nextInt();
        int arr[][] = new int[t+1][t+1];
        int numZeroes = 0;
        // BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
        for(int i = 1; i <= t; i++) {
            String line = sc.next();
            for(int j = 1; j <= t; j++) {
                // System.out.println(j-1);
                arr[i][j] = line.charAt(j-1) - '0'; 
                // System.out.print(arr[i][j]+" ");
                if(arr[i][j] == 0) {
                    numZeroes++;
                }
            }
        }
        for(int i = 1; i <= t; i++) {
            for(int j = 1; j <= t; j++) {
                System.out.print(arr[i][j]+" ");
            }
            System.out.println();
        }
        BipGraph g = new BipGraph(t*t);
     
        for(int i=1; i<=t; i++){
            for(int j=1; j<=t; j++){
                if(arr[i][j]==1 && ((i+j)%2)==0){
                    if(i-1>=1 && (arr[i-1][j]==1)){
                        g.addEdge((i-1)*t + j, (i-2)*t + j);
                    }
                    if(j-1>=1 && (arr[i][j-1]==1)){
                        g.addEdge((i-1)*t + j, (i-1)*t + j-1);
                    }
                    if(i+1<=t && (arr[i+1][j]==1)){
                        g.addEdge((i-1)*t + j, (i)*t + j);
                    }
                    if(j+1<=t && (arr[i][j+1]==1)){
                        g.addEdge((i-1)*t+j, (i-1)*t+j+1);
                    }
                }
            }
        }
        int n=t;
        if((n*n - numZeroes) % 2 == 0) {
            int ans = g.hopcroftKarp();
            if(ans == ((n*n) - numZeroes)/2){
                System.out.println(1);
                System.out.println(ans);
                for(int i = 1;i<= g.m;i++){
                    if(g.pairU[i] != 0){
                        // System.out.println(i + " " + g.pairU[i]);
                        if((i%n) == 0){ 
                            int temp = i/n;
                            System.out.print(temp+" ");
                            System.out.print(n+" ");
                        }else{
                            int temp1 = (i/n)+1;
                            int temp2 = (i%n);
                            System.out.print(temp1+" ");
                            System.out.print(temp2+" ");
                        }
                        if((g.pairU[i]%n)==0){
                            int temp = g.pairU[i]/n;
                            System.out.print(temp+" ");
                            System.out.println(n);
                      
                        }else{
                            int temp1 = (g.pairU[i]/n)+1;
                            int temp2 = (g.pairU[i]%n);
                            System.out.print(temp1+" ");
                            System.out.println(temp2);
                          
                        }

                    }
                }
            }else{
                System.out.println(0);
            }


        }else{
            System.out.println(0);
        }
                //    g.hopcroftKarp());
    }
}
    