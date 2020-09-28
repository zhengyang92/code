// test auto-vectorization


float Foo(const float input[], int n) {
  float acc = 0.f;
  for (int i = 0; i < n; ++i ) {
    acc += input[i];
  }
  return acc;
}
