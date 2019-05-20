# The dots

This repo is my personal dotfiles - currently mac focused.
I use neovim, tmux, zsh (no framework), and generally work in ruby, js, and elixir.

Much of my setup is still manual - this is a work in progress.

## STEPS
1) setup git
2) clone the repo
3) `cd` to the dotfiles folder
4) run `./dotme`

### setup git
Git is available [here](https://git-scm.com).
Alternatively, it can be installed via brew.

NOTE that this script sets up brew for you, so you can get into a chicken-egg
situation if you want to clone this repo.

### DOTME
This file does the following:
1) Try to source the `env` file to setup PATH and environmental variables
2) Ensure xcode is installed, install if not
3) Ensure homebrew is installed, install if not
4) Setup some mac settings (see `./other/mac_settings.sh` for specifics)
5) Install stuff in the Brewfile by running `brew bundle`
6) Setup symlinks for dotfiles via rcm

### Brewfile

The brewfile installs a number of commandline and and cask apps that I use.
There are also a number of comments that reference things I want to keep track of.

### RCM

[RCM](https://github.com/thoughtbot/rcm) is a dotfile managment suite. It is
pretty minimal and works pretty well. Their own
[documentation](http://thoughtbot.github.io/rcm/rcm.7.html) and
[info](https://thoughtbot.com/blog/rcm-for-rc-files-in-dotfiles-repos)
is well documented, take a look if you are curious.

Primarily my dotfiles include neovim, tmux, bash, and zsh rc files, along with
PATH, environmental variables, aliases, and various functions.

### Post Setup

This is a work in progress, so much of my full work environment is not included
here. Some areas I may get to, some a may leave to be manually done each time.

I'm including a description of what else I typically (read "this one time")
want to do, both for my own reference, but also hopefully to help others who
may have ended up here.

#### ASDF
[asdf](https://asdf-vm.com) is a CLI runtime version manager. I like because it
is pretty minimal and lightweight, and it also works for many languages.

asdf is installed via brew, but the specific plugins for each language, and the
runtime for the language itself are not installed. 

`asdf plugin-add nodejs` to add node plugin.
`asdf list-all nodejs` to see all available versions.
`asdf install nodejs 10.15` to install a particular version.
`asdf global nodejs 10.15` to set the version to be default.

I usually start out doing these steps for each language I use.  Setting the
`global` version sets the version in a `.tool-versions` file in your home
directory. You can do the same for a local project as well.

#### shell
After installing zsh and bash through brew, I usually want to use one as my
default.  To do that, I need to first add them to my /etc/shells file, so the
system knows they are allowed.

To do so, you will need to use sudo commands - DON'T USE SUDO WITHOUT KNOWING
WHAT YOU ARE DOING. Don't take my word for it.

You can do this with `command -v zsh | sudo tee -a /etc/shells`.
Then to change the default shell do `sudo chsh -s "$(command -v zsh)" "${USER}"`

#### OTHER

Thats all for now.
This is incomplete tho.
