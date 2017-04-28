# Lines configured by zsh-newuser-install
bindkey -v
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd
# End of lines configured by zsh-newuser-install

# The following lines were added by compinstall
zstyle :compinstall filename '/home/simong/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# [SimonG] Setting up my own prompt
PROMPT=$'\n'"%F{green}[%n@%m: %B%d%b%f%F{green}]%f"$'\n'"> "

# [SimonG] Force the terminal color mode outside of TMUX to xterm-256
[ -z "$TMUX" ] && export TERM=xterm-256color

# [SimonG] Start tmux together with terminal
# Tests to make sure that tmux:
# (1) exists on the system and
# (2) doesn't try to run within itself
if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

############ My own welcome message
bold=$(tput bold)
normal=$(tput sgr0)
green=$(tput setaf 2)
red=$(tput setaf 1)

disk_root_total=`df -h | grep 'dev/sda2' | awk '{print $2}'`
disk_home_total=`df -h | grep 'dev/sda3' | awk '{print $2}'`
disk_root_used=`df -h | grep 'dev/sda2' | awk '{print $3}'`
disk_home_used=`df -h | grep 'dev/sda3' | awk '{print $3}'`
disk_root_avail=`df -h | grep 'dev/sda2' | awk '{print $4}'`
disk_home_avail=`df -h | grep 'dev/sda3' | awk '{print $4}'`
disk_root_perc=`df -h | grep 'dev/sda2' | awk '{print $5}'`
disk_home_perc=`df -h | grep 'dev/sda3' | awk '{print $5}'`

os=`lsb_release -ds`
kernel=`uname -rv`
ip=`ip addr show scope global | grep inet | cut -d' ' -f6 | cut -d/ -f1`
users=`users`
#uptime=`uptime | awk -F"up " '{print $2}' | awk -F"," '{print $2}'`
uptime=`uptime -p`
package=`dpkg --list | wc --lines`

mem_used=`free -h | grep /cache: | awk '{print $3}'`
mem_total=`free -h | grep Mem: | awk '{print $2}'`
swap_used=`free -h | grep Swap: | awk '{print $3}'`
swap_total=`free -h | grep Swap: | awk '{print $2}'`

echo
#echo -e "SYSTEM"
echo -e " ${bold}${green}OS:${normal}          $os"
echo -e " ${bold}${green}Kernel:${normal}      $kernel"
echo -e " ${bold}${green}IP:${normal}          $ip"
echo -e " ${bold}${green}Users:${normal}       $users"
echo -e " ${bold}${green}Uptime:${normal}      $uptime"
echo -e " ${bold}${green}Packages:${normal}    $package"
echo
#echo -e "DISK USAGE"
echo -e " ${bold}${green}/${normal}            $disk_root_perc | $disk_root_used/$disk_root_avail  [$disk_root_total]"
echo -e " ${bold}${green}/home${normal}        $disk_home_perc | $disk_home_used/$disk_home_avail  [$disk_home_total]"
echo
#echo -e "MEMORY USAGE"
echo -e " ${bold}${green}Memory:${normal}      $mem_used  [$mem_total]"
echo -e " ${bold}${green}Swap:${normal}        $swap_used  [$swap_total]"
echo

