# Source this file at the end of .zshrc and .bashrc.
# source /home/$USER/system/davidw.bashrc

# environment variables
SYSTEM_SCRIPTS=/home/$USER/system/scripts
LSAN_OPTIONS=verbosity=1:log_threads=1

# emscripten
# export PATH=$PATH:/home/dwalker0044/Projects/emsdk:/home/dwalker0044/Projects/emsdk/node/14.18.2_64bit/bin:/home/dwalker0044/Projects/emsdk/upstream/emscripten

# jd
source "${SYSTEM_SCRIPTS}/jd.bash"

# aliases
alias vim="nvim"

# git config
git config --global user.name "David Walker"
git config --global user.email "dwalker0044@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
