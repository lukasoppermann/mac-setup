# ---------------------- #
# stuff
# ---------------------- #
BASE_DIR="/Users/lukasoppermann"
POSTS_DIR="$BASE_DIR/Code/veare/storage/app/articles"
function post {
    echo -e "# $1" >> $POSTS_DIR/$(date '+%y%m%d')-${1// /-}.md
}
function draft {
    echo -e "# $1" >> $POSTS_DIR/articles/-${1// /-}.md
}
function posts {
    # check if user provided argument $1 && if this key exists
    i=0;
    for post in $(find $POSTS_DIR -iname "-*.md"); do
        if [[ ! -z $1 && $i = $1 ]]; then
            atom $post
            return
        fi
        posts[i++]="$post"
    done;
    echo -e "\033[33m\\nTip: Open a post using the command \"posts n\" where n is the index from the list.\\n\033[0m"


    i=0;
    for post in ${posts[@]}; do
        p=$(echo $post | sed 's/.*\/-//')
        echo -e "\033[33m${i} \033[0m${p}";
        (( i++ ))
    done;
    echo -e ""
    return;
}
# ---------------------- #
# open bash files
# ---------------------- #
alias profile="$EDITOR ~/.bash_profile"
alias aliases="$EDITOR $dotFilePath.aliases;"
alias gits="$EDITOR $dotFilePath.gits"
alias exports="$EDITOR $dotFilePath.exports"
alias kdiff="git mergetool -y -t Kaleidoscope"

# ---------------------- #
# project directories
# ---------------------- #
alias veare="cd ~/code/veare"
alias fs="cd ~/code/formandsystem-cms"
alias cms="cd ~/code/formandsystem-cms"
alias api="cd ~/code/formandsystem-api"
alias mark="cd ~/code/mark"
alias copra="cd ~/code/copra"
alias bosch="cd ~/code/Bosch\ Git"
# ---------------------- #
# general directories
# ---------------------- #
alias p="cd ~/code"
alias co="cd ~/code"
alias code="cd ~/code"
alias pr="cd ~/Projects"
alias setup=environment
alias env=environment
alias environment="cd ~/code/_environment"
alias packages="cd ~/code/_packages"

# ---------------------- #
# dev & laravel
# ---------------------- #
alias bowerup="bower cache clean && bower update -f"
alias art="php artisan"
alias seed="php artisan db:seed"
alias phpunit="vendor/bin/phpunit -v --stderr"
alias unit="vendor/bin/phpunit -v --stderr"
alias phpspec="vendor/bin/phpspec"
alias spec="vendor/bin/phpspec run -v"
alias dump="composer dump-autoload -o & art clear-compiled"
alias vm="ssh vagrant@127.0.0.1 -p 2222"
alias h="homestead"
alias v="vagrant"
alias vst="vagrant global-status"
alias vp="vagrant provision"
alias php56="php"
# ---------------------- #
# testing
# ---------------------- #
alias psr="vendor/bin/php-cs-fixer fix -vvv --diff --dry-run;"

# ---------------------- #
# Run Build script
# TODO: replace with gulp ?
# ---------------------- #
function build {
  file="build.sh"
	if [ -e "$file" ]; then
		source $file
	elif [ -e "public/$file" ]; then
    source public/$file
	elif [ -e "grunt-tasks/$file" ]; then
    source grunt-tasks/$file
  elif [ -e "public/grunt-tasks/$file" ]; then
    source public/grunt-tasks/$file
	elif [ -e "htdocs/$file" ]; then
    source htdocs</$file
	elif [ -e "grunt-tasks/$file" ]; then
    source grunt-tasks/$file
  elif [ -e "htdocs/grunt-tasks/$file" ]; then
    source htdocs/grunt-tasks/$file
  else
    echo "build.sh not found"
  fi
}

# composer update
function composer {
  var_composer="/usr/local/bin/composer"
	if [[ $1 == "update" ]] ; then
    if [[ ! -z $2 ]] ; then
      echo "Updating package $2:"
      $var_composer update $2
    else
		  echo "Self update:"
		  $var_composer self-update
		  echo "Updating packages:"
		  $var_composer update
    fi
	else
		$var_composer "$@"
	fi
}

# brew update
function brew {
	if [[ $1 == "update" ]] ; then
    var_brew="/usr/local/bin/brew"
		echo "${ORANGE}Updating brew...${RESET}"
		$var_brew update
		echo "${ORANGE}Upgrading formulas...${RESET}"
		$var_brew upgrade --all
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

# shortcuts
alias c="clear"
alias o="open ."
alias .="cd .."

alias hosts="$EDITOR /etc/hosts"

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
alias ll="ls -laF ${colorflag}"

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

# Change working directory to the top-most Finder window location
function cdf() { # short for `cdfinder`
	cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
}

# reload file
function reload {
	if [[ $1 == "" ]] ; then
		source ~/.bash_profile
	elif [ -f ~/.${1#.} ]; then
		source ~/.${1#.}
	elif [ -f $dotFilePath.${1#.} ]; then
		source $dotFilePath.$1
	else
		echo "File not found in: ~/.${1#.} and $dotFilePath.${1#.} not found."
	fi
}

# find folder
function f {
  if [[ -d "$1" ]]; then
    cd $1
  elif [[ -d "../$1" ]]; then
    cd ../$1
  elif [[ -d "../../$1" ]]; then
    cd ../../$1
  elif [[ -d "../../../$1" ]]; then
    cd ../../../$1
  elif [[ -d "../../../../$1" ]]; then
    cd ../../../../$1
  elif [[ -d $(find . -name $1 -type d -maxdepth 1 -mindepth 1) ]]; then
    cd $(find . -name $1 -type d -maxdepth 1 -mindepth 1)
  elif [[ -d $(find . -name $1 -type d -maxdepth 2 -mindepth 2) ]]; then
    cd $(find . -name $1 -type d -maxdepth 2 -mindepth 2)
  elif [[ -d $(find . -name $1 -type d -maxdepth 3 -mindepth 3) ]]; then
    cd $(find . -name $1 -type d -maxdepth 3 -mindepth 3)
  elif [[ -d $(find . -name $1 -type d -maxdepth 4 -mindepth 4) ]]; then
    cd $(find . -name $1 -type d -maxdepth 4 -mindepth 4)
  fi
}

# Opens the github page for the current git repository in your browser
# git@github.com:jasonneylon/dotfiles.git
# https://github.com/jasonneylon/dotfiles/
function gh() {
  giturl=$(git config --get remote.origin.url)
  if [ "$giturl" == "" ]
    then
     echo "Not a git repository or no remote.origin.url set"
     exit 1;
  fi

  giturl=${giturl/git\@github\.com\:/https://github.com/}
  giturl=${giturl/\.git/\/tree/}
  echo $giturl
  branch="$(git symbolic-ref HEAD 2>/dev/null)" ||
  branch="(unnamed branch)"     # detached HEAD
  branch=${branch##refs/heads/}
  giturl=$giturl$branch
  open $giturl
}
