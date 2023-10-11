function __abbr_tips_bind_newline
    if test $__abbr_tips_used != 1
        if abbr -q -- (string trim -- (commandline))
            set -g __abbr_tips_used 1
        else
            set -g __abbr_tips_used 0
        end
    end
    commandline -f execute
end
