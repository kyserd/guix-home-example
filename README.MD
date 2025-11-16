# Guix Home Example

This is a simple example of how one can easily bootstrap
guix home on a new distro to provide simple way to manage
programs and configs specific to the user.

## Getting started

First the `guix-install.sh` script has required dependecies
and will warn if they are not found. A script for debian
dependencies has been provided (all it does is install uidmap and nscd).

After installing guix through `guix-install.sh` you can then run bootstrap.
First bootstrap will do a full guix-pull because the current latest release
of guix (1.4.0) was released in 2022 and does not support git redirects.

As guix recently transitioned to Codeberg, the config upstream url points to
codeberg. But guix 1.4.0 doesn't support this and defaults to savannah.
A full pull through savannah is slow, but there isn't another way around that.

After the first pull succeeds, the script will then pull to the specific version
of guix in the lock file from Codeberg, after which it will use a guix shell to pull in the required
packages of `stow` and `just` to run the `home-build`, 'home-switch', and `stow` commands
to fully setup the system.

Add other dotfiles in `.config` to have them automatically be linked to `~/.config`
and you can add to the listed programs `home/home-config.scm` to be installed automatically.
