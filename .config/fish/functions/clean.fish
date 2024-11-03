function clean
    sudo paccache -rk1
    sudo paccache -ruk0
    deleteOrphans
    cargo cache -a
    pnpm store prune
    sudo docker system prune -a
end
