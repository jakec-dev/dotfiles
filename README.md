# My Dotfiles

## Setup

1. Install software

**Ubuntu**

```sh
sudo apt update
sudo apt upgrade
sudo apt install tree tldr stow nvim tmux
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
sudo chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza
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

4. Setup zsh
```sh
git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
```

4. Install tmux plugins

```sh
tmux
```

- Press `Control+b Shift+i`

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

Run command `:CocInstall coc-tsserver coc-json coc-html coc-css coc-git coc-prettier coc-eslint coc-spell-checker`

## Vim Cheat Sheet

| Key      | Action                                           | .   | Key        | Action                                |
| -        | --                                               | --  | --         | --                                    |
| H        | move to top of screen                            | .   | cs"'       | change double-quotes to single-quotes |
| M        | move to middle of screen                         | .   | ds"        | remove double-quotes                  |
| L        | move to bottom of screen                         | .   | ysiw"      | surround word with double quotes      |
| [x       | move to next error                               | .   | ,aw        | open spell checker menu for word      |
| ]x       | move to previous error                           | .   | ,aap       | open spell checker menu for paragraph |
| zz       | center cursor on screen                          | .   | *          | search word under cursor              |
| zt       | position cursor on top of screen                 | .   | "<number>y | yank to <number> registry             |
| zb       | position cursor on bottom of screen              | .   | "<number>p | paste <number> registry               |
| ^        | jump to first non-blank character in line        | .   | m<char>    | save <char> as mark                   |
| ;        | repeat previous f, t, F or T movement            | .   | '<char>    | jump to <char> mark                   | 
| ,        | repeat previous f, t, F or T movement, backwards | .   | %          | jump to matching bracket              |
