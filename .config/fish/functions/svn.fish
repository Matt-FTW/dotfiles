function svn --description alias\ svn=svn\ --config-dir\ \\\"\$XDG_CONFIG_HOME\\\"/subversion
    command svn --config-dir \"$XDG_CONFIG_HOME\"/subversion $argv
end
