local wezterm = require("wezterm")
local colors = require("colors.custom")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Dùng powershell làm thiết bị đầu vào
config.default_prog = { "powershell.exe" }

config.mux_enable_ssh_agent = false

config.colors = colors

config.background = {
	{
		source = { File = "E:/wezterm/3.jpg" },
		hsb = { brightness = 0.05 },
		horizontal_align = "Center",
		-- opacity = 0.8,
	},
}

-- config.color_scheme = "Catppuccin Macchiato"
config.font = wezterm.font("CaskaydiaCove Nerd Font")

config.window_padding = {
	left = 6,
	right = 6,
	top = 16,
	-- bottom = 7,
}

config.font_size = 14
config.line_height = 1.1
config.cell_width = 1

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
	prefix = " ⚡⚡ .::.: "
	-- SOLID_LEFT_ARROW = utf8.char(0xe0b2)
	-- end

	if window:active_tab():tab_id() ~= 0 then
		ARROW_FOREGROUND = { Foreground = { Color = "#1e2030" } }
	end

	window:set_left_status(wezterm.format({
		-- { Background = { Color = "#b7bdf8" } },
		-- { Background = { Color = "#FFFFFF" } },
		{ Text = prefix },
		ARROW_FOREGROUND,
		{ Text = SOLID_LEFT_ARROW },
	}))
end)

wezterm.on("update-right-status", function(window, _)
	-- Lấy thời gian hiện tại
	-- local date = wezterm.strftime("%Y-%m-%d %H:%M:%S")
	--
	-- -- Hiển thị thông tin trạng thái pin (nếu có)
	-- local battery = ""
	-- for _, b in ipairs(wezterm.battery_info()) do
	-- 	battery = string.format(" %.0f%%", b.state_of_charge * 100)
	-- end

	local prefix = "~~~ @@@@   "

	if window:leader_is_active() then
		prefix = "💪💪 @@@@   "
	end

	-- Đặt chuỗi trạng thái cho thanh bên phải
	window:set_right_status(wezterm.format({
		-- { Background = { Color = "#b7bdf8" } },
		{ Text = prefix }, -- Hiển thị biểu tượng pin, trạng thái và thời gian
	}))
end)

return config
