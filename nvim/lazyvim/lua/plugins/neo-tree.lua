local neotree_options = {
  window = {
    position = "right",
    -- position = "left",
    -- width = 40,
    -- mapping_options = {
    --   noremap = true,
    --   nowait = true,
    -- },
  },
  filesystem = {
    filtered_items = {
      visible = false,   -- when true, they will just be displayed differently than normal items
      hide_dotfiles = false,
      hide_gitignored = false,
      hide_hidden = false,   -- only works on Windows for hidden files/directories
      hide_by_name = {
        --"node_modules"
      },
      hide_by_pattern = {   -- uses glob style patterns
        --"*.meta",
        --"*/src/*/tsconfig.json",
      },
      always_show = {   -- remains visible even if other settings would normally hide it
        --".gitignored",
      },
      never_show = {   -- remains hidden even if visible is toggled to true, this overrides always_show
        --".DS_Store",
        --"thumbs.db"
      },
      never_show_by_pattern = {   -- uses glob style patterns
        --".null-ls_*",
      },
    },
    follow_current_file = false,              -- This will find and focus the file in the active buffer every
    -- time the current file is changed while the tree is open.
    group_empty_dirs = false,                 -- when true, empty folders will be grouped together
    hijack_netrw_behavior = "open_default",   -- netrw disabled, opening a directory opens neo-tree
    -- in whatever position is specified in window.position
    -- "open_current",  -- netrw disabled, opening a directory opens within the
    -- window like netrw would, regardless of window.position
    -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
    use_libuv_file_watcher = false,   -- This will use the OS level file watchers to detect changes
    -- instead of relying on nvim autocmd events.
    window = {
      mappings = {
        ["<bs>"] = "navigate_up",
        ["."] = "set_root",
        ["H"] = "toggle_hidden",
        ["/"] = "fuzzy_finder",
        ["D"] = "fuzzy_finder_directory",
        ["#"] = "fuzzy_sorter",   -- fuzzy sorting using the fzy algorithm
        -- ["D"] = "fuzzy_sorter_directory",
        ["f"] = "filter_on_submit",
        ["<c-x>"] = "clear_filter",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
      },
      fuzzy_finder_mappings = {   -- define keymaps for filter popup window in fuzzy_finder_mode
        ["<down>"] = "move_cursor_down",
        ["<C-n>"] = "move_cursor_down",
        ["<up>"] = "move_cursor_up",
        ["<C-p>"] = "move_cursor_up",
      },
    },
  }
}
return {
  "nvim-neo-tree/neo-tree.nvim",
  -- dependencies = { 'xiyaowong/transparent.nvim', lazy = true, event = "VimEnter" },
  -- require('transparent').clear_prefix('NeoTree'),
  event = "VeryLazy",
  cmd = {"NeoTree toggle"},
  keys = {
    { "<C-n>", "<cmd>NeoTree toggle<CR>", desc = "Toggle the NeoTree" },
  },
  opts = neotree_options,
}
