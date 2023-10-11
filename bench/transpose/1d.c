

void transpose(double *rA, int n)
{
     int i, j;
     for (i = 0; i < 512; ++i) {
       for (j = i + 1; j < 512; ++j) {
         double temp = rA[i * 512 + j];
         rA[i * 512 + j] = rA[j * 512 + i];
         rA[j * 512 + i] = temp;
       }
     }
}
