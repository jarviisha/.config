local wezterm = require("wezterm")
local colors = require("colors.custom")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.initial_rows = 25
config.initial_cols = 130

-- Dùng powershell làm thiết bị đầu vào
config.default_prog = { "powershell.exe" }

-- config.mux_enable_ssh_agent = false

config.colors = colors

-- config.background = {
-- 	{
-- 		source = { File = wezterm.config_dir .. "/wallpaper/w2.jpg" },
-- 		hsb = { brightness = 0.1 },
-- 		horizontal_align = "Center",
-- 		opacity = 0.9,
-- 	},
-- }

config.window_background_opacity = 0.85

-- config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("CaskaydiaMono Nerd Font")

config.window_padding = {
	left = 6,
	right = 6,
	top = 16,
	bottom = 0,
}

config.font_size = 13
config.line_height = 1.2
config.cell_width = 1

config.freetype_load_target = "Normal" -- Điều chỉnh cách hiển thị font
config.freetype_render_target = "HorizontalLcd" -- Tăng độ nét chữ
config.freetype_interpreter_version = 40 -- Phiên bản interpreter giúp tối ưu hiển thị
config.harfbuzz_features = { "calt=0", "clig=0", "liga=0" } -- Tắt ligatures nếu thấy mờ

wezterm.on("toggle-tabbar", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.enable_tab_bar == false then
		wezterm.log_info("tab bar shown")
		overrides.enable_tab_bar = true
	else
		wezterm.log_info("tab bar hidden")
		overrides.enable_tab_bar = false
	end
	window:set_config_overrides(overrides)
end)

-- ##Key maps config:
-- Set leader key
config.leader = { key = "q", mods = "ALT", timeout_milliseconds = 2000 }
config.keys = {
	-- Mở một pane mới
	{
		mods = "LEADER",
		key = "t",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		key = "m",
		mods = "LEADER",
		action = wezterm.action.EmitEvent("toggle-tabbar"),
	},
	-- Đóng pane đang dùng
	{
		mods = "LEADER",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
	-- Chuyển sang pane bên trái
	{
		mods = "LEADER",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	-- Chuyển sang pane bên trái
	{
		mods = "LEADER",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "LEADER",
		key = "f",
		action = wezterm.action.ToggleFullScreen,
	},
	-- Thay đổi kích thước panel
	{
		mods = "CTRL|SHIFT",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 1 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 1 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 1 }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 1 }),
	},
}

-- Chọn một pane theo thứ tự từ 0 -> 9
for i = 0, 9 do
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end
-- ##

-- ##Tabbar config
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = true
config.tab_max_width = 50
-- ##

-- ##Status config
wezterm.on("update-right-status", function(window, _)
	local SOLID_LEFT_ARROW = ""
	local ARROW_FOREGROUND = { Foreground = { Color = "#c6a0f6" } }
	local prefix = ""

	-- prefix = " " .. utf8.char(0x1f30a)
	prefix = " 🌊🌊 .::.: "
	-- SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	-- end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end

	window:set_left_status(wezterm.format({
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

wezterm.on("update-right-status", function(window, _)
	local prefix = "🌟🌟 /:: @DevIsLife   "

	if window:leader_is_active() then
		prefix = "🌟🌟 /:: @CMD   "
	end

	-- Đặt chuỗi trạng thái cho thanh bên phải
	window:set_right_status(wezterm.format({
		-- { Background = { Color = "#b7bdf8" } },
		{ Text = prefix }, -- Hiển thị biểu tượng pin, trạng thái và thời gian
	}))
end)

return config
