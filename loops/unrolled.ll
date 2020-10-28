define void @src(i8 %arg1) {
bb:
  br label %bb3

bb3:
  %p = phi i8 [ 1, %bb ]
  %tmp1 = add nsw nuw i8 %p, 16
  %tmp2 = icmp eq i8 %tmp1, %arg1
  br label %bb4

bb4:
  br i1 %tmp2, label %bb19, label %bb3_u_1

bb19:
  ret void

sink:
  ret void

bb3_u_1:
  %p_u_1 = phi i8 [ %tmp1, %bb3 ]
  %tmp1_u_1 = add nsw nuw i8 %p_u_1, 16
  %tmp2_u_1 = icmp eq i8 %tmp1_u_1, %arg1
  br label %bb4_u_1

bb4_u_1:
  br i1 %tmp2_u_1, label %bb19, label %bb3_u_2

bb3_u_2:
  %p_u_2 = phi i8 [ %tmp1_u_1, %bb3_u_1 ]
  %tmp1_u_2 = add nsw nuw i8 %p_u_2, 16
  %tmp2_u_2 = icmp eq i8 %tmp1_u_2, %arg1
  br label %bb4_u_2

bb4_u_2:
  br i1 %tmp2_u_2, label %bb19, label %sink
}
