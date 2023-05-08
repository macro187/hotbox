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
    require("nvim-tree").setup({
        update_focused_file = {
            enable = true,
        },
        renderer = {
            full_name = true,
        },
    })
    vim.keymap.set("n", "<Leader>e", "<cmd>NvimTreeFocus<cr>")

    -- Close Vim if the tree is the last window
    vim.api.nvim_create_autocmd("BufEnter", {
        group = vim.api.nvim_create_augroup("NvimTreeClose", {clear = true}),
        pattern = "NvimTree_*",
        callback = function()
            local layout = vim.api.nvim_call_function("winlayout", {})
            if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then vim.cmd("confirm quit") end
        end
    })
end


--
-- Neovim LSP
--
vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local buffer_number = args.buf
        local opts = { silent = true, buffer = buffer_number }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set({ "n", "i" }, "<c-_>", vim.lsp.buf.signature_help, opts)
        setup_lsp_overloads(client, buffer_number)
    end,
})

function setup_lsp_overloads(client, buffer_number)
    if not has('lsp-overloads') then return end
    if not client.server_capabilities.signatureHelpProvider then return end
    require('lsp-overloads').setup(client, {
        ui = {
            border = "rounded",
            width = 80,
            offset_x = 0,
            focusable = false,
            floating_window_above_cur_line = true,
        },
        keymaps = {
            next_signature = "<c-n>",
            previous_signature = "<c-p>",
            next_parameter = "<c-l>",
            previous_parameter = "<c-h>",
            close_signature = "<c-k>"
        },
    })
    local opts = { silent = true, buffer = buffer_number }
    vim.keymap.set("n", "<c-k>", ":LspOverloadsSignature<CR>", opts)
    vim.keymap.set("i", "<c-k>", "<cmd>LspOverloadsSignature<CR>", opts)
end

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

    local completeopt = "menu,menuone,popup,noinsert"

    local preselect = cmp.PreselectMode.Item

    local window = {
        completion = {
            border = "rounded",
        },
        documentation = {
            border = "rounded",
        },
    }

    local mapping = {
        ['<c-space>'] = cmp.mapping(
            function(fallback)
                cmp.complete_common_string()
            end,
            { "i", "c" }
        ),
        ['<c-j>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    cmp.complete_common_string()
                end
            end,
            { "i", "c" }
        ),
        ['<c-k>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    cmp.complete_common_string()
                end
            end,
            { "i", "c" }
        ),
        ['<cr>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() and cmp.get_selected_entry() then
                    cmp.confirm()
                elseif cmp.visible() then
                    cmp.close()
                    fallback()
                else
                    fallback()
                end
            end,
            { "i", "c" }
        ),
        ['<c-[>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.abort()
                else
                    fallback()
                end
            end,
            { "i", "c" }
        ),
        -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
        -- ['<cr>'] = cmp.mapping.confirm({ select = true }),
    }

    local performance = {
    }

    cmp.setup({
        completeopt = completeopt,
        preselect = preselect,
        window = window,
        performance = performance,
        mapping = mapping,
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' },
        }, {
            { name = 'nvim_lua' },
        }, {
            { name = 'buffer' },
        }),
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
    })

    cmp.setup.cmdline(':', {
        completeopt = completeopt,
        preselect = preselect,
        window = window,
        performance = performance,
        mapping = mapping,
        sources = cmp.config.sources({
            { name = 'cmdline' },
            { name = 'path', option = { trailing_slash = true } },
        }),
    })
end
