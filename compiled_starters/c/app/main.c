#include <assert.h>
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  // You can use print statements as follows for debugging, they'll be visible when running tests.
  fprintf(stderr, "Logs from your program will appear here!\n");

  if (argc < 3) {
    fprintf(stderr, "Usage: ./your_program.sh tokenize <filename>\n");
    return 1;
  }

  const char *command = argv[1];
  const char *filename = argv[2];

  if (strcmp(command, "tokenize") != 0) {
    fprintf(stderr, "Unknown command: %s\n", command);
    return 1;
  }

  FILE *file = fopen(filename, "r");
  assert(file != NULL);

  char file_contents[1001] = { 0 };
  int size = fread(file_contents, 1, 1000, file);

  fclose(file);

  // Uncomment this block to pass the first stage
  // if (size != 0) {
  //   fprintf(stderr, "Scanner not implemented\n");
  // } else {
  //   printf("EOF  null\n"); // Placeholder, remove this line when implementing the scanner
  // }
}
