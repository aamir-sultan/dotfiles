return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the keymap to grep files
    -- {"<leader>/", false},
    -- change a keymap
    { "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Find All Files" },
    { "<leader>fw", "<cmd> Telescope live_grep <CR>", desc = "Live grep" },
    { "<leader>fh", "<cmd> Telescope help_tags <CR>", desc = "Help page" },
    { "<leader>th", "<cmd> Telescope colorscheme<CR>", "Colorscheme" },

    -- add a keymap to browse plugin files
    {
      "<leader>fp",
      function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
      desc = "Find Plugin File",
    },
  },
}