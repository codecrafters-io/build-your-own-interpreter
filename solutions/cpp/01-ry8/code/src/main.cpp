#include <fstream>
#include <iostream>
#include <sstream>
#include <string>

int main(int argc, char *argv[]) {
  // Flush after every std::cout / std::cerr
  std::cout << std::unitbuf;
  std::cerr << std::unitbuf;

  if (argc < 3) {
    std::cerr << "Usage: ./your_program.sh tokenize <filename>" << std::endl;
    return 1;
  }

  std::string command{argv[1]};
  std::string filename{argv[2]};

  if (command != "tokenize") {
    std::cerr << "Unknown command: " << command << std::endl;
    return 1;
  }

  std::ifstream file{filename};
  using Iterator = std::istreambuf_iterator<char>;
  std::string file_contents{Iterator{file}, Iterator{}};

  if (!file_contents.empty()) {
    std::cerr << "Scanner not implemented" << std::endl;
  } else {
    std::cout << "EOF  null" << std::endl; // Placeholder, remove this line when implementing the scanner
  }
}
