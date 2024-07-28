import fs from "fs";

const programArgs = process.argv.splice(2);

if (programArgs.length < 2) {
  console.error("Usage: ./your_program.sh tokenize <filename>");
  process.exit(1);
}

const command = programArgs[0];
const filename = programArgs[1];

if (command !== "tokenize") {
  console.error(`Usage: Unknown command: ${command}`);
  process.exit(1);
}
const fileContent = fs.readFileSync(filename, "utf8");

if (fileContent && fileContent.length !== 0) {
    throw new Error("Scanner not implemented");
} else {
    console.log("EOF  null");
}
