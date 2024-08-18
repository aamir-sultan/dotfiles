local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").move_selection_next,
        ["<C-k>"] = require("telescope.actions").move_selection_previous,
        ['<C-u>'] = false,
        -- Exit out of insert mode in telescope
        ['<C-c>'] = { "<esc>", type = "command" },
      },
      n = {
        ["q"] = require("telescope.actions").close,
        -- Quit the telescope window
        ['<C-c>'] = require("telescope.actions").close,
      },
    },
  },

  extensions_list = { "themes", "terms", "fzf" },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

-- local harpoon = require('harpoon')
-- harpoon:setup({})
-- basic telescope configuration
-- local conf = require("telescope.config").values
-- local function toggle_telescope(harpoon_files)
--   local file_paths = {}
--   for _, item in ipairs(harpoon_files.items) do
--     table.insert(file_paths, item.value)
--   end
--
--   require("telescope.pickers").new({}, {
--     prompt_title = "Harpoon",
--     finder = require("telescope.finders").new_table({
--       results = file_paths,
--     }),
--     previewer = conf.file_previewer({}),
--     sorter = conf.generic_sorter({}),
--   }):find()
-- end

-- return options
return {
  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    lazy=true,
    event = "LazyFile",
    keys = {
      -- disable the keymap to grep files
      -- {"<leader>/", false},
      -- change a keymap
      { "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>", desc = "Find All Files" },
      { "<leader>fw", "<cmd> Telescope live_grep <CR>",                                         desc = "Live grep" },
      { "<leader>fh", "<cmd> Telescope help_tags <CR>",                                         desc = "Help page" },
      { "<leader>cs", "<cmd> Telescope colorscheme<CR>",                                        desc = "Colorscheme" },
      { "<leader>hm", "<cmd> Telescope harpoon marks<CR>",                                      desc = "[H]arpoon [M]arks" },

      -- add a keymap to browse plugin files
    -- { "<C-e>",     function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" } },
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = options,
    dependencies = {
      "theprimeagen/harpoon",
      lazy = true,
      event = "LazyFile",
      config = function()
        require("telescope").load_extension('harpoon')
      end,
    },


  },
}
