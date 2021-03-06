with import <nixpkgs> {};

let
#  ocamlPackages = pkgs.recurseIntoAttrs pkgs.ocamlPackages_latest;
  findlibSiteLib = "${ocamlPackages.findlib}/lib/ocaml/${ocamlVersion}/site-lib";
  ocamlVersion = (builtins.parseDrvName ocamlPackages.ocaml.name).version;
  ocamlInit = pkgs.writeText "ocamlinit" ''
    let () =
      try Topdirs.dir_directory "${findlibSiteLib}"
      with Not_found -> ()
    ;;
    #use "topfind";;
    #thread;;
    #require "base";;
    #require "core.top";;
    #require "core.syntax";;
  '';
in
  stdenv.mkDerivation rec {
    name = "rwo-shell";
    buildInputs = with ocamlPackages; [
      ocaml
      opam
      core
      core_extended
      base
      utop
      findlib
      dune_2
      merlin
      graphics
    ];
    shellHook = ''
      alias utop="utop -init ${ocamlInit}"
    '';
  }
