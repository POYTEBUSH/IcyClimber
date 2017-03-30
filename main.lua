function love.load()

  windowWidth = 540
  windowHeight = 960
  
  scoreFont = love.graphics.newFont("Fonts/baveuse.ttf", 25)
  font = love.graphics.newFont("Fonts/baveuse.ttf", 12)

  if love.system.getOS() == "Android" then
    local x, y = love.graphics.getDimensions()
    scaleX = (x/windowWidth)
    scaleY = (y/windowHeight)
  else
    scaleX = 0.7
    scaleY = 0.7
  end
  
  love.window.setMode(windowWidth * scaleX, windowHeight * scaleY)

  require "Source/MainMenu"
  require "Source/MainGame"
  require "Source/CollisionHandler"
  require "Source/Gameover"
  require "Source/FallingSnow"
  require "Source/Shop"
  require "Source/Sounds"

  gameState = "startScreen"
  
  --Makes math.random actually random rather than using the same seed.
  math.randomseed(os.time())  
    
  MenuLoad()
  MainGameLoad()
  MainGameLoad()
  GameOverLoad()
  FallingSnowLoad()
  SoundLoad()
end

function love.draw()

  love.graphics.scale(scaleX,scaleY)
  --reset color every frame
  love.graphics.setColor(255, 255, 255)
  FallingSnowDraw()
  
  if(gameState == "startScreen") then    
    MenuDraw()
    
  elseif(gameState == "game") then    
    MainGameDraw() 
    
  elseif(gameState == "death") then    
    GameOverDraw()
    
  elseif(gameState == "shopping") then  
    ShopDraw()
    
  end
  
end

function love.update(dt)

  UpdateSound(gameState)

  FallingSnowUpdate(dt)
  
  if(gameState == "startScreen") then    
      MenuUpdate(dt)
    
  elseif(gameState == "game") then
    MainGameUpdate(dt)    
    
  elseif(gameState == "death") then    
    GameOverUpdate(dt)
    
  elseif(gameState == "shopping") then    
    ShopUpdate(dt)
    
  end

end

function love.mousepressed(x, y, button)
  x = x/scaleX
  y = y/scaleY
  if gameState == "startScreen" then
    MenuMousePressed(x,y,button)
  elseif gameState == "game" then
    MainGameMousePressed(x, y, button)
  elseif gameState == "death" then
    GameOverMousePressed(x, y, button)
  elseif gameState == "shopping" then
    ShopMousePressed(x, y, button) 
  end
end

function love.touchpressed(id, x,y, dx, dy, pressure)
  x = x * windowWidth
  y = y * windowHeight
  if gameState == "startScreen" then
    MenuMousePressed(x, y, 1)
  elseif gameState == "game" then
    MainGameMousePressed(x, y, 1)
  elseif gameState == "death" then
    GameOverMousePressed(x, y, 1) 
  elseif gameState == "shopping" then
    ShopMousePressed(x, y, button) 
  end
end

function love.touchreleased(id, x,y,dx,dy, pressure)
  x = x * windowWidth
  y = y * windowHeight
  if gameState == "startScreen" then
    
  elseif gameState == "game" then
    MainGameMouseReleased(x, y, 1)
  end
end

function love.mousereleased(x, y, button)
  x = x/scaleX
  y = y/scaleY
  if gameState == "startScreen" then
    
  elseif gameState == "game" then
    MainGameMouseReleased(x, y, button)
  end
end

function love.keypressed(key)
  if key == "escape" then
    gameState = "startScreen"
  end
end