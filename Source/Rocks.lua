function RocksLoad()
  
  require "Source/CollisionHandler"
  require "Source/Player"
  
  rocks = {}
  table.insert(rocks, {image = love.graphics.newImage("Sprites/snowball.png"), x = math.random(1,400), y = -100, width = 64, height = 64, speed = 4 })
  table.insert(rocks, {image = love.graphics.newImage("Sprites/snowball.png"), x = math.random(1,400), y = -100, width = 64, height = 64, speed = 5 })
  
end

function RocksUpdate(dt)
  
  for i,r in ipairs(rocks) do
    r.y = r.y + r.speed
    if (r.y >= 960) then
      r.y = -100
      r.x = math.random(50, 400)
      r.speed = fallingSpeed * (0.1 * math.random(20, 50))
    end
  end
  
  
  
end

function RocksDraw()
  for i,r in ipairs(rocks) do
    if BoxCollision(r.x, r.y, r.width, r.height, playerPosX, playerPosY, playerWidth, playerHeight) == true then
      love.graphics.setColor(255, 0, 0)
      love.graphics.print("Kill", 100, 100)
    end
    love.graphics.draw(r.image, r.x, r.y, 0, 0.25, 0.25)
  end
  
end
