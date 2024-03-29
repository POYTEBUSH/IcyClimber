function MenuLoad()
  playButton = love.graphics.newImage("Sprites/PlayButton.png") 
  shopButton = love.graphics.newImage("Sprites/ShopButton.png") 
  achievementsButton = love.graphics.newImage("Sprites/AchievementsButton.png") 
  optionsButton = love.graphics.newImage("Sprites/OptionsButton.png") 
  title = love.graphics.newImage("Sprites/Title.png") 
  yeti = love.graphics.newImage("Sprites/ShopYeti.png")
  
  playButtonX = 95
  playButtonY = 700
  playButtonW = 375
  playButtonH = 100
  
  squareButtonW = 100
  squareButtonH = 100
  
  require "Source/CollisionHandler"
  
end

function MenuUpdate(dt)

end

function MenuDraw()
  love.graphics.draw(title, 70, 75, 0, 1, 1) 
  love.graphics.draw(yeti, 15, 275, 0, 1, 1) 
  love.graphics.draw(playButton, playButtonX, playButtonY)
  love.graphics.draw(shopButton, playButtonX, playButtonY + 125)
  love.graphics.draw(achievementsButton, playButtonX + 137.5, playButtonY + 125)
  love.graphics.draw(optionsButton, playButtonX + 275, playButtonY + 125)
end

function MenuMousePressed(x, y, button)
  
  if mouseRectCollide(x,y,button,playButtonX,playButtonY,playButtonW,playButtonH,1) then
    MainGameLoad()
    gameState = "game"
  end
  
  if mouseRectCollide(x,y,button,playButtonX,playButtonY + 125,squareButtonW,squareButtonH,1) then
    gameState = "shopping"
  end
  
  if mouseRectCollide(x,y,button,playButtonX + 275, playButtonY + 125,squareButtonW,squareButtonH,1) then
    gameState = "settings"
  end
  
  if mouseRectCollide(x,y,button,playButtonX + 137.5, playButtonY + 125,squareButtonW,squareButtonH,1) then
    gameState = "achievements"
  end
  
  
end

function MenukeyPressed(key)
  
end