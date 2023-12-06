-- Was needed to copy the whole function to make it work, as this does not 
-- work if tried to override partially.
return {

  -- Start screen for Vim and Neovim.
  -- { "mhinz/vim-startify", lazy = true, enabled = false },

  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = {'BlakeJC94/alpha-nvim-fortune'},
  requires = {'BlakeJC94/alpha-nvim-fortune'},
  opts = function()
    local fortune = require("alpha.fortune")
    local qoute = fortune()
    -- local logo = [[
    --       ▀████▀▄▄              ▄█
    --         █▀    ▀▀▄▄▄▄▄    ▄▄▀▀█
    -- ▄        █          ▀▀▀▀▄  ▄▀ 
    -- ▄▀ ▀▄      ▀▄              ▀▄▀ 
    -- ▄▀    █     █▀   ▄█▀▄      ▄█   
    -- ▀▄     ▀▄  █     ▀██▀     ██▄█  
    --   ▀▄    ▄▀ █   ▄██▄   ▄  ▄  ▀▀ █ 
    --   █  ▄▀  █    ▀██▀    ▀▀ ▀▀  ▄▀ 
    --   █   █  █      ▄▄           ▄▀  
    -- ]]
    -- local logo = [[
    --   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⣪⣿⡿⠋⠉⠀⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    --   ⡇⠀⠀⠀⠀⢀⣼⣿⠟⠉⠉⠙⢰⣇⠀⠀⠀⢻⡆⠀⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    --   ⣷⡀⢀⢤⣤⣾⣿⣿⣤⣤⠄⠀⠘⣿⣆⠀⠀⠀⢧⠀⠈⢷⡄⠀⠀⠀⠀⠀⠀⠀
    --   ⠙⠿⠇⠀⢻⣿⣿⡿⠋⠀⠀⠀⢸⣿⠏⠂⠀⠀⠀⠀⠀⠀⠃⠐⠀⠀⠀⠀⠀⠀
    --   ⠀⠰⠀⠀⠀⠙⠉⠀⠀⠀⠀⠀⠀⠀⢠⠀⠀⠀⠀⠀⠀⠀⢀⠀⠁⠀⠀⠀⠀⠀
    --   ⠀⠀⠣⢤⣀⠀⠀⠀⣀⣠⣴⡦⡶⠚⠥⠆⠀⠀⠀⠀⠀⢰⡄⠀⡄⠀⠀⠀⠀⠀
    --   ⠀⠀⠀⢸⢹⣭⣭⣭⣵⣦⠜⠁⠈⣦⡀⠀⠀⠀⠀⡆⠀⠘⠀⠀⣿⡄⠀⠀⠀⠀
    --   ⠀⠀⠀⠀⠙⠿⢿⡿⠿⣯⣤⣴⣾⣿⣧⠀⠀⠀⢠⠁⠀⢸⠀⠀⡟⣿⣦⣀⠀⠀
    --   ⠀⠀⠀⠀⠀⠀⠀⡉⠀⠀⢙⢉⣝⣉⠙⠀⠀⠀⣆⣀⣀⣠⣀⣼⡷⠤⠽⠛⠛⠃
    --   ⠀⠀⠀⠀⠀⠀⠘⠛⠛⠛⠊⠈⠉⠉⠿⢷⣿⠾⠿⠛⠛⠛⠁⠀⠀⠀⠀⠀⠀⠀
    -- ]]
    local logo = [[

                                                                     
    _/      _/  _/_/_/_/    _/_/    _/      _/  _/_/_/  _/      _/   
   _/_/    _/  _/        _/    _/  _/      _/    _/    _/_/  _/_/    
  _/  _/  _/  _/_/_/    _/    _/  _/      _/    _/    _/  _/  _/     
 _/    _/_/  _/        _/    _/    _/  _/      _/    _/      _/      
_/      _/  _/_/_/_/    _/_/        _/      _/_/_/  _/      _/       
                                                                     
]]
    local logo = [[

      ___          ___          ___                                ___     
     /\  \        /\__\        /\  \         ___                  /\  \    
     \:\  \      /:/ _/_      /::\  \       /\  \      ___       |::\  \   
      \:\  \    /:/ /\__\    /:/\:\  \      \:\  \    /\__\      |:|:\  \  
  _____\:\  \  /:/ /:/ _/_  /:/  \:\  \      \:\  \  /:/__/    __|:|\:\  \ 
 /::::::::\__\/:/_/:/ /\__\/:/__/ \:\__\ ___  \:\__\/::\  \   /::::|_\:\__\
 \:\~~\~~\/__/\:\/:/ /:/  /\:\  \ /:/  //\  \ |:|  |\/\:\  \__\:\~~\  \/__/
  \:\  \       \::/_/:/  /  \:\  /:/  / \:\  \|:|  | ~~\:\/\__\\:\  \      
   \:\  \       \:\/:/  /    \:\/:/  /   \:\__|:|__|    \::/  / \:\  \     
    \:\__\       \::/  /      \::/  /     \::::/__/     /:/  /   \:\__\    
     \/__/        \/__/        \/__/       ~~~~         \/__/     \/__/    
]]
--     local logo = [[
--
--    _  __ ___  _   _ __ __ _   __
--   / |/ // _/,' \ /// // // \,' /
--  / || // _// o || V // // \,' / 
-- /_/|_//___/|_,' |_,'/_//_/ /_/  
--
-- ]]
--     local logo = [[
--
--  _|      _|  _|_|_|_|    _|_|    _|      _|  _|_|_|  _|      _|  
--  _|_|    _|  _|        _|    _|  _|      _|    _|    _|_|  _|_|  
--  _|  _|  _|  _|_|_|    _|    _|  _|      _|    _|    _|  _|  _|  
--  _|    _|_|  _|        _|    _|    _|  _|      _|    _|      _|  
--  _|      _|  _|_|_|_|    _|_|        _|      _|_|_|  _|      _|  
--
--
-- ]]
    --  local logo = [[
    --  _______             ____   ___.__         
    --  \      \   ____  ___\   \ /   |__| _____  
    --  /   |   \_/ __ \/  _ \   Y   /|  |/     \ 
    -- /    |    \  ___(  <_> \     / |  |  Y Y  \
    -- \____|__  /\___  \____/ \___/  |__|__|_|  /
    --           \/     \/                       \/    
    --  ]]

    -- local combined = logo
    local combined = logo .. qoute
    -- local combined = logo .. fortune()
    -- local combined = qoute .. "\n" .. logo
    -- logo = string.rep("\n", 8) .. combined .. "\n" -- This line adds padding at the top
    logo = combined .. "\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = "Telescope find_files",                                     desc = " Find file",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New file",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find text",       icon = " ", key = "g" },
          { action = [[lua require("lazyvim.util").telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

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
