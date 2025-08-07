local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.initial_cols = 140
config.initial_rows = 40

config.font = wezterm.font('JetBrains Mono', {
  weight = 'Bold',
})
config.line_height = 1.1
-- https://github.com/stayradiated/terminal.sexy
config.color_scheme = "Monokai (terminal.sexy)"
config.colors ={
  foreground = "#8FC029",
  background = '#121212',
}
config.background = {
  {
    source = {
      Color = '#121212',
    },
    width = '100%',
    height = '100%',
    horizontal_align = 'Center',
    vertical_align = 'Middle',
  },
  {
    source = {
      File = '/Users/melvinbrem/.dotfiles/assets/LM_NG.png',
    },
    height = 'Contain',
    horizontal_align = 'Center',
    vertical_align = 'Middle',
    width = 'Contain',
    repeat_x = 'NoRepeat',
    repeat_y = 'NoRepeat',
    opacity = 0.1,
  }
}

return config, font