let root_path =
  Filename.concat (Sys.getenv "HOME") ".trupkg"

let root_of_package name =
  Filename.concat root_path name

let version_dir name version =
  Filename.concat (root_of_package name) version

let source_list_path =
  Filename.concat root_path "source_list.txt"

let read_file filename =
  let chan = open_in filename in
  let rec read lines =
    try
      read (lines @ [input_line chan])
    with End_of_file ->
      String.concat "\n" lines
  in
  read []

let read_source_list () =
  let contents = read_file source_list_path in
  String.split_on_char '\n' contents
