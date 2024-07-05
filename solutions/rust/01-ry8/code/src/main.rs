use std::env;
use std::fs;
use std::io::{self, Write};

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 3 {
        writeln!(io::stderr(), "Usage: {} tokenize <filename>", args[0]).unwrap();
        return;
    }

    let command

    let file_path = &args[1];
    let file_contents = fs::read_to_string(file_path).unwrap_or_else(|_| {
        writeln!(io::stderr(), "Failed to read file {}", file_path).unwrap();
        String::new()
    });

    if !file_contents.is_empty() {
        panic!("Scanner not implemented");
    } else {
        println!("EOF  null"); // Placeholder, remove this line when implementing the scanner
    }
}
