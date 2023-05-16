# Source this file at the end of .zshrc and .bashrc.
# source "${USER}/system/davidw.bashrc"

# environment variables
SYSTEM_SCRIPTS=/home/$USER/system/scripts
LSAN_OPTIONS=verbosity=1:log_threads=1

# emscripten
# export PATH=$PATH:/home/dwalker0044/Projects/emsdk:/home/dwalker0044/Projects/emsdk/node/14.18.2_64bit/bin:/home/dwalker0044/Projects/emsdk/upstream/emscripten

# use zig compiled from source
export PATH=~/system/zig/build/stage3/bin:$PATH

# jd
source "${SYSTEM_SCRIPTS}/jd.bash"

# aliases
alias vim="nvim"
alias hx="helix"
