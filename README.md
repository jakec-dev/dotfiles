# My Dotfiles

## Setup

1. Install software

**Ubuntu**

```sh
sudo apt update
sudo apt upgrade
sudo apt install tldr stow nvim tmux fd-find mc
// Install eza
wget -c https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz -O - | tar xz
sudo chmod +x eza
sudo chown root:root eza
sudo mv eza /usr/local/bin/eza

git clone https://github.com/jrmoulton/tmux-sessionizer.git
cd tmux-sessionizer
cargo install --path . --force
cd ..
rm -rf tmux-sessionizer
echo "source <(COMPLETE=zsh tms)" >> ~/.zshrc
```

**Mac**

```sh
brew install nvim tmux fd
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
git clone https://github.com/jeffreytse/zsh-vi-mode $ZSH_CUSTOM/plugins/zsh-vi-mode
// Install zoxide
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
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

## Display-Switch Setup (Arch Linux)

Automatically switches monitor inputs when pressing USB switch button.

**Prerequisites**

```sh
# Install Rust if not already installed
sudo pacman -S rust

# Install ddcutil for testing DDC/CI
sudo pacman -S ddcutil
```

**Build and Install**

```sh
# Clone and build
cd /tmp
git clone https://github.com/haimgel/display-switch.git
cd display-switch
cargo build --release

# Install binary
sudo cp target/release/display_switch /usr/local/bin/
```

**Setup i2c Permissions**

```sh
# Create i2c system group and add user
sudo groupadd --system i2c
sudo usermod -aG i2c $USER

# Create udev rule for i2c devices
echo 'SUBSYSTEM=="i2c-dev", KERNEL=="i2c-[0-9]*", GROUP="i2c", MODE="0660"' | sudo tee /etc/udev/rules.d/99-i2c.rules

# Restart udev daemon to reload group database
sudo systemctl restart systemd-udevd

# Apply udev rules
sudo udevadm control --reload-rules
sudo udevadm trigger --subsystem-match=i2c-dev

# Load i2c-dev module
sudo modprobe i2c-dev

# Make i2c-dev load on boot
echo "i2c-dev" | sudo tee /etc/modules-load.d/i2c-dev.conf
```

**Enable and Start Service**

```sh
# After running stow (which symlinks the config)
systemctl --user daemon-reload
systemctl --user enable display-switch.service
systemctl --user start display-switch.service
```

**Verify Setup**

```sh
# Check i2c permissions (should show crw-rw---- with group i2c)
ls -l /dev/i2c-*

# Verify group membership (must logout/login first)
groups | grep i2c

# Test DDC/CI detection
ddcutil detect

# Check service status
systemctl --user status display-switch.service

# View logs
tail -f ~/.local/share/display-switch/display-switch.log
```

**Configuration**

Edit `~/.config/display-switch/display-switch.ini` to match your setup:

1. **Find USB device ID:**
   ```sh
   lsusb
   ```
   Look for your USB switch/hub. If you have multiple similar devices, you may need to test each one.

2. **Find monitor input codes:**
   ```sh
   # List detected monitors
   ddcutil detect

   # Get available inputs (replace X with your i2c bus number)
   ddcutil capabilities --bus=X | grep -A 5 "Feature: 60"
   ```

3. **Test input switching:**
   ```sh
   # Switch to a specific input (e.g., 0x11 for HDMI)
   ddcutil setvcp 60 0x11 --bus=X
   ```

4. **Configure inputs in the INI file:**
   - Use standard names: `Hdmi1`, `Hdmi2`, `DisplayPort1`, `DisplayPort2`
   - Or use custom hex codes: `"0x1b"` for non-standard inputs

**Troubleshooting**

- **No USB events detected:** Try the other USB device ID if you have multiple hubs
- **Monitor not detected:** Check if DDC/CI is enabled in monitor's OSD settings
- **Permission denied:** Ensure you logged out/in after adding user to i2c group
- **i2c devices missing:** Run `sudo modprobe i2c-dev` and check `/dev/i2c-*` exists

## Vim Cheat Sheet
| Key      | Action                                           | .   | Key        | Action                                |
| -        | --                                               | --  | --         | --                                    |
| J        | join next line to current line                   | .   | cs"'       | change double-quotes to single-quotes |
| s        | delete character and insert                      | .   | ds"        | remove double-quotes                  |
| A        | insert at end of line                            | .   | ysiw"      | surround word with double quotes      |
|   I      | insert at beginning of line                      | .   | ,aw        | open spell checker menu for word      |
| .        | .                                                | .   | ,aap       | open spell checker menu for paragraph |
| zz       | center cursor on screen                          | .   | *          | search word under cursor              |
| zt       | position cursor on top of screen                 | .   | "<number>y | yank to <number> registry             |
| zb       | position cursor on bottom of screen              | .   | "<number>p | paste <number> registry               |
| ^        | jump to first non-blank character in line        | .   | m<char>    | save <char> as mark                   |
| ;        | repeat previous f, t, F or T movement            | .   | '<char>    | jump to <char> mark                   | 
| ,        | repeat previous f, t, F or T movement, backwards | .   | %          | jump to matching bracket              |
| Ctrl+u   | jump up half a screen                            | .   | vi<char>   | visual select inside character        |
| Ctrl+d   | jump down half a screen                          | .   | .          | .                                     |
