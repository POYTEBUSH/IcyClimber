mouse = {}

function AchievementsLoad()    
  
  backButton = love.graphics.newImage("sprites/BackButton.png")
  
end

function AchievementsUpdate()
  
  mouseX = love.mouse.getX()
  mouseY = love.mouse.getY()
  
end

function AchievementsDraw()
  
  love.graphics.draw(backButton, 25, 25)
  love.graphics.setFont(scoreFont)
  for i,h in ipairs(heights) do
    love.graphics.print(h.name, 25, (i + 5) * 30)
    love.graphics.print(h.h, 400, (i + 5) * 30)
  end
  
  love.graphics.setFont(font)
  
end

function AchievementsMousePressed(x, y, button)  
  
  if mouseRectCollide(x,y,button,25,24,100,100,1) then
    MenuLoad()
    gameState = "startScreen"
  end
  
end

