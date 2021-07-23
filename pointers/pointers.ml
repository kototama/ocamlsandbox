type 'a pointer = Null | Pointer of 'a ref;;

let new_pointer x = Pointer (ref x);;

type ilist = cell pointer
and cell = {mutable hd : int; mutable tl : ilist};;

let new_cell () = {hd = 0; tl = Null};;

let cons x l =
    let c = new_cell () in
    c.hd <- x;
    c.tl <- l;
    (new_pointer c : ilist);;

let cons2 x l =
    let c = new_cell () in
    c.hd <- x;
    c.tl <- l;
    (new_pointer c);;
