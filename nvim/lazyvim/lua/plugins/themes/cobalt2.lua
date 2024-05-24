return {
  'lalitmee/cobalt2.nvim',
  lazy = true,
  priority = 1000,
  event = { "ColorSchemePre" }, -- if you want to lazy load
  dependencies = { "tjdevries/colorbuddy.nvim", tag = "v1.0.0" },
  config = function()
    require("colorbuddy").colorscheme("cobalt2")
  end,
}
