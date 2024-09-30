import Foundation

// You can use print statements as follows for debugging, they'll be visible when running tests.
print("Logs from your program will appear here!")

guard CommandLine.argc == 3 else {
    print("Usage: ./your_program.sh tokenize <filename>")
    exit(1)
}

let command = CommandLine.arguments[1]
let filename = CommandLine.arguments[2]

guard command == "tokenize" else {
    print("Unknown command: \(command)")
    exit(1)
}

let fileContents: String
do {
    fileContents = try String(contentsOfFile: filename, encoding: .utf8)
} catch {
    print("Error reading file: \(filename) with error: \(error.localizedDescription)")
    exit(1)
}

// Uncomment this block to pass the first stage
// if fileContents.isEmpty {
//    print("EOF  null")
// } else {
//    print("Scanner not implemented")
//    exit(1)
// }
