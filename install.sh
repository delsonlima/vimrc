#!/usr/bin/sh

DEPENDENCY_PACKAGES="fd-find ripgrep"
PLUG_URL="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
NVM_URL="https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh"
PLUG_PATH_VIM="$HOME/.vim/autoload/plug.vim"
PLUG_PATH_NVIM="${XDG_DATA_HOME:-$HOME/.local/share}/nvim/site/autoload/plug.vim"
VIMRC_FILE="./vimrc"
EDITOR=
PLUG_PATH=
VIMRC_DEST_PATH=
VIMRC_DEST_NAME=

echo "Select your editor variant:"
echo "  1 - nvim"
echo "  2 - vim"
read -p "default (1): " EDITOR_INDEX
EDITOR_INDEX=${EDITOR_INDEX:-1}

case $EDITOR_INDEX in
    1)
        EDITOR="nvim"
        DEPENDENCY_PACKAGES+=" neovim python3-neovim"
        VIMRC_DEST_PATH="$HOME/.config/nvim"
        VIMRC_DEST_NAME="init.vim"
        PLUG_PATH="$PLUG_PATH_NVIM";;
    2)
        EDITOR="vim"
        DEPENDENCY_PACKAGES+=" vim"
        VIMRC_DEST_PATH="$HOME/.vim"
        PLUG_PATH="$PLUG_PATH_VIM";;
    *)
        echo "Invalid editor index!"
        exit 1;;
esac

echo "Selected editor: $EDITOR"

if [ "$EDITOR" = "nvim" ]; then
    PACKAGE_MANAGERS="dnf apt-get"
    PM_COMMAND=

    for pm in $PACKAGE_MANAGERS; do
        pm_path=$(command -v "$pm")
        if [ -n "$pm_path" ]; then
            PM_COMMAND="$pm_path"
        fi
    done

    if [ -z "$PM_COMMAND" ]; then
        echo "Could not determine package manager"
        exit 1
    fi

    echo "Istalling dependencies if missing: $DEPENDENCY_PACKAGES"
    sudo $PM_COMMAND install -y ${DEPENDENCY_PACKAGES}
fi

if [ ! -f "$PLUG_PATH" ]; then
    echo "Downloading vim-plug..."
    curl -fsLo "$PLUG_PATH" --create-dirs "$PLUG_URL" || exit 1
fi

NODE_PATH=$(command -v node)
echo "NODE_PATH: $NODE_PATH"

if [ -z "$NODE_PATH" ]; then
    echo "Could not find node. Trying to install..."
    curl -so- "$NVM_URL" | bash > /dev/null || exit 1
    . "$HOME/.nvm/nvm.sh"

    nvm install --lts
fi

NODE_VERSION=$(node --version)
echo "NODE_VERSION: $NODE_VERSION"

if [ -z "$NODE_VERSION" ]; then
    echo "Could not run installed node!"
    exit 1
fi

echo "Copying vimrc file to $VIMRC_DEST_PATH/$VIMRC_DEST_NAME"
mkdir -p "$VIMRC_DEST_PATH"
cp "$VIMRC_FILE" "$VIMRC_DEST_PATH/$VIMRC_DEST_NAME"

echo "Starting $EDITOR and installing plugins in... "
for i in 5 4 3 2 1 0; do
    echo "${i}s"

    if [ "$i" != 0 ]; then
        sleep 1s
    fi
done

$EDITOR +PlugInstall +qall && $EDITOR +CocInstall +qall
