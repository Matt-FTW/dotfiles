function gr --wraps='cd "$(git rev-parse --show-toplevel)"' --description 'alias gr=cd "$(git rev-parse --show-toplevel)"'
    cd "$(git rev-parse --show-toplevel)" $argv
end
