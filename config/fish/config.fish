### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "$HOME/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

set fish_greeting
set --export LANG "en_US.UTF-8"
set --export --prepend PATH "$HOME/.local/bin"

alias vim="nvim"

if test -e ~/.config.fish
    source ~/.config.fish
end

if test -e ~/.local/bin/mise
    ~/.local/bin/mise activate fish | source
end

set -g fish_key_bindings fish_vi_key_bindings
zoxide init fish | source

__auto_source_venv
