function RocksLoad()
  
  rocks = {}
  table.insert(rocks, {image = love.graphics.newImage("Sprites/snowball.png"), x = math.random(1,500), y = -1060, speed = 2.0 * (0.1 * math.random(20, 50)) })
  table.insert(rocks, {image = love.graphics.newImage("Sprites/snowball.png"), x = math.random(1,500), y = -100, speed = 2.0 * (0.1 * math.random(20, 50)) })
  
end

function RocksUpdate(dt)
  
  for i,r in ipairs(rocks) do
    r.y = r.y + r.speed
  end
  
  for i,r in ipairs(rocks) do
    if (r.y >= 960) then
      r.y = -100
      r.x = math.random(50, 400)
      r.speed = (2.0 * (0.1 * math.random(20, 50)))
    end
  end
  
  
  
end

function RocksDraw()
  for i,r in ipairs(rocks) do
    love.graphics.draw(r.image, r.x, r.y, 0, 0.25, 0.25)
  end
  
end
