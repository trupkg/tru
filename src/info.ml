let run args =
  match args with
    | name :: [] ->
        let dir = Archive.root_of_package name in
        if Sys.file_exists dir && Sys.is_directory dir then
          let report path =
            let fn = Filename.concat dir path in
            if Sys.is_directory fn then
              let base = Filename.basename path in
              print_endline ("Found " ^ "\"name\" version " ^ base ^ " at " ^ fn)
          in
          List.iter report (Array.to_list(Sys.readdir dir))
        else
          print_endline ("No package named \"" ^ name ^ "\" is installed.")
    | _ ->
        prerr_endline "...";
        exit 65
