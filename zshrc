
zstyle :compinstall filename '/home/beauzeaux/.zshrc'

# End of lines added by compinstall

source /usr/share/zsh/scripts/antigen/antigen.zsh

# source ~/.zsh/settings.zsh

# Load all files from ~/.zshrc.d (thanks to chr4.org)
if [ -d $HOME/.zshrc.d/ ]; then
    for file in $HOME/.zshrc.d/*.zsh; do
        source $file
    done
fi

# Antigen packages

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
git
pip
command-not-found

zsh-users/zsh-syntax-highlighting

EOBUNDLES
antigen theme agnoster
antigen apply
