# Completions for fish shell
# This file should go in /usr/share/fish/vendor_completions.d
# according to https://fishshell.com/docs/current/completions.html
# function

set dir_colorscripts /opt/shell-color-scripts/colorscripts
set dir_blacklisted_colorscripts "$dir_colorscripts/blacklisted"

# Lists all filenames in a given directory
function list_filenames
    set dir $argv[1]
    if command -q find
        # use find if available
        set files (command find $dir -maxdepth 1 -type f)
    else if command -q ls
        # use ls if available
        set files (command ls $dir)
    else
        # cannot provide coloscript name autocompletions for args of exec, blacklist, and unblacklist
        return
    end

    for file in $files
        echo (basename $file)
    end
end

# List all colorscript names
function cs_names
    echo (list_filenames $dir_colorscripts | string collect)
end

# List all blacklisted colorscript names
function blacklisted_cs_names
    echo (list_filenames $dir_blacklisted_colorscripts | string collect)
end

# Description text
set -l help_desc 'Print help'
set -l list_desc 'List all installed color scripts'
set -l random_desc 'Run a random color script'
set -l exec_desc 'Run a specified color script by SCRIPT NAME or INDEX'
set -l blacklist_desc 'Blacklist a color script by SCRIPT NAME or INDEX'
set -l unblacklist_desc 'Unblacklist a color script by SCRIPT NAME or INDEX'
set -l all_desc 'List the outputs of all colorscripts with their SCRIPT NAME'

# List of all available commands and flag-style commands
set -l commands -h --help help -l --list list -r --random random -e --exec exec \
    -b --blacklist blacklist -u --unblacklist unblacklist -a --all all

# turn off built-in file completions
complete -c colorscript -f

# Commands autocompletions
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -a help -d "$help_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -a list -d "$list_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -a random -d "$random_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -a exec -d "$exec_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -a blacklist -d "$blacklist_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -a unblacklist -d "$unblacklist_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -a all -d "$all_desc"

# Flag-style commands autocompletions
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -s h -l help -d "$help_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -s l -l list -d "$list_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -s r -l random -d "$random_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -s e -l exec -d "$exec_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -s b -l blacklist -d "$blacklist_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -s u -l unblacklist -d "$unblacklist_desc"
complete -c colorscript -n "not __fish_seen_subcommand_from $commands" -s a -l all -d "$all_desc"

# Coloscript name autocompletions
set -l commands_that_take_names -e --exec exec -b --blacklist blacklist
complete -c colorscript -n "__fish_seen_subcommand_from $commands_that_take_names" -a '(cs_names)'

# Blacklisted colorscript name autocompletions
set -l commands_that_take_blacklisted_names -u --unblacklist unblacklist
complete -c colorscript -n "__fish_seen_subcommand_from $commands_that_take_blacklisted_names" -a '(blacklisted_cs_names)'
