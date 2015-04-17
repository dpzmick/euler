#include <stdlib.h>
#include <stdio.h>
#include "mpi.h"
#include "file.h"
#include "explorers.h"

int max_array(int a[], int num_elements)
{
   int i, max=-32000;
   for (i=0; i<num_elements; i++)
   {
	if (a[i]>max)
	{
	    max=a[i];
	}
   }
   return(max);
}

int main(int argc, char **argv) {
    FILE *fp = fopen("new.dat", "r");
    int xmax, ymax;
    int **data;
    
    load_max(fp, &xmax, &ymax);
    
    data = (int**) malloc(xmax * sizeof(int*));
    for (int x = 0; x < xmax; x++) {
        data[x] = calloc(ymax, sizeof(int));
    }

    load_data(fp, xmax, ymax, data);

    int max = 0;
    for (int x = 0; x < xmax; x++) {
        #pragma omp parallel for
        for (int y = 0; y < ymax; y++) {
            // check up, down, left, right, down_diag left, down_diag right
            int values[5];
            values[0] = up(data,x,y,xmax,ymax);
            values[1] = down(data,x,y,xmax,ymax);
            values[2] = left(data,x,y,xmax,ymax);
            values[3] = d_left(data,x,y,xmax,ymax);
            values[4] = d_right(data,x,y,xmax,ymax);
            int max_tmp = max_array(values, 5);
            if (max_tmp > max) { max = max_tmp; }
        }
    }
    
    printf("%d\n", max);
    free(data);
    return 0;
}
