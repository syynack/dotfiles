# Colours
WHITE="$FG[015]"
RED="$FG[196]"
GREEN="$FG[048]"
DARK_GREEN="$FG[082]"
GREY="$FG[248]"
ORANGE="$FG[208]"
RESET="$reset_color"

ZSH_THEME_GIT_PROMPT_PREFIX="$RED"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"

# git prompt status
ZSH_THEME_GIT_PROMPT_DIRTY="$RED\xe2\x9c\x97\x0a"
ZSH_THEME_GIT_PROMPT_CLEAN="$DARK_GREEN\xe2\x9c\x94\x0a"

PROMPT_ARROW="\xe2\x9e\x94\x0a" # ➔

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$GREY%{$(current_branch)%} $(git_prompt_short_sha) $(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function get_prompt() {
  echo "%(?.$GREEN.$RED)$PROMPT_ARROW"
}

PROMPT='$WHITE%n@%M $GREY%*$GREEN [$(get_pwd)] $(git_prompt_info)
$(get_prompt)  $RESET'
