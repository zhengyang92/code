; ModuleID = 'kernel.c'
source_filename = "kernel.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

declare <8 x i32> @llvm.masked.gather.v8i32(<8 x i32*>, i32, <8 x i1>, <8 x i32>)
declare void @llvm.masked.scatter.v8i32(<8 x i32>, <8 x i32*>, i32, <8 x i1>)

; Function Attrs: nofree norecurse nosync nounwind uwtable
define dso_local void @transpose([512 x i32]* nocapture %rA, i32 %n) local_unnamed_addr #0 {
entry:
  %cmp39 = icmp sgt i32 %n, 1
  br i1 %cmp39, label %for.cond1.preheader.preheader, label %for.end20

for.cond1.preheader.preheader:                    ; preds = %entry
  %0 = add nsw i32 %n, -1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc18
  %indvars.iv41 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next42, %for.inc18 ]
  %indvar = phi i32 [ 0, %for.cond1.preheader.preheader ], [ %1, %for.inc18 ]
  %1 = add nuw nsw i32 %indvar, 1
  %xtraiter = and i32 %1, 7
  %2 = icmp ult i32 %indvar, 7
  br i1 %2, label %for.inc18.unr-lcssa, label %for.cond1.preheader.new

for.cond1.preheader.new:                          ; preds = %for.cond1.preheader
  %unroll_iter = and i32 %1, 2147483640
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader.new
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.new ], [ %indvars.iv.next.7, %for.body3 ]
  %niter = phi i32 [ %unroll_iter, %for.cond1.preheader.new ], [ %niter.nsub.7, %for.body3 ]

  %indvars = insertelement <8 x i64> undef, i64 %indvars.iv, i32 0
  %indvars.broadcast = shufflevector <8 x i64> %indvars, <8 x i64> undef, <8 x i32> <i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0>
  %indvars.vec = or <8 x i64> %indvars.broadcast, <i64 0, i64 1, i64 2, i64 3, i64 4, i64 5, i64 6, i64 7>

  %arrayidx.ptr.col = getelementptr inbounds [512 x i32], [512 x i32]* %rA,  <8 x i64> %indvars.vec, i64 %indvars.iv41
  %arrayidx.ptr.row.1 = getelementptr inbounds [512 x i32], [512 x i32]* %rA,  i64 %indvars.iv41
  %arrayidx.ptr.row = bitcast [512 x i32]* %arrayidx.ptr.row.1 to <8 x i32>*
  
  %rows = load <8 x i32>, <8 x i32>* %arrayidx.ptr.row
  %cols = call <8 x i32> @llvm.masked.gather.v8i32(<8 x i32*> %arrayidx.ptr.col,  i32 0, <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <8 x i32> undef), !tbaa !3
  store <8 x i32>%cols, <8 x i32>* %arrayidx.ptr.row
  call void @llvm.masked.scatter.v8i32(<8 x i32> %rows, <8 x i32*> %arrayidx.ptr.col,  i32 0,  <8 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>), !tbaa !3
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %niter.nsub.7 = add i32 %niter, -8
  %niter.ncmp.7.not = icmp eq i32 %niter.nsub.7, 0
  br i1 %niter.ncmp.7.not, label %for.inc18.unr-lcssa, label %for.body3, !llvm.loop !7

for.inc18.unr-lcssa:                              ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.7, %for.body3 ]
  %lcmp.mod.not = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.inc18, label %for.body3.epil

for.body3.epil:                                   ; preds = %for.inc18.unr-lcssa, %for.body3.epil
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for.body3.epil ], [ %indvars.iv.unr, %for.inc18.unr-lcssa ]
  %epil.iter = phi i32 [ %epil.iter.sub, %for.body3.epil ], [ %xtraiter, %for.inc18.unr-lcssa ]
  %arrayidx5.epil = getelementptr inbounds [512 x i32], [512 x i32]* %rA, i64 %indvars.iv.epil, i64 %indvars.iv41
  %3 = load i32, i32* %arrayidx5.epil, align 4, !tbaa !3
  %arrayidx9.epil = getelementptr inbounds [512 x i32], [512 x i32]* %rA, i64 %indvars.iv41, i64 %indvars.iv.epil
  %4 = load i32, i32* %arrayidx9.epil, align 4, !tbaa !3
  store i32 %4, i32* %arrayidx5.epil, align 4, !tbaa !3
  store i32 %3, i32* %arrayidx9.epil, align 4, !tbaa !3
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add nsw i32 %epil.iter, -1
  %epil.iter.cmp.not = icmp eq i32 %epil.iter.sub, 0
  br i1 %epil.iter.cmp.not, label %for.inc18, label %for.body3.epil, !llvm.loop !10

for.inc18:                                        ; preds = %for.body3.epil, %for.inc18.unr-lcssa
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond.not = icmp eq i32 %1, %0
  br i1 %exitcond.not, label %for.end20, label %for.cond1.preheader, !llvm.loop !11

for.end20:                                        ; preds = %for.inc18, %entry
  ret void
}

attributes #0 = { nofree norecurse nosync nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"clang version 13.0.0 (git@github.com:llvm/llvm-project d63860a05226d89f840a665134e2cb52c30ce4c4)"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = distinct !{!7, !8, !9}
!8 = !{!"llvm.loop.mustprogress"}
!9 = !{!"llvm.loop.unroll.disable"}
!10 = distinct !{!10, !9}
!11 = distinct !{!11, !8}
