# very-base-scheleton-for-erlang-projects

## Rakefile
    rake clean                # Remove any temporary products
    rake clobber              # Remove any generated file
    rake compile              # Compiles project
    rake shell                # opens Erlang's REPL, after compiling
    rake test                 # Lanches tests
    rake update_modules_list  # Update loaded module: to use in the repl, to reload recompiled modules

## my_modules.erl

 Function <code>my_modules:reload/0</code> will update every module loaded in the REPL.
