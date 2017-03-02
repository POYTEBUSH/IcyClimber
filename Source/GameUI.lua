function GameUILoad()
  score = 0
  snow = love.graphics.newImage("Sprites/SnowFloor.png") 
  
  snowPanelX = 0
  snowPanelY = 0 
end

function GameUIUpdate()
  score = math.floor(timer * 10) + rockScore + collectibleScore
end

function GameUIDraw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(snow, snowPanelX, snowPanelY) 
  love.graphics.setColor(0,0,0)
  love.graphics.print("Score: " .. score, 50, windowHeight - 96, 0, 2, 2)
  
  if shield == true then
    love.graphics.print("Shield" , 270, windowHeight - 96, 0, 2, 2)
  elseif slow == true then
    love.graphics.print("Slow Motion" , 270, windowHeight - 96, 0, 2, 2)
  end
  
  love.graphics.print("Coins: " .. coins, 50, windowHeight - 48, 0, 2, 2)
  
  love.graphics.setColor(255,255,255)
end