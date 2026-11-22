# nixland

A custom, modular NixOS configuration built around the Hyprland window manager. It is easy to read and easy to edit.

The Hyprland setup and a collection of useful dotfiles are all bundled into the NixOS configuration, so you get a polished desktop with minimal effort.

<table>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/6b73afb3-0679-44d5-8386-0cd198c63129" width="450" alt="Desktop screenshot 1"></td>
    <td><img src="https://github.com/user-attachments/assets/92e3dd85-3177-4f23-be4b-3c99ec9d661d" width="450" alt="Desktop screenshot 2"></td>
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/230f6338-2c19-4709-878f-d779a7ed3d59" width="450" alt="Desktop screenshot 3"></td>
    <td><img src="https://github.com/user-attachments/assets/52acf8c4-42fc-4f8a-8e63-c4ce615622c4" width="450" alt="Desktop screenshot 4"></td>
  </tr>
</table>

## Reproducible and Fast to Install

The entire configuration is pinned to a single stable nixpkgs release that is fully cached by Hydra, the official NixOS build farm. This means:

- **Reproducible:** every install gets the same package versions.
- **No compiling:** most packages are downloaded as prebuilt binaries instead of being built locally, which makes SuperHYPR a good fit for weaker computers.

## Table of Contents

- [Installation](#installation)
- [Customization](#customization)
- [Navigation](#navigation)
- [Code Documentation](#code-documentation)
  - [Modules](#modules)
  - [Dotfiles](#dotfiles)

## Installation

1. **Back up your existing configuration.** This configuration overwrites your NixOS configuration and several folders in `~/.config` (those for Hyprland, Waybar, and related tools). The `dots` folder lists every folder that will be symlinked into `~/.config`.

2. **Clone the repository and copy it over your NixOS configuration:**

   ```sh
   cd /etc
   sudo git clone https://github.com/unperturbable-se/custom-nixos-configs.git
   sudo cp -r custom-nixos-configs/. nixos/
   cd nixos
   ```

3. **Regenerate the hardware configuration** for your machine (this replaces `hardware-configuration.nix`):

   ```sh
   sudo nixos-generate-config --show-hardware-config | sudo tee hardware-configuration.nix
   ```

4. **(Optional) Enable machine-specific modules** in `flake.nix`:
   - Running in a virtual machine: uncomment `./machines/virtual_machine.nix`
   - Using an NVIDIA GPU: uncomment `./machines/nvidia.nix`

5. **(Optional) Customize** the installed apps, users, and locale. See [Customization](#customization).

6. **Stage all changes with git.** Flakes only see files tracked by git, so stage everything before building:

   ```sh
   git add .
   ```

7. **Build and switch to the new configuration:**

   ```sh
   sudo nixos-rebuild switch --flake .#default
   ```

   The first build downloads many packages and can take a long time. When it finishes, you will have your new NixOS + Hyprland desktop.

## Customization

Make your changes before the first build, or at any time afterwards. A rebuild applies them.

1. **Apps:** `modules/apps.nix` lists the apps that get installed. Comment out any you don't want, for example `kdePackages.kdenlive` becomes `#kdePackages.kdenlive`.
2. **Developer tools:** `modules/dev.nix` lists the development tools I use. Comment out any you don't need.
3. **Locale and timezone:** edit `modules/locales.nix` to match your region. Tip: paste the file into an LLM and ask it to adapt it to your locale and timezone.
4. **Users:** `modules/users.nix` defines the users and admins. Replace every instance of `raed` with your own username to rename the administrator account, and add more users by following the same pattern. If you are unsure, check the [NixOS documentation](https://nixos.org/manual/nixos/stable/) or ask an LLM.
5. **Stage your changes in git.** Flakes only see files tracked by git, so run `git add .` after customizing, before rebuilding.

## Navigation

Press the **Windows** key to open the application launcher, which also lists common actions. It includes a **shortcut viewer**, so you can look up shortcuts whenever you forget them.

The essentials:

| Shortcut | Action |
| --- | --- |
| `Win` + workspace number | Switch to that workspace |
| `Win` + `Shift` + workspace number | Move the selected window to that workspace |
| `Win` + `F` | Toggle fullscreen for the selected window |
| `Win` + `S` | Switch wallpaper |
| `Win` + `L` | Lock the screen |

Workspaces matter: with only one, you will quickly run out of screen space.

## Code Documentation

The configuration has two parts: the NixOS modules in `modules/` and the dotfiles in `dots/`.

### Modules

| File | Purpose |
| --- | --- |
| `apps.nix` | Apps to install |
| `core.nix` | Core settings and essential packages (for example SSH) |
| `dev.nix` | Development tools (for example GCC) |
| `drivers.nix` | Sound and graphics drivers needed for Hyprland |
| `home.nix` | Symlinks the dotfiles into `~/.config` |
| `hyprland.nix` | Hyprland-specific packages |
| `locales.nix` | Region, language, and timezone settings |
| `users.nix` | User and admin accounts |

### Dotfiles

| Folder / File | Purpose |
| --- | --- |
| `awww` | Wallpapers and a script to switch between them (`Win` + `S`) |
| `gtk-4.0` | Custom GTK 4 settings, such as transparency |
| `hypr` | Main Hyprland config (`hyprland.conf`): window and tiling management, shortcuts |
| `hyprbars` | Custom titlebar config. Currently unused because of UI issues |
| `kitty` | Terminal configuration |
| `lockscreen` | Lockscreen appearance (`Win` + `L`) |
| `mimeapps.list` | Default applications for each file type |
| `nemo` | Config for the desktop file manager shown on workspace 1 |
| `power-menu` | Script for the shutdown, reboot, logout, and sleep menu |
| `rofi` | Application launcher appearance and behavior |
| `screenshot` | Script for taking screenshots and recording the screen |
| `shortcuts` | Script that lists all shortcuts |
| `waybar` | The top bar (Wi-Fi, workspaces, and other status info) |
| `yazi` | Yazi file manager config. Dolphin is also preinstalled for anyone who prefers a graphical file manager |

[Back to top](#superhypr)
