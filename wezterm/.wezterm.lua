-- Pull in the wezterm API
local wezterm = require 'wezterm'
local gpus = wezterm.gui.enumerate_gpus()

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

---------------------------------------------------------------
--- functions
---------------------------------------------------------------
-- selene: allow(unused_variable)
---@diagnostic disable-next-line: unused-function, unused-local
local function enable_wayland()
	local session = os.getenv("DESKTOP_SESSION")
	if session == "hyprland" then
		return true
	end
	-- local wayland = os.getenv("XDG_SESSION_TYPE")
	-- if wayland == "wayland" then
	-- 	return true
	-- end
	return false
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Ayu Dark'
-- config.color_scheme = 'ayu'
-- config.color_scheme = 'Batman'
config.font = wezterm.font_with_fallback {
    {
      family = 'JetBrains Mono',
      weight = 'Medium',
      style = 'Italic',
      harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    },
    { family = 'Terminus', weight = 'Bold' },
    'Noto Color Emoji',
  }

-- Background Settings
-- config.window_background_gradient = {
--   -- Can be "Vertical" or "Horizontal".  Specifies the direction
--   -- in which the color gradient varies.  The default is "Horizontal",
--   -- with the gradient going from left-to-right.
--   -- Linear and Radial gradients are also supported; see the other
--   -- examples below
--   orientation = 'Vertical',

--   -- Specifies the set of colors that are interpolated in the gradient.
--   -- Accepts CSS style color specs, from named colors, through rgb
--   -- strings and more
--   colors = {
--     '#0f0c29',
--     '#302b63',
--     '#24243e',
--   },

--   -- Instead of specifying `colors`, you can use one of a number of
--   -- predefined, preset gradients.
--   -- A list of presets is shown in a section below.
--   -- preset = "Warm",

--   -- Specifies the interpolation style to be used.
--   -- "Linear", "Basis" and "CatmullRom" as supported.
--   -- The default is "Linear".
--   interpolation = 'Linear',

--   -- How the colors are blended in the gradient.
--   -- "Rgb", "LinearRgb", "Hsv" and "Oklab" are supported.
--   -- The default is "Rgb".
--   blend = 'Rgb',

--   -- To avoid vertical color banding for horizontal gradients, the
--   -- gradient position is randomly shifted by up to the `noise` value
--   -- for each pixel.
--   -- Smaller values, or 0, will make bands more prominent.
--   -- The default value is 64 which gives decent looking results
--   -- on a retina macbook pro display.
--   -- noise = 64,

--   -- By default, the gradient smoothly transitions between the colors.
--   -- You can adjust the sharpness by specifying the segment_size and
--   -- segment_smoothness parameters.
--   -- segment_size configures how many segments are present.
--   -- segment_smoothness is how hard the edge is; 0.0 is a hard edge,
--   -- 1.0 is a soft edge.

--   -- segment_size = 11,
--   -- segment_smoothness = 0.0,
-- }

config.window_background_image = 'D://Mega//backgrounds//2184.jpg'
config.window_background_opacity = .99
config.text_background_opacity = 0.3
config.window_background_image_hsb = {
    -- Darken the background image by reducing it to 1/3rd
    brightness = 0.1,
  
    -- You can adjust the hue by scaling its value.
    -- a multiplier of 1.0 leaves the value unchanged.
    hue = 1.0,
  
    -- You can adjust the saturation also.
    saturation = 1.0,
  }

-- Additional Settings
config.automatically_reload_config = true
config.enable_scroll_bar = true
-- config.disable_default_key_bindings = true
config.check_for_updates = false
config.use_ime = true
config.ime_preedit_rendering = "Builtin"
config.use_dead_keys = false
config.warn_about_missing_glyphs = false
-- config.enable_kitty_graphics = false
config.animation_fps = 1
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 0
-- config.front_end = "OpenGL"
config.front_end = "Software"
-- config.front_end = "WebGpu"
config.enable_wayland = enable_wayland()
-- https://github.com/wez/wezterm/issues/1772
-- config.enable_wayland = true
-- config.color_scheme = "nordfox"
-- config.color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors/" }
config.hide_tab_bar_if_only_one_tab = false
config.adjust_window_size_when_changing_font_size = false
config.selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.use_fancy_tab_bar = false
-- config.colors = {
--     tab_bar = {
--         background = scheme.background,
--         new_tab = { bg_color = "#2e3440", fg_color = scheme.ansi[8], intensity = "Bold" },
--         new_tab_hover = { bg_color = scheme.ansi[1], fg_color = scheme.brights[8], intensity = "Bold" },
--         -- format-tab-title
--         -- active_tab = { bg_color = "#121212", fg_color = "#FCE8C3" },
--         -- inactive_tab = { bg_color = scheme.background, fg_color = "#FCE8C3" },
--         -- inactive_tab_hover = { bg_color = scheme.ansi[1], fg_color = "#FCE8C3" },
--     },
-- }
config.exit_behavior = "CloseOnCleanExit"
config.tab_bar_at_bottom = false
config.window_close_confirmation = "AlwaysPrompt"
-- config.window_background_opacity = 0.8
-- config.visual_bell = {
-- 	fade_in_function = "EaseIn",
-- 	fade_in_duration_ms = 150,
-- 	fade_out_function = "EaseOut",
-- 	fade_out_duration_ms = 150,
-- }
-- config.separate <Tab> <C-i>
config.enable_csi_u_key_encoding = true
config.leader = { key = "Space", mods = "CTRL|SHIFT" }
-- config.keys = keybinds.create_keybinds()
-- config.key_tables = keybinds.key_tables
-- config.mouse_bindings = keybinds.mouse_bindings
-- https://github.com/wez/wezterm/issues/2756
config.webgpu_preferred_adapter = gpus[1]
config.front_end = "OpenGL"
-- config.max_fps  = 60

-- for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
-- 	if gpu.backend == "Vulkan" and gpu.device_type == "IntegratedGpu" then
-- 		config.webgpu_preferred_adapter = gpu
-- 		config.front_end = "WebGpu"
-- 		break
-- 	end
-- end

config.hyperlink_rules = {
	-- Matches: a URL in parens: (URL)
	{
		regex = '\\((\\w+://\\S+)\\)',
		format = '$1',
		highlight = 1,
	},
	-- Matches: a URL in brackets: [URL]
	{
		regex = '\\[(\\w+://\\S+)\\]',
		format = '$1',
		highlight = 1,
	},
	-- Matches: a URL in curly braces: {URL}
	{
		regex = '\\{(\\w+://\\S+)\\}',
		format = '$1',
		highlight = 1,
	},
	-- Matches: a URL in angle brackets: <URL>
	{
		regex = '<(\\w+://\\S+)>',
		format = '$1',
		highlight = 1,
	},
	-- Then handle URLs not wrapped in brackets
	{
		-- Before
		--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
		--format = '$0',
		-- After
		regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
		format = '$1',
		highlight = 1,
	},
	-- implicit mailto link
	{
		regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
		format = 'mailto:$0',
	},
}
table.insert(config.hyperlink_rules, {
	regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
	format = "https://github.com/$1/$3",
})

-- Returns the WSL with wsl -l -v
local wsl_domains = wezterm.default_wsl_domains()

for idx, dom in ipairs(wsl_domains) do
  if dom.name == 'WSL:Ubuntu' then
    dom.default_prog = { 'bash' }
    dom.default_cwd = "~"
  end
end

config.wsl_domains = wsl_domains

-- and finally, return the configuration to wezterm
return config