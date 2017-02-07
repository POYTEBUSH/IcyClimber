function GameOverLoad()
  
end

function GameOverUpdate(dt)

end

function GameOverDraw()
  --All this code is testing
  love.graphics.circle("fill", 270, 500, 200)
  
  love.graphics.setColor(0, 0, 255)
  love.graphics.circle("fill", 170, 350, 50)
  love.graphics.circle("fill", 370, 350, 50)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.circle("fill", 170, 375, 15)
  love.graphics.circle("fill", 370, 375, 15)
  
  love.graphics.circle("fill", 270, 550, 100)
  
  love.graphics.setColor(255, 255, 255)
  love.graphics.circle("fill", 270, 540, 100)
end

function GameOverMousePressed(x, y, button)
    if mouseRectCollide(x, y, button, 0, 0, 540, 960, 1) then
      
      MenuLoad()
      gameState = "startScreen"
      
    end
end