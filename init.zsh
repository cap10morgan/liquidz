# turn on terminal colors
export CLICOLOR=1

# liquidprompt
if [ -f $(brew --prefix)/bin/liquidprompt ]; then
  . $(brew --prefix)/bin/liquidprompt
fi

# completions
export FPATH="$(brew --prefix)/share/zsh-completions:$(brew --prefix)/share/zsh/site-functions:$FPATH"
autoload -U compinit
compinit

# corrections
setopt correctall

# allow hooking into functions
autoload -Uz add-zsh-hook

# set tab title to cwd
function set-tab-window-titles {
  tab_label=${PWD/${HOME}/\~} # use 'relative' path
  echo -ne "\e]2;${tab_label}\a" # set window title to full string
  echo -ne "\e]1;${tab_label: -24}\a" # set tab title to rightmost 24 characters
}
add-zsh-hook precmd set-tab-window-titles
