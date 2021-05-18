; ModuleID = 'matrixTranspose-simplified.c'

declare <4 x i32> @llvm.masked.gather.v4i32(<4 x i32*>, i32, <4 x i1>, <4 x i32>)
declare void @llvm.masked.scatter.v4i32(<4 x i32>, <4 x i32*>, i32, <4 x i1>)

; Function Attrs: nofree norecurse nounwind uwtable
define dso_local void @transpose([64 x i32]* nocapture %rA, i32 %n) local_unnamed_addr #0 {
entry:
  %cmp39 = icmp sgt i32 %n, 1
  br i1 %cmp39, label %for.cond1.preheader.preheader, label %for.end20

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count43 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc18, %for.cond1.preheader.preheader
  %indvar = phi i64 [ %indvar.next, %for.inc18 ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.inc18 ], [ 1, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvar, 1
  %xtraiter = and i64 %0, 3
  %1 = icmp ult i64 %indvar, 3
  br i1 %1, label %for.inc18.unr-lcssa, label %for.cond1.preheader.new

for.cond1.preheader.new:                          ; preds = %for.cond1.preheader
  %unroll_iter = sub i64 %0, %xtraiter
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader.new
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.new ], [ %indvars.iv.next.3, %for.body3 ]
  %niter = phi i64 [ %unroll_iter, %for.cond1.preheader.new ], [ %niter.nsub.3, %for.body3 ]
  %indvars.iv.32 = trunc i64 %indvars.iv to i32
  %indvars = insertelement <4 x i32> undef, i32 %indvars.iv.32, i32 0
  %indvars.broadcast = shufflevector <4 x i32> %indvars, <4 x i32> undef, <4 x i32> <i32 0, i32 0, i32 0, i32 0>
  %indvars.vec = or <4 x i32> %indvars.broadcast, <i32 0, i32 1, i32 2, i32 3>

  %arrayidx.ptr.col = getelementptr inbounds [64 x i32], [64 x i32]* %rA,  <4 x i32> %indvars.vec, i64 %indvars.iv41
  %arrayidx.ptr.row = getelementptr inbounds [64 x i32], [64 x i32]* %rA,  i64 %indvars.iv41, <4 x i32> %indvars.vec
  %arrayidx = call <4 x i32> @llvm.masked.gather.v4i32(<4 x i32*> %arrayidx.ptr.col,  i32 0, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x i32> undef), !tbaa !2
  %arrayidx2 = call <4 x i32> @llvm.masked.gather.v4i32(<4 x i32*> %arrayidx.ptr.row, i32 0, <4 x i1> <i1 true, i1 true, i1 true, i1 true>, <4 x i32> undef), !tbaa !2
  call void @llvm.masked.scatter.v4i32(<4 x i32> %arrayidx, <4 x i32*> %arrayidx.ptr.row,  i32 0, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !2
  call void @llvm.masked.scatter.v4i32(<4 x i32> %arrayidx2, <4 x i32*> %arrayidx.ptr.col,  i32 0, <4 x i1> <i1 true, i1 true, i1 true, i1 true>), !tbaa !2
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.nsub.3 = add i64 %niter, -4
  %niter.ncmp.3 = icmp eq i64 %niter.nsub.3, 0
  br i1 %niter.ncmp.3, label %for.inc18.unr-lcssa, label %for.body3

for.inc18.unr-lcssa:                              ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3, %for.body3 ]
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc18, label %for.body3.epil

for.body3.epil:                                   ; preds = %for.inc18.unr-lcssa, %for.body3.epil
  %indvars.iv.epil = phi i64 [ %indvars.iv.next.epil, %for.body3.epil ], [ %indvars.iv.unr, %for.inc18.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.sub, %for.body3.epil ], [ %xtraiter, %for.inc18.unr-lcssa ]
  %arrayidx5.epil = getelementptr inbounds [64 x i32], [64 x i32]* %rA, i64 %indvars.iv.epil, i64 %indvars.iv41
  %2 = load i32, i32* %arrayidx5.epil, align 4, !tbaa !2
  %arrayidx9.epil = getelementptr inbounds [64 x i32], [64 x i32]* %rA, i64 %indvars.iv41, i64 %indvars.iv.epil
  %3 = load i32, i32* %arrayidx9.epil, align 4, !tbaa !2
  store i32 %3, i32* %arrayidx5.epil, align 4, !tbaa !2
  store i32 %2, i32* %arrayidx9.epil, align 4, !tbaa !2
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.sub = add i64 %epil.iter, -1
  %epil.iter.cmp = icmp eq i64 %epil.iter.sub, 0
  br i1 %epil.iter.cmp, label %for.inc18, label %for.body3.epil, !llvm.loop !6

for.inc18:                                        ; preds = %for.body3.epil, %for.inc18.unr-lcssa
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond44, label %for.end20, label %for.cond1.preheader

for.end20:                                        ; preds = %for.inc18, %entry
  ret void
}



!llvm.module.flags = !{!0}
!llvm.ident = !{!1}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{!"clang version 10.0.1 (https://github.com/llvm/llvm-project.git ef32c611aa214dea855364efd7ba451ec5ec3f74)"}
!2 = !{!3, !3, i64 0}
!3 = !{!"int", !4, i64 0}
!4 = !{!"omnipotent char", !5, i64 0}
!5 = !{!"Simple C/C++ TBAA"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
