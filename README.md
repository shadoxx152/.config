# .config

This is my dotfile to configurate some software as followed:  

- zsh (just this for now)

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

This is my WezTerm configuration, just a single wezterm.lua file. I keep tweaking it, but honestly, I’ve lost track of what I’ve changed. It works for now, so that’s good enough.my single wezterm configuration.
