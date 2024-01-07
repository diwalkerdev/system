# Source this file at the end of .zshrc and .bashrc.
# source "${USER}/System/davidw.bashrc"

# environment variables
EDITOR=helix
SYSTEM_SCRIPTS=/home/$USER/System/scripts
LSAN_OPTIONS=verbosity=1:log_threads=1

# emscripten
# export PATH=$PATH:/home/dwalker0044/Projects/emsdk:/home/dwalker0044/Projects/emsdk/node/14.18.2_64bit/bin:/home/dwalker0044/Projects/emsdk/upstream/emscripten

# use zig prebuilt
export PATH=/opt/zig:$PATH

# jd
source "${SYSTEM_SCRIPTS}/jd.bash"

# aliases
alias vim="nvim"
alias hx="helix"

# Jump to current project
# jd n
