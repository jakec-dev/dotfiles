# My Dotfiles

## Setup

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

- Run command `:PlugInstall`
- Run command `:TSInstall markdown markdown_inline`

6. Install coc extensions

```
nvim
```

Run command `:CocInstall coc-tsserver coc-json coc-html coc-css coc-git coc-pretter coc-eslint coc-spell-checker`

## Vim Cheatsheet

| Key    | Action                                    | .   | Key       | Action                                |
| -      | --                                        | --  | --        | --                                    |
| H      | move to top of screen                     | .   | cs"'      | change double-quotes to single-quotes |
| M      | move to middle of screen                  | .   | ds""      | remove double-quotes                  |
| L      | move to bottom of screen                  | .   | ysiw"     | surround word with double quotes      |
| zz     | center cursor on screen                   | .   | .         | .                                     |
| zt     | position cursor on top of screen          | .   | .         | .                                     |
| zb     | position cursor on bottom of screen       | .   | .         | .                                     |
| ^      | jump to first non-blank character in line | .   | .         | .                                     |
| ; | repeat previous f, t, F or T movement | . | . | . |
| , | repeat previous f, t, F or T movement, backwards | . | . | . |
