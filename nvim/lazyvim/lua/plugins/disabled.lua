DISABLE_ON_LINES = 20000

local Util = require("lazyvim.util")

-- Function to display a message in the status line
local function display_status_message(message, hl_group)
  vim.api.nvim_echo({ { message, hl_group } }, true, {})
end

-- local function is_large_file()
--   -- local current_buf_lines = vim.api.nvim_buf_line_count(0)
--   -- Check if buffer exists otherwise but defualt set the file size to to small
--   if vim.fn.expand('%') == '' or is_buffer_empty() then
--     return false
--   else
--     local current_buf_lines = tonumber(vim.fn.system({ 'wc', '-l', vim.fn.expand('%') }):match('%d+'))
--     -- local current_buf_lines = vim.api.nvim_buf_line_count(0)
--     display_status_message("Large file: Disabling some extentions due to large file size " .. current_buf_lines,
--       "WarningMsg")
--     Util.info("Disabling some extentions due to large file size" .. current_buf_lines, { title = "Warning" })
--     return current_buf_lines > DISABLE_ON_LINES
--   end
-- end

local function is_large_file()
  if vim.fn.expand('%') == '' then
    return false
  else
    local current_buf_lines = tonumber(vim.fn.system({ 'wc', '-l', vim.fn.expand('%') }):match('%d+'))
    if current_buf_lines == nil then
      -- Error occurred while getting line count, consider file as small
      return false
    else
      if current_buf_lines > DISABLE_ON_LINES then
        -- local message = "Large file: Line Count " .. current_buf_lines
        -- vim.api.nvim_echo({ { message, "WarningMsg" } }, true, {})
        return true
      else
        return false
      end
    end
  end
end

if is_large_file() then
  -- local Util = require("lazyvim.util")
  -- display_status_message("Large file: Disabling some extentions due to large file size", "WarningMsg")
  display_status_message("Large file: Disabling some extentions due to large file size", "WarningMsg")
  -- Util.info("Disabling some extentions due to large file size", { title = "Warning" })
  false_large = false
else
  false_large = true
end

