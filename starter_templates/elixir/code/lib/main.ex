defmodule CLI do
  def main(args) do
    # You can use print statements as follows for debugging, they'll be visible when running tests.
    IO.puts("Logs from your program will appear here!")

    case args do
      ["tokenize", filename | _] ->
        case File.read(filename) do
          {:ok, contents} ->
            case String.length(contents) do
              # Uncomment this line to pass the first stage
              # 0 -> IO.puts("EOF  null")
              _ -> IO.puts(:stderr, "TODO: Implement scanner!")
            end

          {:error, error} ->
            IO.inspect(:stderr, {:error, error}, label: "Error")
        end

      [command | _] ->
        IO.puts("Unknown command: #{command}")
        System.halt(1)

      [] ->
        IO.puts("Usage: your_program.sh <command> <args>")
        System.halt(1)
    end
  end
end
