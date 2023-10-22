#!/bin/bash
#
# Installs theme for Gnome Terminal on Debian-based Linux distibution.

set -e

theme_installer_filename="$1"

if [ -z "${theme_installer_filename}" ]; then
  echo "error: Please specify theme name" 1>&2
  echo 1>&2

  echo "Available theme names:" 1>&2
  echo 1>&2

  find \
    "../submodules/gogh/installs/" \
    -type f \
    -name "*.sh" \
  | while read -r path; do
      basename "${path}" ".sh" 1>&2
    done

  echo 1>&2

  exit 1
fi

sudo apt install -y \
  dconf-cli \
  uuid-runtime

export TERMINAL="gnome-terminal"

"../submodules/gogh/installs/${theme_installer_filename}.sh"
