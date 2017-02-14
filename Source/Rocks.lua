function RocksLoad()
  
  rocks = {}
  rockImage = love.graphics.newImage("Sprites/Snowball.png")
  rockSpawnTime = 5
  amountOfRocks = 6

  --initial rocks
  for i=1, amountOfRocks do
    table.insert(rocks, {image = rockImage, x = 238, y = -100, width = 64, height = 64, speed = 8, active = false })
  end
  rocks[1].active = true
  
end

function RocksUpdate(dt)
  
  --resets rocks
  for i,r in ipairs(rocks) do
    
    if r.active == true then
      r.y = r.y + r.speed
    end
    
    if (r.y >= 960) then
      newRockPos(i)
    end
    
    if BoxCollision(r.x, r.y, r.width, r.height, playerPosX, playerPosY, playerWidth, playerHeight) == true then
      gameState = "death"
    end
    
    if BoxCollision(r.x, r.y, r.width, r.height, hookPosX, hookPosY, hookWidth, hookHeight) == true then
      newRockPos(i)
    end
    
  end
  
  --adds new rock every ten seconds
  if rocks[amountOfRocks].active == false then
    if rocks[math.ceil(timer/rockSpawnTime)].active == false then
      rocks[math.ceil(timer/rockSpawnTime)].active = true
      rockSpawnTime = rockSpawnTime * 2
    end
  end
end

function RocksDraw()
  
  for i,r in ipairs(rocks) do
    love.graphics.draw(r.image, r.x, r.y, 0, 0.25, 0.25)
  end
  
end

function newRockPos(rockNum)
  rocks[rockNum].x = math.random(90, 360)
  rocks[rockNum].y = -400
  rocks[rockNum].speed = fallingSpeed * (0.1 * math.random(20, 40))
end
