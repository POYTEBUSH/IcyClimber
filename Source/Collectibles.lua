function CollectiblesLoad()
  
  collectibles = {}
  collectibleImage = love.graphics.newImage("Sprites/Snowball.png")
  powerUpImageList = {}
  for i, file in ipairs(love.filesystem.getDirectoryItems("Sprites/PowerUps")) do
    image = love.graphics.newImage("Sprites/PowerUps/" .. file)
    table.insert(powerUpImageList, image)
  end
  
  collectibleSpawnTime = 5
  amountOfCollectibles = 3
  collectibleScore = 0
  collectibleScale = 0.2
  speedModifier = 1
  coins = 0
  
  --How long the slow down powerup lasts (in seconds)
  speedModifierLength = 10
  
  --Used to end the slow down powerup after the speedModifierLength is up
  speedModifierEnd = 0
  
  shield = false
  slowDown = false

  --Initialises collectibles
  for i=1, amountOfCollectibles do
    table.insert(collectibles, {image = slowDownImage, x = 238, y = -100, size = 256 * collectibleScale, speed = 0, active = false })
  end
  
end

function CollectiblesUpdate(dt)
  
  for i,c in ipairs(collectibles) do
    
    --Moves active collectibles
    if c.active == true then
      c.y = c.y + c.speed
    end
    
    --Resets collectibles when off screen
    if (c.y >= 960) then
      ResetCollectibles()
    end
    
    --Handles collision between collectibles and player
    if BoxCollision(c.x, c.y, c.size, c.size, playerPosX, playerPosY, playerWidth, playerHeight) == true then
      CollectiblePickup(1)
    end
    
    --Handles collision between collectibles and hook
    if BoxCollision(c.x, c.y, c.size, c.size, hookPosX, hookPosY, hookWidth, hookHeight) == true then
      CollectiblePickup(1)
    end
    
  end 
  
  --Adds new collectibles over time
  if timer > collectibleSpawnTime then
    collectibleSpawnTime = collectibleSpawnTime + math.random(10,30)
    ResetCollectibles()
    collectibles[math.random(1,3)].active = true
  end
  
  --Ends the slowdown powerup
  if timer > speedModifierEnd then
    speedModifier = 1
  end
  
end

function CollectiblesDraw()
  --Draws collectibles
  if shield == true then
    love.graphics.draw(powerUpImageList[2], playerPosX + 20, playerPosY - 40, 0.5, 0.5)
  end
  
  
  for i,c in ipairs(collectibles) do
    love.graphics.draw(powerUpImageList[i], c.x, c.y, 0, collectibleScale, collectibleScale)
  end
  
end

--Handles picking up collectibles
function CollectiblePickup(collectibleNum)
  if collectibleNum == 1 then
    slowDown = true
  elseif collectibleNum == 2 then
    shield = true
  elseif collectibleNum == 3 then
    coins = coins + 1
  elseif collectibleNum == 4 then
    speedModifier = 0.5
    speedModifierEnd = timer + speedModifierLength
  end
  collectibleScore = collectibleScore + 25
  ResetCollectibles()
end

--Sets position and speed of rocks
function ResetCollectibles()
  for i, c in ipairs(collectibles) do
    c.x = math.random(90, 360)
    c.y = -400
    c.speed = fallingSpeed * (0.1 * math.random(20, 40))
    c.active = false
  end
end
