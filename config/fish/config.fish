# exit if not in interactive mode
status -i || exit

set fish_greeting ""

alias ls='exa --icons'
alias la='exa --icons -la'
alias tree='exa --icons --tree'
alias cat='bat --theme base16 --paging=never --style=plain'
alias g='copier -c github_token 2>&1 > /dev/null && git'
# alias clear='clear && ~/.config/color-scripts/launch.sh'

# color
set fish_color_normal brwhite
set fish_color_command brblue
set fish_color_param brcyan
set fish_color_error brred

# vi-mode
set fish_cursor_default block
set fish_cursor_insert block
set fish_cursor_replace_one underscore
set fish_cursor_visual block
set fish_color_quote brgreen

# prompt
# starship init fish | source

# startup
# ~/.config/color-scripts/launch.sh

# functions
function launch_cs ()
  set color_script $argv[1]
  if test color_script != ""
    if not test -d $HOME/.config/color-scripts
      echo "launch_cs: $HOME/.config/color-scripts does not exists"
    end
    if test -f $HOME/.config/color-scripts/$color_script
      $HOME/.config/color-scripts/$color_script
    else
      echo "launch_cs: $color_script not found"
    end
  end
end

function get_cs ()
  if not test -d $HOME/.config/color-scripts
    echo "get_cs: $HOME/.config/color-scripts does not exists"
  end
  ls -la $HOME/.config/color-scripts
end
export PATH="$PATH:$HOME/.spicetify"

# comment to disable vi mode
fish_vi_key_bindings
