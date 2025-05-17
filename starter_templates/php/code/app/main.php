<?php
error_reporting(E_ALL);

if ($argc < 3) {
    fwrite(STDERR, "Usage: ./your_program.sh tokenize <filename>\n");
    exit(1);
}

$command = $argv[1];
$filename = $argv[2];

if ($command !== "tokenize") {
    fwrite(STDERR, "Unknown command: {$command}\n");
    exit(1);
}

$file_contents = file_get_contents($filename);

// You can use print statements as follows for debugging, they'll be visible when running tests.
fwrite(STDERR, "Logs from your program will appear here!\n");

// Uncomment this block to pass the first stage
// if ($file_contents) {
//     throw new Exception("Scanner not implemented");
// } else {
//     echo "EOF  null\n"; // Placeholder, replace this line when implementing the scanner
// }
