defmodule CLI do
  # This is the main entry point of our program
  def main(args) do
    case args do
      ["tokenize", filename] ->
        # You can use print statements as follows for debugging, they'll be visible when running tests.
        IO.puts("Logs from your program will appear here!")

        case File.read(filename) do
          {:ok, file_contents} ->
            # TODO: Uncomment this when implementing the scanner
            # if file_contents != "" do
            #   raise "Scanner not implemented"
            # else
            #   IO.puts("EOF  null") # Placeholder, replace this line when implementing the scanner
            # end
            :ok # Remove this when you uncomment the code above, it's just a placeholder for the compiler

          {:error, reason} ->
            IO.puts(:stderr, "Error reading file: #{reason}")
            System.halt(1)
        end

      [command, _filename] ->
        IO.puts(:stderr, "Unknown command: #{command}")
        System.halt(1)

      _ ->
        IO.puts(:stderr, "Usage: ./your_program.sh tokenize <filename>")
        System.halt(1)
    end
  end
end
