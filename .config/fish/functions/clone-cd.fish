function clone-cd --argument url _destination
    set destination (default $_destination (repo-from-url $url))

    if file-exists $destination
        echo 'Already cloned. Attempting pull...'
        cd $destination && git pull
        return
    end

    git clone --depth=1 $url $destination && cd $destination
end
