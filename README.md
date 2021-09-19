# Sandbox to try (stuff in) OCaml

## Using

In the top directory:

```
nix-shell
```

In a project directory:
```
dune build
dune exec ./helloworld.exe
```

## Creating new project

Create and folder and then a file called `dune` with content:

```
(executable
  (name helloworld))
```

## Issues

Running `opam init` creates a `~/.opam` directory but the Emacs completion
backend works better without it. Maybe a conflict with Nix?
