#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Start ssh-agent automatically, ensure only one agent process runs at a time
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# command tweaks
alias sudo="sudo -v; sudo "
alias ls="ls --human-readable -1 --literal --hide-control-chars --color=auto --group-directories-first --size --dereference"
alias c="clear"
alias q="exit"

# fix ssh issue when using kitty terminal
# https://wiki.archlinux.org/title/Kitty#Terminal_issues_with_SSH
alias ssh="kitty +kitten ssh "

# cd + ls in one command
cl() {
    local dir="$1"
    local dir="${dir:=$HOME}"
    if [[ -d "$dir" ]]; then
        cd "$dir" >/dev/null; ls
    else
        echo "bash: cl: $dir: Directory not found"
    fi
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
PS1='\W > '

# app shortcuts
alias battlestation="bpytop"
alias vol="pulsemixer"
alias bluetooth="bluetoothctl"
alias firewall="sudo gufw"
alias mount-phone="simple-mtpfs phone/"
alias unmount-phone="fusermount -u phone/"
alias news="newsboat"
alias weather="curl wttr.in/'Gold Coast, Australia'"
alias lf="$SCRIPTS_HOME/lf/lfrun"
alias vagrant="TERM=xterm-256color vagrant"
wiki() {
    search_term="$(echo $@ | sed 's/ /+/g')"
    lynx https://wiki.archlinux.org/index.php?search=${search_term} 
}

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
