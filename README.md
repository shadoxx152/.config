# .config

This is my dotfile to configurate some software as followed:  

- zsh 
- wezterm
- Yazi

## Detail

### zsh

All Zsh configuration files are located inside the Oh My Zsh directory, including the `.zshrc` file. If you use the following command to clone this repository:

```bash
git clone https://github.com/shadoxx152/.config.git ~/.config
```

You will need to create two symbolic links:

```bash
ln -s ~/.config/oh-my-zsh ~/.oh-my-zsh
ln -s ~/.config/oh-my-zsh/.zshrc ~/.zshrc
```

This ensures that your Zsh configuration is correctly linked to the Oh My Zsh directory and the .zshrc file is properly set up.

To apply the changes, reload your Zsh configuration with:

```bash
source ~/.zshrc
```

This will ensure that all settings take effect immediately.

To ensure that Powerlevel10k and other Zsh themes display correctly, you need to install a Nerd Font.

### wezterm
Use this one: [wezterm-config](https://github.com/KevinSilvester/wezterm-config). I cloned this repo to read through the config and learn Lua along the way. Big thanks to KevinSilvester for sharing this!

### Yazi
use catppuccin theme, need to install by following command:
```bash
ya pack -a yazi-rs/flavors:catppuccin-frappe
```

Didn't changed the deafault keybinding.
