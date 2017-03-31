function GameOverLoad()
  yeti = love.graphics.newImage("Sprites/ShopYeti.png")
  gameOverTxt = love.graphics.newImage("Sprites/GameOver.png")
end

function GameOverUpdate(dt)

end

function GameOverDraw()
  love.graphics.draw(wallPic2, 0, 0)
  love.graphics.draw(wallPic3, 480, 0)
  love.graphics.draw(gameOverTxt, 0, 0)
  love.graphics.draw(yeti, windowWidth / 4, windowHeight - 300, 0, 0.5, 0.5) 
  love.graphics.draw(scoreBar, 0, 50) 
  
  love.graphics.print("High score: " .. love.filesystem.read("highscore.txt"), 100, 300)
  
  love.graphics.print("Coins: " .. coins, 350, windowHeight - 50, 0, 2, 2)  love.graphics.setColor(18, 100, 161)  
  love.graphics.setFont(scoreFont)  
  love.graphics.print(score, 15, windowHeight - 70, 0, 2, 2)
end

function GameOverMousePressed(x, y, button)
    if mouseRectCollide(x, y, button, 0, 0, 540, 960, 1) then
      
      MenuLoad()
      gameState = "startScreen"
    end
end