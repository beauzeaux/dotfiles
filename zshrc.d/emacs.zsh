# Aliases
alias emacs=emacs
alias e="emacs"

function isEmacsDaemonRunning() {
    return $(test -e "/tmp/emacs$UID/server")
}

function emacs-stop-daemon() {

}

