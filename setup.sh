echo "Installing Mac command like tools"

xcode-select --install

git config --global user.name "tylee"
git config --global user.email tylee.fdcl@gmail.com

echo "Installing Homebrew"

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo >> /Users/tylee/.zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tylee/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install python3 neovim tmux
brew install --cask git-credential-manager

pip3 install --user --break-system-packages pynvim

mkdir ~/.config

mkdir ~/.config/nvim

mkdir ~/.config/karabiner

cp init.vim ~/.config/nvim

cp tmux.conf ~/.tmux.conf

cp karabiner.json ~/.config/karabiner

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
cd ~/.local/share/nvim/plugged/vim-markdown-composer
cargo build --release

