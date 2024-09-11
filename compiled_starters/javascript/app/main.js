import fs from "fs";

const args = process.argv.slice(2); // Skip the first two arguments (node path and script path)

if (args.length < 2) {
  console.error("Usage: ./your_program.sh tokenize <filename>");
  process.exit(1);
}

const command = args[0];

if (command !== "tokenize") {
  console.error(`Usage: Unknown command: ${command}`);
  process.exit(1);
}

// You can use print statements as follows for debugging, they'll be visible when running tests.
console.error("Logs from your program will appear here!");

const filename = args[1];

// Uncomment this block to pass the first stage
//
// const fileContent = fs.readFileSync(filename, "utf8");
//
// if (fileContent.length !== 0) {
//   throw new Error("Scanner not implemented");
// } else {
//   console.log("EOF  null");
// }
