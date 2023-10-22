#!/bin/bash
#
# Installs theme for Windows Terminal.

set -e

theme_installer_filename="$1"

if [ -z "${theme_installer_filename}" ]; then
  echo "error: Please specify theme name" 1>&2
  echo 1>&2

  echo "Available theme names:" 1>&2
  echo 1>&2

  find \
    "../themes/" \
    -type f \
    -name "*.sh" \
  | while read -r path; do
      basename "${path}" ".sh" 1>&2
    done

  echo 1>&2

  exit 1
fi

# shellcheck disable=SC1090
source "../themes/${theme_installer_filename}.sh"

envsubst < "../templates/windows-terminal.json"

echo 1>&2
echo "Success! Then, copy the JSON object from above to your \`settings.json\` of Windows Terminal" 1>&2
echo 1>&2
echo "Follow the link for details:" 1>&2
echo "https://learn.microsoft.com/en-us/windows/terminal/customize-settings/color-schemes#creating-your-own-color-scheme" 1>&2
echo 1>&2
