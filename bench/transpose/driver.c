
typedef int fftw_real;
int rA[128][128];

extern void complex_transpose(int **, int);


int main(int argc, char **argv)
{
     int i;

     fftw_real sum = 0;
     for (i = 0; i < 16384; ++i) {
       *((int *)rA + i)= i;
       sum = sum + *((int *)rA + i);
     }
     printf("Matrix before: A[0][0] = %d, A[0][1] = %d, A[1][0] = %d, A[1][1] = %d\n", rA[0][0], rA[0][1], rA[1][0], rA[1][1]);
     printf("Checksum before = %d\n", sum);

      for (int i = 0 ; i < 1000001; i ++)
     complex_transpose(rA, 128);

     sum = 0;
     for (i = 0; i < 16384; ++i)
       sum = sum + *((int *)rA + i);

     printf("Matrix after: A[0][0] = %d, A[0][1] = %d, A[1][0] = %d, A[1][1] = %d\n", rA[0][0], rA[0][1], rA[1][0], rA[1][1]);
     printf("Checksum  after = %d\n", sum);

     return 0;
}
