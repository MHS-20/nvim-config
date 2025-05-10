return {
    "scalameta/nvim-metals",
    ft = { "scala", "sbt", "java" }, -- Load Metals only for Scala, SBT, and Java files
    dependencies = {
        "nvim-lua/plenary.nvim",     -- Required dependency
        "mfussenegger/nvim-dap",     -- Optional: Debugging support
    },
    config = function()
        local metals_config = require("metals").bare_config()

        -- Capabilities for autocompletion
        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        metals_config.capabilities = capabilities

        -- Define the on_attach function
        metals_config.on_attach = function(client, bufnr)
            -- Enable Mason-managed tools (e.g., formatters, linters)
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_buf_set_option(bufnr, "formatexpr", "v:lua.vim.lsp.formatexpr()")
            end

            -- Additional LSP settings
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc" -- Enable omnifunc for autocompletion
        end


        -- Metals settings
        metals_config.settings = {
            showImplicitArguments = true,
            superMethodLensesEnabled = true,
            showInferredType = true,
        }

        -- Autocmd to start Metals
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "sbt", "java" },
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
        })

        -- Keymaps for Metals
        local keymap = vim.keymap
        keymap.set("n", "<leader>mc", "<cmd>MetalsCompile<CR>", { desc = "Compile Scala project" })
        --   keymap.set("n", "<leader>mi", "<cmd>MetalsImportBuild<CR>", { desc = "Import build" })
        --   keymap.set("n", "<leader>mt", "<cmd>MetalsTest<CR>", { desc = "Run tests" })
    end,
}
