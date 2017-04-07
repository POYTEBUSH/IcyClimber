function GameOverLoad()
  backButton = love.graphics.newImage("Sprites/BackButton.png")
  gameOverBack = love.graphics.newImage("Sprites/AchievementBackground.png")
  
  goYeti = love.graphics.newImage("Sprites/DeadYeti.png")
  --gameOverTxt = love.graphics.newImage("Sprites/GameOver.png")
end

function GameOverUpdate(dt)

end

function GameOverDraw()
  
  love.graphics.draw(goYeti, 165, 30, 0, 0.4, 0.4)
  love.graphics.draw(backButton, 25, 25)
  love.graphics.draw(gameOverBack, 5, 160)
  
  love.graphics.setFont(gameOverFont)

  love.graphics.print("Game Over", (windowWidth / 2) - 125, 200)
  
  love.graphics.print("Score: ", (windowWidth / 2) - 75, 300)
  love.graphics.print(score, (windowWidth / 2) - 30, 350)
  
  love.graphics.print("Coins: ", (windowWidth / 2) - 70, 450)
  love.graphics.print(coins, (windowWidth / 2) - 30, 500)
  
  love.graphics.print("Height: ", (windowWidth / 2) - 75, 600)
  love.graphics.print(currentHeight, (windowWidth / 2) - 30, 650)
  
  love.graphics.print("Best Achievement: ", (windowWidth / 2) - 225, 750)
  love.graphics.print(0, (windowWidth / 2) - 30, 800)
  
  love.graphics.setFont(font)  
  
  --love.graphics.draw(wallPic2, 0, 0)
  --love.graphics.draw(wallPic3, 480, 0)
  --love.graphics.draw(gameOverTxt, 0, 0)
  --love.graphics.draw(yeti, windowWidth / 4, windowHeight - 300, 0, 0.5, 0.5) 
  --love.graphics.draw(scoreBar, 0, 50) 
  --
  --love.graphics.print("Coins: " .. coins, 350, windowHeight - 50, 0, 2, 2)  love.graphics.setColor(18, 100, 161)  
  --love.graphics.setFont(scoreFont)  
  --love.graphics.print(score, 15, windowHeight - 70, 0, 2, 2)
end

function GameOverMousePressed(x, y, button)
  if mouseRectCollide(x,y,button,25,24,100,100,1) then
    MenuLoad()
    gameState = "startScreen"
  end
  
    --if mouseRectCollide(x, y, button, 0, 0, 540, 960, 1) then
    --  MenuLoad()
    --  gameState = "startScreen"
    --end
end