local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- config

config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

if string.find(wezterm.target_triple, "windows") then
    config.default_prog = { 'powershell.exe' }
end

--Colors & Appearance
config.color_scheme = 'Tokyo Night Storm'
config.use_fancy_tab_bar = false 
config.enable_tab_bar = true
config.show_tab_index_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false 

config.window_padding = {
    left = 10,
    right = 0,
    top = 20,
    bottom = 0,
}

config.inactive_pane_hsb = {
    saturation = 0.9,
    brightness = 0.8,
}

config.window_background_opacity = 0.9
config.text_background_opacity = 0.8

config.font = wezterm.font_with_fallback({
    {
        family = "Consolas",
        scale = 1.24,
        weight = "Medium",
        --italic = true,
        harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
    },
})

-- Key Binding
config.keys = {
    -- Alt + T 新建 Tab
    {
        key = 't',
        mods = 'ALT',
        action = wezterm.action.SpawnTab 'DefaultDomain',
    },
  
    -- Alt + W 关闭当前 Tab 并自动切换到下一个 Tab
    {
        key = 'w',
        mods = 'ALT',
        action = wezterm.action.CloseCurrentTab { confirm = false },
    },
      -- Alt + H / Alt + L 切换 Tab
    {
        key = 'h',
        mods = 'ALT',
        action = wezterm.action.ActivateTabRelative(-1),
    },
    {
        key = 'l',
        mods = 'ALT',
        action = wezterm.action.ActivateTabRelative(1),
    },
  
      -- Alt + D 水平拆分 Pane
    {
        key = 'd',
        mods = 'ALT',
        action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
    },
  
      -- Alt + E 垂直拆分 Pane
    {
        key = 'e',
        mods = 'ALT',
        action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
    },
  
      -- Alt + Q 关闭当前 Pane
    {
        key = 'q',
        mods = 'ALT',
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
  
      -- Alt + Ctrl + H/L/K/J 移动 Pane
    {
        key = 'h',
        mods = 'ALT|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'l',
        mods = 'ALT|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
        key = 'k',
        mods = 'ALT|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'j',
        mods = 'ALT|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
        -- Alt + Enter 切换全屏
    -- {
    --   key = 'Enter',
    --   mods = 'ALT',
    --   action = wezterm.action.ToggleFullScreen,
    -- },
}

for i = 0, 8 do
    -- leader + number to activate that tab
    table.insert(config.keys, {
        key = tostring(i + 1),
        mods = "ALT",
        action = wezterm.action.ActivateTab(i),
    })
end

config.mouse_bindings = {
    -- 1. 复制选择的文本（没有按任何修饰键）
    {
      event = { Up = { button = 'Left', streak = 1 } },  -- 鼠标左键释放，连续点击1次
      mods = 'NONE',  -- 没有修饰键
      action = wezterm.action.CompleteSelection 'ClipboardAndPrimarySelection',  -- 复制到剪贴板
    },
    -- 2. 在按下 Ctrl 键时，点击链接打开链接
    {
      event = { Up = { button = 'Left', streak = 1 } },  -- 鼠标左键释放，连续点击1次
      mods = 'CTRL',  -- 按住 Ctrl 键
      action = wezterm.action.OpenLinkAtMouseCursor,  -- 在鼠标光标处打开链接
    },
}
  
-- event : format-tab-title

wezterm.on('format-tab-title', function (tab, _, _, _, _)
    local is_zoomed = ''
    if tab.active_pane.is_zoomed then
        is_zoomed = 'z'
    end

    return {
        { Text = ' ' .. tab.tab_index + 1 .. is_zoomed .. ' ' },
    }
end)

return config