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

  (* You can use print statements as follows for debugging, they'll be visible when running tests. *)
  Printf.eprintf "Logs from your program will appear here!\n";

  if String.length file_contents > 0 then
    (* Implement & use your scanner here *)
    failwith "Scanner not implemented"
  else
    (* Uncomment this block to pass the first stage *)
    (* Printf.printf "EOF  null" (* Placeholder, remove this line when implementing the scanner *) *)
    ()
