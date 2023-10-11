complete -c projectdo --no-files

set -l commands build run test tool

# Options
complete -c projectdo -n "not __fish_seen_subcommand_from $commands" \
    -s h -l help -d 'Display usage information'
complete -c projectdo -n "not __fish_seen_subcommand_from $commands" \
    -s d -l 'dry-run' -d 'Do not execute any commands with side-effects'
complete -c projectdo -n "not __fish_seen_subcommand_from $commands" \
    -s q -l quiet -d 'Do not print commands before execution'
complete -c projectdo -n "not __fish_seen_subcommand_from $commands" \
    -s v -l version -d 'Dsiplay the version'

# Actions
complete -c projectdo -n "not __fish_seen_subcommand_from $commands" \
    -a build -d 'Build the current project'
complete -c projectdo -n "not __fish_seen_subcommand_from $commands" \
    -a run -d 'Run the current project'
complete -c projectdo -n "not __fish_seen_subcommand_from $commands" \
    -a test -d 'Test the current project'
complete -c projectdo -n "not __fish_seen_subcommand_from $commands" \
    -a tool -d 'Invoke the tool corresponding to the current project'
