if vim.g.vscode then
    -- VSCode extension
  return {
    -- disable trouble
    -- { "folke/trouble.nvim", enabled = false },
    -- { "rcarriga/nvim-notify", enabled = false },
    { "ggandor/leap.nvim", enabled = false },
    { "nvim-lualine/lualine.nvim", enabled = false },
    { "xiyaowong/transparent.nvim", enabled = false },
    { "rcarriga/nvim-notify", enabled = false },
    { "folke/noice.nvim", enabled = false },
    { "nvimdev/dashboard-nvim", enabled = false },
    { "nvim-neo-tree/neo-tree.nvim", enabled = false },
    -- { "lukas-reineke/indent-blankline.nvim", enabled = false },
    -- { "goolord/alpha-nvim", enabled = false },
    -- { "nvim-lualine/lualine.nvim", enabled = false },
  }
else
-- ordinary Neovim
-- bootstrap lazy.nvim, LazyVim and your plugins
return {
  -- disable trouble
  -- { "folke/trouble.nvim", enabled = false },
  -- { "rcarriga/nvim-notify", enabled = false },
  -- { "ggandor/leap.nvim", enabled = false },
  -- { "lukas-reineke/indent-blankline.nvim", enabled = false },
  -- { "goolord/alpha-nvim", enabled = false },
  -- { "nvim-lualine/lualine.nvim", enabled = false },
}
end
