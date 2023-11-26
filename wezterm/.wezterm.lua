-- Pull in the wezterm API
local wezterm = require 'wezterm'
local gpus = wezterm.gui.enumerate_gpus() -- Returns the list of available Gpus supported by WebGpu.
local config = {} -- This table will hold the configuration.
local act = wezterm.action -- Actions table for wezterm different tables.
local keys = {} -- This table will hold the keybindings.
local mouse_bindings = {} -- This table will hold the mouse bindings.
local launch_menu = {} -- This table will hold the launch menu options.

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
    local wayland = os.getenv("XDG_SESSION_TYPE")
    if wayland == "wayland" then
    	return true
    end
    return false
end

local function basename(s)
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
end

local function merge_tables(t1, t2)
    for k, v in pairs(t2) do
        if (type(v) == "table") and (type(t1[k] or false) == "table") then
            merge_tables(t1[k], t2[k])
        else
            t1[k] = v
        end
    end
    return t1
end

local function merge_lists(t1, t2)
    local result = {}
    for _, v in pairs(t1) do
        table.insert(result, v)
    end
    for _, v in pairs(t2) do
        table.insert(result, v)
    end
    return result
end

local function exists(tab, element)
    for _, v in pairs(tab) do
        if v == element then
            return true
        elseif type(v) == "table" then
            return exists(v, element)
        end
    end
    return false
end

local function convert_home_dir(path)
    local cwd = path
    local home = os.getenv("HOME")
    cwd = cwd:gsub("^" .. home .. "/", "~/")
    if cwd == "" then
        return path
    end
    return cwd
end

local function convert_useful_path(dir)
    local cwd = convert_home_dir(dir)
    return basename(cwd)
end

local function split_from_url(dir)
    local cwd = ""
    local hostname = ""
    local cwd_uri = dir:sub(8)
    local slash = cwd_uri:find("/")
    if slash then
        hostname = cwd_uri:sub(1, slash - 1)
        -- Remove the domain name portion of the hostname
        local dot = hostname:find("[.]")
        if dot then
            hostname = hostname:sub(1, dot - 1)
        end
        cwd = cwd_uri:sub(slash)
        cwd = convert_useful_path(cwd)
    end
    return hostname, cwd
end

