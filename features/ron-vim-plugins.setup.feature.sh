. $HOTBOX/lib/sh.sh


heading "Installing Ron's Vim plugins"
echo_on
cd ~/.vim/pack/hotbox/start
git clone https://github.com/macro187/vim-macrobsidian.git
git clone --depth 1 https://github.com/ryanoasis/vim-devicons.git
git clone --depth 1 https://github.com/gelguy/wilder.nvim.git
git clone --depth 1 https://github.com/preservim/nerdtree.git
git clone --depth 1 https://github.com/prabirshrestha/vim-lsp.git
git clone --depth 1 https://github.com/prabirshrestha/asyncomplete.vim.git
git clone --depth 1 https://github.com/prabirshrestha/asyncomplete-lsp.vim.git
echo_off
