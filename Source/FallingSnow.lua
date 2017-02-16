function FallingSnowLoad()
  
  snowPic = love.graphics.newImage("Sprites/SnowBackground.png") 
  
  snowX = 0
  snow1Y = -960
  snow2Y = 0  
  
end

function FallingSnowUpdate(dt)

  snow1Y = snow1Y + (250 * dt * speedModifier)
  snow2Y = snow2Y + (250 * dt * speedModifier)
  
  if(snow1Y >= 960)then
    snow1Y = -960
  end
  
  if(snow2Y >= 960)then
    snow2Y = -960
  end
end

function FallingSnowDraw()
  
  love.graphics.draw(snowPic, snowX, snow1Y) 
  love.graphics.draw(snowPic, snowX, snow2Y) 
end