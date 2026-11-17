%kavya lakshmisagara krishnagowda
%kav9793@gmail.com

subgrid_size(3).

% - For subgrid_size(s), subgrids can be identified by labels 0..s*s-1
% - A cell (x,y) can be mapped to the subgrid labeled (((x-1)/s)*s + (y-1)/s)

% the grid is n x n, where n = s*s
size(S*S) :- subgrid_size(S).
num(1..N) :- size(N).

% every cell gets exactly one number
1 { sudoku(X,Y,V) : num(V) } 1 :- num(X), num(Y).

% the numbers given in the instance stay in the grid
sudoku(X,Y,V) :- initial(X,Y,V).

% no number twice in a row
:- sudoku(X,Y1,V), sudoku(X,Y2,V), Y1 < Y2.

% no number twice in a column
:- sudoku(X1,Y,V), sudoku(X2,Y,V), X1 < X2.

% find out which subgrid a cell belongs to
subgrid(X,Y,((X-1)/S)*S + (Y-1)/S) :- num(X), num(Y), subgrid_size(S).

% no number twice in a subgrid
:- sudoku(X1,Y1,V), sudoku(X2,Y2,V),
   subgrid(X1,Y1,G), subgrid(X2,Y2,G),
   (X1,Y1) < (X2,Y2).


#show sudoku/3.
