function RocksLoad()
  
  rockPic = love.graphics.newImage("Sprites/snowball.png") 
  rockX = math.random(1, 500)
  rockY = -100
  rockSpeed = (2.0 * (0.1 * math.random(20, 30)))
  
end

function RocksUpdate(dt)
  
  rockY = rockY + rockSpeed
  
  if (rockY >= 960) then
    rockY = -100
    rockX = math.random(50, 400)
    rockSpeed = (2.0 * (0.1 * math.random(20, 50)))
  end
  
end

function RocksDraw()
  
  love.graphics.draw(rockPic, rockX, rockY, 0, 0.5, 0.5)
  
end
