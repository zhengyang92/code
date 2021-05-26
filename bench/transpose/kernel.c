

void transpose(int rA[64][64], int n)
{
     int i, j;

     for (i = 1; i < n; ++i) {
#pragma unroll 8
       for (j = 0; j < i; ++j) {
         int temp;

         temp = rA[j][i];
         rA[j][i] = rA[i][j];
         rA[i][j] = temp;
       }
     }
}
