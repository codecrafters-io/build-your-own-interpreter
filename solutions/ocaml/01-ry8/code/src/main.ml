let () =
  if Array.length Sys.argv < 3 then (
    Printf.eprintf "Usage: ./your_program.sh tokenize <filename>\n";
    exit 1);

  let command = Sys.argv.(1) in
  let filename = Sys.argv.(2) in

  if command <> "tokenize" then (
    Printf.eprintf "Unknown command: %s\n" command;
    exit 1);

  let file_contents = In_channel.with_open_text filename In_channel.input_all in

  if String.length file_contents > 0 then
    (* Implement & use your scanner here *)
    failwith "Scanner not implemented"
  else
    print_endline "EOF  null"; (* Placeholder, replace this line when implementing the scanner *)
    ()
