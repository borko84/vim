#-------------------------------------------------------------------------
# zshrc
#-------------------------------------------------------------------------
echo -e "\n...loading zshrc ...\n\n"


#-------------------------------------------------------------------------
# next lets set some enviromental/shell pref stuff up
#-------------------------------------------------------------------------
setopt ALL_EXPORT

# setopt APPEND_HISTORY
# unsetopt BG_NICE          #do NOT nice bg commands
# setopt CORRECT            #command CORRECTION
# setopt EXTENDED_HISTORY   #puts timestamps in the history
# setopt MENUCOMPLETE

# setopt HASH_CMDS          #turns on hashing
# setopt NOHUP
# setopt NOTIFY
# setopt NO_FLOW_CONTROL
# setopt AUTO_LIST          #these two should be turned off
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME        #tries to resume command of same name



#-------------------------------------------------------------------------
# IRC settings
#-------------------------------------------------------------------------
#IRCNICK="borko"
#IRCNAME="Piotrek Borko |  borko@o2.pl"
#IRCSERVER=irc.debian.org

#-------------------------------------------------------------------------
# history 
#-------------------------------------------------------------------------
HISTFILE=$HOME/.zhistory
HISTSIZE=1000
SAVEHIST=1000


#-------------------------------------------------------------------------
# env
#-------------------------------------------------------------------------
#TZ="Europe/Rome"
#PYTHON_PATH="python-libs:$PYTHON_PATH"
#HOSTNAME="`hostname -s`"
#NNTPSERVER=wonka.hampshire.edu
#PAGER=less
#EDITOR='emacs -nw'
#EMAIL='mako@bork.hampshire.edu'
#DEBFULLNAME="Benjamin Hill (Mako)" 
#DEBEMAIL='mako@debian.org'

#LANGUAGE=
#LC_ALL=en_US.UTF-8
#LANG=en_US.UTF-8
#LC_CTYPE=C
#unsetopt ALL_EXPORT
#enable ls colors by default - use yellow for directories
#LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.svgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:"

#-------------------------------------------------------------------------
# svn
#-------------------------------------------------------------------------
export SVN_EDITOR='vim'
export SVN_ROOT=:ext:pborkowski@unicard.pl:https://intranet/baza/software/platinum/trunk 
export SVN_SSH=ssh                                                                       

#-------------------------------------------------------------------------
# cvs
#-------------------------------------------------------------------------
#CVS_RSH=ssh
#CVSROOT=/var/cvs
#CVSROOT=:ext:mako@micha.hampshire.edu:/var/cvs

export GIT_AUTHOR_NAME='Piotr Bo'
export GIT_COMMITTER_NAME=borko
export GIT_AUTHOR_EMAIL=borko84@gmail.com
export GIT_COMMITTER_EMAIL=borko84@gmail.com


#-------------------------------------------------------------------------
# PROMPT
#-------------------------------------------------------------------------
autoload -U colors && colors
PS1="%D{%m%d %H:%M} [%{$fg[green]%}%m%{$reset_color%}: %2c]# "   

#PROMPT="$HOST:%~%% " 
#PS1='%D{%m%d %H:%M} [%U%m%u:%2c%]x# '
#PS1="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "



#-------------------------------------------------------------------------
# PATH
#-------------------------------------------------------------------------
PATH="$HOME/bin:/usr/local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/sbin:."

#export DISPLAY=localhost:0.0
#export DISPLAY=localhost:0.0

#-------------------------------------------------------------------------
# colors in terminal
#-------------------------------------------------------------------------
#if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then      
#    eval "`dircolors -b`"
#    alias ls='ls --color=always --group-directories-first'
#    alias grep='grep --color=always'
#    alias fgrep='fgrep --color=always'
#    alias egrep='egrep --color=always'
#fi      



#-------------------------------------------------------------------------
# aliases
#-------------------------------------------------------------------------
alias reload='source ~/.zshrc'
alias rmf="rm -rf"
alias ls='ls --color=auto '
alias la='ls -al'
alias xrestart='sudo /etc/init.d/kdm restart'

#eval `dircolors $HOME/.dircolors`
#alias slrn="slrn -n"
#alias f=finger
#alias offlineimap-tty='offlineimap -u TTY.TTYUI'
#alias rest2html-css='rest2html --embed-stylesheet --stylesheet-path=/usr/share/python-docutils/stylesheets/default.css'
#alias grep='egrep'


#function grept() {
#    grep -Hrin $1 * 
#}


# alias    =clear

#chpwd() {
#     [[ -t 1 ]] || return
#     case $TERM in
#     sun-cmd) print -Pn "\e]l%~\e\\"
#     ;;
#    *xterm*|screen|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
#    ;;
#    esac
#}




#-------------------------------------------------------------------------
# cygwin
#-------------------------------------------------------------------------
#alias cmd='/cygdrive/c/Windows/system32/cmd.exe /c start cmd'   
#alias vim='vim 2> /dev/null'
#alias gvim='gvim 2> /dev/null'
## alias	=clear


#-------------------------------------------------------------------------
# completion start
#-------------------------------------------------------------------------
autoload -U compinit
compinit

autoload -U promptinit
promptinit

setopt completealiases
bindkey -v   # vim key bindings
bindkey '^R' history-incremental-search-backward

#bindkey "\e[Z" reverse-menu-complete # Shift+Tab 



#-------------------------------------------------------------------------
# zsh completion
#-------------------------------------------------------------------------
#zstyle ':completion:*' menu select     # selecting completion

#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
#zstyle ':completion:*' menu select=5
#zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
#zstyle :compinstall filename '/home/borko/.zshrc'





#-------------------------------------------------------------------------
# NS settings - version 2-32
#-------------------------------------------------------------------------
# # LD_LIBRARY_PATH
# OTCL_LIB=/usr/share/ns-allinone-2.32/otcl-1.13
# NS2_LIB=/usr/share/ns-allinone-2.32/lib
# X11_LIB=/usr/X11R6/lib
# USR_LOCAL_LIB=/usr/local/lib
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OTCL_LIB:$NS2_LIB:$X11_LIB:$USR_LOCAL_LIB  

# # TCL_LIBRARY
# TCL_LIB=/usr/share/ns-allinone-2.32/tcl8.4.15/library
# USR_LIB=/usr/lib
# export TCL_LIBRARY=$TCL_LIB:$USR_LIB  

# # PATH
# #XGRAPH=/usr/share/ns-allinone-2.32/bin:/usr/share/ns-allinone-2.32/tcl8.4.15/unix:/usr/share/ns-allinone-2.32/tk8.4.14/unix
# XGRAPH=/usr/share/ns-allinone-2.32/bin:/usr/share/ns-allinone-2.32/tcl8.4.15/unix:
# NS=/usr/share/ns-allinone-2.32/ns-2.32/
# NAM=/usr/share/ns-allinone-2.32/nam-1.13/
# PATH=$PATH:$XGRAPH:$NS:$NAM   





#-------------------------------------------------------------------------
# OMNET settings
#-------------------------------------------------------------------------
#export PATH=$PATH:/home/borko/omnetpp-4.1/bin
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/borko/omnetpp-4.1/lib 
#export TCL_LIBRARY=/usr/share/tcltk/tcl8.4
