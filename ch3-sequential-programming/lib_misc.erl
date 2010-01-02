-module(lib_misc).
-export([sum/1, for/3, qsort/1, odds_and_evens/1, odds_and_evens_acc/1]).

sum(L) ->  sum(L, 0).

sum([], N) ->  N;
sum([H|T], N) -> sum(T, H+N).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1, Max, F)].

qsort([]) ->
    [];
qsort([Pivot|T]) ->
    qsort([X || X <- T, X < Pivot])
        ++ [Pivot] ++
        qsort([X || X <- T, X >= Pivot]).

% Two traversals of the entire list
odds_and_evens(L) ->
    Odds = [X || X <- L,
                 (X rem 2) =:= 1],
    Evens = [X || X<-L,
                  (X rem 2) =:= 0],
    {Odds, Evens}.

% Accumlator
%% "Public" function that takes a list
odds_and_evens_acc(L) ->
    odds_and_evens_acc(L, [], []).
%% Accumlator function that checks the HEAD of the list and prepends it to the Odds/Evens Head.
odds_and_evens_acc([H|T], Odds, Evens) ->
    case (H rem 2) of
        1 ->
            odds_and_evens_acc(T, [H|Odds], Evens);
        0 ->
            odds_and_evens_acc(T, Odds, [H|Evens])
    end;

odds_and_evens_acc([], Odds, Evens) ->
    {lists:reverse(Odds), lists:reverse(Evens)}.
