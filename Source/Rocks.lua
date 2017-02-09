function RocksLoad()
  
  require "Source/CollisionHandler"
  require "Source/Player"
  
  numberOfRocks = 5
  
  rocks = {}
  for i=1, numberOfRocks do
    table.insert(rocks, {image = love.graphics.newImage("Sprites/snowball.png"), x = math.random(1,400), y = -1 * math.random(100,400), width = 64, height = 64, speed = 960 })
  end
    
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
