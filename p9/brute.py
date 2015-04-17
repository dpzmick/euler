import math

def is1000(a,b,c):
    return a+b+c==1000

def isTriple(a,b,c):
    return c == math.sqrt(float(a)*float(a) + float(b)*float(b))

max = 1000

for a in range(1,max):
    for b in range(1,max):
        for c in range(1,max):
            if isTriple(a,b,c) and is1000(a,b,c):
                print a,b,c
