using System;
using System.IO;

if (args.Length < 2)
{
    Console.Error.WriteLine("Usage: ./your_program.sh tokenize <filename>");
    Environment.Exit(1);
}

string command = args[0];
string filename = args[1];

if (command != "tokenize")
{
    Console.Error.WriteLine($"Unknown command: {command}");
    Environment.Exit(1);
}

string fileContents = File.ReadAllText(filename);

if (!string.IsNullOrEmpty(fileContents))
{
    throw new NotImplementedException("Scanner not implemented");
}
else
{
    Console.WriteLine("EOF  null"); // Placeholder, replace this line when implementing the scanner
}
