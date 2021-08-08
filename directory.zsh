DIR_DIRECTORY=${DIR_DIRECTORY-${0:A:h}}
DIRECTORY_ALL=$HOME/.zsh/directory_all.txt
mkdir -p $(dirname "$DIRECTORY_ALL")

function chpwd() {
    builtin pwd >> "$DIRECTORY_ALL"
}

function fzf-cd() {
    out=$(fzfyml4 run ${DIR_DIRECTORY}/directory.yml "$DIRECTORY_ALL")
    if [[ -n $out ]]; then
        cd $out
    fi
}
alias d='fzf-cd'

