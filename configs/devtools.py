import os

# Compilers, Tools etc
list_dev = [
    "base-devel", 
    "clang", # clang/clangd
    "gdb",
    "cmake",
    "man-pages", 
    "man-db", 
    "opengl-man-pages",
    "python-setuptools", 
    "tree-sitter-cli",
    "nvim",
]

for x in list_dev: os.system(f"sudo pacman -S {x} --noconfirm")

# Install NVM (Node Version Manager)
os.system("curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.41.0/install.sh | bash")
