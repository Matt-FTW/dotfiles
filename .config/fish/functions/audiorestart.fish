function audiorestart --wraps='systemctl --user restart wireplumber pipewire pipewire-pulse' --description 'alias audiorestart=systemctl --user restart wireplumber pipewire pipewire-pulse'
  systemctl --user restart wireplumber pipewire pipewire-pulse $argv
        
end
