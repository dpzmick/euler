#include "file.h"

void load_max(FILE *fp, int *xmax, int *ymax) {
    char tmp[7];
    fgets(tmp, 7, fp); //4 to keep new line
    *xmax = atoi(tmp);
    fgets(tmp, 7, fp);
    *ymax = atoi(tmp);
}

int **load_data(FILE *fp, int xmax, int ymax, int **data) {
    char tmp[3];
    for (int y = 0; y < ymax; y++) {
        // load xmax integers, seperated by spaces
        for (int x = 0; x < xmax; x++) {
            for (int i = 0; i < 3; i++) {
                tmp[i] = fgetc(fp);
            }
            data[x][y] = atoi(tmp);
            //printf("%d ", data[x][y]);
        }
        //printf("\n");
    }
}
