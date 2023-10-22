#!/bin/bash
#
# Generates themes for supported installers.

function subst_template() {
  # shellcheck disable=SC1090
  source "$2"
  envsubst < "$1"
}

function get_theme_name() {
  # shellcheck disable=SC1090
  source "$1"
  echo "${TERMINAL_THEME_NAME}"
}

function generate_theme_gogh() {
  local theme_path="$1"

  local theme_name
  theme_name="$(get_theme_name "${theme_path}")"

  local theme_path_gogh="../submodules/gogh/themes/${theme_name}.yml"

  subst_template \
    "../templates/gogh.yml" \
    "${theme_path}" \
  > "${theme_path_gogh}"

  echo "Theme definition for Gogh generated at: ${theme_path_gogh}"

  pushd "../submodules/gogh" > /dev/null || return 2

  rm -rf ".venv"

  python3 -m "venv" ".venv"

  # shellcheck disable=SC1091
  source "./.venv/bin/activate"

  pip3 install -r "requirements.txt"

  python3 "tools/generatJson.py"
  python3 "tools/generateJsonFiles.py"
  python3 "tools/generateShFiles.py"
  python3 "tools/updateThemes.py"

  echo "Done: theme artifacts for Gogh successfully generated"

  git status --short

  popd > /dev/null || return 2
}

set -e

find \
  "../themes" \
  -type f \
  -name "*.sh" \
| while read -r theme_path; do
    generate_theme_gogh "${theme_path}"
  done
