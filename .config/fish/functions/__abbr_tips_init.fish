function __abbr_tips_init -d "Initialize abbreviations variables for fish-abbr-tips"
    set -e __ABBR_TIPS_KEYS
    set -e __ABBR_TIPS_VALUES
    set -Ux __ABBR_TIPS_KEYS
    set -Ux __ABBR_TIPS_VALUES

    set -l i 1
    set -l abb (string replace -r '.*-- ' '' -- (abbr -s))
    while test $i -le (count $abb)
        set -l current_abb (string split -m1 -- ' ' "$abb[$i]")
        set -a __ABBR_TIPS_KEYS "$current_abb[1]"
        set -a __ABBR_TIPS_VALUES (string trim -c '\'' -- "$current_abb[2]")
        set i (math $i + 1)
    end

    set -l i 1
    set -l abb (string replace -r '.*-- ' '' -- (alias -s))
    while test $i -le (count $abb)
        set -l current_abb (string split -m2 -- ' ' "$abb[$i]")
        set -a __ABBR_TIPS_KEYS "a__$current_abb[2]"
        set -a __ABBR_TIPS_VALUES (string trim -c '\'' -- "$current_abb[3]")
        set i (math $i + 1)
    end
end
