define void @src(i8* %arg, i8* %arg1, i8 %arg2) {
bb:
  br label %bb3

bb3:
  %tmp = phi i8 [ 1, %bb ], [ %tmp17, %bb3 ]
  %tmp4 = add nuw i8 %tmp, 8
  %tmp5 = shl nuw i8 %tmp, 1
  %tmp6 = getelementptr i8, i8* %arg1, i8 %tmp5
  %tmp8 = load i8, i8* %tmp6
  %tmp9 = shl i8 %tmp4, 1
  %tmp10 = getelementptr i8, i8* %arg1, i8 %tmp9
  %tmp12 = load i8, i8* %tmp10
  %tmp13 = getelementptr i8, i8* %arg, i8 %tmp
  store i8 %tmp8, i8* %tmp13
  %tmp15 = getelementptr i8, i8* %arg, i8 %tmp4
  store i8 %tmp12, i8* %tmp15
  %tmp17 = add nuw nsw i8 %tmp, 16
  %tmp18 = icmp eq i8 %tmp17, %arg2
  br i1 %tmp18, label %bb19, label %bb3

bb19:
  ret void
}


define void @tgt(i8* %arg, i8* %arg1, i8 %arg2) {
bb:
  br label %bb3

bb3:
  %tmp = phi i8 [ 1, %bb ], [ %tmp17, %bb3 ]
  %tmp4 = add nuw i8 %tmp, 8
  %tmp5 = shl nuw i8 %tmp, 1
  %tmp6 = getelementptr i8, i8* %arg1, i8 %tmp5
  %tmp8 = load i8, i8* %tmp6
  %tmp9 = shl i8 %tmp4, 1
  %tmp10 = getelementptr i8, i8* %arg1, i8 %tmp9
  %tmp12 = load i8, i8* %tmp10
  %tmp13 = getelementptr i8, i8* %arg, i8 %tmp
  store i8 %tmp8, i8* %tmp13
  %tmp15 = getelementptr i8, i8* %arg, i8 %tmp4
  store i8 %tmp12, i8* %tmp15
  %tmp17 = add nuw nsw i8 %tmp, 16
  %tmp18 = icmp eq i8 %tmp17, %arg2
  br i1 %tmp18, label %bb19, label %bb3

bb19:
  ret void
}
