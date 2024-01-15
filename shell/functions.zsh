function my_fzf() {
	cd $(find -L ~ \( -path '*/\.*' -o -path '/**/node_modules' -o -fstype 'dev' -o -fstype 'proc' \) -prune -o -type d -print 2> /dev/null | sed 1d | cut -b1- | fzf --preview 'bat --style=numbers --color=always {} | head -500' +m)
}

function ranger-cd() {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    _ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}

function _ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        ranger "$@"
    else
        exit
    fi
}

function gpgagentr () {
  gpg-connect-agent killagent /bye
  gpg-connect-agent updatestartuptty /bye
  gpg-connect-agent /bye
}
