# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
export EDITOR="vim"
# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
#PS1='${debian_chroot:+($debian_chroot)}\[\e[01;34m\]\u\[\e[01;34m\]::\[\e[11;37m\]\h\[\e[01;30m\]:\[\e[01;34m\]\w\[\e[11;37m\]#
#\[\e[11;37m\]>>> \[\e[0m\]'
PS1="\[\e[00;32m\]\u\[\e[0m\]\[\e[00;33m\]@\[\e[0m\]\[\e[00;34m\]\h\[\e[0m\]\[\e[00;37m\][\[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]\[\e[0m\]\[\e[00;32m\]\\$\[\e[0m\]"
#PS1="\n\[\e[30;1m\](\[\e[36;1m\]\u@\h\[\e[30;1m\])-(\[\e[34;0m\]\j\[\e[30;1m\])-(\[\e[32;1m\]\@ \d\[\e[30;1m\])->\[\e[30;1m\]\n(\[\e[34;1m\]\w\[\e[30;1m\])-(\[\e[34;1m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files, \$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\e[30;1m\])--> \[\e[0m\]"
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    #PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    PS1="\[\e[00;32m\]\u\[\e[0m\]\[\e[00;33m\]@\[\e[0m\]\[\e[00;34m\]\h\[\e[0m\]\[\e[00;37m\][\[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]\[\e[0m\]\[\e[00;32m\]\\$\[\e[0m\]"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#USER ALIAS
#alias my='mysql -u maioral -p --auto-rehash'
#alias ic='cd /safe/icarus/configurations && django && cd ../'
#alias ol='cd /safe/olympus/configurations && django && cd ../'
#alias ar='cd /safe/ares/configurations && django && cd ../'
#alias ml='cd /home/rspena/fmq/mathlibs'
alias clean='clear;clear;'
alias reload='clear;clear;exec bash -l;'

#USER HOME ALIAS
alias work='cd /home/fabiov/workspace'
alias home='cd /home/fabiov'
#alias test='cd /home/edu/workspaces/testing'

#GAMEDEV ALIAS
alias repos='cd /home/fabiov/workspace/repos'
#alias gm='cd /home/edu/workspaces/repos/impriart/source/games'
#alias fmq='cd /home/edu/workspaces/impriart_motor'
#alias imp='cd /home/edu/workspaces/impriart_motor'
#alias impriart='cd /home/edu/workspaces/repos/impriart/source'
#alias drivers='cd /home/edu/workspaces/RepoDrivers/Software/LibDrivers/'
#alias drv='cd /home/edu/workspaces/RepoDrivers/Software/LibDrivers/'

#GIT ALIAS
alias gg='git gui'
alias gc='git checkout'
alias gss='git stash save'
alias gsp='git stash pop'
alias gs='git status'
alias gb='git branch'
alias gp='git pull'
alias gk='gitk --all'
alias gr='git reset --hard HEAD~0'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --"

#QX ALIAS
#alias qxx='172.20.2.234'
#alias qxxconnect='ssh machine@172.20.2.234'

#Microchip Tools
export PATH=$PATH:"/opt/microchip/xc32/v1.31/bin"
export PATH=$PATH:"/opt/microchip/xc16/v1.21/bin"
export PATH=$PATH:"/opt/microchip/xc8/v1.30/bin"
export PATH=$PATH:"/opt/microchip/xc8/v1.33/bin"
export PATH=$PATH:"/opt/microchip/xc16/v1.22/bin"
export PATH=$PATH:"/opt/microchip/xc32/v1.33/bin"


#alias logs='gnome-terminal -e "python /safe/icarus/scripts/openlogs.py all"'
# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
#alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
#alias terminator="terminator 2>/dev/null"

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export LESS="-R"
eval "$(lesspipe)"
#---------------------------------------------------------------------------+
# => colour chart                                                           |
#---------------------------------------------------------------------------+
# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue

# Bold
BBlack="\[\033[1;30m\]"       # Black
BRed="\[\033[1;31m\]"         # Red
BGreen="\[\033[1;32m\]"       # Green
BYellow="\[\033[1;33m\]"      # Yellow
BBlue="\[\033[1;34m\]"        # Blue

# Bold High Intensty
BIBlack="\[\033[1;90m\]"      # Black
BIRed="\[\033[1;91m\]"        # Red
BIGreen="\[\033[1;92m\]"      # Green
BIYellow="\[\033[1;93m\]"     # Yellow
BIBlue="\[\033[1;94m\]"       # Blue

# Various variables you might want for your PS1 prompt instead
LoggedUser="\u"
PathShort="\w"
PathFull="\W"
NewLine="\n"


