
define dso_local void @src(i32* nocapture %0, i32* nocapture readonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = add nsw i32 %2, 7
  %5 = sdiv i32 %4, 8
  %6 = srem i32 %2, 8
  switch i32 %6, label %42 [
    i32 0, label %7
    i32 7, label %12
    i32 6, label %17
    i32 5, label %22
    i32 4, label %27
    i32 3, label %32
    i32 2, label %37
  ]

7:                                                ; preds = %3, %42
  %8 = phi i32* [ %45, %42 ], [ %1, %3 ]
  %9 = phi i32 [ %47, %42 ], [ %5, %3 ]
  %10 = getelementptr inbounds i32, i32* %8, i64 1
  %11 = load i32, i32* %8, align 4
  store i32 %11, i32* %0, align 4
  br label %12

12:                                               ; preds = %3, %7
  %13 = phi i32* [ %10, %7 ], [ %1, %3 ]
  %14 = phi i32 [ %9, %7 ], [ %5, %3 ]
  %15 = getelementptr inbounds i32, i32* %13, i64 1
  %16 = load i32, i32* %13, align 4
  store i32 %16, i32* %0, align 4
  br label %17

17:                                               ; preds = %3, %12
  %18 = phi i32* [ %15, %12 ], [ %1, %3 ]
  %19 = phi i32 [ %14, %12 ], [ %5, %3 ]
  %20 = getelementptr inbounds i32, i32* %18, i64 1
  %21 = load i32, i32* %18, align 4
  store i32 %21, i32* %0, align 4
  br label %22

22:                                               ; preds = %3, %17
  %23 = phi i32* [ %20, %17 ], [ %1, %3 ]
  %24 = phi i32 [ %19, %17 ], [ %5, %3 ]
  %25 = getelementptr inbounds i32, i32* %23, i64 1
  %26 = load i32, i32* %23, align 4 
  store i32 %26, i32* %0, align 4 
  br label %27

27:                                               ; preds = %3, %22
  %28 = phi i32* [ %25, %22 ], [ %1, %3 ]
  %29 = phi i32 [ %24, %22 ], [ %5, %3 ]
  %30 = getelementptr inbounds i32, i32* %28, i64 1
  %31 = load i32, i32* %28, align 4 
  store i32 %31, i32* %0, align 4 
  br label %32

32:                                               ; preds = %3, %27
  %33 = phi i32* [ %30, %27 ], [ %1, %3 ]
  %34 = phi i32 [ %29, %27 ], [ %5, %3 ]
  %35 = getelementptr inbounds i32, i32* %33, i64 1
  %36 = load i32, i32* %33, align 4 
  store i32 %36, i32* %0, align 4 
  br label %37

37:                                               ; preds = %3, %32
  %38 = phi i32* [ %35, %32 ], [ %1, %3 ]
  %39 = phi i32 [ %34, %32 ], [ %5, %3 ]
  %40 = getelementptr inbounds i32, i32* %38, i64 1
  %41 = load i32, i32* %38, align 4 
  store i32 %41, i32* %0, align 4 
  br label %42

42:                                               ; preds = %3, %37
  %43 = phi i32* [ %1, %3 ], [ %40, %37 ]
  %44 = phi i32 [ %5, %3 ], [ %39, %37 ]
  %45 = getelementptr inbounds i32, i32* %43, i64 1
  %46 = load i32, i32* %43, align 4 
  store i32 %46, i32* %0, align 4 
  %47 = add nsw i32 %44, -1
  %48 = icmp sgt i32 %44, 1
  br i1 %48, label %7, label %49

49:                                               ; preds = %42, %3
  ret void
}

attributes #0 = { nofree norecurse nounwind optsize uwtable "disable-tail-calls"="false" "frame-pointer"="none" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" "unsafe-fp-math"="false" "use-soft-float"="false" }
