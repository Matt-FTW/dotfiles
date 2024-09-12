<div align="center">
<a href="#"><img src="./title.png"></a>
</div>

<div align="center">

<img src="https://raw.githubusercontent.com/catppuccin/catppuccin/main/assets/palette/macchiato.png" width="90%"/><br>

</div>

<div align="center">

<a href="#herb--about"><img width="190px" src="https://raw.githubusercontent.com/Matt-FTW/dotfiles/main/.github/assets/category-images/dotfiles-about.png"></a>
<a href="#wrench--setup"><img width="190px" src="https://raw.githubusercontent.com/Matt-FTW/dotfiles/main/.github/assets/category-images/dotfiles-setup.png"></a>
<a href="#camera--gallery"><img width="190px" src="https://raw.githubusercontent.com/Matt-FTW/dotfiles/main/.github/assets/category-images/dotfiles-gallery.png"></a>

</div>

# :herb: ‎ <samp>About</samp>

[Neovim](https://neovim.io/) is my main editor of choice. Not only is faster than its competitors, but it's also super customizable, obviously uses the vim bindings (which are the best thing when it comes to manipulating text) and has a great and big community. This are the tip of the iceberg, but since I made the change back in 2023, I never looked back.

I first started using vanilla Neovim without any configurations and trying to build my own config from scratch, but I got a little frustrated and decided to try some preconfigured configs. After a lot of trying and researching I stumbled upon [LazyVim](https://github.com/LazyVim/LazyVim), which is the one I'm currently using as a base. It has the best defaults by far, easy to get into and customize, active maintainer (i love you Folke 💕), and finally the best feature: extras.

Extras are basically a bunch of plugin specs, which you can divide in different files. You can import each other as well, and they serve as plugins that you can enable and disable easily through a menu by typing the `:LazyExtras` command. This is so good when you are trying to built a configuration that depending on the project or the tastes of the person, can select different plugin selections.

This is what I built my configuration around. You can built on top of LazyVim with the extras you want to enable or disable. It makes for hundreds of plugin combinations and is all super modular. Currently, there are more than 200 extras available to choose. Do you want to know which plugins/extras I have? You can check them [over here](https://dotfyle.com/Matt-FTW/dotfiles-config-nvim).

There are a lot of languages supported (zig, rust, svelte, typescript, java, go, etc), as well as a bunch of formatters (biome, prettier, ruff, stylua, shfmt, rustywind, etc) and linters (biome, eslint, pylint, selene, markdownlint, stylelint, etc).

All the other configuration that you want to do, like assigning some new keymaps, options or autocmds, can be done like in LazyVim, and all the defaults and configuration options are the ones from LazyVim, so if you tried it before, you're gonna like this 😉. Check the [LazyVim docs](https://www.lazyvim.org/) to know more about it.

# :wrench: ‎ <samp>Setup</samp>

### :package: Extras Installation

To install an extra is just as easy as opening neovim, typing `:LazyExtras`, and selecting any row from the menu that appears. To select one, hit the `x` key. And your done, be sure to close and open again neovim to see the changes.

> [!NOTE]
> There are some extras that have extended in the name. Those are based on the native [LazyVim extras](https://github.com/LazyVim/LazyVim/tree/main/lua/lazyvim/plugins/extras).

If you see any errors with a custom extra, be sure to report it by creating a [new issue](https://github.com/Matt-FTW/dotfiles/issues/new/choose).

### :package: Neovim Version Manager

If you wanna use multiple instances of neovim and switch between them, check out [bob](https://github.com/MordechaiHadad/bob).

Here is a quick start using the latest version as an example:

```bash
# Install the latest version
bob install latest

# Switch to the latest version
bob use latest

# Check installed versions
bob ls

# Uninstall the latest version
bob uninstall latest
```

Check the [bob usage section](https://github.com/MordechaiHadad/bob?tab=readme-ov-file#-usage) for more information.

### :package: Neovim Standalone Config

This section is for those who only want to install the Neovim config instead of all the dotfiles or they want to try this config alongside theirs.

To do this, first of all clone the repo and install the plugins.

```bash
git clone git@github.com:Matt-FTW/dotfiles ~/.config/Matt-FTW/dotfiles
NVIM_APPNAME=Matt-FTW/dotfiles/.config/nvim nvim --headless +"Lazy! sync" +qa
```

Finally to open neovim and try the configuration use this command:

> [!TIP]
> Add the command as an alias to your shell config if you want to use it in the future alongside your neovim config.

```bash
NVIM_APPNAME=Matt-FTW/dotfiles/.config/nvim nvim
```

# :camera: ‎ <samp>Gallery</samp>

| **Dashboard**                        |
| ------------------------------------ |
| ![dashboard](./assets/dashboard.png) |

| **Telescope Find-files**               |
| -------------------------------------- |
| ![find-files](./assets/find-files.png) |

| **Neo-tree**                       | **Symbols Outline**              |
| ---------------------------------- | -------------------------------- |
| ![neo-tree](./assets/neo-tree.png) | ![outline](./assets/outline.png) |

| **Bufferline**                         |
| -------------------------------------- |
| ![bufferline](./assets/bufferline.png) |

| **Lualine**                      |
| -------------------------------- |
| ![lualine](./assets/lualine.png) |

| **Notify Info**                   | **Notify Warning**                      | **Notify Error**                    |
| --------------------------------- | --------------------------------------- | ----------------------------------- |
| ![info](./assets/notify-info.png) | ![warning](./assets/notify-warning.png) | ![error](./assets/notify-error.png) |

| **Which-key**                        |
| ------------------------------------ |
| ![which-key](./assets/which-key.png) |

| **Telescope Live-Grep**              |
| ------------------------------------ |
| ![live-grep](./assets/live-grep.png) |

| **Cmp**                      |
| ---------------------------- |
| ![cmp](./assets/cmp.png)     |
| ![cmp-2](./assets/cmp-2.png) |

| **Breadcrumbs**                          |
| ---------------------------------------- |
| ![breadcrumbs](./assets/breadcrumbs.png) |

| **Actions Preview**                              |
| ------------------------------------------------ |
| ![actions-preview](./assets/actions-preview.png) |

| **Trouble**                      |
| -------------------------------- |
| ![trouble](./assets/trouble.png) |

| **Diff-History**                           |
| ------------------------------------------ |
| ![diff-history](./assets/diff-history.png) |

| **Floaterm**                             |
| ---------------------------------------- |
| ![floating](./assets/floaterm-float.png) |

| **Dressing Menu**                  |
| ---------------------------------- |
| ![dressing](./assets/dressing.png) |
