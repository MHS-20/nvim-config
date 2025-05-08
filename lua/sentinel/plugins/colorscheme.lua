
-- return {
--  "ellisonleao/gruvbox.nvim",
--  priority = 1000,
--  config = function()
--    require("gruvbox").setup({
      -- custom options
--    })
--   vim.cmd("colorscheme gruvbox")
-- end
--}  

return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      -- custom options
      style = "night"
    })
    vim.cmd("colorscheme tokyonight")
  end
} 
