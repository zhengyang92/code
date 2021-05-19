
#include "stdio.h"
#define SIZE 64
#define ENABLE_CHECKSUM
int rA[SIZE][SIZE];

extern void transpose(int **, int);




int main(int argc, char **argv)
{
    int i;
    int sum = 0;

    for (i = 0; i < SIZE * SIZE; ++i) {
      *((int *)rA + i)= i;
      sum = sum + *((int *)rA + i);
    }

    printf("Checksum before = %d\n", sum);
    printf("Matrix before: A[0][0] = %d, A[0][1] = %d, A[1][0] = %d, A[1][1] = %d\n", rA[0][0], rA[0][1], rA[1][0], rA[1][1]);
    for (int i = 0 ; i < 1000001; i ++)
      transpose((int **)rA, SIZE);


    sum = 0;
    for (i = 0; i < SIZE * SIZE; ++i)
      sum = sum + *((int *)rA + i);
    printf("Checksum  after = %d\n", sum);
    printf("Matrix after: A[0][0] = %d, A[0][1] = %d, A[1][0] = %d, A[1][1] = %d\n", rA[0][0], rA[0][1], rA[1][0], rA[1][1]);

    return 0;
}