---------------------------------------------------------------
--- Configurations settings and switches.
---------------------------------------------------------------
-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Ayu Dark'
-- config.color_scheme = 'ayu'
-- config.color_scheme = 'Batman'
-- config.color_scheme = "nordfox"
config.color_scheme = "Hardcore"
-- config.cell_width	= 1.05  -- Set this to increase the charachter spacing in the terminal.
config.cell_width	= 1.01  -- Set this to in/decrease the charachter spacing in the terminal.
config.line_height	= 1.0  -- Set this to in/decrease the charachter height in the terminal.
config.font_size 	= 11.0
config.font = wezterm.font_with_fallback {
	{
		family = 'Monaspace Argon',
		weight = 'Medium',
		-- weight = 'Bold',
		style = 'Italic',
		-- stretch = 'UltraExpanded',
		-- stretch = 'Expanded',
		harfbuzz_features = {'calt=1', 'clig=1', 'liga=1', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08'}
	},
	{
	    family = 'Monaspace Neon',
	    weight = 'Medium',
	    style = 'Italic',
	    harfbuzz_features = {'calt=1', 'clig=1', 'liga=1', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08'}
	},
	{
		family = 'Monaspace Xenon',
		weight = 'Medium',
		style = 'Italic',
		harfbuzz_features = {'calt=1', 'clig=1', 'liga=1', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08'}
	},
	{
		family = 'Monaspace Radon',
		weight = 'Medium',
		style = 'Italic',
		harfbuzz_features = {'calt=1', 'clig=1', 'liga=1', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08'}
	},
	{
		family = 'Monaspace Krypton',
		weight = 'Medium',
		style = 'Italic',
		harfbuzz_features = {'calt=1', 'clig=1', 'liga=1', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08'}
	},
	{
		family = 'JetBrains Mono',
		weight = 'Medium',
		style = 'Italic',
		harfbuzz_features = {'calt=1', 'clig=1', 'liga=1', 'dlig', 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08'}
	}, {
		family = 'Terminus',
		weight = 'Bold'
	}, 'Noto Color Emoji'}

-- Background Settings
-- config.window_background_image = 'D://Mega//backgrounds//2184.jpg' -- Background image path
config.window_background_opacity = .98 -- Background transparency = 0 and opacity = 1
config.text_background_opacity = 0.3 -- The image content can have relatively low contrast with respect to the text.
-- config.window_background_image_hsb = { -- Will implicitly prepend a layer to the background configuration
--     brightness = 0.1, -- Darken the background image by reducing it to 1/3rd
--     hue = 1.0, -- You can adjust the hue by scaling its value. A multiplier of 1.0 leaves the value unchanged.
--     saturation = 1.0 -- You can adjust the saturation also.
-- }
local hsb_dimmer = { -- Will implicitly prepend a layer to the background configuration
brightness = 0.1, -- Darken the background image by reducing it to 1/3rd
hue = 1.0, -- You can adjust the hue by scaling its value. A multiplier of 1.0 leaves the value unchanged.
saturation = 1.0 -- You can adjust the saturation also.
}
-- config.window_background_image_hsb = hsb_dimmer -- Will implicitly prepend a layer to the background configuration

config.background = {
	-- This is the deepest/back-most layer. It will be rendered first
	{
	  source  = {
		File    = 'D://Mega//backgrounds//2184.jpg',
	  },
	  -- The texture tiles vertically but not horizontally.
	  -- When we repeat it, mirror it so that it appears "more seamless".
	  -- An alternative to this is to set `width = "100%"` and have
	  -- it stretch across the display
	--   repeat_x 	= 'Mirror',
		repeat_x 	= 'NoRepeat',
	  hsb 		  = hsb_dimmer,
    opacity   = 0.98,
	  -- When the viewport scrolls, move this layer 10% of the number of
	  -- pixels moved by the main viewport. This makes it appear to be
	  -- further behind the text.
	  attachment = "Fixed",
	},
	-- Subsequent layers are rendered over the top of each other
	{
	  source  = {
		File    = 'D://Mega//backgrounds//assets//blob_blue.gif',
	  },
	  width 	    = '100%',
	  repeat_x 	  = 'NoRepeat',
  
	  -- position the spins starting at the bottom, and repeating every
	  -- two screens.
	  vertical_align 	  = 'Middle',
	  -- repeat_y_size 	  = '300%',
	  hsb 				      = hsb_dimmer,
    opacity           = 0.2,
    height            = 'Contain',
  
	  -- The parallax factor is higher than the background layer, so this
	  -- one will appear to be closer when we scroll
	  -- attachment = { Parallax = 0.1 },
    attachment = "Fixed",
	},
}

-- Additional Settings
config.automatically_reload_config = true -- reload it automatically when detected change - Default = true
config.enable_scroll_bar = true -- Enable the scrollbar. This is currently disabled by default
config.disable_default_key_bindings = true -- When true - Can disable all of them with this configuration
config.check_for_updates = false -- Wezterm checks regularly if there is a new stable version available
config.use_ime = true --  The Input Method Editor (IME) is useful for inputting kanji or other text.
config.ime_preedit_rendering = "Builtin" --  (Default) IME preedit is rendered by WezTerm itself
config.use_dead_keys = false -- Is normally usefull incase of diacritic. Not recommended for vi users.
config.treat_left_ctrlalt_as_altgr = true -- Windows treat ctrl+alt as altgr -- Test in different conditions.
config.warn_about_missing_glyphs = false
-- Check for further options https://wezfurlong.org/wezterm/config/lua/config/visual_bell.html
-- config.visual_bell = {
-- 		fade_in_function = "EaseIn",
-- 		fade_in_duration_ms = 150,
-- 		fade_out_function = "EaseOut",
-- 		fade_out_duration_ms = 150,
-- 	}
	
-- Cursor Settings
config.default_cursor_style = 'SteadyUnderline' -- Acceptable values are SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, and BlinkingBar
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.cursor_blink_rate = 0
config.animation_fps = 1 -- Controls the maximum frame rate used when rendering easing effects for blinking cursors, blinking text and visual bell.
-- config.visual_bell = {
--   fade_in_duration_ms = 75,
--   fade_out_duration_ms = 75,
--   target = 'CursorColor',
-- }

-- config.color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors/" }
config.hide_tab_bar_if_only_one_tab = false -- When there is only a single tab, the tab bar is hidden from the display
config.adjust_window_size_when_changing_font_size = false -- The default value is now nil
config.selection_word_boundary = " \t\n{}[]()\"'`,;:│=&!%" -- What is selected when doing a word selection with the mouse.
config.window_padding = { -- Controls the amount of padding between the window border and the terminal cells.
    left = 0,
    right = 0,
    top = 0,
    bottom = 0
}
config.use_fancy_tab_bar = false -- When true, the tab bar is rendered in a native style with proportional fonts.
config.exit_behavior = "CloseOnCleanExit" -- if the shell program exited with a successful status, close the pane else keep it open.
config.tab_bar_at_bottom = false -- When true, the tab bar will be rendered at the bottom of the window.
config.window_close_confirmation = "AlwaysPrompt" -- Set this to "NeverPrompt" if you don't like confirming closing windows every time.
-- config.enable_csi_u_key_encoding = true -- Not recommended to enable this option as it does change the behavior of some keys in backwards incompatible ways
config.allow_win32_input_mode = true -- Not recommended to enable this option as it does change the behavior of some keys in backwards incompatible ways

-- config.front_end = "WebGpu" -- Other options are CPU based "Software", GPU based "OpenGL".
-- config.front_end = "Software" -- Other options are CPU based "Software", GPU based "OpenGL".
config.front_end = "OpenGL" -- Other options are CPU based "Software", GPU based "OpenGL".
config.webgpu_preferred_adapter = gpus[1] -- Specifies which WebGpu adapter should be used. Only applicable when you have configured front_end = "WebGpu"
config.max_fps = 60 -- Limits the maximum number of frames per second that wezterm will attempt to draw.
config.enable_wayland = enable_wayland() -- This option is only considered on X11/Wayland systems and has no effect on macOS or Windows.
-- https://github.com/wez/wezterm/issues/1772
-- config.enable_wayland = true

-- This is code block is creating issues in loading of the wezterm
-- for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
--   if gpu.backend == "Vulkan" and gpu.device_type == "IntegratedGpu" then
--     config.webgpu_preferred_adapter = gpu
--     config.front_end = "WebGpu"
--     break
--   end
-- end

config.native_macos_fullscreen_mode = true -- Remove the title bar from the top
config.debug_key_events = true -- Is used for debugging the key events produced by the keys

-- Defines rules to match text from the terminal output and generate clickable links.
config.hyperlink_rules = { -- Matches: a URL in parens: (URL)
{
    regex = '\\((\\w+://\\S+)\\)',
    format = '$1',
    highlight = 1
}, -- Matches: a URL in brackets: [URL]
{
    regex = '\\[(\\w+://\\S+)\\]',
    format = '$1',
    highlight = 1
}, -- Matches: a URL in curly braces: {URL}
{
    regex = '\\{(\\w+://\\S+)\\}',
    format = '$1',
    highlight = 1
}, -- Matches: a URL in angle brackets: <URL>
{
    regex = '<(\\w+://\\S+)>',
    format = '$1',
    highlight = 1
}, -- Then handle URLs not wrapped in brackets
{
    -- Before
    -- regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
    -- format = '$0',
    -- After
    regex = '[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)',
    format = '$1',
    highlight = 1
}, -- implicit mailto link
{
    regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
    format = 'mailto:$0'
}}
table.insert(config.hyperlink_rules, {
    regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
    format = "https://github.com/$1/$3"
})

-- Returns the WSL with wsl -l -v
local wsl_domains = wezterm.default_wsl_domains()

for idx, dom in ipairs(wsl_domains) do
    if dom.name == 'WSL:Ubuntu' then
        dom.default_prog = {'bash'}
        dom.default_cwd = "~"
    end
end

config.wsl_domains = wsl_domains
config.default_domain = 'WSL:Ubuntu'

--- Set Pwsh as the default on Windows
config.default_prog = {'pwsh.exe', '-NoLogo'}

table.insert(launch_menu, {
    label = 'PowerShell',
    args = {'powershell.exe', '-NoLogo'}
})
table.insert(launch_menu, {
    label = 'Pwsh',
    args = {'pwsh.exe', '-NoLogo'}
})

---------------------------------------------------------------
--- keybinds
---------------------------------------------------------------
config.leader = { -- leader key is a a modal modifier key. Just like vi/Vim/Nvim.
    key = "Space",
    mods = "CTRL|SHIFT"
}

tmux_keybinds = {
  -- Idea is to use ALT key with wezterm and CTRL+ALT in TMUX but some exceptions are there.
	{ key = "j", mods = "ALT", action = act({ SpawnTab = "CurrentPaneDomain" }) }, -- Alternative is ALT+t
	{ key = "k", mods = "ALT", action = act({ CloseCurrentTab = { confirm = true } }) }, -- k for kill
	{ key = "h", mods = "ALT", action = act({ ActivateTabRelative = -1 }) },
	{ key = "l", mods = "ALT", action = act({ ActivateTabRelative = 1 }) },
	{ key = "LeftArrow", mods = "ALT", action = act({ ActivateTabRelative = -1 }) },
	{ key = "RightArrow", mods = "ALT", action = act({ ActivateTabRelative = 1 }) },
	-- { key = "h", mods = "ALT|CTRL", action = act({ MoveTabRelative = -1 }) },
	-- { key = "l", mods = "ALT|CTRL", action = act({ MoveTabRelative = 1 }) },
	--{ key = "k", mods = "ALT|CTRL", action = act.ActivateCopyMode },
	{ key = "k", mods = "ALT|CTRL", action = act.Multiple({ act.CopyMode("ClearSelectionMode"), act.ActivateCopyMode, act.ClearSelection }) },
	{ key = "j", mods = "ALT|CTRL", action = act({ PasteFrom = "PrimarySelection" }) },
	{ key = "1", mods = "ALT", action = act({ ActivateTab = 0 }) },
	{ key = "2", mods = "ALT", action = act({ ActivateTab = 1 }) },
	{ key = "3", mods = "ALT", action = act({ ActivateTab = 2 }) },
	{ key = "4", mods = "ALT", action = act({ ActivateTab = 3 }) },
	{ key = "5", mods = "ALT", action = act({ ActivateTab = 4 }) },
	{ key = "6", mods = "ALT", action = act({ ActivateTab = 5 }) },
	{ key = "7", mods = "ALT", action = act({ ActivateTab = 6 }) },
	{ key = "8", mods = "ALT", action = act({ ActivateTab = 7 }) },
	{ key = "9", mods = "ALT", action = act({ ActivateTab = 8 }) },
	{ key = "-", mods = "ALT", action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
	{ key = "\\", mods = "ALT", action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
	{ key = "h", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Left" }) },
	{ key = "l", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Right" }) },
	{ key = "k", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Up" }) },
	{ key = "j", mods = "ALT|SHIFT", action = act({ ActivatePaneDirection = "Down" }) },
	{ key = "h", mods = "ALT|SHIFT|CTRL", action = act({ AdjustPaneSize = { "Left", 1 } }) },
	{ key = "l", mods = "ALT|SHIFT|CTRL", action = act({ AdjustPaneSize = { "Right", 1 } }) },
	{ key = "k", mods = "ALT|SHIFT|CTRL", action = act({ AdjustPaneSize = { "Up", 1 } }) },
	{ key = "j", mods = "ALT|SHIFT|CTRL", action = act({ AdjustPaneSize = { "Down", 1 } }) },
	{ key = "Enter", mods = "ALT", action = "QuickSelect" },
	{ key = "/", mods = "ALT", action = act.Search("CurrentSelectionOrEmptyString") },
	{ key = "m", mods = "ALT", action = act.ToggleFullScreen },
}

default_keybinds = {
	{ key = "c", mods = "CTRL|SHIFT", action = act({ CopyTo = "Clipboard" }) },
	{ key = "v", mods = "CTRL|SHIFT", action = act({ PasteFrom = "Clipboard" }) },
	{ key = "Insert", mods = "SHIFT", action = act({ PasteFrom = "PrimarySelection" }) },
  	{ key = 't', mods = 'ALT', action = act.SpawnTab 'CurrentPaneDomain' }, -- CTRL+t is set for fzf
  	{ key = 'P', mods = 'CTRL|SHIFT', action = act.ActivateCommandPalette},
	{ key = "=", mods = "CTRL", action = "ResetFontSize" },
	{ key = "+", mods = "CTRL|SHIFT", action = "IncreaseFontSize" },
	{ key = "-", mods = "CTRL", action = "DecreaseFontSize" },
	{ key = "PageUp", mods = "ALT", action = act({ ScrollByPage = -1 }) },
	{ key = "PageDown", mods = "ALT", action = act({ ScrollByPage = 1 }) },
	{ key = "b", mods = "ALT", action = act({ ScrollByPage = -1 }) },
	{ key = "f", mods = "ALT", action = act({ ScrollByPage = 1 }) },
	{ key = "z", mods = "ALT", action = "ReloadConfiguration" },
	{ key = "z", mods = "ALT|SHIFT", action = act({ EmitEvent = "toggle-tmux-keybinds" }) },
	{ key = "e", mods = "ALT", action = act({ EmitEvent = "trigger-nvim-with-scrollback" }) },
	{ key = "q", mods = "ALT", action = act({ CloseCurrentPane = { confirm = true } }) },
	{ key = "x", mods = "ALT", action = act({ CloseCurrentPane = { confirm = true } }) },
	{ key = "a", mods = "ALT", action = wezterm.action.ShowLauncher },
	{ key = "Space", mods = "ALT", action = wezterm.action.ShowTabNavigator },
	{ key = "d", mods = "ALT|SHIFT", action = wezterm.action.ShowDebugOverlay },
	{ key = "r", mods = "ALT", action = act({ ActivateKeyTable = { name = "resize_pane", one_shot = false, timeout_milliseconds = 3000, replace_current = false,},}),},
	{ key = "s", mods = "ALT", action = act.PaneSelect({alphabet = "1234567890"}) },
	{ key = "`", mods = "ALT", action = act.RotatePanes("CounterClockwise") },
	{ key = "`", mods = "ALT|SHIFT", action = act.RotatePanes("Clockwise") },
	{ key = "E", mods = "ALT|SHIFT", action = act.PromptInputLine({
			description = "Enter new name for tab",
			-- selene: allow(unused_variable)
			---@diagnostic disable-next-line: unused-local
			action = wezterm.action_callback(function(window, pane, line)
				-- line will be `nil` if they hit escape without entering anything
				-- An empty string if they just hit enter
				-- Or the actual line of text they wrote
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

key_bindings = {
-- bashrc has the kill-backward commands now which covers us in most terminals. Should not be made specific to
-- wezterm. The shortcuts are here incase needed in future.
-- { key = 'Backspace', mods = 'CTRL', action = act.SendKey {key = 'Backspace', mods = 'ALT'} } -- most Linux shells use Alt + backspace instead for word backspace
-- { key = 'Backspace', mods = 'CTRL', action = act.SendKey {key = 'w', mods = 'CTRL'} } -- most Linux shells use Alt + backspace instead for word backspace
}

function create_keybinds()
  local merged_table
	merged_table = merge_lists(default_keybinds, tmux_keybinds)
	merged_table = merge_lists(merged_table, key_bindings)
  return merged_table
end

key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "h", action = act({ AdjustPaneSize = { "Left", 1 } }) },
		{ key = "RightArrow", action = act({ AdjustPaneSize = { "Right", 1 } }) },
		{ key = "l", action = act({ AdjustPaneSize = { "Right", 1 } }) },
		{ key = "UpArrow", action = act({ AdjustPaneSize = { "Up", 1 } }) },
		{ key = "k", action = act({ AdjustPaneSize = { "Up", 1 } }) },
		{ key = "DownArrow", action = act({ AdjustPaneSize = { "Down", 1 } }) },
		{ key = "j", action = act({ AdjustPaneSize = { "Down", 1 } }) },
		-- Cancel the mode by pressing escape
		{ key = "Escape", action = "PopKeyTable" },
	},
	copy_mode = {
		{ key = "Escape", mods = "NONE", action = act.Multiple({
				act.ClearSelection,
				act.CopyMode("ClearPattern"),
				act.CopyMode("Close"),
			}),},
		{ key = "q", mods = "NONE", action = act.CopyMode("Close") },
		-- move cursor
		{ key = "h", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "LeftArrow", mods = "NONE", action = act.CopyMode("MoveLeft") },
		{ key = "j", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "DownArrow", mods = "NONE", action = act.CopyMode("MoveDown") },
		{ key = "k", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "UpArrow", mods = "NONE", action = act.CopyMode("MoveUp") },
		{ key = "l", mods = "NONE", action = act.CopyMode("MoveRight") },
		{ key = "RightArrow", mods = "NONE", action = act.CopyMode("MoveRight") },
		-- move word
		{ key = "RightArrow", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
		{ key = "f", mods = "ALT", action = act.CopyMode("MoveForwardWord") },
		{ key = "\t", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{ key = "w", mods = "NONE", action = act.CopyMode("MoveForwardWord") },
		{ key = "LeftArrow", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "ALT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "\t", mods = "SHIFT", action = act.CopyMode("MoveBackwardWord") },
		{ key = "b", mods = "NONE", action = act.CopyMode("MoveBackwardWord") },
		{ key = "e", mods = "NONE", action = act({ Multiple = {
					act.CopyMode("MoveRight"),
					act.CopyMode("MoveForwardWord"),
					act.CopyMode("MoveLeft"),
				},
			}),
		},
		-- move start/end
		{ key = "0", mods = "NONE", action = act.CopyMode("MoveToStartOfLine") },
		{ key = "\n", mods = "NONE", action = act.CopyMode("MoveToStartOfNextLine") },
		{ key = "$", mods = "SHIFT", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "$", mods = "NONE", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "e", mods = "CTRL", action = act.CopyMode("MoveToEndOfLineContent") },
		{ key = "m", mods = "ALT", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "^", mods = "SHIFT", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "^", mods = "NONE", action = act.CopyMode("MoveToStartOfLineContent") },
		{ key = "a", mods = "CTRL", action = act.CopyMode("MoveToStartOfLineContent") },
		-- select
		{ key = " ", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{ key = "v", mods = "NONE", action = act.CopyMode({ SetSelectionMode = "Cell" }) },
		{
			key = "v",
			mods = "SHIFT",
			action = act({
				Multiple = {
					act.CopyMode("MoveToStartOfLineContent"),
					act.CopyMode({ SetSelectionMode = "Cell" }),
					act.CopyMode("MoveToEndOfLineContent"),
				},
			}),
		},
		-- copy
		{
			key = "y",
			mods = "NONE",
			action = act({
				Multiple = {
					act({ CopyTo = "ClipboardAndPrimarySelection" }),
					act.CopyMode("Close"),
				},
			}),
		},
		{
			key = "y",
			mods = "SHIFT",
			action = act({
				Multiple = {
					act.CopyMode({ SetSelectionMode = "Cell" }),
					act.CopyMode("MoveToEndOfLineContent"),
					act({ CopyTo = "ClipboardAndPrimarySelection" }),
					act.CopyMode("Close"),
				},
			}),
		},
		-- scroll
		{ key = "G", mods = "SHIFT", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "G", mods = "NONE", action = act.CopyMode("MoveToScrollbackBottom") },
		{ key = "g", mods = "NONE", action = act.CopyMode("MoveToScrollbackTop") },
		{ key = "H", mods = "NONE", action = act.CopyMode("MoveToViewportTop") },
		{ key = "H", mods = "SHIFT", action = act.CopyMode("MoveToViewportTop") },
		{ key = "M", mods = "NONE", action = act.CopyMode("MoveToViewportMiddle") },
		{ key = "M", mods = "SHIFT", action = act.CopyMode("MoveToViewportMiddle") },
		{ key = "L", mods = "NONE", action = act.CopyMode("MoveToViewportBottom") },
		{ key = "L", mods = "SHIFT", action = act.CopyMode("MoveToViewportBottom") },
		{ key = "o", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEnd") },
		{ key = "O", mods = "NONE", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
		{ key = "O", mods = "SHIFT", action = act.CopyMode("MoveToSelectionOtherEndHoriz") },
		{ key = "PageUp", mods = "NONE", action = act.CopyMode("PageUp") },
		{ key = "PageDown", mods = "NONE", action = act.CopyMode("PageDown") },
		{ key = "b", mods = "CTRL", action = act.CopyMode("PageUp") },
		{ key = "f", mods = "CTRL", action = act.CopyMode("PageDown") },
		{
			key = "Enter",
			mods = "NONE",
			action = act.CopyMode("ClearSelectionMode"),
		},
		-- search
		{ key = "/", mods = "NONE", action = act.Search("CurrentSelectionOrEmptyString") },
		{
			key = "n",
			mods = "NONE",
			action = act.Multiple({
				act.CopyMode("NextMatch"),
				act.CopyMode("ClearSelectionMode"),
			}),
		},
		{
			key = "N",
			mods = "SHIFT",
			action = act.Multiple({
				act.CopyMode("PriorMatch"),
				act.CopyMode("ClearSelectionMode"),
			}),
		},
	},
	search_mode = {
		{ key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
		{
			key = "Enter",
			mods = "NONE",
			action = act.Multiple({
				act.CopyMode("ClearSelectionMode"),
				act.ActivateCopyMode,
			}),
		},
		{ key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
		{ key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
		{ key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
		{ key = "/", mods = "NONE", action = act.CopyMode("ClearPattern") },
		{ key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
	},
}

---------------------------------------------------------------
--- Mouse bindings
---------------------------------------------------------------
mouse_bindings = {
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "NONE",
		action = act({ CompleteSelection = "PrimarySelection" }),
	},
	{
		event = { Up = { streak = 1, button = "Right" } },
		mods = "NONE",
		action = act({ CompleteSelection = "Clipboard" }),
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = "OpenLinkAtMouseCursor",
	},
}

config.launch_menu = launch_menu
config.mouse_bindings = mouse_bindings
config.keys = create_keybinds()
config.key_tables = key_tables
-- https://github.com/wez/wezterm/issues/2756

-- and finally, return the configuration to wezterm
return config
