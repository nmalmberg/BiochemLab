#!/bin/bash

# This file is a shell script to install helpful software for this
# repository onto a Raspberry Pi. Rather than using RStudio, which
# requires a toolkit that isn't available for the Raspberry Pi's
# processor, this will require the user to use Emacs. The software
# will come from multiple sources, so there are several different
# commands to run in the shell script. This will also add to your
# ~/.emacs file, so if you already have a customized startup file
# for Emacs, you might want to modify this script accordingly.

# Download R, Emacs and ESS from APT repositories.
sudo apt update
sudo apt install r-recommended r-cran-units r-bioc-biostrings
sudo apt install emacs elpa-ess pandoc-citeproc

# Download the bookdown package from CRAN
R CMD install bookdown

# Add the MELPA repository to the Emacs package list
cat <<'EOF' >> ~/.emacs
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages"))
(package-initialize)
EOF

# Download the poly-R package from MELPA
# emacs --eval "(package-refresh-contents)"
# emacs --eval "(package-install poly-R)"
