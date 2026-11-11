import os

cwd = os.getcwd() 
config = "~/.config"
bins = cwd + '/bin' 
fonts = cwd + '/fonts'

files = [f for f in os.listdir(cwd) if f not in [
        # Ignore
        ".git", 
        ".gitignore", 
        "setup.py",
        "create_symlinks.py",
        "fonts", 
        "bin", 
        "wallpaper.jpg", 
        "lightdm-gtk-greeter",
        "visuals",
        "configs",
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
