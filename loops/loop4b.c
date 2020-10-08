void loop4b(int a, int b, int c, int d, int e)  {
  int aa, bb;
  if (cond()) {
    aa = bb = 0;
    goto l1;
  }
  for (aa = 0; aa < a; aa++) {
    for (bb = 0; bb < b; bb++) {
    l1:
      for (int cc = 0; cc < c; cc++) {
        for (int dd = 0; dd < d; dd++) {
          for (int ee = 0; ee < e; ee++) {
            f();
          }
        }
      }
    }
  }
}
