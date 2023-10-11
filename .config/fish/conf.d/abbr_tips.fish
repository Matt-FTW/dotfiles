for mode in default insert
    bind --mode $mode " " __abbr_tips_bind_space
    bind --mode $mode \n __abbr_tips_bind_newline
    bind --mode $mode \r __abbr_tips_bind_newline
end

set -g __abbr_tips_used 0

# Trim simple/double quotes from args
function trim_value
    echo "$argv" | string trim --left --right --chars '"\'' | string join ' '
end

function __abbr_tips_install --on-event abbr_tips_install
    # Regexes used to find abbreviation inside command
    # Only the first matching group will be tested as an abbr
    set -Ux ABBR_TIPS_REGEXES
    set -a ABBR_TIPS_REGEXES '(^(\w+\s+)+(-{1,2})\w+)(\s\S+)'
    set -a ABBR_TIPS_REGEXES '(^(\s?(\w-?)+){3}).*'
    set -a ABBR_TIPS_REGEXES '(^(\s?(\w-?)+){2}).*'
    set -a ABBR_TIPS_REGEXES '(^(\s?(\w-?)+){1}).*'

    set -Ux ABBR_TIPS_PROMPT "\n💡 \e[1m{{ .abbr }}\e[0m => {{ .cmd }}"
    set -gx ABBR_TIPS_AUTO_UPDATE background

    __abbr_tips_init
end

function __abbr_tips --on-event fish_postexec -d "Abbreviation reminder for the current command"
    set -l command (string split ' ' -- "$argv")
    set -l cmd (string replace -r -a '\\s+' ' ' -- "$argv" )

    # Update abbreviations lists when adding/removing abbreviations
    if test "$command[1]" = abbr
        # Parse args as abbr options
        argparse --name abbr --ignore-unknown a/add e/erase g/global U/universal -- $command

        if set -q _flag_a
            and not contains -- "$argv[2]" $__ABBR_TIPS_KEYS
            set -a __ABBR_TIPS_KEYS "$argv[2]"
            set -a __ABBR_TIPS_VALUES (trim_value "$argv[3..-1]")
        else if set -q _flag_e
            and set -l abb (contains -i -- "$argv[2]" $__ABBR_TIPS_KEYS)
            set -e __ABBR_TIPS_KEYS[$abb]
            set -e __ABBR_TIPS_VALUES[$abb]
        end
    else if test "$command[1]" = alias
        # Update abbreviations list when adding aliases
        set -l alias_key
        set -l alias_value

        # Parse args as `alias` options
        argparse --name alias --ignore-unknown s/save -- $command

        if string match -q '*=*' -- "$argv[2]"
            set command_split (string split '=' -- $argv[2])
            set alias_key "a__$command_split[1]"
            set alias_value $command_split[2..-1]
        else
            set alias_key "a__$argv[2]"
            set alias_value $argv[3..-1]
        end

        set alias_value (trim_value "$alias_value")

        if set -l abb (contains -i -- "$argv[3..-1]" $__ABBR_TIPS_KEYS)
            set __ABBR_TIPS_KEYS[$abb] $alias_key
            set __ABBR_TIPS_VALUES[$abb] $alias_value
        else
            set -a __ABBR_TIPS_KEYS $alias_key
            set -a __ABBR_TIPS_VALUES $alias_value
        end
    else if test "$command[1]" = functions
        # Parse args as `functions` options
        argparse --name functions e/erase -- $command

        # Update abbreviations list when removing aliases
        if set -q _flag_e
            and set -l abb (contains -i -- a__{$argv[2]} $__ABBR_TIPS_KEYS)
            set -e __ABBR_TIPS_KEYS[$abb]
            set -e __ABBR_TIPS_VALUES[$abb]
        end
    end

    # Exit in the following cases :
    #  - abbreviation has been used
    #  - command is already an abbreviation
    #  - command not found
    #  - or it's a function (alias)
    if test $__abbr_tips_used = 1
        set -g __abbr_tips_used 0
        return
    else if abbr -q "$cmd"
        or not type -q "$command[1]"
        return
    else if string match -q -- "alias $cmd *" (alias)
        return
    else if test (type -t "$command[1]") = function
        and count $ABBR_TIPS_ALIAS_WHITELIST >/dev/null
        and not contains "$command[1]" $ABBR_TIPS_ALIAS_WHITELIST
        return
    end

    set -l abb
    if not set abb (contains -i -- "$cmd" $__ABBR_TIPS_VALUES)
        for r in $ABBR_TIPS_REGEXES
            if set abb (contains -i -- (string replace -r -a -- "$r" '$1' "$cmd") $__ABBR_TIPS_VALUES)
                break
            end
        end
    end

    if test -n "$abb"
        if string match -q "a__*" -- "$__ABBR_TIPS_KEYS[$abb]"
            set -l alias (string sub -s 4 -- "$__ABBR_TIPS_KEYS[$abb]")
            if functions -q "$alias"
                echo -e (string replace -a '{{ .cmd }}' -- "$__ABBR_TIPS_VALUES[$abb]" \
                        (string replace -a '{{ .abbr }}' -- "$alias" "$ABBR_TIPS_PROMPT"))
            else
                set -e __ABBR_TIPS_KEYS[$abb]
                set -e __ABBR_TIPS_VALUES[$abb]
            end
        else
            echo -e (string replace -a '{{ .cmd }}' -- "$__ABBR_TIPS_VALUES[$abb]" \
                    (string replace -a '{{ .abbr }}' -- "$__ABBR_TIPS_KEYS[$abb]" "$ABBR_TIPS_PROMPT"))
        end
    end

    return
end

function __abbr_tips_update --on-event abbr_tips_update
    __abbr_tips_clean
    __abbr_tips_install
end

function __abbr_tips_uninstall --on-event abbr_tips_uninstall
    __abbr_tips_clean
    functions --erase __abbr_tips_init
end
