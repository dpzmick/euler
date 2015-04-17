import math
# implementation using Sieve of Eratosthenes

# performs sieve from 1 to n, returns all primes
def sieve(n):
    lst = [True for x in range(1,n+1)]
    for x in range(2,n):
        y = x + x
        while y <= n:
            lst[y-1] = False
            y = y + x
    ret = []
    for i, num in enumerate(lst):
        if num:
            ret.append(i+1)
    return ret

# approximate upper bound
n = 10001
upper = int(math.floor(n*(math.log(n) + math.log(math.log(n)))))
print sieve(upper)[n]
