-module(shop1).
-export([total/1]).

% ED: Recursive call.  Simple Mapper
total([{What, N}|T]) ->
    shop:cost(What) * N + total(T);
total([]) -> 0.
