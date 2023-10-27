# My Terminal Themes

My personal themes for terminals.

Currently supported terminals:

- **Gnome Terminal** (on Debian-based distributions)
- **Windows Terminal**

## Installation

1. Clone this repo:

   ```bash
   git clone --recurse-submodules https://github.com/Danand/terminal-themes.git
   ```

2. Change directory to the root of repo:

   ```bash
   cd terminal-themes
   ```

3. Change mode of scripts to executable, recursively:

   ```bash
   chmod +x -R **/*.sh
   ```

4. Change directory to `./scripts`:

   ```bash
   cd ./scripts
   ```

5. Terminal-specific steps:

   - **Gnome Terminal**:

     1. Generate themes for supported installers (powered by [**Gogh**](https://github.com/Gogh-Co/Gogh)), may require `sudo`:

        ```bash
        ./generate-themes.sh
        ```

     2. Install [theme of your choice](#available-themes):

        ```bash
        ./install-theme-debian-gnome.sh "theme-name"
        ```

   - **Windows Terminal**:

     ```bash
     ./install-theme-windows-terminal.sh "theme-name"
     ```

## Available themes

- `halloween-2023`

## Utilities

Themes generated with [`terminal-colors-generator`](https://github.com/Danand/terminal-colors-generator)
