# add / push / commit
function fastgit() {

    if [[ $# == 1 ]]; then
        git commit -a -m "$1" && git push 
    elif [[ $# == 2 ]]; then
        git add "$1" && git commit -m "$2" && git push 
    elif [[ $# == 3 ]]; then
        git add "$1" && git commit -m "$2" && git push origin "$3"
    else
        echo "invalid arguments"
    fi
}

# weather
function weather() {
    if [[ $# -ne 1 ]]; then
        echo "Illegal number of parameters"
        return
    fi

    curl wttr.in/$1
}

# catgrep
function catgrep() {
    if [[ $# -ne 2 ]]; then
        echo "Illegal number of parameters"
        return
    fi

    cat $1 | grep $2 --color=auto
}

# catzgrep
function catgrep() {
    if [[ $# -ne 2 ]]; then
        echo "Illegal number of parameters"
        return
    fi

    cat $1 | zgrep $2 --color=auto
}

# get current branch in git repo
function parse_git_branch() {
	BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
	if [ ! "${BRANCH}" == "" ]
	then
        COLOR=`parse_git_dirty_color`
        if [ ! "${COLOR}" == "" ]; then
            echo -e "@${COLOR}${BRANCH}*"
        else
            echo -e "@${BRANCH}"
        fi
	else
		echo ""
	fi
}

# get current status of git repo
function parse_git_dirty_color() {
    local K="\033[30m"    # black
    local R="\033[31m"    # red
    local G="\033[32m"    # green
    local Y="\033[33m"    # yellow
    local B="\033[34m"    # blue
    local M="\033[35m"    # magenta
    local C="\033[36m"    # cyan
    local W="\033[37m"    # white

	status=`git status 2>&1 | tee`
	dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
	untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
	ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
	newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
	renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
	deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
	
    color=''
	if [ "${renamed}" == "0" ]; then
		color="${Y}"
	fi
	if [ "${ahead}" == "0" ]; then
		color="${W}"
	fi
	if [ "${newfile}" == "0" ]; then
		color="${G}"
	fi
	if [ "${untracked}" == "0" ]; then
		color="${Y}"
	fi
	if [ "${deleted}" == "0" ]; then
		color="${R}"
	fi
	if [ "${dirty}" == "0" ]; then
		color="${M}"
	fi
	if [ ! "${color}" == "" ]; then
		echo -e "${color}"
	else
		echo ""
	fi
}

# start docker compose
function aw-start() {
    docker-compose -f deployment/docker-compose.yml -f deployment/docker-compose.override.yml up redis postgres
}

# build c++
function aw-build() {
    python setup.py build_ext --inplace
}


# storybook
function storybook() {
    cd ~/devel/aw-front
    yarn storybook
}
