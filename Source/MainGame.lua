function MainGameLoad()
  
  require "Source/FallingWalls"
  require "Source/Player"
  require "Source/Rocks"
  
  FallingWallsLoad()
  PlayerLoad()
  fallingSpeed = 120
  RocksLoad()

  timer = 0
end

function MainGameUpdate(dt)
  fallingSpeed = 120 * dt

  timer = timer + dt

  --Update falling walls
  FallingWallsUpdate(dt)
  --Update player
  PlayerUpdate(dt)
  --Update rocks
  RocksUpdate(dt)
  
end

function MainGameDraw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", 0, 0, windowWidth, windowHeight)
  
  PlayerDraw()
  FallingWallsDraw()
  RocksDraw()
end

function MainGameMousePressed(x, y, button)
  
  --run the player touch/click function
  PlayerMousePressed(x, y, button)
  
end

function MainGameMouseReleased(x, y, button)
 
end