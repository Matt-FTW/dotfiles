set -e SSH_AGENT_PID
if test -z $gnupg_SSH_AUTH_SOCK_BY; or test $gnupg_SSH_AUTH_SOCK_BY -ne $fish_pid
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end
set -gx GPG_TTY (tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
