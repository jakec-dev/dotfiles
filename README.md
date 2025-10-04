# My Dotfiles

1. Install software

**Ubuntu**

```sh
sudo apt update
sudo apt upgrade
sudo apt install git curl tree tldr stow nvim tmux
```

**Mac**
```sh
brew install nvim tmux
```

2. Clone repo

```sh
cd ~
git clone git@github.com:jakec-dev/dotfiles.git
```

3. Run stow
```sh
cd ~/dotfiles
stow .
```

4. Install tmux plugins

```sh
tmux
```

Press `Control+b Shift+i`

5. Install nvim plugins

```sh
nvim
```

Run command `:PlugInstall`

6. Install coc extensions

```
nvim
```

Run command `:CocInstall coc-tsserver coc-json coc-html coc-css coc-git coc-pretter coc-eslint coc-spell-checker`
