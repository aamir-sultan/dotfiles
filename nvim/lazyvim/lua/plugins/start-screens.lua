-- Was needed to copy the whole function to make it work, as this does not 
-- work if tried to override partially.
return {

  -- Start screen for Vim and Neovim.
  -- { "mhinz/vim-startify", lazy = true, enabled = false },
  -- {
  -- 'BlakeJC94/alpha-nvim-fortune'
  -- -- lazy = true,
  -- -- event = "VimEnter",
  -- },

  {
  "nvimdev/dashboard-nvim",
  -- lazy = true,
  event = "VimEnter",
  -- event = "VeryLazy",
  dependencies = {'BlakeJC94/alpha-nvim-fortune'},
  -- requires = {'BlakeJC94/alpha-nvim-fortune'},
  opts = function()
    local fortune = require("alpha.fortune")
    local qoute = fortune()
    -- local plug =  [[ 
    -- [  Github] [ aamir-sultan]
    -- ]]
    local logo = [[
            .__         
  _______  _|__| _____  
 /    \  \/ /  |/     \ 
|   |  \   /|  |  Y Y  \
|___|  /\_/ |__|__|_|  /
     \/              \/ 
]]

    -- local combined = ""
    -- local combined = qoute
    -- local combined = logo
    local combined = logo .. qoute
    -- local combined = logo .. qoute .. plug
    -- local combined = qoute .. "\n" .. logo
    -- logo = string.rep("\n", 8) .. combined .. "\n" -- This line adds padding at the top
    logo = combined .. "\n"

    local opts = {
      -- theme = "doom", -- doom can use the buttons style which LazyLite is following
      theme = "hyper",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        shortcut = {}, -- Require this to remove the glepnir marks
        header = vim.split(logo, "\n"),
        packages = { enable = false }, -- show how many plugins neovim loaded as the following function also do it
        -- mru = { limit = 10, icon = 'your icon', label = '', cwd_only = false },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          local status = "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms"
          return { status }
        end,
      },
    }

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
  }
}
