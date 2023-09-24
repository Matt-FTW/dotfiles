function yc --wraps='yadm commit -S -a -m' --description 'alias yc=yadm commit -S -a -m'
    yadm commit -S -m $argv
end
