return {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]], -- Default keymap to toggle terminal
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "horizontal", -- Options: 'vertical', 'horizontal', 'tab', 'float'
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })
  
      -- Set additional keymaps for convenience
      local keymap = vim.keymap
      keymap.set("n", "<leader>pp", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
      keymap.set("t", "<leader>pp", "<cmd>ToggleTerm<CR>", { desc = "Toggle terminal" })
      keymap.set("n", "<leader>pf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle floating terminal" })
      keymap.set("n", "<leader>ph", "<cmd>ToggleTerm size=10 direction=horizontal<CR>", { desc = "Toggle horizontal terminal" })
      keymap.set("n", "<leader>pv", "<cmd>ToggleTerm size=80 direction=vertical<CR>", { desc = "Toggle vertical terminal" })
    end,
  }