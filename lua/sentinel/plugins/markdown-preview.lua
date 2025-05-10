return {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" }, 
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    config = function()
      vim.g.mkdp_auto_start = 1 -- immediately open the preview window
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0 -- refresh the preview window
      vim.g.mkdp_browser = "" -- open the preview in the default browser
    end,

    vim.keymap.set("n", "<leader>mm", "<cmd>MarkdownPreview<CR>", { desc = "Toggle Markdown Preview" })
  }