return {
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            format = {
                enable = true,
                defaultConfig = {
                    indent_style = "space",
                    indent_size = "2",
                },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    -- add runtime
                    [vim.fn.expand("$VIMRUNTIME")] = true,
                    -- add your config
                    [vim.fn.expand("~/.config/nvim")] = true,
                    -- add plugins
                    -- if you're not using packer, then you might need to change the paths below
                    [vim.fn.expand("~/.local/share/nvim/site/pack/packer/opt/*")] = true,
                    [vim.fn.expand("~/.local/share/nvim/site/pack/packer/start/*")] = true,
                },
                maxPreload = 2000,
                preloadFileSize = 50000,
            },
            telemetry = {
                enable = true
            },
        },
    },
}
