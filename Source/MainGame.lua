function MainGameLoad()
  
  require "Source/FallingWalls"
  require "Source/Player"
  require "Source/Rocks"
  require "Source/GameUI"
  require "Source/Collectibles"
  
  FallingWallsLoad()
  PlayerLoad()
  fallingSpeed = 120
  RocksLoad()
  GameUILoad()
  CollectiblesLoad()

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
  --Update game UI
  GameUIUpdate(dt)
  --Update collectibles
  CollectiblesUpdate()
end

function MainGameDraw()
  love.graphics.setColor(255, 255, 255)
  
  PlayerDraw()
  RocksDraw()
  CollectiblesDraw()
  FallingWallsDraw()
  GameUIDraw()
  
end

function MainGameMousePressed(x, y, button)
  
  --run the player touch/click function
  PlayerMousePressed(x, y, button)
  GameUIMousePressed(x, y, button)
end

function MainGameMouseReleased(x, y, button)
 
end