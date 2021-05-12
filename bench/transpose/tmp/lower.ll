declare <4 x i32> @llvm.masked.gather.v4i32(<4 x i32*> %ptrs, i32 %align, <4 x i1> %masks, <4 x i32> %passthro)
declare void @llvm.masked.scatter.v4i32(<4 x i32>, <4 x i32*>, i32, <4 x i1>)

define <4 x i32> @masked_gather_v4i32([64 x i32]* %rA, i64 %indvars.iv, i64 %indvars.iv41) {
; X86-LABEL: masked_gather_v4i32:
; X86:       # %bb.0: # %entry
; X86-NEXT:    vpslld $31, %xmm1, %xmm1
; X86-NEXT:    vpgatherdd %xmm1, (,%xmm0), %xmm2
; X86-NEXT:    vmovdqa %xmm2, %xmm0
; X86-NEXT:    retl
;
; X64-LABEL: masked_gather_v4i32:
; X64:       # %bb.0: # %entry
; X64-NEXT:    vpslld $31, %xmm1, %xmm1
; X64-NEXT:    vpgatherqd %xmm1, (,%ymm0), %xmm2
; X64-NEXT:    vmovdqa %xmm2, %xmm0
; X64-NEXT:    vzeroupper
; X64-NEXT:    retq
;
; NOGATHER-LABEL: masked_gather_v4i32:
; NOGATHER:       # %bb.0: # %entry
; NOGATHER-NEXT:    vpslld $31, %xmm1, %xmm1
; NOGATHER-NEXT:    vmovmskps %xmm1, %eax
; NOGATHER-NEXT:    testb $1, %al
; NOGATHER-NEXT:    je .LBB4_2
; NOGATHER-NEXT:  # %bb.1: # %cond.load
; NOGATHER-NEXT:    vmovq %xmm0, %rcx
; NOGATHER-NEXT:    vpinsrd $0, (%rcx), %xmm2, %xmm2
; NOGATHER-NEXT:  .LBB4_2: # %else
; NOGATHER-NEXT:    testb $2, %al
; NOGATHER-NEXT:    je .LBB4_4
; NOGATHER-NEXT:  # %bb.3: # %cond.load1
; NOGATHER-NEXT:    vpextrq $1, %xmm0, %rcx
; NOGATHER-NEXT:    vpinsrd $1, (%rcx), %xmm2, %xmm2
; NOGATHER-NEXT:  .LBB4_4: # %else2
; NOGATHER-NEXT:    vextractf128 $1, %ymm0, %xmm0
; NOGATHER-NEXT:    testb $4, %al
; NOGATHER-NEXT:    jne .LBB4_5
; NOGATHER-NEXT:  # %bb.6: # %else5
; NOGATHER-NEXT:    testb $8, %al
; NOGATHER-NEXT:    jne .LBB4_7
; NOGATHER-NEXT:  .LBB4_8: # %else8
; NOGATHER-NEXT:    vmovdqa %xmm2, %xmm0
; NOGATHER-NEXT:    vzeroupper
; NOGATHER-NEXT:    retq
; NOGATHER-NEXT:  .LBB4_5: # %cond.load4
; NOGATHER-NEXT:    vmovq %xmm0, %rcx
; NOGATHER-NEXT:    vpinsrd $2, (%rcx), %xmm2, %xmm2
; NOGATHER-NEXT:    testb $8, %al
; NOGATHER-NEXT:    je .LBB4_8
; NOGATHER-NEXT:  .LBB4_7: # %cond.load7
; NOGATHER-NEXT:    vpextrq $1, %xmm0, %rax
; NOGATHER-NEXT:    vpinsrd $3, (%rax), %xmm2, %xmm2
; NOGATHER-NEXT:    vmovdqa %xmm2, %xmm0
; NOGATHER-NEXT:    vzeroupper
; NOGATHER-NEXT:    retq
entry:
  %indvars.iv.next = or i64 %indvars.iv, 1
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %indvars1 = insertelement <4 x i64> undef, i64 %indvars.iv, i32 0
  %indvars2 = insertelement <4 x i64> %indvars1, i64 %indvars.iv.next, i32 1
  %indvars3 = insertelement <4 x i64> %indvars2, i64 %indvars.iv.next.1, i32 2
  %indvars.vec = insertelement <4 x i64> %indvars3, i64 %indvars.iv.next.2, i32 3
  %arrayidx.ptr = getelementptr inbounds [64 x i32], [64 x i32]* %rA,  <4 x i64> %indvars.vec, i64 %indvars.iv41
  %arrayidx2.ptr = getelementptr inbounds [64 x i32], [64 x i32]* %rA,  i64 %indvars.iv41,  <4 x i64> %indvars.vec
  %res = call <4 x i32> @llvm.masked.gather.v4i32(<4 x i32*> %arrayidx.ptr, i32 0,  <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x i32> undef)
  call void @llvm.masked.scatter.v4i32(<4 x i32> %res, <4 x i32*> %arrayidx2.ptr,  i32 0, <4 x i1> <i1 true, i1 true, i1 true, i1 true>)
  ret <4 x i32> %res
}