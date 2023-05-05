--
-- Ron's Neovim Configuration
--
-- This is sourced after vimrc by Neovim only
--

function has(module_name)
    if package.loaded[module_name] then return true end
    for _, searcher in ipairs(package.searchers or package.loaders) do
      local loader = searcher(module_name)
      if type(loader) == "function" then
        package.preload[module_name] = loader
        return true
      end
    end
    return false
end


--
-- nvim-tree
--
if has("nvim-tree") then
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    require("nvim-tree").setup()
    vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeFocus<cr>")
end


--
-- Neovim LSP
--
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buffer_number = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buffer_number })
    end,
})

if vim.fn.executable("OmniSharp") == 1 then
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "cs",
        callback = function()
            vim.lsp.start({
                name = "omnisharp",
                cmd = { "OmniSharp", "-lsp" },
                --root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
                --settings = {
                --  Lua = {
                --    runtime = {
                --      version = "LuaJIT",
                --    },
                --    diagnostics = {
                --      globals = { "vim" },
                --    },
                --    workspace = {
                --      library = vim.api.nvim_get_runtime_file("", true),
                --    },
                --    telemetry = {
                --      enable = false,
                --    },
                --  },
                --},
            })
        end,
    })
end


--
-- cmp
--
if has("cmp") then
    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        window = {
            completion = {
                border = "rounded",
            },
            documentation = {
                border = "rounded",
            },
        },
        mapping = cmp.mapping.preset.insert({
        --    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        --    ['<C-f>'] = cmp.mapping.scroll_docs(4),
        --    ['<C-Space>'] = cmp.mapping.complete(),
        --    ['<C-e>'] = cmp.mapping.abort(),
        --    ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        }, {
            { name = 'buffer' },
        })
    })
end
