# very-base-scheleton-for-erlang-projects

## Rakefile
    rake clean                # Remove any temporary products
    rake clobber              # Remove any generated file
    rake compile              # Compile project
    rake shell                # open Erlang's REPL, after compiling
    rake test                 # Lanche tests
    rake update_modules_list  # Update loaded module: for the repl, to reload recompiled modules

## my_modules.erl

 Function <code>my_modules:reload/0</code> will update every module loaded in the REPL.
