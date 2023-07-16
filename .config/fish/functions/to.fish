# Display general usage
function __to_usage
  echo 'Usage:'
  echo ' to (BOOKMARK|DIR)         Go to BOOKMARK or DIR'
  echo ' to add [BOOKMARK] [DEST]  Create a BOOKMARK for DEST'
  echo '                             Default BOOKMARK: name of current directory'
  echo '                             Default DEST: path to current directory'
  echo ' to add DEST               Create a bookmark for DEST if it is a directory'
  echo ' to ls                     List all bookmarks'
  echo ' to mv OLD NEW             Change the name of a bookmark from OLD to NEW'
  echo ' to rm BOOKMARK            Remove BOOKMARK'
  echo ' to clean                  Remove bookmarks that have a missing destination'
  echo ' to resolve BOOKMARK       Print the destination of a bookmark'
  echo ' to help                   Show this message'
  echo
  echo "Bookmarks are stored in: $TO_DIR"
  echo 'To change, run: set -U TO_DIR <dir>'
  return 1
end

# https://github.com/fish-shell/fish-shell/issues/6173#issuecomment-1067114363
function is_empty_dir
    test -d "$argv"
    or return 1 # not a directory, so not an empty directory
    # count counts how many arguments it received
    # if this glob doesn't match, it won't get arguments
    # and so it will return 1
    # because we *want* an empty directory, turn that around.
    # the `{.*,*}` ensures it matches hidden files as well.
    not count $argv/{.*,*} >/dev/null
end

function __to_dir
  if test -n "$TO_DIR"
    echo $TO_DIR
    return
  end

  set -l dir

  if test -d "$HOME/.tofish" && not is_empty_dir $HOME/.tofish
    set dir $HOME/.tofish
  else if test -n "$XDG_DATA_HOME"
    set dir $XDG_DATA_HOME/to-fish
  else
    set dir $HOME/.local/share/to-fish
  end

  set -U TO_DIR $dir
  echo $TO_DIR
end

function __to_bm_path
  echo (__to_dir)/$argv
end

function __to_resolve
  readlink (__to_bm_path $argv) 2>/dev/null
end

function __to_print
  __to_resolve $argv | string replace -r "^$HOME" "~" | string replace -r '^~$' $HOME
end

function __to_ls
  for l in (__to_dir)/*
    basename $l
  end
end

function __to_rm
  command rm -v (__to_bm_path $argv[1]); or return $status
  __to_update_bookmark_completions
end

function __to_add -a bm dest
  # if there are no arguments
  if test -z "$bm"
    # use the current directory
    set dest (pwd)
    set bm (basename $dest)
  else
    # if there are two arguments
    if test -n "$dest"
      # use them as bookmark name and destination
      set dest (realpath $dest)

    # if there is only one argument
    else

      # if the argument is a directory
      if string match -q '*/*' $bm && test -d "$bm"
        # use it as the destination
        set dest (realpath $bm)
        set bm (basename $dest)
      else
        # if not a directory
        # use it as the bookmark name
        set dest (pwd)
      end
    end
  end

  if __to_resolve $bm > /dev/null
    echo "ERROR: Bookmark exists: $bm -> "(__to_print $bm) >&2
    return 1
  end

  if not test -d "$dest"
    echo "ERROR: Destination does not exist: $dest" >&2
    return 1
  end

  if string match -q '*/*' $bm
    echo "ERROR: Bookmark name cannot contain '/': $bm" >&2
    return 1
  end

  switch (uname)
    case Darwin
      command ln -s $dest (__to_bm_path $bm); or return $status
    case '*'
      command ln -sT $dest (__to_bm_path $bm); or return $status
  end

  echo $bm "->" (__to_print $bm)

  __to_update_bookmark_completions
end

function __to_complete_directories
  set -l cl (commandline -ct | string split -m 1 /)
  set -l bm $cl[1]
  set -l bmdir (__to_resolve $bm)
  if test -z "$bmdir"
    __fish_complete_directories
  else
    set -e cl[1]
    if test -z "$cl"
      __fish_complete_directories $bmdir/ | string replace -r 'Directory$' $bm
    else
      __fish_complete_directories $bmdir/$cl | string replace -r 'Directory$' $bm
    end
  end
