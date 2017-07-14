
function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$(parse_git_dirty) $(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

function get_pwd() {
  echo "${PWD/$HOME/~}"
}

function get_prompt() {
  echo "%(?.$FG[048].$FG[196])\xe2\x9e\x94\x0a"
}

PROMPT='$FG[248]%* $FG[248]%n@%M $FG[048][$(get_pwd)] $FG[248]$(git_prompt_info)
$reset_color $(get_prompt)  $reset_color'

ZSH_THEME_GIT_PROMPT_PREFIX="$FG[196]"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$FG[196] \xe2\x9c\x97\x0a"
ZSH_THEME_GIT_PROMPT_CLEAN="$FG[082] \xe2\x9c\x94\x0a"
