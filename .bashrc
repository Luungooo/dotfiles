source /etc/bashrc

RESET="\[\033[01;00m\]"
FG_MAGNETA="\[\033[01;35m\]"
FG_BLACK="\[\033[01;30m\]"
FG_GREEN="\[\033[01;32m\]"
FG_BLUE="\[\033[01;34m\]"
FG_YELLOW="\[\033[01;33m\]"
FG_BRIGHT_GREEN="\[\033[01;92m\]"
FG_CYAN="\[\033[01;36m\]"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

write_prefix() {
  echo -n "${debian_chroot:+($debian_chroot)}${FG_MAGNETA}\u${FG_BLUE}┬${FG_GREEN}\h \W"
  echo -n "${FG_YELLOW}"
  echo -n "\$(parse_git_branch)"
  echo -n "${RESET}\n"
  
  me="$USER"
  for (( i=0; i<${#me}; i++ )) do
    echo -n " "
  done
  echo "${FG_BLUE}└${FG_BLUE} \$${RESET} "
}

PS1="$(write_prefix)"


#Alias

alias bashconf='$EDITOR ~/.bashrc'
alias reload='source ~/.bashrc'
alias ls='ptls -A'
alias ll='ptls -lA'
alias pwd='ptpwd'
alias ipp='echo $(curl -s ipinfo.io/ip)'
alias yt='youtube-dl'
alias ytv='yt -f bestvideo'
alias yta='yt -f bestaudio'
alias mkdir='mkdir -p'
alias alacrittyconf='$EDITOR ~/.config/alacritty/alacritty.yml'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'


#environment variable

export EDITOR='/usr/bin/nvim'
export PATH=~/.local/bin:$PATH
