#-------------------------------------------
# bashrc
#-------------------------------------------
# 
# author:   borko
# version:  1
# date:     2010.11.18
#-------------------------------------------

cd ~/

echo -e "\n loading bashrc\n"

#--------------------------------------------------------------------------
# ubuntu specific
#--------------------------------------------------------------------------

    # If not running interactively, don't do anything
    [ -z "$PS1" ] && return
    [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"      # make less more friendly for non-text input files, see lesspipe(1) 
    if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then     # set variable identifying the chroot you work in (used in the prompt below) 
        debian_chroot=$(cat /etc/debian_chroot)
    fi
    case "$TERM" in                      # set a fancy prompt (non-color, unless we know we "want" color)
        xterm-color) color_prompt=yes;;
    esac

    #force_color_prompt=yes              # uncomment for a colored prompt, if the terminal has the capability;
    if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        color_prompt=yes
        else
        color_prompt=
        fi
    fi

    unset color_prompt force_color_prompt

    case "$TERM" in
    xterm*|rxvt*)
        PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
        ;;
    *)
        ;;
    esac

#--------------------------------------------------------------------------
# enable programmable completion features   
#--------------------------------------------------------------------------

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi 

#--------------------------------------------------------------------------
# colors in terminal
#--------------------------------------------------------------------------

if [ "$TERM" != "dumb" ] && [ -x /usr/bin/dircolors ]; then      
    eval "`dircolors -b`"
    alias ls='ls --color=always --group-directories-first'
    alias grep='grep --color=always'
    alias fgrep='fgrep --color=always'
    alias egrep='egrep --color=always'
fi

#--------------------------------------------------------------------------
# ENV
#--------------------------------------------------------------------------

export HISTCONTROL=ignoredups        # don't put duplicate lines in the history. See bash(1) for more options 
export HISTCONTROL=ignoreboth        # ... and ignore same sucessive entries
shopt -s checkwinsize                # check the window size after each command and, if necessary,
                                     # update the values of LINES and COLUMNS.   

#--------------------------------------------------------------------------
# prompt
#--------------------------------------------------------------------------
#export PS1="\[\033[0;32m\]\u@\h \[\033[33m\]$(PWDN)\[\033[0m\] \$ ";
#PS1='[\H: \W/ ]# '   

function PWDN {
pwd | awk -F\/ '{print $(NF-1),$(NF)}' | sed 's_ _/_'
}


PS1='\A [\033[32m\h\033[0m: $(PWDN)/ #] '

#-------------------------------------------
# svn
#-------------------------------------------  
export SVN_EDITOR='vim'
export SVN_ROOT=:ext:pborkowski@unicard.pl:https://intranet/baza/software/platinum/trunk 
export SVN_SSH=ssh                                                                       


#--------------------------------------------------------------------------
# ctags/cscope
#--------------------------------------------------------------------------
#alias cs='echo "mlcscope -b -R -I <idir>"'

alias ctag_cpp='ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .' 
alias ctag_py='ctags -R --python-kinds=-i *'

function cs() {
    find . -name '*.py' -o -name '*.java' -o -iname '*.[CH]' \
           -o -name '*.cpp' -o -name '*.cc' -o -name '*.hpp' > cscope.files
    cat cscope.files
    cscope -b -q        # -b: just build
                        # -q: create inverted index 
    #rm cscope.in.out cscope.po.out
}



#--------------------------------------------------------------------------
# my aliases
#--------------------------------------------------------------------------

alias pdd='ddd --debugger /usr/bin/pydb'
alias reload='source ~/.bashrc'
alias rmf='rm -rf'
alias la='ls -la'

function greptxt() {
    exc=""
    inc="*"

    for i do
      case "$i" in
            --e) shift; exc=$2; shift;;
            --i) shift; inc=$2; shift;;
      esac
    done
    echo "include set to '$inc'";
    echo "exclude set to '$exc'";
    grep -irH $1 * --include "$inc" --exclude "$exc" --exclude="\*.svn\*" --exclude="tags"
}

