. $HOTBOX/lib/sh.sh


heading "Creating Ron's Vim plugin directory"
echo_on
cd $HOME
mkdir -p .vim/pack
cd .vim/pack
rm -rf ron
mkdir -p ron/start
echo_off


heading "Installing Ron's Vim plugins"
echo_on
cd ~/.vim/pack/ron/start
git clone https://github.com/macro187/vim-macrobsidian.git
git clone --depth 1 https://github.com/ryanoasis/vim-devicons.git
git clone --depth 1 https://github.com/gelguy/wilder.nvim.git
git clone --depth 1 https://github.com/preservim/nerdtree.git
git clone --depth 1 https://github.com/prabirshrestha/vim-lsp.git
git clone --depth 1 https://github.com/prabirshrestha/asyncomplete.vim.git
git clone --depth 1 https://github.com/prabirshrestha/asyncomplete-lsp.vim.git
echo_off
