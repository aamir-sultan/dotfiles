local harpoon_options = {
  global_settings = {
    -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
    save_on_toggle = false,

    -- saves the harpoon file upon every change. disabling is unrecommended.
    save_on_change = true,

    -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
    enter_on_sendcmd = false,

    -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
    tmux_autoclose_windows = false,

    -- filetypes that you want to prevent from adding to the harpoon list menu.
    excluded_filetypes = { "harpoon" },

    -- set marks specific to each git branch inside git repository
    -- Each branch will have it's own set of marked files
    mark_branch = true,

    -- enable tabline with harpoon marks
    tabline = false,
    tabline_prefix = "   ",
    tabline_suffix = "   ",
  },
  width = vim.api.nvim_win_get_width(0) - 4,
}
return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = harpoon_options,
  config = function()
    require("harpoon"):setup(_, opts)
  end,
  keys = {
    { "<leader>A", function() require("harpoon"):list():append() end,  desc = "harpoon file", },
    {
      "<leader>a",
      function()
        local harpoon = require("harpoon")
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = "harpoon quick menu",
    },
    { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
    { "-j",        function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
    { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
    { "-k",        function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
    { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
    { "-l",        function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
    { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
    { "-;",        function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
    { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    { "-'",        function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
    -- Not very usefull -- as the same functionality can be achieved via harpoon list and fuzzy finding
    -- { "<leader>hn",   function() require("harpoon"):list():next() end },
    -- { "<leader>hp",   function() require("harpoon"):list():prev() end }
  },
}
