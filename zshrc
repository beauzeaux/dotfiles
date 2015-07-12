
zstyle :compinstall filename '/home/beauzeaux/.zshrc'

# End of lines added by compinstall

source /usr/share/zsh/scripts/antigen/antigen.zsh

source ~/.zsh/settings.zsh

# Antigen packages

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting

antigen theme ys

antigen apply
