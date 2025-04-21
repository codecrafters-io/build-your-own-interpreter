import fs from "fs";

const args: string[] = process.argv.slice(2); // Skip the first two arguments (node path and script path)

if (args.length < 2) {
  console.error("Usage: ./your_program.sh tokenize <filename>");
  process.exit(1);
}

const command: string = args[0];

if (command !== "tokenize") {
  console.error(`Usage: Unknown command: ${command}`);
  process.exit(1);
}

const filename: string = args[1];

const fileContent: string = fs.readFileSync(filename, "utf8");

if (fileContent.length !== 0) {
  throw new Error("Scanner not implemented");
} else {
  console.log("EOF  null");
}
