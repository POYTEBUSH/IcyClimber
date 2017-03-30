mouse = {}

function SettingsLoad()    
  backButton = love.graphics.newImage("Sprites/BackButton.png")
  
  sound = true
  soundButton = love.graphics.newImage("Sprites/SoundButton.png")   
  noSoundButton = love.graphics.newImage("Sprites/NoSoundButton.png")
  buttonW = 128
  buttonH = 128
end

function SettingsUpdate()
  mouseX = love.mouse.getX()
  mouseY = love.mouse.getY()
end

function SettingsDraw()
  love.graphics.draw(backButton, 25, 25)
  
  if(sound == true) then 
    love.graphics.draw(soundButton, 100, 200, 0, 0.5, 0.5)
  end
  if (sound == false) then
    love.graphics.draw(noSoundButton, 100, 200, 0, 0.5, 0.5) 
  end
  
end

function SettingsMousePressed(x, y, button)  
  
  if mouseRectCollide(x,y,button,100,200,buttonW,buttonH,1) then
    if (sound == false) then
      sound = true
    elseif (sound == true) then
      sound = false
    end
  end
  
  if mouseRectCollide(x,y,button,25,24,100,100,1) then
    MenuLoad()
    gameState = "startScreen"
  end
end

