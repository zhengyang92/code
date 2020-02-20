#include <stdint.h>
#include <stdio.h>

int main() {
  for (uint16_t i = 0 ; ; i ++) {

    uint8_t a = i / 256;
    uint8_t b = i % 256;

    uint8_t src = (a + 3 + b + 3 + 1) >> 1;
    uint8_t tgt = ((a + b + 1) >> 1) + 3;

    if (src != tgt) {
      printf("err\n");
    } else {
      printf("a %d b %d src %d tgt %d\n", a, b, src, tgt);
    }

    if (i == 65535)
      break;
  }
  return 0;
}
