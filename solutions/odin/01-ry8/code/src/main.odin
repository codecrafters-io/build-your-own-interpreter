package main

import "core:os"
import "core:fmt"
import "core:strings"

main :: proc() {
    if len(os.args) < 3 {
        fmt.eprintln("Usage: ./your_program.sh tokenize <filename>")
        os.exit(1)
    }

    command := os.args[1]
    filename := os.args[2]

    if command != "tokenize" {
        fmt.eprintf("Unknown command: %s\n", command)
        os.exit(1)
    }

    file_contents, ok := os.read_entire_file(filename)
    if !ok {
        fmt.eprintf("Failed to read file: %s\n", filename)
        os.exit(1)
    }

    if len(file_contents) > 0 {
        panic("Scanner not implemented")
    } else {
        fmt.println("EOF  null") // Placeholder, replace this line when implementing the scanner
    }
}
