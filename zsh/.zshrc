#===============================================================================
# File Name:   .zshrc
# Author:      Cody Cziesler
# Description: My dot-file for zsh. Since I use oh-my-zsh, it will setup that.
#              This script will also load my ~/.aliases dotfile, and setup my
#              path environmental variable.
#===============================================================================

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/cody.cziesler/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Plugins to load
plugins=(git macos)

source $ZSH/oh-my-zsh.sh

# User configuration
alias c.="cd .."

# For Jekyll (https://jekyllrb.com/docs/installation/macos/)
export SDKROOT=$(xcrun --show-sdk-path)
export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:$PATH"

# For rbenv (to select different ruby versions)
eval "$(rbenv init - zsh)"
export PATH="$HOME/.gem/ruby/3.0.0/bin:$PATH"

# For perl
PATH="/Users/cody.cziesler/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/cody.cziesler/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/cody.cziesler/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/cody.cziesler/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/cody.cziesler/perl5"; export PERL_MM_OPT;

# For gtkwave
alias gtkwave="/Applications/gtkwave.app/Contents/Resources/bin/gtkwave"

echo "Sourced ~/.zshrc"
