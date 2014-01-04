
repl(State1) :- 
  write(': '),
  read(Command),
  (execute(Command, State1, State2, Output),
    write(Output),
    nl;
    
    write('Failed')
  ),
  !,
  repl(State2).

execute(show, A, A, A).
execute(add(X),A,B,'ok') :-
  add(A,X,B).


add(emptyTree, Element, tree(Element, emptyTree, emptyTree)).
add(tree(Root, Left, Right), Root, tree(Root, Left, Right)).
add(tree(Root, Left, Right), Element, tree(Root, NewLeft, Right)) :-
  Element @< Root,
  add(Left, Element, NewLeft).

add(tree(Root, Left, Right), Element, tree(Root, Left, NewRight)) :-
  Element @> Root,
  add(Right, Element, NewRight).
  


