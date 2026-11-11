import os

user = os.getlogin()
dots = f"/home/{user}/dotfiles"

list_env = [
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
]

list_env_aur = [
    "bspwm-git", 
    "sxhkd-git"
]

for x in list_env: os.system(f"sudo pacman -S {x} --noconfirm")
for x in list_env_aur: os.system(f"yay -S {x} --noconfirm")

os.system("sudo systemctl enable lightdm")

## Lightdm
os.system("sudo rm -rf /etc/lightdm/lightdm-gtk-greeter.conf")
os.system(f"sudo cp {dots}/lightdm-gtk-greeter/lightdm-gtk-greeter.conf /etc/lightdm/")

os.system(f"sudo cp {dots}/lightdm-gtk-greeter/pixmaps/loginwall.jpg /usr/share/pixmaps/")
os.system(f"sudo cp {dots}/lightdm-gtk-greeter/pixmaps/pfp.jpg /usr/share/pixmaps/")