#export PS1='$([ "$(id -u)" == "0" ] && echo "'${BRed}'" || echo "'${BBlue}'")'"[ "${LoggedUser}" ]"${Color_Off}'$(git branch &>/dev/null;\
export PS1='$([ "$(id -u)" == "0" ] && echo "'${BRed}'" || echo "'${BBlue}'")'"\[\e[00;32m\]\u\[\e[0m\]\[\e[00;33m\]@\[\e[0m\]\[\e[00;34m\]\h\[\e[0m\]\[\e[00;37m\][\[\e[0m\]\[\e[00;33m\]\w\[\e[0m\]\[\e[00;37m\]]\[\e[0m\]\[\e[00;32m\]\\$\[\e[0m\]"${Color_Off}'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    # @4 - Clean repository - nothing to commit
    echo "'${BGreen}'\n"$(__git_ps1 " (%s)"); \
  else \
    # @5 - Changes to working tree
    echo "'${BIRed}'\n"$(__git_ps1 " {%s}"); \
  fi) '${Red}" "${Color_Off}'\n$ "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'${Green}" "${Color_Off}'"; \
fi)'

mymake()
{
  pathpat="(/[^/]*)+:[0-9]+"
  ccred=$(echo -e "\033[0;31m")
  ccyellow=$(echo -e "\033[0;33m")
  ccend=$(echo -e "\033[0m")
  /usr/bin/make "$@" 2>&1 | sed -E -e "/[Ee]rror[: ]/ s%$pathpat%$ccred&$ccend%g" -e "/[Ww]arning[: ]/ s%$pathpat%$ccyellow&$ccend%g"
  return ${PIPESTATUS[0]}
}


#fortune cookies
#~/.myScripts/cowscript

#Node NVM
#source ~/.nvm/nvm.sh
#nvm use 0.12.4 > /dev/null 2>&1
#nodeVersion=`nvm current`

#Node Webkit
#alias nw='~/.nw/nw'

#Electron
#alias electron='~/.electron/electron'
#electronVersion=` electron --version`

#gcc g++
#gccVersion=`gcc -v 2>&1 | tail -1 | cut -d " " -f 3`
#gppVersion=`g++ -v 2>&1 | tail -1 | cut -d " " -f 3`

#gccArm
#8.2.1
#export PATH="/opt/armGcc/gcc-arm-none-eabi-8-2018-q4-major/bin:$PATH"
#4.7.4
#export PATH="/opt/armGcc/gcc-arm-none-eabi-4_7-2013q2/bin:$PATH"
#alias arm-gcc='arm-none-eabi-gcc'
#alias arm-g++='arm-none-eabi-g++'

#arm-gcc arm-g++
#armGccVersion=`arm-none-eabi-gcc -v 2>&1 | tail -1 | cut -d " " -f 3`
#armGppVersion=`arm-none-eabi-g++ -v 2>&1 | tail -1 | cut -d " " -f 3`
#openOCDVersion=`openocd -v 2>&1 | head -1 | cut -d " " -f 4| cut -c1-10`

#python
#pythonVersion=`python -c 'import platform; print(platform.python_version())'`

#IP's
#wifiIp=`ifconfig wlp2s0  |grep 'netmask' |awk '/inet/ {print $2}'`
#adapterIp=`ifconfig enp0s31f6  |grep 'netmask' |awk '/inet/ {print $2}'`
#dockIp=`ifconfig enx3ce1a1240fce  |grep 'netmask' |awk '/inet/ {print $2}'`

#Print Versions:
#echo -e '\033[1;34m' Now using:
#echo -e '\033[1;37m' \* node: $nodeVersion\\t'\033[1;93m' \* electron: $electronVersion\\t'\033[1;91m'\* python: $pythonVersion
#echo -e '\033[1;92m' \* gcc: $gccVersion\\t\\t'\033[1;90m' \* g++: $gppVersion
#echo -e '\033[0;92m' \* arm-gcc: $armGccVersion\\t'\033[0;90m' \* arm-g++: $armGppVersion\\t'\033[1;91m'\* OpenOCD: $openOCDVersion


#Print IP's
#ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'
#echo -e '\033[1;34m' IP: `ifconfig eth0 2>/dev/null|awk '/inet addr:/ {print $2}'|sed 's/addr://'`
#echo -e '\033[1;34m' IP\'s:
#echo -e '\033[1;37m' \* Wifi: $wifiIp\\t'\033[1;93m' \* Dock: $dockIp '\033[1;91m'\\t\* Adapter: $adapterIp\\t'\033[1;92m' 
#echo -en "\e[0m"

#unetbootin
#export PATH=$PATH:/opt/SourceryCodeBenchLite/bin/
#export PATH=$PATH:/opt/unetbootin/
#alias unetbootin='sudo /opt/unetbootin/unetbootin-linux64-661.bin'


export PATH="/home/fabiov/workspace/Scripts/:$PATH"

#GCC compiler to ledstrips firmware
export PATH="/opt/gcc-arm-none-eabi-4_7-2013q2/bin:$PATH"
#GCC compliler for botoneira
#export PATH="/opt/gcc-arm-none-eabi-8-2019-q3-update/bin:$PATH"

