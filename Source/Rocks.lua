function RocksLoad()
  
  rocks = {}
  rockImage = love.graphics.newImage("Sprites/Snowball.png")
  rockSpawnTime = 2
  amountOfRocks = 6
  rockScore = 0
  rockScale = 0.25

  --Initialises rocks
  for i=1, amountOfRocks do
    table.insert(rocks, {image = rockImage, x = 238, y = -100, size = 256 * rockScale, speed = 0, active = false })
  end
  rocks[1].active = true
  
end

function RocksUpdate(dt)
  
  for i,r in ipairs(rocks) do
    
    --Moves active rocks
    if r.active == true then
      r.y = r.y + (r.speed * speedModifier)
    end
    
    --Resets rocks when off screen
    if (r.y >= 960) then
      ResetRockPos(i)
    end
    
    --Handles collision between rocks and player
    if BoxCollision(r.x, r.y, r.size, r.size, playerPosX, playerPosY, playerWidth, playerHeight) == true then
      if shield == false then
        gameState = "death"
      else
        ResetRockPos(i)
        shield = false
      end
    end
    
    --Handles collision between rocks and hook
    if BoxCollision(r.x, r.y, r.size, r.size, hookPosX, hookPosY, hookWidth, hookHeight) == true then
      ResetRockPos(i)
      rockScore = rockScore + 25
    end
    
  end 
  
  --Adds new rocks over time
  if rocks[amountOfRocks].active == false and math.floor(timer/rockSpawnTime) > 0 and rocks[math.floor(timer/rockSpawnTime)].active == false then
    rocks[math.floor(timer/rockSpawnTime)].active = true
    ResetRockPos(math.floor(timer/rockSpawnTime))
    rockSpawnTime = rockSpawnTime * 2
  end
end

function RocksDraw()
  --Draws rocks
  for i,r in ipairs(rocks) do
    love.graphics.draw(r.image, r.x, r.y, 0, rockScale, rockScale)
  end
  
end

--Sets position and speed of rocks
function ResetRockPos(rockNum)
  rocks[rockNum].x = math.random(90, 360)
  rocks[rockNum].y = -400
  rocks[rockNum].speed = fallingSpeed * (0.1 * math.random(20, 40))
end
