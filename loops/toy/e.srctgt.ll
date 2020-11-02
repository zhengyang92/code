define void @src(i8 %arg1) {
entry:
  br label %bb
bb:
  %p = phi i8 [ %tmp1, %bb5 ], [1, %entry]
  %c = icmp eq i8 %p, %arg1
  %tmp1 = add nuw nsw i8 %p, 16
  %tmp2 = icmp eq i8 %tmp1, %arg1
  br i1 %c, label %bb4, label %bb3

bb3:
  br label %bb4
bb4:
  %phi = phi i8 [ 1, %bb3 ], [3, %bb]
  br label %bb5
bb5:
  br i1 %tmp2, label %bb19, label %bb
bb19:
  ret void
}


define void @tgt(i8 %arg1) {
  ret void
}
