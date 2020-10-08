void loop3e(int a, int b, int c, int d, int e)  {
  for (int aa = 0; aa < a; aa++) {
    for (int bb = 0; bb < b; bb++) {
      for (int cc = 0; cc < c; cc++) {
        for (int dd = 0; dd < d; dd++) {
          for (int ee = 0; ee < e; ee++) {
            f();
            if (cond())
              break;
          }
          if (cond())
            break;
        }
        if (cond())
          break;
      }
      if (cond())
        break;
    }
    if (cond())
      break;
  }
}

