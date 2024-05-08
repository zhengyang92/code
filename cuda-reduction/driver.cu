#include "stdio.h"

__global__ void add (float *A, float *B, float *C) {
    int i = blockIdx.x * 1024 + threadIdx.x;

    C[i] = A[i] + B[i];
}


int main() {

  int N = 1<<30;
  float *x, *y, *z, *d_x, *d_y, *d_z;
  x = (float*)malloc(N*sizeof(float));
  y = (float*)malloc(N*sizeof(float));
  z = (float*)malloc(N*sizeof(float));

  cudaMalloc(&d_x, N*sizeof(float));
  cudaMalloc(&d_y, N*sizeof(float));
  cudaMalloc(&d_z, N*sizeof(float));

  for (int i = 0; i < N; i++) {
    x[i] = 1.0f;
    y[i] = 5.0f;
  }

  cudaMemcpy(d_x, x, N*sizeof(float), cudaMemcpyHostToDevice);
  cudaMemcpy(d_y, y, N*sizeof(float), cudaMemcpyHostToDevice);

  add<<<(N+1023)/1024, 1024>>>(d_x, d_y, d_z);


  cudaMemcpy(z, d_z, N*sizeof(float), cudaMemcpyDeviceToHost);

  float maxError = 0.0f;
  for (int i = 0; i < N; i++) {
    maxError = max(maxError, abs(z[i]-5.0f));
  }
  printf("Max error: %f\n", maxError);

  cudaFree(d_x);
  cudaFree(d_y);
  cudaFree(d_z);

  free (x);
  free (y);
  free (z);


}