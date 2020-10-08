#include "cond.h"

void loop1(int a, int b, int c, int d, int e) {
  for (int aa = 0; aa < a; aa++) {
    for (int bb = 0; bb < b; bb++) {
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

void loop2a(int a, int b, int c, int d, int e)  {
  for (int aa = 0; aa < a; aa++) {
    if (cond())
      break;
    for (int bb = 0; bb < b; bb++) {
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

void loop2b(int a, int b, int c, int d, int e)  {
  for (int aa = 0; aa < a; aa++) {
    for (int bb = 0; bb < b; bb++) {
      if (cond())
        break;
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

void loop2c(int a, int b, int c, int d, int e)  {
  for (int aa = 0; aa < a; aa++) {
    for (int bb = 0; bb < b; bb++) {
      for (int cc = 0; cc < c; cc++) {
        if (cond())
          break;
        for (int dd = 0; dd < d; dd++) {
          for (int ee = 0; ee < e; ee++) {
            f();
          }
        }
      }
    }
  }
}

void loop2d(int a, int b, int c, int d, int e)  {
  for (int aa = 0; aa < a; aa++) {
    for (int bb = 0; bb < b; bb++) {
      for (int cc = 0; cc < c; cc++) {
        for (int dd = 0; dd < d; dd++) {
          if (cond())
            break;
          for (int ee = 0; ee < e; ee++) {
            f();
          }
        }
      }
    }
  }
}

void loop2e(int a, int b, int c, int d, int e)  {
  for (int aa = 0; aa < a; aa++) {
    for (int bb = 0; bb < b; bb++) {
      for (int cc = 0; cc < c; cc++) {
        for (int dd = 0; dd < d; dd++) {
          for (int ee = 0; ee < e; ee++) {
            if (cond())
              break;
            f();
          }
        }
      }
    }
  }
}

void loop3a(int a, int b, int c, int d, int e)  {
  for (int aa = 0; aa < a; aa++) {
    for (int bb = 0; bb < b; bb++) {
      for (int cc = 0; cc < c; cc++) {
        for (int dd = 0; dd < d; dd++) {
          for (int ee = 0; ee < e; ee++) {
            f();
            if (cond())
              break;
          }
        }
      }
    }
  }
}

void loop3b(int a, int b, int c, int d, int e)  {
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
      }
    }
  }
}

void loop3c(int a, int b, int c, int d, int e)  {
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
    }
  }
}

void loop3d(int a, int b, int c, int d, int e)  {
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
  }
}

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

void loop4a(int a, int b, int c, int d, int e)  {
  int aa;
  if (cond()) {
    aa = 0;
    goto l1;
  }
  for (aa = 0; aa < a; aa++) {
  l1:
    for (int bb = 0; bb < b; bb++) {
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

void loop4c(int a, int b, int c, int d, int e)  {
  int aa, bb, cc;
  if (cond()) {
    aa = bb = cc = 0;
    goto l1;
  }
  for (aa = 0; aa < a; aa++) {
    for (bb = 0; bb < b; bb++) {
      for (cc = 0; cc < c; cc++) {
      l1:
        for (int dd = 0; dd < d; dd++) {
          for (int ee = 0; ee < e; ee++) {
            f();
          }
        }
      }
    }
  }
}

void loop4d(int a, int b, int c, int d, int e)  {
  int aa, bb, cc, dd;
  if (cond()) {
    aa = bb = cc = dd = 0;
    goto l1;
  }
  for (aa = 0; aa < a; aa++) {
    for (bb = 0; bb < b; bb++) {
      for (cc = 0; cc < c; cc++) {
        for (dd = 0; dd < d; dd++) {
        l1:
          for (int ee = 0; ee < e; ee++) {
            f();
          }
        }
      }
    }
  }
}

void loop4e(int a, int b, int c, int d, int e)  {
  int aa, bb, cc, dd, ee;
  if (cond()) {
    aa = bb = cc = dd = ee = 0;
    goto l1;
  }
  for (aa = 0; aa < a; aa++) {
    for (bb = 0; bb < b; bb++) {
      for (cc = 0; cc < c; cc++) {
        for (dd = 0; dd < d; dd++) {
          for (ee = 0; ee < e; ee++) {
          l1:
            f();
          }
        }
      }
    }
  }
}

#include <stdio.h>

int main(void)  {
  loop1(3, 3, 3, 3, 3);
  printf("\n");

  loop2a(3, 3, 3, 3, 3);
  printf("\n");
  loop2b(3, 3, 3, 3, 3);
  printf("\n");
  loop2c(3, 3, 3, 3, 3);
  printf("\n");
  loop2d(3, 3, 3, 3, 3);
  printf("\n");
  loop2e(3, 3, 3, 3, 3);
  printf("\n");

  loop3a(3, 3, 3, 3, 3);
  printf("\n");
  loop3b(3, 3, 3, 3, 3);
  printf("\n");
  loop3c(3, 3, 3, 3, 3);
  printf("\n");
  loop3d(3, 3, 3, 3, 3);
  printf("\n");
  loop3e(3, 3, 3, 3, 3);
  printf("\n");

  loop4a(3, 3, 3, 3, 3);
  printf("\n");
  loop4b(3, 3, 3, 3, 3);
  printf("\n");
  loop4c(3, 3, 3, 3, 3);
  printf("\n");
  loop4d(3, 3, 3, 3, 3);
  printf("\n");
  loop4e(3, 3, 3, 3, 3);
  printf("\n");
}
