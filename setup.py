import os

cwd = os.getcwd() 
configs = cwd + '/configs'

install = [
    # System
    "xorg",
    "xorg-server", 
    "nano", 
    "openssh",

    # Utils
    "bat", 
    "tree", 
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
]

os.system("sudo systemctl enable systemd-timesyncd")

# Install system
for x in install: os.system(f"sudo pacman -S {x} --noconfirm")

# Install developer tools
os.system("python3 ./configs/devtools.py")

# Install yay
os.system("git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd ~/dotfiles && rm -rf yay")

# Install environment
os.system("python3 ./configs/environment.py")

# Install programs
os.system("python3 ./configs/programs.py")

os.system("sh -c \"$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\"") # ohmyzsh

os.system("python3 create_symlinks.py")

# Create folders
os.system("mkdir ~/Downloads ~/Documents ~/Pictures ~/Studies ~/Projects ~/Videos")
