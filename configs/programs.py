import os

user = os.getlogin()
dots = f"/home/{user}/dotfiles"

list_programs = [
    "firefox",
    "spotify-launcher", 
]

list_programs_flatpak = [
    "com.obsproject.Studio",
]

for x in list_programs: os.system(f"sudo pacman -S {x} --noconfirm")
for x in list_programs_flatpak: os.system(f"flatpak install flathub {x} -y --noninteractive")
