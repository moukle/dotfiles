# Dotfiles - my personal configuration files
Making the adventure into the Wayland 🧙

## Info
| Shell             | 💻 zsh + [zap](https://github.com/zap-zsh/zap) + [starship](https://github.com/starship/starship)             |
| WM                | 🖥️ [hyprland](https://github.com/hyprwm/Hyprland) + [waybar](https://github.com/Alexays/Waybar)               |
| Editor            | ✍️ [NvChad](https://github.com/NvChad/NvChad)                                                                  |
| Terminal          | 🐱 [kitty](https://github.com/kovidgoyal/kitty)                                                               |
| Launcher          | 🚀 [tofi]                                                                                                     |
| Browser           | 🌐 chromium + [qutebrowser](https://github.com/qutebrowser/qutebrowser)                                       |
| Notifications     | 📣 [dunst](https://github.com/dunst-project/dunst)                                                            |
| Color Automation  | 🌈 [wal](https://github.com/dylanaraps/pywal)                                                                 |
| Pacman Manager    | 📦 [pacdef](https://github.com/steven-omaha/pacdef)                                                           |
| File Manager      | 📂 [fff](https://github.com/dylanaraps/fff)                                                                   |
| Font              | 🖊️ [Fantasque Sans Nerd](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/FantasqueSansMono) |
| Other             | 🛠️ [fzf](https://github.com/junegunn/fzf)                                                                     |
| Wallpaper         | 🖼️ [by Tom Pumford](https://unsplash.com/photos/FB_oz9I1Jx8)                                                  |

## Installation
My dotfiles are managed with [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager. To set up the configurations, follow these steps:

1. Clone this repository:
   ```shell
   git clone https://github.com/moukle/dotfiles.git
2. Change into the dotfiles directory:
  ```shell
  cd dotfiles
  ```
3. Symlink the desired configuration using Stow. For example, to symlink the hyprland config:
  ```shell
  stow hyprland
  ```
4. Repeat the above step for each configuration you want to set up.

## Wal
I use wal to generate and change color-schemes on the fly.
In the `wal/.config/wal/templates` folder you find configs for:
- dunst
- tofi
- zathura
- qutebrowser
- ...

Simply change whole setup colors by
```sh
walr.sh <theme> <light>

# example
walr.sh ayu -l
```

## Inspiration
- [hal-ullr](https://www.deviantart.com/hal-ullr)
- [mauforonda](https://github.com/mauforonda/dotfiles)
- [zzzeyez](https://github.com/zzzeyez/dots)
- ...

# License
This project is licensed under the MIT License.
