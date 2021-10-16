# Source this file at the end of .zshrc and .bashrc.
# source /home/$USER/system/davidw.bashrc

SYSTEM_SCRIPTS=/home/$USER/system/scripts
FORCODER=/home/$USER/Projects/4coder
PATH=$PATH:$SYSTEM_SCRIPTS:$FORCODER
LSAN_OPTIONS=verbosity=1:log_threads=1

alias jd="python $SYSTEM_SCRIPTS/jumpdir.py"
alias vim="nvim"
alias coder=4ed

git config --global user.name "David Walker"
git config --global user.email "dwalker0044@gmail.com"
git config --global init.defaultBranch main
git config --global pull.rebase true
