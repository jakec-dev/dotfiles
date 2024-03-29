#
# ~/.bashrc
#

# SSH Agent
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# work stuff
alias sshwork="ssh jclayton@172.16.10.37"
alias work="cat $HOME/work/contact.txt"

# jakec.dev stuff
alias sshjake="ssh -i $HOME/jakecdevDockerKey.pem ubuntu@jakec.dev"
alias scpjake="scp -i $HOME/jakecdevDockerKey.pem"

# command tweaks
alias sudo="sudo -v; sudo "
alias ls="ls --human-readable -1 --literal --hide-control-chars --color=auto --group-directories-first --size"
alias yeet="sudo pacman -Rns"
alias c="clear"
alias :q="exit"
alias q="exit"
alias py="python"

# fix ssh issue when using kitty terminal
# https://wiki.archlinux.org/title/Kitty#Terminal_issues_with_SSH
alias ssh="kitty +kitten ssh "

# create a bash script file
mks() {
    echo "#!/bin/bash" > $@
    chmod 775 $@
    $EDITOR $@
}

# trash-cli shortcuts
# https://github.com/andreafrancia/trash-cli/
alias rm='echo "You fool! Use trm to move files to trash or \rm to permanently delete file"; false'
alias trm="trash-put"
alias tli="trash-list"
alias tre="trash-restore"
alias tde="trash-rm"
alias tme="$SCRIPTS_HOME/system/empty-trash.sh"

# xdg-mime shortcuts
alias filetype="xdg-mime query filetype"
alias defaultapp="xdg-mime query default"

# terminal prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="\[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]> "
# PS1='\W > '

# task management
alias tui="taskwarrior-tui"
alias in="task add +inbox"

# calendar
alias remind="$SCRIPTS_HOME/system/reminder.sh"
alias rem="echo REM ${@}% >> ~/Documents/Sync/.reminders/cli.rem"
alias rem-edit="$EDITOR ~/Documents/Sync/.reminders/cli.rem"

# app shortcuts
alias mount-phone="simple-mtpfs phone/"
alias unmount-phone="fusermount -u phone/"
alias weather="curl wttr.in/Gold+Coast"
alias lf="$SCRIPTS_HOME/lf/lfrun"
alias vimwiki='vim -c VimwikiIndex'
alias vagrant="TERM=xterm-256color vagrant"

# completion for kitty terminal
source <(kitty + complete setup bash)

# define lang
LANG=en_US.UTF-8

# manage dotfiles - https://github.com/jakec-dev/dotfiles
alias config='/usr/bin/git --git-dir=/home/jake/.cfg/ --work-tree=/home/jake'

# icons for lf
export LF_ICONS="\
tw=:\
st=:\
ow=:\
dt=:\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
