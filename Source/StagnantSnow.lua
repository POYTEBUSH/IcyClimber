function SnowLoad()
  
  snow = love.graphics.newImage("Sprites/SnowFloor.png") 
  
  snowPanelX = 0
  snowPanelY = 0  
end

function SnowUpdate(dt)
end

function SnowDraw()
  
  love.graphics.draw(snow, snowPanelX, snowPanelY) 
end