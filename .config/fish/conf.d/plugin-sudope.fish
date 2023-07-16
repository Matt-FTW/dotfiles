# default key sequence:
set -q sudope_sequence
  or switch $FISH_VERSION
    case '2.0' '2.0.*' '2.1' '2.1.*' '2.2' '2.2.*'
      # use Ctrl+s for fish 2.2 and earlier, as Esc is not usable as a meta key.
      set sudope_sequence \cs
    case '*'
      # use Esc+Esc for fish 2.3+
      set sudope_sequence \e\e
  end

function __sudope_bind -a sequence # modifiers..
  set -l modifiers $argv[2..-1]

  set -l current_binding (bind $modifiers $sequence 2>/dev/null | cut -d' ' -f2-)
  if test -n "$current_binding"
    echo "sudope: The sequence `$sequence` is already bound to: `$current_binding` (`$modifiers`)"
  else
    bind $modifiers -- $sequence sudope
  end
end

# if sudope is already bound to some sequence, leave it
if bind | string match -rq '[[:space:]]sudope$'
  exit
end

set -l -- bind_modifiers '--mode' "$fish_bind_mode"
switch $FISH_VERSION
  case '2.*'
    # no change
  case '*'
    # in 3.x, fish added a default binding for a more naive version of sudope,
    # and we want to use ours. so we'll use the 3.x+ `--user` flag to override the preset.
    set -- bind_modifiers $bind_modifiers '--user'
end

__sudope_bind $sudope_sequence $bind_modifiers
