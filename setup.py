import os

cwd = os.getcwd() 
config = "~/.config"
bins = cwd + '/bin' 
fonts = cwd + '/fonts'

install = [
    # System and utils
    "xorg",
    "xorg-server", 
    "openssh",
    "bat",
    "tree", 
    "nano", 
    "playerctl",
    "tumbler", 
    "gvfs", 
    "mpv", 
    "feh", 
    "unzip", 
    "curl", 
    "ripgrep", 
    "flatpak", 
    "ffmpeg", 
    "noto-fonts", 
    "noto-fonts-cjk", 
    "noto-fonts-emoji",

    # Programming
    "base-devel", 
    "clang",
    "gdb",
    "cmake",
    "zig",
    "man-pages", 
    "man-db", 
    "python-setuptools", 
    "tree-sitter-cli",
    "nvim",

    # Environment
    "lightdm", 
    "lightdm-gtk-greeter",
    "picom", 
    "polybar", 
    "rofi", 
    "dunst", 
    "thunar", 
    "thunar-volman",

    # Terminal
    "zsh", 
    "tmux", 
    "alacritty",

    # Programs
    "firefox",
    "discord", 
    "spotify-launcher",
    "flameshot",
    "calibre",
    "zathura",
    "zathura-pdf-mupdf",
    "zathura-cb",
]

install_aur = [
    "bspwm-git", 
    "sxhkd-git"
]

install_flatpak = [
    "com.obsproject.Studio",
]

os.system("sudo systemctl enable systemd-timesyncd")

# Install system
for x in install: os.system(f"sudo pacman -S {x} --noconfirm")

# Install YAY
os.system("git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ~/dotfiles && rm -rf yay")

# Install aur and flatpak packages
for x in install_aur: os.system(f"yay -S {x} --noconfirm")
for x in install_flatpak: os.system(f"flatpak install flathub {x} -y --noninteractive")

# Install NVM
os.system("curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash")

# Install OhMyZsh
os.system("sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\" \"\" --unattended") # ohmyzsh

## Lightdm
os.system("sudo systemctl enable lightdm")

os.system("sudo rm -rf /etc/lightdm/lightdm-gtk-greeter.conf")
os.system(f"sudo cp {cwd}/lightdm-gtk-greeter/lightdm-gtk-greeter.conf /etc/lightdm/")

os.system(f"sudo cp {cwd}/lightdm-gtk-greeter/pixmaps/* /usr/share/pixmaps/")

# Create symlinks
files = [f for f in os.listdir(cwd) if f not in [
        # Ignore
        ".git", 
        ".gitignore", 
        "setup.py",
        "fonts", 
        "bin", 
        "lightdm-gtk-greeter",
        "wallpaper.jpg", 
]]

for f in os.listdir(fonts):
    os.system(f"sudo cp -r {fonts}/{f} /usr/share/fonts/")

for f in os.listdir(bins):
    os.system(f"sudo rm -rf /usr/bin/{f}")
    os.system(f"sudo ln -s {bins}/{f} /usr/bin")

for f in files:
    if f == '.tmux.conf' or f == '.zshrc':
        os.system(f"rm -rf ~/{f}")
        os.system(f"ln -s {cwd}/{f} ~/")
    else:
        os.system(f"rm -rf {config}/{f}")
        os.system(f"ln -s {cwd}/{f} {config}")

# Create folders
os.system("mkdir ~/Downloads ~/Documents ~/Pictures ~/Studies ~/Projects ~/OpenSource ~/Videos")

# ZSH default shell
os.system("chsh -s $(which zsh)")
