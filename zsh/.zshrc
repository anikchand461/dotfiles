# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PROMPT='> '

# ---- Powerlevel10k + Oh My Zsh config ----
# disable Oh My Zsh theme so p10k can control the prompt
ZSH_THEME=""

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugins you use
plugins=(git zsh-syntax-highlighting)

# source Oh My Zsh (do this before sourcing p10k)
source $ZSH/oh-my-zsh.sh

# Initialize Zoxide
eval "$(zoxide init zsh --cmd cd)"

# Powerlevel10k (manual install)
if [ -f "$HOME/.powerlevel10k/powerlevel10k.zsh-theme" ]; then
  source "$HOME/.powerlevel10k/powerlevel10k.zsh-theme"
fi

# ---- Your existing customizations (kept as-is) ----
export CLICOLOR=1
export LSCOLORS=Gxfxcxdxbxegedabagacad
DISABLE_VCS_PROMPT=true
DEFAULT_USER=$(whoami)

alias startmysql="mysql -u root -p"
export COPYFILE_DISABLE=1

# Added by Windsurf
export PATH="/Users/anikchand/.codeium/windsurf/bin:$PATH"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"
export PATH="$HOME/Library/Python/3.10/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/Library/Application Support/reflex/bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# any other custom lines you had can follow here...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Remove any existing alias named 'n' to avoid conflict
unalias n 2>/dev/null

# note() {
#   local note_dir="$HOME/Documents/notes"
#   local today="$(date +%Y-%m-%d)"
#   local note_file="$note_dir/$today.txt"
#
#   # Create notes directory if missing
#   mkdir -p "$note_dir"
#
#   # Create file with header if it doesn't exist
#   if [ ! -f "$note_file" ]; then
#     echo "=== Notes for $today ===" > "$note_file"
#     echo "" >> "$note_file"
#   fi
#
#   # Parse arguments
#   if [ $# -eq 0 ]; then
#     # No args → show today's notes
#     echo "📘 Today's Notes ($today):"
#     echo "──────────────────────────"
#     cat "$note_file"
#   elif [ "$1" = "-e" ]; then
#     # Edit in Neovim
#     nvim "$note_file"
#   elif [ "$1" = "-l" ]; then
#     # List last 5 note files
#     echo "📁 Recent Note Files:"
#     ls -t "$note_dir"/*.txt 2>/dev/null | head -5 | sed "s|$note_dir/||"
#   else
#     # Append note with timestamp
#     echo "[$(date '+%H:%M')] $*" >> "$note_file"
#     echo "✅ Saved to $today.txt"
#   fi
# }

# fzf() {
#   local file
#   file=$(command fzf \
#     --height 40% \
#     --layout=reverse \
#     --border \
#     --preview 'ca {} 2>/dev/null' \
#     --preview-window=right:60%:wrap)
#
#   if [[ -n "$file"]]
#   then 
#    nvim "$file"
#   fi
# }

alias typer="termtyper"
alias fm=yazi
alias ls="eza --icons"
alias tree="eza --tree --icons"
alias ll="eza -lh --icons"
alias lsg="eza --git --icons"
export PATH="/opt/homebrew/bin:$PATH"

# C compiler shortcut
crun() {
  gcc -Wall -std=c17 -o out "$1" && ./out && rm out
}   

# C++ compiler shortcut
cpprun() {
  g++ -Wall -Wextra -std=c++17 -o out "$1" && ./out && rm out
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/anikchand/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

source /Users/anikchand/.config/broot/launcher/bash/br

export PATH="$PATH:$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:$HOME/.nvm/versions/node/$(nvm version)/bin"
export PATH="$PATH:/Users/anikchand/.nvm/versions/node/v20.19.0/bin"
# Add nvm-managed global bin to PATH (works when you nvm use different versions)
export PATH="$PATH:$HOME/.nvm/versions/node/$(nvm version)/bin"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql/bin:$PATH"


# Added by Antigravity
export PATH="/Users/anikchand/.antigravity/antigravity/bin:$PATH"

# Added by Antigravity
export PATH="/Users/anikchand/.antigravity/antigravity/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh
# Don't try to complete if I haven't typed at least 2 characters
zstyle ':autocomplete:*' min-input 2

alias tldr='tldr --color'

