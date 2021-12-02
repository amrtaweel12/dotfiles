# Enable VI key binding by default
fish_vi_key_bindings

# Let Fish look at the bin folder at the home directory to find scripts
set -U fish_user_paths $fish_user_paths $HOME/bin $HOME/.local/bin

# Configure Deno
set DENO_INSTALL $HOME/.deno
set -U fish_user_paths $fish_user_paths $DENO_INSTALL/bin

# Turn off the greeting message
set fish_greeting

# Autocomplete and Highlight Colors
set fish_color_normal blue
set fish_color_autosuggestion '#7d7d7d'
set fish_color_command blue --bold
set fish_color_error red --bold
set fish_color_param cyan
set fish_color_quote yellow
set fish_color_redirection white --bold
set fish_color_end white --bold
set fish_color_operator white --bold
set fish_color_comment yellow
set fish_pager_color_prefix white
set fish_pager_color_completion white
set fish_pager_color_description yellow
set fish_pager_color_background --background=background

# Set editor to VIM
set EDITOR "nvim"
# Set visual editor to VSCode
set VISUAL "code"


################################################################################
# Aliases
################################################################################

# Open Tmux with UTF8 support
alias tmux='tmux -u'

# List entries with long format, display the sizes in human readable format, and show hidden entries.
alias ll='ls -AlhF'

alias la='ls -A'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Confirm before overwriting something
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias mux='tmuxinator'

alias nnn='nnn -e'

alias vim="vim"
alias nvim='~/applications/nvim.appimage'

################################################################################

################################################################################
# Bindings
################################################################################

# Scroll through suggestions
# bind \t complete
# bind -m insert \t complete

# Accept the next word with tab + n
# bind \tn forward-word
# bind -M insert \tn forward-word

# Accept the whole suggestion with tab + l
# bind \tl accept-autosuggestion
# bind -M insert \tl accept-autosuggestion

################################################################################