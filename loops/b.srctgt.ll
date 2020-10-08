define i32 @src(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %11, %2
  ret i32 0

5:                                                ; preds = %2, %11
  %6 = phi i32 [ %12, %11 ], [ 0, %2 ]
  br label %7

7:                                                ; preds = %7, %5
  %8 = phi i32 [ 0, %5 ], [ %10, %7 ]
  %9 = icmp slt i32 %8, %1
  %10 = add nuw nsw i32 %8, 1
  br i1 %9, label %7, label %11

11:                                               ; preds = %7
  %12 = add nuw nsw i32 %6, 1
  %13 = icmp eq i32 %12, %0
  br i1 %13, label %4, label %5
}



define i32 @tgt(i32 %0, i32 %1) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %5, label %4

4:                                                ; preds = %11, %2
  ret i32 0

5:                                                ; preds = %2, %11
  %6 = phi i32 [ %12, %11 ], [ 0, %2 ]
  br label %7

7:                                                ; preds = %7, %5
  %8 = phi i32 [ 0, %5 ], [ %10, %7 ]
  %9 = icmp slt i32 %8, %1
  %10 = add nuw nsw i32 %8, 1
  br i1 %9, label %7, label %11

11:                                               ; preds = %7
  %12 = add nuw nsw i32 %6, 1
  %13 = icmp eq i32 %12, %0
  br i1 %13, label %4, label %5
}



