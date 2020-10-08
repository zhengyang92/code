; ModuleID = '/Users/liuz/loop2d.c'
source_filename = "/Users/liuz/loop2d.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.15.0"

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @src(i32, i32, i32, i32, i32) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  store i32 0, i32* %11, align 4
  br label %16

16:                                               ; preds = %62, %5
  %17 = load i32, i32* %11, align 4
  %18 = load i32, i32* %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %65

20:                                               ; preds = %16
  store i32 0, i32* %12, align 4
  br label %21

21:                                               ; preds = %58, %20
  %22 = load i32, i32* %12, align 4
  %23 = load i32, i32* %7, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %61

25:                                               ; preds = %21
  store i32 0, i32* %13, align 4
  br label %26

26:                                               ; preds = %54, %25
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %8, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %57

30:                                               ; preds = %26
  store i32 0, i32* %14, align 4
  br label %31

31:                                               ; preds = %50, %30
  %32 = load i32, i32* %14, align 4
  %33 = load i32, i32* %9, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %53

35:                                               ; preds = %31
  %36 = call i32 (...) @f()
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  br label %53

39:                                               ; preds = %35
  store i32 0, i32* %15, align 4
  br label %40

40:                                               ; preds = %46, %39
  %41 = load i32, i32* %15, align 4
  %42 = load i32, i32* %10, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %49

44:                                               ; preds = %40
  %45 = call i32 (...) @f()
  br label %46

46:                                               ; preds = %44
  %47 = load i32, i32* %15, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %15, align 4
  br label %40

49:                                               ; preds = %40
  br label %50

50:                                               ; preds = %49
  %51 = load i32, i32* %14, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %14, align 4
  br label %31

53:                                               ; preds = %38, %31
  br label %54

54:                                               ; preds = %53
  %55 = load i32, i32* %13, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %13, align 4
  br label %26

57:                                               ; preds = %26
  br label %58

58:                                               ; preds = %57
  %59 = load i32, i32* %12, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %12, align 4
  br label %21

61:                                               ; preds = %21
  br label %62

62:                                               ; preds = %61
  %63 = load i32, i32* %11, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %11, align 4
  br label %16

65:                                               ; preds = %16
  ret void
}

; Function Attrs: noinline nounwind optnone ssp uwtable
define void @tgt(i32, i32, i32, i32, i32) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store i32 %0, i32* %6, align 4
  store i32 %1, i32* %7, align 4
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  store i32 0, i32* %11, align 4
  br label %16

16:                                               ; preds = %62, %5
  %17 = load i32, i32* %11, align 4
  %18 = load i32, i32* %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %65

20:                                               ; preds = %16
  store i32 0, i32* %12, align 4
  br label %21

21:                                               ; preds = %58, %20
  %22 = load i32, i32* %12, align 4
  %23 = load i32, i32* %7, align 4
  %24 = icmp slt i32 %22, %23
  br i1 %24, label %25, label %61

25:                                               ; preds = %21
  store i32 0, i32* %13, align 4
  br label %26

26:                                               ; preds = %54, %25
  %27 = load i32, i32* %13, align 4
  %28 = load i32, i32* %8, align 4
  %29 = icmp slt i32 %27, %28
  br i1 %29, label %30, label %57

30:                                               ; preds = %26
  store i32 0, i32* %14, align 4
  br label %31

31:                                               ; preds = %50, %30
  %32 = load i32, i32* %14, align 4
  %33 = load i32, i32* %9, align 4
  %34 = icmp slt i32 %32, %33
  br i1 %34, label %35, label %53

35:                                               ; preds = %31
  %36 = call i32 (...) @f()
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %39

38:                                               ; preds = %35
  br label %53

39:                                               ; preds = %35
  store i32 0, i32* %15, align 4
  br label %40

40:                                               ; preds = %46, %39
  %41 = load i32, i32* %15, align 4
  %42 = load i32, i32* %10, align 4
  %43 = icmp slt i32 %41, %42
  br i1 %43, label %44, label %49

44:                                               ; preds = %40
  %45 = call i32 (...) @f()
  br label %46

46:                                               ; preds = %44
  %47 = load i32, i32* %15, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %15, align 4
  br label %40

49:                                               ; preds = %40
  br label %50

50:                                               ; preds = %49
  %51 = load i32, i32* %14, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %14, align 4
  br label %31

53:                                               ; preds = %38, %31
  br label %54

54:                                               ; preds = %53
  %55 = load i32, i32* %13, align 4
  %56 = add nsw i32 %55, 1
  store i32 %56, i32* %13, align 4
  br label %26

57:                                               ; preds = %26
  br label %58

58:                                               ; preds = %57
  %59 = load i32, i32* %12, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %12, align 4
  br label %21

61:                                               ; preds = %21
  br label %62

62:                                               ; preds = %61
  %63 = load i32, i32* %11, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %11, align 4
  br label %16

65:                                               ; preds = %16
  ret void
}

declare i32 @f(...) #1

attributes #0 = { noinline nounwind optnone ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "darwin-stkchk-strong-link" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "probe-stack"="___chkstk_darwin" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+cx8,+fxsr,+mmx,+sahf,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.module.flags = !{!0, !1, !2}
!llvm.ident = !{!3}

!0 = !{i32 2, !"SDK Version", [3 x i32] [i32 10, i32 15, i32 4]}
!1 = !{i32 1, !"wchar_size", i32 4}
!2 = !{i32 7, !"PIC Level", i32 2}
!3 = !{!"Apple clang version 11.0.3 (clang-1103.0.32.62)"}
