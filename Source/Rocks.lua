function RocksLoad()
  
  require "Source/CollisionHandler"
  require "Source/Player"
  require "Source/MainGame"
  
  rocks = {}
  rockImage = love.graphics.newImage("Sprites/Snowball.png")
  rockSpawnTime = 10
  table.insert(rocks, {image = rockImage, x = math.random(1,400), y = -1 * math.random(100,400), width = 64, height = 64, speed = 960 })

    
end

function RocksUpdate(dt)
  
  for i,r in ipairs(rocks) do
    r.y = r.y + r.speed
    if (r.y >= 960) then
      r.y = -100
      r.x = math.random(50, 400)
      r.speed = fallingSpeed * (0.1 * math.random(20, 50))
    end
    
    if BoxCollision(r.x, r.y, r.width, r.height, playerPosX, playerPosY, playerWidth, playerHeight) == true then
      gameState = "death"
      for i=table.maxn(rocks), 1 do
        table.remove(rocks, i)
      end
      table.insert(rocks, {image = rockImage, x = math.random(1,400), y = -1 * math.random(100,400), width = 64, height = 64, speed = 960 })
    end
    
  end
  
  if math.ceil(timer/rockSpawnTime) > table.maxn(rocks) then
    table.insert(rocks, {image = rockImage, x = math.random(1,400), y = -1 * math.random(100,400), width = 64, height = 64, speed = fallingSpeed * (0.1 * math.random(20, 50)) })
  end
  
end

function RocksDraw()
  
  for i,r in ipairs(rocks) do
    love.graphics.draw(r.image, r.x, r.y, 0, 0.25, 0.25)
  end
  
end
