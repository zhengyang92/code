define void @src(i8 %arg1) {
bb:
  br label %bb3

bb3:
  %p = phi i8 [ 1, %bb ], [ %tmp1, %bb4 ]
  %tmp1 = add nuw nsw i8 %p, 16
  %tmp2 = icmp eq i8 %tmp1, %arg1
  br label %bb_self

bb_self:
  %s = phi i8 [ 1, %bb3 ], [ %s1, %bb_self ]
  %s1 = add nuw nsw i8 %s, 16
  %s2 = icmp eq i8 %s1, %arg1
  br i1 %s2, label %bb4, label %bb_self

bb4:
  br i1 %tmp2, label %bb19, label %bb3

bb19:
  ret void
}


define void @tgt(i8 %arg1) {
  ret void
}
