function GameUILoad()
  score = 0
  snow = love.graphics.newImage("Sprites/SnowFloor.png") 
  
  slowButton = love.graphics.newImage("Sprites/SlowDownButton.png")
  
  snowPanelX = 0
  snowPanelY = 0 
  
  slowButtonX = 300
  slowButtonY = 860
end

function GameUIUpdate()
  score = math.floor(timer * 10) + rockScore + collectibleScore
end

function GameUIDraw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(snow, snowPanelX, snowPanelY) 
  
  if slowDown == true then
    love.graphics.draw(slowButton, slowButtonX, slowButtonY, 0, 0.4, 0.4)
  end
  
  love.graphics.setColor(0,0,0)
  love.graphics.print("Score: " .. score, 50, windowHeight - 96, 0, 2, 2)
  
  if shield == true then
    love.graphics.print("Shield" , 270, windowHeight - 96, 0, 2, 2)
  end
  
  love.graphics.print("Coins: " .. coins, 50, windowHeight - 48, 0, 2, 2)
  
  love.graphics.setColor(255,255,255)
end


function GameUIMousePressed(x, y, button)
  if mouseRectCollide(x, y, button, slowButtonX, slowButtonY, 40, 40, 1) then
    slowDown = false
    CollectiblePickup(4)
  end
end