#! /usr/bin/python

import os

os.system("rm result")

times = 100
n = [25,100,800]
par = [0.025*i for i in range(41)]

res = [0 for i in range(41)]

for i in range(3):
    for j in range(41):
        for k in range(times):
            os.system("echo "+str(n[i])+" "+str(par[j])+ " " + str(k)+"|./test >> result")

file1 = open("result",'r')
i=0
res = [0.0,0.0,0.0]
for line in file1:
    a=line.split()
    res[0] += int(a[0])
    res[1] += int(a[1])
    res[2] += int(a[2])
    i += 1
    if i==times:
        i = 0
        print res[0]/times,res[1]/times,res[2]/times
        print
        res = [0.0,0.0,0.0]
file1.close()
