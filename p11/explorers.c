#include <stdio.h>
#include "explorers.h"

int up(int** data, int x, int y, int xmax, int ymax) {
    int product = 1;
    for (int count = 0; count < 4; count++) {
        int value;
        if (y - count < 0) { value = 1; } else { value = data[x][y - count]; }
        product = product * value;
    }
    return product;
}

int down(int** data, int x, int y, int xmax, int ymax) {
    int product = 1;
    for (int count = 0; count < 4; count++) {
        int value;
        if (y + count >= ymax) { value = 1; } else { value = data[x][y + count]; }
        product = product * value;
    }
    return product;
}

int left(int** data, int x, int y, int xmax, int ymax) {
    int product = 1;
    for (int count = 0; count < 4; count++) {
        int value;
        if (x - count < 0) { value = 1; } else { value = data[x - count][y]; }
        product = product * value;
    }
    return product;
}

int right(int** data, int x, int y, int xmax, int ymax) {
    int product = 1;
    for (int count = 0; count < 4; count++) {
        int value;
        if (x + count >= xmax) { value = 1; } else { value = data[x + count][y]; }
        product = product * value;
    }
    return product;
}

int d_left(int** data, int x, int y, int xmax, int ymax) {
    int product = 1;
    for (int count = 0; count < 4; count++) {
        int value;
        if (y + count >= ymax || x - count < 0) {
            value = 1;
        } else {
            value = data[x - count][y + count];
        }
        product = product * value;
    }
    return product;
}

int d_right(int** data, int x, int y, int xmax, int ymax) {
    int product = 1;
    for (int count = 0; count < 4; count++) {
        int value;
        if (y + count >= ymax || x + count >= xmax){
            value = 1;
        } else { 
            value = data[x + count][y + count];
        }
        product = product * value;
    }
    return product;
}
