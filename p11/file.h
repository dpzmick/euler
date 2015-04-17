#include <stdio.h>
#include <stdlib.h>

#ifndef LOAD_MAX
#define LOAD_MAX
void load_max(FILE*, int*, int*);
#endif

// load a file in format:
// line 1: xmax
// line 2: ymax
// d11 d12 d13 ... dxmax1
// d21 d22 d21 ... dxmax2
// .
// ...............dxmaxymax
//
// xmax and ymax must be two digit numbers
int **load_data(FILE*, int, int, int**);
