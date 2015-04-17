// This is pretty slow..
#include <stdio.h>
#include <stdlib.h>

long summingSieve(int upper) {
    long sum = 0;
    int* values = calloc(upper, sizeof(int));
    for (int i = 2; i <= upper; i++) {
        for (int j = i + i; j <= upper; j = j + i) {
            values[j-1] = 1;
        }
        if (values[i-1] == 0) {
            sum += i;
        }
    }
    if (values[upper - 1] == 0) { 
        sum += upper;
    }
    return sum;
}

int main(int argc, char *argv) {
    int n = 2000000;
    long sum = summingSieve(n);
    printf("sum of primes below %d: %ld\n", n, sum);
    return 0;
}
