function GameUILoad()
  score = 0
end

function GameUIUpdate()
  score = math.floor(timer * 10) + rockScore + collectibleScore
end

function GameUIDraw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.rectangle("fill", 0, windowHeight - 96, windowWidth, 96)
  love.graphics.setColor(255, 255, 255)
  love.graphics.print("score: " .. score, 0, windowHeight - 96, 0, 2, 2)
  
  if shield == true then
    love.graphics.print("shield" , 270, windowHeight - 96, 0, 2, 2)
  end
  
  love.graphics.print("coins: " .. coins, 0, windowHeight - 48, 0, 2, 2)
end