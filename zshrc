
zstyle :compinstall filename '/home/beauzeaux/.zshrc'

# End of lines added by compinstall

source /usr/share/zsh/scripts/antigen/antigen.zsh

source ~/.zsh/settings.zsh

# Antigen packages

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
git
pip
command-not-found

zsh-users/zsh-syntax-highlighting

EOBUNDLES
antigen theme ys
antigen apply
