-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action


-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:


config.font = wezterm.font_with_fallback {
    'Cascadia Code',
    -- 'Fira Code',
    -- 'JetBrainsMono Nerd Font',
    -- 'Iosevka',
    -- 'JuliaMono',
    'codicon',
    '3270Narrow Nerd Font',
}

config.font_size = 20
config.harfbuzz_features = {"zero", "ss01", "ss20"}
-- config.freetype_load_target = "HorizontalLcd"
config.freetype_load_target = 'Light'
config.freetype_render_target = 'HorizontalLcd'


-- config.leai = 1
config.disable_default_key_bindings = true
config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.keys = {
    { key = '-', mods = 'CTRL', action = 'DecreaseFontSize' },
    { key = '=', mods = 'CTRL', action = 'IncreaseFontSize' },
    -- { key = '=', mods = 'CTRL', action = 'ResetFontSize' },
    { key = 'c', mods = 'CTRL|SHIFT', action = act.CopyTo 'ClipboardAndPrimarySelection' },
    { key = 'v', mods = 'CTRL|SHIFT', action = act.PasteFrom 'Clipboard' },
    { key = 'r', mods = 'CTRL|SHIFT', action = act.ReloadConfiguration,
  },
    -- { key = 'f', mods = 'CTRL', action = 'Search={CaseSensitiveString=""}' },
}

-- config.color_scheme = 'Everforest Light (Gogh)'
config.color_scheme = 'wal'

-- and finally, return the configuration to wezterm
return config
