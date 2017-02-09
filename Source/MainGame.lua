function MainGameLoad()
  
  require "Source/FallingWalls"
  require "Source/Player"
  
  FallingWallsLoad()
  PlayerLoad()
  FallingSpeed = 2.0
  
  --Timer for testing only
  timer = 0
end

function MainGameUpdate(dt)

  timer = timer + dt
  if(timer > 45) then
    gameState = "death"
  end

  --Update falling walls
  FallingWallsUpdate(dt)
  --Update player
  PlayerUpdate(dt)
end

function MainGameDraw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 0, 0, windowWidth, windowHeight)
  
  
  PlayerDraw()
  FallingWallsDraw()
end

function MainGameMousePressed(x, y, button)
  
  --run the player touch/click function
  PlayerMousePressed(x, y, button)
  
end

function MainGameMouseReleased(x, y, button)
 
end