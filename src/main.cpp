#include <stdio.h>

int main(int argc, char *argv[]) {
  if (1 < argc) {
      printf("%d args, exiting!\n", argc);
      return -1;
  }
  char *prgname = argv[0];
  
  printf("Hello from %s\n", prgname);
  return 0;
}
