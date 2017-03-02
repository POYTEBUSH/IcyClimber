function CollectiblesLoad()
  
  collectibles = {}
  collectibleImage = love.graphics.newImage("Sprites/Snowball.png")
  collectibleSpawnTime = 5
  amountOfCollectibles = 3
  collectibleScore = 0
  collectibleScale = 0.25
  speedModifier = 1
  coins = 0
  
  --How long the slow down powerup lasts (in seconds)
  speedModifierLength = 5
  
  --Used to end the slow down powerup after the speedModifierLength is up
  speedModifierEnd = 0
  
  shield = false
  slow = false

  --Initialises collectibles
  for i=1, amountOfCollectibles do
    table.insert(collectibles, {image = collectibleImage, x = 238, y = -100, size = 256 * collectibleScale, speed = 0, active = false, typec = i })
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
      ResetCollectiblePos(i)
    end
    
    --Handles collision between collectibles and player
    if BoxCollision(c.x, c.y, c.size, c.size, playerPosX, playerPosY, playerWidth, playerHeight) == true then
      CollectiblePickup(i)
    end
    
    --Handles collision between collectibles and hook
    if BoxCollision(c.x, c.y, c.size, c.size, hookPosX, hookPosY, hookWidth, hookHeight) == true then
      CollectiblePickup(i)
    end
    
  end 
  
  --Adds new collectibles over time
  if timer > collectibleSpawnTime then
    collectibleSpawnTime = collectibleSpawnTime + math.random(10,30)
    randCollectible = math.random(1,3)
    ResetCollectiblePos(randCollectible)
    collectibles[randCollectible].active = true
  end
  
  --Ends the slowdown powerup
  if timer > speedModifierEnd then
    speedModifier = 1
    slow = false
  end
  
end

function CollectiblesDraw()
  --Draws collectibles
  love.graphics.setColor(0, 0, 255)
  for i,c in ipairs(collectibles) do
    love.graphics.draw(c.image, c.x, c.y, 0, collectibleScale, collectibleScale)
  end
  
end

--Handles picking up collectibles
function CollectiblePickup(collectibleNum)
  if collectibles[collectibleNum].typec == 1 then
    slow = true
    speedModifier = 0.5
    speedModifierEnd = timer + speedModifierLength
  elseif collectibles[collectibleNum].typec == 2 then
    shield = true
  elseif collectibles[collectibleNum].typec == 3 then
    coins = coins + 1
  end
  collectibleScore = collectibleScore + 25
  ResetCollectiblePos(collectibleNum)
end

--Sets position and speed of rocks
function ResetCollectiblePos(collectibleNum)
  collectibles[collectibleNum].x = math.random(90, 360)
  collectibles[collectibleNum].y = -400
  collectibles[collectibleNum].speed = fallingSpeed * (0.1 * math.random(20, 40))
  collectibles[collectibleNum].active = false
end
