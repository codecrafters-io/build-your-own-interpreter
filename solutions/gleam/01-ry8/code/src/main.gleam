import gleam/io
import gleam/string

import argv
import simplifile

pub fn main() {
  let args = argv.load().arguments

  case args {
    ["tokenize", filename] -> {
      case simplifile.read(filename) {
        Ok(contents) -> {
          case string.length(contents) {
            0 -> io.println("EOF  null")
            _ -> io.println_error("TODO: Implement scanner!")
          }
        }
        Error(error) -> {
          io.println_error("Error: " <> simplifile.describe_error(error))
          exit(1)
        }
      }
    }
    [command, _] -> {
      io.println_error("Unknown command: " <> command)
      exit(1)
    }
    _ -> {
      io.println_error("Usage: ./your_program.sh tokenize <filename>")
      exit(1)
    }
  }
}

@external(erlang, "erlang", "halt")
pub fn exit(code: Int) -> Nil