if vim.g.vscode then
  -- VSCode extension
  return {
    { "Civitasv/cmake-tools.nvim",                   enabled = false },
    { "Hoffs/omnisharp-extended-lsp.nvim",           enabled = false },
    { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
    { "L3MON4D3/LuaSnip",                            enabled = false },
    { "MunifTanjim/nui.nvim",                        enabled = false },
    { "RRethy/vim-illuminate",                       enabled = false },
    { "SmiteshP/nvim-navic",                         enabled = false },
    { "TobinPalmer/Tip.nvim",                        enabled = false },
    { "ahmedkhalf/project.nvim",                     enabled = false },
    { "akinsho/bufferline.nvim",                     enabled = false },
    { "b0o/SchemaStore.nvim",                        enabled = false },
    { "catppuccin/nvim",                             enabled = false },
    { "dstein64/vim-startuptime",                    enabled = false },
    { "echasnovski/mini.ai",                         enabled = false },
    { "echasnovski/mini.animate",                    enabled = false },
    { "echasnovski/mini.bufremove",                  enabled = false },
    { "echasnovski/mini.comment",                    enabled = false },
    { "echasnovski/mini.files",                      enabled = false },
    { "echasnovski/mini.hipatterns",                 enabled = false },
    { "echasnovski/mini.indentscope",                enabled = false },
    { "echasnovski/mini.pairs",                      enabled = false },
    { "echasnovski/mini.starter",                    enabled = false },
    { "echasnovski/mini.surround",                   enabled = false },
    { "folke/edgy.nvim",                             enabled = false },
    { "folke/flash.nvim",                            enabled = false },
    { "folke/noice.nvim",                            enabled = false },
    { "folke/persistence.nvim",                      enabled = false },
    { "folke/todo-comments.nvim",                    enabled = false },
    { "folke/tokyonight.nvim",                       enabled = false },
    { "folke/trouble.nvim",                          enabled = false },
    { "folke/which-key.nvim",                        enabled = false },
    { "gbprod/yanky.nvim",                           enabled = false },
    { "ggandor/flit.nvim",                           enabled = false },
    { "ggandor/leap.nvim",                           enabled = false },
    { "goolord/alpha-nvim",                          enabled = false },
    { "hrsh7th/nvim-cmp",                            enabled = false },
    { "iamcco/markdown-preview.nvim",                enabled = false },
    { "jbyuki/one-small-step-for-vimkind",           enabled = false },
    { "lervag/vimtex",                               enabled = false },
    { "lewis6991/gitsigns.nvim",                     enabled = false },
    { "linux-cultist/venv-selector.nvim",            enabled = false },
    { "luckasRanarison/tree-sitter-hypr",            enabled = false },
    { "lukas-reineke/headlines.nvim",                enabled = false },
    { "lukas-reineke/indent-blankline.nvim",         enabled = false },
    { "lukas-reineke/indent-blankline.nvim",         enabled = false },
    { "mfussenegger/nvim-dap",                       enabled = false },
    { "mfussenegger/nvim-jdtls",                     enabled = false },
    { "mfussenegger/nvim-lint",                      enabled = false },
    { "neovim/nvim-lspconfig",                       enabled = false },
    { "nvim-lua/plenary.nvim",                       enabled = false },
    { "nvim-lualine/lualine.nvim",                   enabled = false },
    { "nvim-neo-tree/neo-tree.nvim",                 enabled = false },
    { "nvim-neotest/neotest",                        enabled = false },
    { "nvim-pack/nvim-spectre",                      enabled = false },
    { "nvim-telescope/telescope.nvim",               enabled = false },
    { "nvim-tree/nvim-web-devicons",                 enabled = false },
    { "nvim-treesitter/nvim-treesitter",             enabled = false },
    { "nvim-treesitter/nvim-treesitter-context",     enabled = false },
    { "nvimdev/dashboard-nvim",                      enabled = false },
    { "nvimtools/none-ls.nvim",                      enabled = false },
    { "p00f/clangd_extensions.nvim",                 enabled = false },
    { "rcarriga/nvim-notify",                        enabled = false },
    { "simrat39/rust-tools.nvim",                    enabled = false },
    { "simrat39/symbols-outline.nvim",               enabled = false },
    { "stevearc/aerial.nvim",                        enabled = false },
    { "stevearc/conform.nvim",                       enabled = false },
    { "stevearc/dressing.nvim",                      enabled = false },
    { "tpope/vim-repeat",                            enabled = false },
    { "tzachar/cmp-tabnine",                         enabled = false },
    { "williamboman/mason.nvim",                     enabled = false },
    { "windwp/nvim-ts-autotag",                      enabled = false },
    { "wookayin/semshi",                             enabled = false },
    { "zbirenbaum/copilot-cmp",                      enabled = false },
  }
else
  -- ordinary Neovim
  -- bootstrap lazy.nvim, LazyVim and your plugins

  return {

    -- disable trouble
    -- { "akinsho/bufferline.nvim",                     enabled = false },
    -- { "ahmedkhalf/project.nvim",                     enabled = false },
    -- { "b0o/SchemaStore.nvim",                        enabled = false },
    -- { "catppuccin/nvim",                             enabled = false },
    -- { "Civitasv/cmake-tools.nvim",                   enabled = false },
    -- { "dstein64/vim-startuptime",                    enabled = false },
    -- { "echasnovski/mini.ai",                         enabled = false },
    -- { "echasnovski/mini.animate",                    enabled = false },
    -- { "echasnovski/mini.bufremove",                  enabled = false },
    -- { "echasnovski/mini.comment",                    enabled = false },
    -- { "echasnovski/mini.files",                      enabled = false },
    -- { "echasnovski/mini.hipatterns",                 enabled = false },
    -- { "echasnovski/mini.indentscope",                enabled = false },
    -- { "echasnovski/mini.starter",                    enabled = false },
    -- { "echasnovski/mini.surround",                   enabled = false },
    -- { "echasnovski/mini.pairs",                      enabled = false },
    -- { "folke/noice.nvim",                            enabled = false },
    -- { "folke/edgy.nvim",                             enabled = false },
    -- { "folke/flash.nvim",                            enabled = false },
    -- { "folke/which-key.nvim",                        enabled = false },
    -- { "folke/todo-comments.nvim",                    enabled = false },
    -- { "folke/tokyonight.nvim",                       enabled = false },
    -- { "folke/trouble.nvim",                          enabled = false },
    -- { "folke/persistence.nvim",                      enabled = false },
    -- { "Hoffs/omnisharp-extended-lsp.nvim",           enabled = false },
    -- { "hrsh7th/nvim-cmp",                            enabled = false },
    -- { "iamcco/markdown-preview.nvim",                enabled = false },
    -- { "jbyuki/one-small-step-for-vimkind",           enabled = false },
    -- { "JoosepAlviste/nvim-ts-context-commentstring", enabled = false },
    -- { "lukas-reineke/indent-blankline.nvim",         enabled = false },
    -- { "lukas-reineke/headlines.nvim",                enabled = false },
    -- { "linux-cultist/venv-selector.nvim",            enabled = false },
    -- { "lervag/vimtex",                               enabled = false },
    -- { "lewis6991/gitsigns.nvim",                     enabled = false },
    -- { "luckasRanarison/tree-sitter-hypr",            enabled = false },
    -- { "L3MON4D3/LuaSnip",                            enabled = false },
    -- { "ggandor/leap.nvim",                           enabled = false },
    -- { "ggandor/flit.nvim",                           enabled = false },
    -- { "goolord/alpha-nvim",                          enabled = false },
    -- { "gbprod/yanky.nvim",                           enabled = false },
    -- { "lukas-reineke/indent-blankline.nvim",         enabled = false },
    -- { "mfussenegger/nvim-jdtls",                     enabled = false },
    -- { "mfussenegger/nvim-dap",                       enabled = false },
    -- { "mfussenegger/nvim-lint",                      enabled = false },
    -- { "MunifTanjim/nui.nvim",                        enabled = false },
    -- { "neovim/nvim-lspconfig",                       enabled = false },
    -- { "nvim-lualine/lualine.nvim",                   enabled = false },
    -- { "nvim-lua/plenary.nvim",                       enabled = false },
    -- { "nvim-neotest/neotest",                        enabled = false },
    -- { "nvim-neo-tree/neo-tree.nvim",                 enabled = false },
    -- { "nvim-telescope/telescope.nvim",               enabled = false },
    -- { "nvim-tree/nvim-web-devicons",                 enabled = false },
    -- { "nvim-pack/nvim-spectre",                      enabled = false },
    -- { "nvimdev/dashboard-nvim",                      enabled = false },
    -- { "nvimtools/none-ls.nvim",                      enabled = false },
    -- { "p00f/clangd_extensions.nvim",                 enabled = false },
    -- { "rcarriga/nvim-notify",                        enabled = false },
    -- { "RRethy/vim-illuminate",                       enabled = false },
    -- { "SmiteshP/nvim-navic",                         enabled = false },
    -- { "simrat39/symbols-outline.nvim",               enabled = false },
    -- { "simrat39/rust-tools.nvim",                    enabled = false },
    -- { "stevearc/aerial.nvim",                        enabled = false },
    -- { "stevearc/conform.nvim",                       enabled = false },
    -- { "stevearc/dressing.nvim",                      enabled = false },
    -- { "TobinPalmer/Tip.nvim",                        enabled = false },
    -- { "tpope/vim-repeat",                            enabled = false },
    -- { "tzachar/cmp-tabnine",                         enabled = false },
    -- { "williamboman/mason.nvim",                     enabled = false },
    -- { "wookayin/semshi",                             enabled = false },
    -- { "zbirenbaum/copilot-cmp",                      enabled = false },

    -- Other plugins
    -- { "ThePrimeagen/vim-be-good", enabled = false },
    -- { "WeiChungWu/vim-SystemVerilog",   enabled = false },
    -- { "airblade/vim-gitgutter",         enabled = false },
    -- { "christoomey/vim-tmux-navigator", enabled = false },
    -- { "djoshea/vim-autoread",           enabled = false },
    -- { "echasnovski/mini.cursorword",    enabled = false },
    -- { "frazrepo/vim-rainbow",           enabled = false },
    -- { "lambdalisue/nerdfont.vim",       enabled = false },
    -- { "ludovicchabant/vim-gutentags",   enabled = false },
    -- { "m4xshen/hardtime.nvim",          enabled = false },
    -- { "mg979/vim-visual-multi",         enabled = false },
    -- { "nachumk/systemverilog.vim",      enabled = false },
    -- { "numToStr/Comment.nvim",          enabled = false },
    -- { "preservim/tagbar",               enabled = false },
    -- { "theprimeagen/harpoon",           enabled = false },
    -- { "tmux-plugins/vim-tmux",          enabled = false },
    -- { "tpope/vim-fugitive",             enabled = false },
    -- { "tpope/vim-sensible",             enabled = false },
    -- { "vim-scripts/SearchComplete",     enabled = false },
    -- { "wellle/targets.vim",             enabled = false },
    -- { "xiyaowong/transparent.nvim",     enabled = false },

    -- Disable these extension for large files.
    -- { "nvim-treesitter/nvim-treesitter",         enabled = false_large },
    { "nvim-treesitter/nvim-treesitter-context", enabled = false_large },
    -- { "windwp/nvim-ts-autotag",                  enabled = false_large },
  }
end
