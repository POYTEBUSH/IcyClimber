function GameUILoad()
  score = 0
  scoreBar = love.graphics.newImage("Sprites/ScoreBar.png") 
  
  slowButton = love.graphics.newImage("Sprites/SlowDownButton.png")
  slowButtonNoHand = love.graphics.newImage("Sprites/SlowDownButtonNoHand.png")
  clockHand = love.graphics.newImage("Sprites/clockHand.png")
  
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
  love.graphics.draw(scoreBar, snowPanelX, snowPanelY) 
  
  if slowDown == true then
    love.graphics.draw(slowButton, slowButtonX, slowButtonY, 0, 0.4, 0.4)
  end
  
  if speedModifier == 0.5 then
    love.graphics.draw(slowButtonNoHand, slowButtonX, slowButtonY, 0, 0.4, 0.4)
    love.graphics.draw(clockHand, slowButtonX + 40, slowButtonY + 40, (timer - speedModifierEnd + 40.2) / 1.6, 0.4, 0.4, 100, 100)    
  end  
  
  love.graphics.setFont(scoreFont)
  
  love.graphics.print(score, 15, windowHeight - 70, 0, 2, 2)
    
  love.graphics.setFont(font)
  
  if shield == true then
    love.graphics.print("Shield" , 270, windowHeight - 100, 0, 2, 2)
  end
  
  love.graphics.print("Coins: " .. coins, 100, windowHeight - 50, 0, 2, 2)
  
end

function GameUIMousePressed(x, y, button)
  if slowDown == true then
    if mouseRectCollide(x, y, button, slowButtonX, slowButtonY, 80, 80, 1) then
      slowDown = false
      CollectiblePickup(4)
    end
  end
end