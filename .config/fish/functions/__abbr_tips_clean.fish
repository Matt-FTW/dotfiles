function __abbr_tips_clean -d "Clean plugin variables and functions"
    bind --erase \n
    bind --erase \r
    bind --erase " "
    set --erase __abbr_tips_used
    set --erase __abbr_tips_run_once
    set --erase __ABBR_TIPS_VALUES
    set --erase __ABBR_TIPS_KEYS
    set --erase ABBR_TIPS_PROMPT
    set --erase ABBR_TIPS_AUTO_UPDATE
    set --erase ABBR_TIPS_ALIAS_WHITELIST
    set --erase ABBR_TIPS_REGEXES
    functions --erase __abbr_tips_bind_newline
    functions --erase __abbr_tips_bind_space
    functions --erase __abbr_tips
end
