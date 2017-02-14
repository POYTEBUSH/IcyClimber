function love.conf(c)
  c.title = "Icy Climber"
  local window = c.screen or c.window -- love 0.9 renamed "screen" to "window"
  window.width = 540
  window.height = 1920/2
  c.window.resizable = true
  c.window.highdpi = true
  c.externalstorage = true
  
end
