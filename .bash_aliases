# ---------------------- #
# stuff
# ---------------------- #
BASE_DIR="/Users/lukasoppermann"
POSTS_DIR="$BASE_DIR/Code/veare/storage/app/articles"
function post {
    name=$(echo $1 | tr '[:upper:]' '[:lower:]')
    name=$(echo $name | xargs)
    echo -e "# $1" >> $POSTS_DIR/$(date '+%y%m%d')-${name// /-}.md
}
function draft {
    name=$(echo $1 | tr '[:upper:]' '[:lower:]')
    name=$(echo $name | xargs | sed "s/[^[:alpha:] -]//g")
    echo -e "# $1" >> $POSTS_DIR/-${name// /-}.md
}
function publish {

    if [[ ! -z $1 ]]; then
        files=($(find $POSTS_DIR -iname "[a-z-]*.md"))
        post=$(echo ${files[$1]} | sed 's/.*\/-//')

        if [ -e "$POSTS_DIR/-$post" ]; then
            mv $POSTS_DIR/-$post $POSTS_DIR/$(date +%y%m%d)-$post
            echo -e "Renamed \033[33m $post \033[0mto \033[33m$(date +%y%m%d)-$post\\n\033[0m"
            return
        fi

        post=$(echo ${files[$1]} | sed 's/.*\///')
        if [ -e "$POSTS_DIR/$post" ]; then
            mv $POSTS_DIR/$post $POSTS_DIR/$(date +%y%m%d)-$post
            echo -e "Renamed \033[33m $post \033[0mto \033[33m$(date +%y%m%d)-$post\\n\033[0m"
            return
        fi

        echo -e "\033[33m\\nPost with id ${1} not found.\\n\033[0m"
        return
    fi
    echo -e "\033[33m\\nPlease provide the id of the post you want to publish.\\n\033[0m"

}
function posts {
    # check if user provided argument $1 && if this key exists
    i=0;
    for post in $(find $POSTS_DIR -iname "[a-z-]*.md"); do
        if [[ ! -z $1 && $i = $1 ]]; then
            atom $post
            return
        fi
        posts[i++]="$post"
    done;
    echo -e "\033[33m\\nTip: Open a post using the command \"posts n\" where n is the index from the list.\\n\033[0m"


    i=0;
    for post in ${posts[@]}; do
        p=$(echo $post | sed 's/.*\/-//' | sed 's/.*\///' | sed 's/\.md//' | sed 's/-/ /g')
        echo -e "\033[33m${i} \033[0m${p}";
        (( i++ ))
    done;
    echo -e ""
    return;
}

# ---------------------- #
# open bash files
# ---------------------- #
alias profile="atom ~/.bash_profile"
alias aliases="atom $setupDir/.bash_aliases;"
alias gits="atom $setupDir/.bash_git"
alias kdiff="git mergetool -y -t Kaleidoscope"

# ---------------------- #
# docker
# ---------------------- #
alias dr="docker"
alias dc="docker-compose"
alias dm="docker-machine"
alias dckr="docker"
function dockerip {
    docker inspect --format='{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)
}

# ---------------------- #
# project directories
# ---------------------- #
alias veare="cd ~/code/veare"
alias fs="cd ~/code/formandsystem"
alias cms="cd ~/code/formandsystem-cms"
alias fs-cms="cd ~/code/fs-cms"
alias api="cd ~/code/formandsystem-api"
alias mark="cd ~/code/mark"
alias copra="cd ~/code/copra"
alias bosch="cd ~/code/bosch-git"
# ---------------------- #
# general directories
# ---------------------- #
alias p="cd ~/code"
alias co="cd ~/code"
alias code="cd ~/code"
alias pr="cd ~/Projects"
alias setup=environment
alias environment="cd ~/code/_environment"
alias packages="cd ~/code/_packages"

# ---------------------- #
# dev & laravel
# ---------------------- #
alias bowerup="bower cache clean && bower update -f"
alias php='php -dzend_extension=/usr/local/opt/php70-xdebug/xdebug.so'
alias art="php artisan"
alias seed="php artisan db:seed"
alias reset="php artisan migrate:reset"
alias cc="php artisan cache:clear"
alias cl="> storage/logs/laravel.log"
alias phpunit="php vendor/bin/phpunit -vvv --stderr --report-useless-tests --coverage-text --colors"
alias unit="php vendor/bin/phpunit -v --stderr"
alias phpspec="vendor/bin/phpspec"
alias spec="vendor/bin/phpspec run -v"
alias humbug="vendor/bin/humbug && vendor/bin/humbug stats --skip-killed=yes -vvv"
alias dump="composer dump-autoload -o & art clear-compiled"
alias slow="slow-deps"
alias vm="ssh vagrant@127.0.0.1 -p 2222"
alias h="homestead"
alias homestead-edit="atom ~/.homestead/Homestead.yaml"
alias v="vagrant"
alias vst="vagrant global-status"
alias vup="vagrant up"
alias vre="vagrant reload"
alias vp="vagrant provision"
alias php56="php"
function make:db {
    mysql -u homestead -p -h 192.168.10.10 -e "create database $1;"
}
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

# shortcuts
alias c="clear"
alias o="open ."
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

# reload file
function reload {
	if [[ $1 == "" ]] ; then
		source ~/.bash_profile
	elif [ -f ~/.${1#.} ]; then
		source ~/.${1#.}
	elif [ -f $setupDir/.${1#.} ]; then
		source $setupDir/.$1
	else
		echo "File not found in: ~/.${1#.} and $setupDir/.${1#.} not found."
	fi
}