function grept() {
    grep -irH $1 * 
}


function ff() {
    find $1 -name $2 2> /dev/null
}

    #function la() {
    #    ls -lad .*/ --color=always | grep ^d --color=never 
    #    ls -la --color=always | grep ^l --color=never
    #    ls -la --color=always | grep ^- --color=never
    #}





#--------------------------------------------------------------------------
# vi settings
#--------------------------------------------------------------------------

bind -m vi-insert "\C-l":clear-screen
set -o vi

#bind '"\C-i": vi-complete'
#cat " bind '"\C-i": vi-complete' "
##echo -e "\n"
#cat " /c/projekty/acman/out/bin "



#--------------------------------------------------------------------------
# NS settings
#--------------------------------------------------------------------------
#-------------------------------------------
# version 2-32
#-------------------------------------------

# LD_LIBRARY_PATH
OTCL_LIB=/usr/share/ns-allinone-2.32/otcl-1.13
NS2_LIB=/usr/share/ns-allinone-2.32/lib
X11_LIB=/usr/X11R6/lib
USR_LOCAL_LIB=/usr/local/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$OTCL_LIB:$NS2_LIB:$X11_LIB:$USR_LOCAL_LIB  

# TCL_LIBRARY
TCL_LIB=/usr/share/ns-allinone-2.32/tcl8.4.15/library
USR_LIB=/usr/lib
export TCL_LIBRARY=$TCL_LIB:$USR_LIB  

# PATH
#XGRAPH=/usr/share/ns-allinone-2.32/bin:/usr/share/ns-allinone-2.32/tcl8.4.15/unix:/usr/share/ns-allinone-2.32/tk8.4.14/unix
XGRAPH=/usr/share/ns-allinone-2.32/bin:/usr/share/ns-allinone-2.32/tcl8.4.15/unix:
NS=/usr/share/ns-allinone-2.32/ns-2.32/
NAM=/usr/share/ns-allinone-2.32/nam-1.13/
PATH=$PATH:$XGRAPH:$NS:$NAM     

#-------------------------------------------
# version 2-34
#-------------------------------------------
#export TCL_LIBRARY=/usr/lib:/usr/share/ns-allinone-2.34/tcl8.4.18/library 
#export LD_LIBRARY_PATH=/usr/local/lib:/usr/X11R6/lib:/usr/share/ns-allinone-2.34/lib:/usr/share/ns-allinone-2.34/otcl-1.13  
#PATH=$PATH:/usr/share/ns-allinone-2.34/nam-1.14/:/usr/share/ns-allinone-2.34/ns-2.34/:/usr/share/ns-allinone-2.34/bin:/usr/share/ns-allinone-2.34/tcl8.4.18/unix:/usr/share/ns-allinone-2.34/tk8.4.18/unix



#--------------------------------------------------------------------------
# trojka
#--------------------------------------------------------------------------

alias trojka='mplayer -playlist http://www.polskieradio.pl/st/program3.asx'

#--------------------------------------------------------------------------
# CYGWIN specific
#--------------------------------------------------------------------------
#alias vim='vim 2> /dev/null'
#alias gvim='gvim 2> /dev/null'

#--------------------------------------------------------------------------
# MSYS specific
#--------------------------------------------------------------------------

# function pef {
#     procname=${1}
#     if [ $# -eq 0 ] ; then tasklist ; else tasklist | grep -i ${procname} | grep -v grep ; fi
# }
# 
# function ki {
#     procname=${1}
#     processes=$(tasklist | grep -i ${procname} | grep -v grep | gawk '{print $1}')
#     
#     for process in ${processes}
#     do
#         wmic process where name=\"${process}\" delete
#     done
# }
# 
# SDK=/c/Program\ Files/Microsoft\ SDKs/Windows/v7.0A/bin
# PATH=$PATH:$SDK   
