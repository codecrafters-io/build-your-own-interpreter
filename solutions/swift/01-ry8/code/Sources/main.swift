import Foundation

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

if fileContents.isEmpty {
   print("EOF  null")
} else {
   print("Scanner not implemented")
   exit(1)
}
