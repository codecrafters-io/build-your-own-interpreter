package codecrafters_interpreter

import java.io.IOException
import java.nio.file.{Files, Path}

object Main {
  def main(args: Array[String]): Unit = {
    args match {
      case Array(command, filename, _*) =>
        if (command != "tokenize") {
          Console.err.println(s"Unknown command: $command")
          System.exit(1)
        }

        val fileContents: String = try {
          Files.readString(Path.of(filename))
        } catch {
          case e: IOException =>
            Console.err.println(s"Error reading file: ${e.getMessage}")
            System.exit(1)
            "" // This won't be reached, but needed for type inference
        }

        // You can use print statements as follows for debugging, they'll be visible when running tests.
        Console.err.println("Logs from your program will appear here!")

        // TODO: Uncomment the code below to pass the first stage
        // 
        // if (fileContents.nonEmpty) {
        //   throw new RuntimeException("Scanner not implemented")
        // } else {
        //   println("EOF  null") // Placeholder, replace this line when implementing the scanner
        // }

      case _ =>
        Console.err.println("Usage: ./your_program.sh tokenize <filename>")
        System.exit(1)
    }
  }
}
