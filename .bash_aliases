# ---------------------- #
# open bash files
# ---------------------- #
alias profile="atom ~/.bash_profile"
alias aliases="atom $setupDir/.bash_aliases;"
alias gits="atom $setupDir/.bash_git"
alias kdiff="git mergetool -y -t Kaleidoscope"
# ---------------------- #
# project directories
# ---------------------- #
alias veare="cd ~/code/veare"
# ---------------------- #
# general directories
# ---------------------- #
alias p="cd ~/code"

# brew update
function brew {
	if [[ $1 == "update" ]] ; then
    var_brew="/usr/local/bin/brew"
		echo "${ORANGE}Updating brew...${RESET}"
		$var_brew update
		echo "${ORANGE}Upgrading formulas...${RESET}"
		$var_brew upgrade
		echo "${ORANGE}Cleaning up...${RESET}"
		$var_brew cleanup
		echo "${ORANGE}The doctor says...${RESET}"
		$var_brew doctor
	else
		/usr/local/bin/brew "$@"
	fi
}

function root {
	cd $(sed -E "s#($pwdDir$projectsDir/[^/]*)/.*#\1#" <<< $PWD)
}

function port {
	if [[ $1 != "" ]] ; then
		lsof -i :${1#.} | grep LISTEN
	else
		echo "Please provide a port"
	fi 
}

# shortcuts
alias c="clear"
alias .="cd .."

alias hosts="sudo nano /etc/hosts"

alias dns-cache="dscacheutil -flushcache"
alias clear-cache="dscacheutil -flushcache"

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

# better top
alias top="top -o cpu"

# list all files
# -G -A=include hidden, but not . and ..; -F=/ after dir to mark it as such
alias l='ls'
alias ls='ls -GAF ${colorflag}'

# List all files colorized in long format, including dot files
alias ll="ls -lAF ${colorflag}"

# List only directories
alias ld='ls -lF ${colorflag} | grep "^d"'

# Enable aliases to be sudo’ed
alias sudo='sudo '

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias lip="localip"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | grep -o 'inet6\? \(\([0-9]\+\.[0-9]\+\.[0-9]\+\.[0-9]\+\)\|[a-fA-F0-9:]\+\)' | sed -e 's/inet6* //'"

# Enhanced WHOIS lookups
alias whois="whois -h whois-servers.net"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

############################
# functions

# reload file
function reload {
	# store current dir to cd back
	cur_dir=$(echo $PWD)
	# reload profile
	if [[ $1 == "" ]] ; then
		source ~/.bash_profile
	elif [ -f ~/.${1#.} ]; then
		source ~/.${1#.}
	elif [ -f $setupDir/.${1#.} ]; then
		source $setupDir/.$1
	else
		echo "File not found in: ~/.${1#.} and $setupDir/.${1#.} not found."
	fi
	# cd back to prev dir
	cd ${cur_dir}
}
