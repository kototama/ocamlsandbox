# Sandbox to try (stuff in) OCaml

## Merlin

`ocamlmerlin` must be in the PATH.

## Using

```
dune build
dune exec ./helloworld.exe
```

## Creating new project

Create a file called `dune` with content:

```
(executable
  (name helloworld))
```

