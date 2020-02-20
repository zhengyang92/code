// RUN: ~/work/llvm-project/build/bin/clang compilesimd.c -march=skx -o -emit-llvm  -S -emit-llvm  -o - -O3

#include <immintrin.h>

__m128i test_mm_hsub_epi32(__m128i a, __m128i b, __m128i c) {
  // CHECK-LABEL: test_mm_hsub_epi32
  // CHECK: call <4 x i32> @llvm.x86.ssse3.phsub.d.128(<4 x i32> %{{.*}}, <4 x i32> %{{.*}})
  return _mm_avg_epu16(_mm_add_epi16(a, c), _mm_add_epi16(b, c)) ;
}
