// RUN: ~/work/llvm-project/build/bin/clang compilesimd.c -march=skx -o -emit-llvm  -S -emit-llvm  -o - -O3

#include <immintrin.h>

__m128i test_mm_hsub_epi32(__m128i a, __m128i b, __m128i c) {
  // CHECK-LABEL: test_mm_hsub_epi32
  // CHECK: call <4 x i32> @llvm.x86.ssse3.phsub.d.128(<4 x i32> %{{.*}}, <4 x i32> %{{.*}})
  return _mm_avg_epu16(_mm_add_epi16(a, c), _mm_add_epi16(b, c)) ;
}


/*

liuz@wework:~/code$ ~/work/llvm-project/build/bin/clang compilesimd.c -march=skx -o -emit-llvm  -S -emit-llvm  -o - -O3
clang-11: warning: Unknown CUDA version 10.2. Assuming the latest supported version 10.1 [-Wunknown-cuda-version]
; ModuleID = 'compilesimd.c'
source_filename = "compilesimd.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: nounwind readnone uwtable
define dso_local <2 x i64> @test_mm_hsub_epi32(<2 x i64> %a, <2 x i64> %b, <2 x i64> %c) local_unnamed_addr #0 {
entry:
  %0 = bitcast <2 x i64> %a to <8 x i16>
  %1 = bitcast <2 x i64> %c to <8 x i16>
  %add.i = add <8 x i16> %1, %0
  %2 = bitcast <2 x i64> %b to <8 x i16>
  %add.i4 = add <8 x i16> %1, %2
  %3 = tail call <8 x i16> @llvm.x86.sse2.pavg.w(<8 x i16> %add.i, <8 x i16> %add.i4) #2
  %4 = bitcast <8 x i16> %3 to <2 x i64>
  ret <2 x i64> %4
}

; Function Attrs: nounwind readnone
declare <8 x i16> @llvm.x86.sse2.pavg.w(<8 x i16>, <8 x i16>) #1

attributes #0 = { nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "denormal-fp-math"="ieee,ieee" "denormal-fp-math-f32"="ieee,ieee" "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="128" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="skx" "target-features"="+adx,+aes,+avx,+avx2,+avx512bw,+avx512cd,+avx512dq,+avx512f,+avx512vl,+bmi,+bmi2,+clflushopt,+clwb,+cx16,+cx8,+f16c,+fma,+fsgsbase,+fxsr,+invpcid,+lzcnt,+mmx,+movbe,+pclmul,+pku,+popcnt,+prfchw,+rdrnd,+rdseed,+sahf,+sse,+sse2,+sse3,+sse4.1,+sse4.2,+ssse3,+x87,+xsave,+xsavec,+xsaveopt,+xsaves" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 11.0.0 (git@github.com:llvm/llvm-project 1d49eb00d97a8e920ae34ff433419d0cd61641fd)"}

*/
