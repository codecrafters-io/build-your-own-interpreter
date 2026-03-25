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

unless file_contents.empty?
  raise "Scanner not implemented"
else
  puts "EOF  null" # Placeholder, replace this line when implementing the scanner
end
