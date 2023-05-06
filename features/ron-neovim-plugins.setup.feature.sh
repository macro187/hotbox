. $HOTBOX/lib/sh.sh


heading "Installing Ron's Neovim plugins"
echo_on
cd ~/.local/share/nvim/site/pack/hotbox/start
git clone https://github.com/macro187/vim-macrobsidian.git
git clone --depth 1 https://github.com/nvim-tree/nvim-web-devicons.git
git clone --depth 1 https://github.com/nvim-tree/nvim-tree.lua.git
git clone --depth 1 https://github.com/hrsh7th/nvim-cmp.git
git clone --depth 1 https://github.com/hrsh7th/cmp-nvim-lsp.git
git clone --depth 1 https://github.com/hrsh7th/cmp-nvim-lua.git
git clone --depth 1 https://github.com/hrsh7th/cmp-cmdline.git
git clone --depth 1 https://github.com/hrsh7th/cmp-path.git
git clone --depth 1 https://github.com/hrsh7th/cmp-buffer.git
git clone --depth 1 https://github.com/hrsh7th/vim-vsnip.git
git clone --depth 1 https://github.com/hrsh7th/cmp-vsnip.git
echo_off
