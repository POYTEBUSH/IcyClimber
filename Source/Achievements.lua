mouse = {}

function AchievementsLoad()    
  
  backButton = love.graphics.newImage("Sprites/BackButton.png")
  achievementBack = love.graphics.newImage("Sprites/AchievementBackground.png")
end

function AchievementsUpdate()
  
  mouseX = love.mouse.getX()
  mouseY = love.mouse.getY()
  
end

function AchievementsDraw()
  
  love.graphics.draw(backButton, 25, 25)
  
  love.graphics.draw(achievementBack, 5, 160)
  
  love.graphics.setFont(scoreFont)
  for i,h in ipairs(heights) do
    love.graphics.setColor(230,230,230)
    love.graphics.print(h.name, 30, (i + 5) * 30)
    love.graphics.print(h.h, 395, (i + 5) * 30)
  end
  love.graphics.rectangle("fill", 380, 180, 5, 475)
  
    love.graphics.setColor(255,255,255)

  
  love.graphics.setFont(font)
  
end

function AchievementsMousePressed(x, y, button)  
  
  if mouseRectCollide(x,y,button,25,24,100,100,1) then
    MenuLoad()
    gameState = "startScreen"
  end
  
end

