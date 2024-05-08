

__global__ void add (float *A, float *B, float *C) {
    int i = threadIdx.x;

    C[i] = A[i] + B[i];
}