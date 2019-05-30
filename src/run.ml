open Usage

let run () =
  match Array.to_list Sys.argv with
    | [_; "--version"] -> print_endline "!!!"
    | _ :: command :: args ->
        if command = "install" then
          Install.run args
        else if command = "info" then
          Info.run args
        else begin
          prerr_endline ("Unrecognized command \"" ^ command ^ "\".");
          print_usage prerr_endline;
          exit 65
        end
    | _ ->
        print_usage prerr_endline;
        exit 65