end

function __to_update_bookmark_completions
  complete -e -c to
  complete -c to -k -x -s h -l help -d 'Show help'

  # Subcommands
  complete -c to -k -n '__fish_use_subcommand' -f -a 'help' -d 'Show help'
  complete -c to -k -n '__fish_use_subcommand' -x -a 'resolve' -d 'Print bookmark destination'
  complete -c to -k -n '__fish_use_subcommand' -x -a 'clean' -d 'Remove bad bookmarks'
  complete -c to -k -n '__fish_use_subcommand' -x -a 'mv' -d 'Rename bookmark'
  complete -c to -k -n '__fish_use_subcommand' -x -a 'rm' -d 'Remove bookmark'
  complete -c to -k -n '__fish_use_subcommand' -f -a 'ls' -d 'List bookmarks'
  complete -c to -k -n '__fish_use_subcommand' -x -a 'add' -d 'Create bookmark'

  # Directories
  complete -c to -k -n '__fish_use_subcommand' -r -a '(__to_complete_directories)'

  # Bookmarks
  for bm in (__to_ls | sort -r)
    complete -c to -k -n '__fish_use_subcommand; or __fish_seen_subcommand_from rm mv resolve' -r -a (echo $bm | string escape) -d (__to_print $bm)
  end
end

function to -d 'Bookmarking tool'
  set -l dir (__to_dir)

  # Create tofish directory
  if not test -d "$dir"
    if command mkdir $dir
      echo "Created bookmark directory: $dir"
    else
      echo "Failed to Create bookmark directory: $dir"
      return 1
    end
  end

  # Catch usage errors
  set -l cmd $argv[1]
  set -l numargs (count $argv)
  switch $cmd
    # subcommands that don't take an argument
    case ls help clean
      if not test $numargs -eq 1
        echo "Usage: to $cmd"
        return 1
      end

    # subcommands that require an argument
    case rm resolve
      if not test $numargs -eq 2
        echo "Usage: to $cmd BOOKMARK"
        return 1
      end

    # add has 2 optional arguments
    case add
      if not test $numargs -ge 1 -a $numargs -le 3
        echo 'Usage: to add [BOOKMARK] [DEST]'
        echo '       to add DEST'
        return 1
      end

    # subcommands that require 2 arguments
    case mv
      if not test $numargs -eq 3
        echo 'Usage: to mv OLD NEW'
        return 1
      end
  end

  switch $cmd
    # Add a bookmark
    case add
      __to_add $argv[2..-1]
      return $status

    # Remove a bookmark
    case rm
      __to_rm $argv[2]
      return $status

    # List all bookmarks
    case ls
      for bm in (__to_ls)
        echo "$bm -> "(__to_print $bm)
      end
      return 0

    # Rename a bookmark
    case mv
      set -l old $argv[2]
      if not __to_resolve $old > /dev/null
        echo "ERROR: Bookmark not found: $old"
        return 1
      end

      set -l new $argv[3]
      __to_add $new (__to_resolve $old); or return $status
      __to_rm $old; or return $status

      return 0

    # Clean
    case clean
      for bm in (__to_ls)
        if not test -d (__to_resolve $bm)
          __to_rm $bm
        end
      end
      return 0

    # Resolve
    case resolve
      __to_resolve $argv[2]
      return $status

    # Help
    case -h --help help
      __to_usage
      return 0

    # Default
    case '*'
      set -l name $argv[1]
      if test -z "$name"
        __to_usage
        return 1
      end

      set -l dest (__to_resolve $name)
      if test -z "$dest"
        if test -d "$name"
          echo "cd \"$name\"" | source -
        else
          echo "to: No such bookmark “$name”" >&2
          return 1
        end
      else if test -d "$dest"
        echo "cd \"$dest\"" | source -
      else
        echo "to: Destination for bookmark “$name” does not exist: $dest" >&2
        return 1
      end
  end
end
