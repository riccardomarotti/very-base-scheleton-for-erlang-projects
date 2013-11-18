-module(my_code).
-export([reload/0]).

reload() ->
	{ok, [Modules]} = file:consult('modules'),
	[ reload(Module) || Module <- Modules ],
	ok.

reload(Module) ->
	code:purge(Module),
	code:load_file(Module).
