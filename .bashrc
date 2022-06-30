# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac
export DOTFILES_LOCATION=$(dirname $(readlink ~/.bashrc))

for script in $DOTFILES_LOCATION/bash.d/*; do 
  source "$script"
done