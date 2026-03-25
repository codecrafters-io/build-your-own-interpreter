command, filename = ARGV
unless filename
  abort "Usage: ./your_program.sh tokenize <filename>"
end

abort "Unknown command: #{command}" if command != "tokenize"

file_contents = begin
  File.read(filename)
rescue SystemCallError
  ""
end

# You can use print statements as follows for debugging, they'll be visible when running tests.
$stderr.puts "Logs from your program will appear here!"

# TODO: Uncomment the code below to pass the first stage
# 
# unless file_contents.empty?
#   raise "Scanner not implemented"
# else
#   puts "EOF  null" # Placeholder, replace this line when implementing the scanner
# end
