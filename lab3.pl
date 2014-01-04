% Написать программу, которая реализует поиск по дереву,
% возвращая путь от корня к искомому элементу. Дерево 
% должно грузиться из файла как набор предикатов 
% (можно использовать consult). Если искомых элементов
% несколько, вернуть все варианты. Поиск проводится по 
% полному или частичному совпадению, т.е., поиск по слову
% "Ром" должен показать и "Ром", и "Роман", и "Паром". 
% Естественно, латиница, и не обязательно применять 
% заглавные буквы.


:- [lab3_tree].        % include file

init(X) :-
  node(X,_,_).
  
matchId(Word, Id) :-
  node(Id, _, AWordB),
  append(A, WordB, AWordB),
  append(Word, B, WordB).
  
pathToRoot(0,[]).
pathToRoot(Id,Result) :-
  node(Id,ParentId,_),
  pathToRoot(ParentId, PathToRootFromParent),
  Result = [Id | PathToRootFromParent].
  
getPathToRootFromMatch(Word,Path) :-
  matchId(Word,Id),
  pathToRoot(Id,Path).
