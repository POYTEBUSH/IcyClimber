function MenuLoad()
  playButton = love.graphics.newImage("Sprites/PlayButton.png") 
  achievementsButton = love.graphics.newImage("Sprites/AchievementsButton.png") 
  optionsButton = love.graphics.newImage("Sprites/OptionsButton.png") 
  playButtonX = 120
  playButtonY = 300
  playButtonW = 300
  playButtonH = 100
  
  require "Source/CollisionHandler"
  
end

function MenuUpdate(dt)

end

function MenuDraw()
  
  love.graphics.draw(playButton, playButtonX, playButtonY)
  love.graphics.draw(achievementsButton, playButtonX, playButtonY + 150)
  love.graphics.draw(optionsButton, playButtonX, playButtonY + 300)
end

function MenuMousePressed(x, y, button)
  
  if mouseRectCollide(x,y,button,playButtonX,playButtonY,playButtonW,playButtonH,1) then
    MainGameLoad()
    gameState = "game"
  end

end

function MenukeyPressed(key)
  
end