export TERM="xterm-256color"
# files to source in priority
source ~/.oh_my.zsh

# load zsh config files
config_files=(~/.zsh/**/*.zsh(N))
for file in ${config_files}
do
  source $file
done

# For some reason updating to Mojave broke having this in a separate config.  
# It not longer works when in a separate file.
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
