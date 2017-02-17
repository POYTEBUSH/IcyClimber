function FallingSnowLoad()
  
  snowPic = love.graphics.newImage("Sprites/SnowBackground.png") 
  snowPicSmall = love.graphics.newImage("Sprites/SnowBackgroundSmall.png")
  blue = love.graphics.newImage("Sprites/Blue.png") 
  
  snowX = 0
  snow1Y = -960
  snow2Y = 0  
  snow1SmallY = -960
  snow2SmallY = 0  
end

function FallingSnowUpdate(dt)

  snow1Y = snow1Y + (200 * dt * speedModifier)
  snow2Y = snow2Y + (200 * dt * speedModifier)
  snow1SmallY = snow1SmallY + (225 * dt * speedModifier)
  snow2SmallY = snow2SmallY + (225 * dt * speedModifier)
  
  if(snow1Y >= 960)then
    snow1Y = -960
  end
  
  if(snow2Y >= 960)then
    snow2Y = -960
  end 
    
  if(snow1SmallY >= 960)then
    snow1SmallY = -960
  end
  
  if(snow2SmallY >= 960)then
    snow2SmallY = -960
  end
end

function FallingSnowDraw()
  
  love.graphics.setBackgroundColor(0,150,255)
  love.graphics.draw(snowPicSmall, snowX, snow1SmallY) 
  love.graphics.draw(snowPicSmall, snowX, snow2SmallY) 
  love.graphics.draw(snowPic, snowX, snow1Y) 
  love.graphics.draw(snowPic, snowX, snow2Y)
  love.graphics.draw(blue, snowX, 0)
end