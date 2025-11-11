guix-profile := `guix time-machine -C .config/guix/channels-lock.scm`    
guix := guix-profile / "bin/guix"

list:
    @just --list

guix-update:
    {{guix}} time-machine -C .config/guix/channels.scm -- describe --format=channels > .config/guix/channels-lock.scm

guix-pull:
    {{guix}} pull -C .config/guix/channels-lock.scm

home-build:
    {{guix}} home build home/home-config.scm

home-switch:
    {{guix}} home reconfigure home/home-config.scm

stow:
    stow --target ~/.config .config

install-locale:
    sudo guix install glibc-locales
    echo "GUIX_LOCPATH=$HOME/.guix-profile/lib/locale" | sudo tee -a /root/.profile
