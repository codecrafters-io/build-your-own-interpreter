use std::env;
use std::fs;
use std::io::{self, Write};

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        writeln!(io::stderr(), "Usage: {} <filename>", args[0]).unwrap();
        return;
    }

    // You can use print statements as follows for debugging, they'll be visible when running tests.
    // But make sure to write the output to stderr.
    writeln!(io::stderr(), "Logs from your program will appear here!").unwrap();

    let file_path = &args[1];
    let file_contents = fs::read_to_string(file_path).unwrap_or_else(|_| {
        writeln!(io::stderr(), "Failed to read file {}", file_path).unwrap();
        String::new()
    });

    // Uncomment this block to pass the first stage
    // if !file_contents.is_empty() {
    //     panic!("Scanner not implemented");
    // } else {
    //     println!("EOF  null"); // Placeholder, remove this line when implementing the scanner
    // }
}
