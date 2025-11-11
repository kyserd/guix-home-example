(use-modules (gnu)
             (gnu home))

(home-environment
  (packages (specifications->packages
              (list "git"
                    "tmux"
                    "helix"
                    "just"
                    "fish"
                    "foot"
                    "stow"
                    "glibc-locales"))))
