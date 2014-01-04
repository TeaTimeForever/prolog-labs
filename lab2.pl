% Представим каждого ферзя порядковым номером (1..8).
% Порядковый номер означает, в какой колонке находится 
% данный ферзь. В списке будем хранить высоту на которую
% определен каждый ферзь.

% Параметрами в предикат canAdd будут список из k ферзей,
% где позиция в списке означает номер колонки в которой 
% ферзь располагается, а значение в этой позиции указывает
% на номер строки в которую его поставили (высота).

checkUpDiagonal([], QueenNumb).                                           % Если список расставленных ферзей пуст - то проверка прошла.
checkUpDiagonal([FirstQueen | OtherQueens], QueenNumb) :-                 % Проверка на верхнюю диагональ:
  CheckedPosition is QueenNumb + 1,                                       % проверяемая позиция это = текущая + 1;
  not(FirstQueen = CheckedPosition),                                      % если первый ферзь из расставленных не совпадает (не бьется) проверяемым,
  checkUpDiagonal(OtherQueens, CheckedPosition).                          % то запускаем рекурсию, и проверяем не бьет ли он остальные расставленные ферзи.  

checkDownDiagonal([], QueenNumb).                                         % Если список расставленных ферзей пуст - то проверка прошла.
checkDownDiagonal([FirstQueen | OtherQueens], QueenNumb) :-               % Проверка на нижнюю диагональ:
  CheckedPosition is QueenNumb - 1,                                       % проверяемая позиция это = текущая - 1;
  not(FirstQueen = CheckedPosition),                                      % если первый ферзь из расставленных не совпадает (не бьется) проверяемым,
  checkDownDiagonal(OtherQueens, CheckedPosition).                        % то запускаем рекурсию, и проверяем не бьет ли он остальные расставленные ферзи.
  
composeQueens(ComposedQueens, [], ComposedQueens).                        % Если список свободных ферзей пуст, то присваиваем в Result найденный список. 
                                                                          % Переменная Result необходима, для того, чтобы пролог выдавал "решения" а не значения true/false
composeQueens(ComposedQueens, FreeQueens, Result) :-                      % Если список свободных ферзей не пуст, то
  append( A, [FreeQueen | B], FreeQueens),                                % проводим операцию append, где в качестве итогового списка подаем FreeQueens, список
                                                                          % A мб иногда пустым, иногда заполненным количества [length(FreeQueens)-1] т.к. FreeQueen не мб
                                                                          % пуст. Это позволит перебрать все элементы списка FreeQueens.
  checkUpDiagonal(ComposedQueens, FreeQueen),                             % Проверяем очередного ферзя - бьет ли он когото по верхней диагонали.
  checkDownDiagonal(ComposedQueens, FreeQueen),                           % Проверяем очередного ферзя - бьет ли он когото по нижней диагонали.

  append(A, B, OtherFreeQueens),                                          % Склеиваем список из неиспользованных ферзей из списка FreeQueens = (A+B).
  composeQueens([FreeQueen | ComposedQueens], OtherFreeQueens, Result).   % Запускаем рекурсию, и добавляем к расставленным ферзям, того, который прошел проверки,
                                                                          % со оставшимся списком свободных ферзей.

% composeQueens([], [1,2,3,4,5,6,7,8], Result).                           % вопрос