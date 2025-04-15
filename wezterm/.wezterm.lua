local wezterm = require('wezterm')
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.initial_cols = 140
config.initial_rows = 40

config.font =   wezterm.font('JetBrains Mono', {
  weight = 'Bold',
})
config.color_scheme = "Monokai (terminal.sexy)"
config.colors ={
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
      File = '/Users/melvinbrem/.dotfiles/assets/LM_G.png',
    },
    height = 'Contain',
    horizontal_align = 'Center',
    vertical_align = 'Middle',
    width = 'Contain',
    repeat_x = 'NoRepeat',
    repeat_y = 'NoRepeat',
    opacity = 0.2,
  }
}

return config, font