h(b,j(x,y)). % апапап
h(z,e(d,y)).
g(S) :-	
	h(S, _).
	
f(1,a).
f(2,b).
f(3,c).
f(4,d).

sum([],0).
sum([X|Xs],S) :- sum(Xs,S1), S is X + S1.


mapf([],[]).
mapf([X|Xs],[Y|Ys]) :- f(X,Y), mapf(Xs,Ys).

