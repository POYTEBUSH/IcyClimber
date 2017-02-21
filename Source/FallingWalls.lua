function FallingWallsLoad()
  
  wallPic1 = love.graphics.newImage("Sprites/WallPic1.png") 
  wallPic2 = love.graphics.newImage("Sprites/WallPic2.png") 
  wallPic3 = love.graphics.newImage("Sprites/WallPic3.png") 
  wallPic4 = love.graphics.newImage("Sprites/WallPic4.png") 
  
  leftWall1 = 0
  leftWall2 = -960
  rightWall1 = 480
  rightWall2 = -480
  
end

function FallingWallsUpdate(dt)

  leftWall1 = leftWall1 + (fallingSpeed * speedModifier)
  leftWall2 = leftWall2 + (fallingSpeed * speedModifier)
  rightWall1 = rightWall1 + (fallingSpeed * speedModifier)
  rightWall2 = rightWall2 + (fallingSpeed * speedModifier)
  
  if(leftWall1 >= 960)then
    leftWall1 = -960
  end
  
  if(leftWall2 >= 960)then
    leftWall2 = -960
  end
  
  if(rightWall1 >= 960)then
    rightWall1 = -960
  end
  
  if(rightWall2 >= 960)then
    rightWall2 = -960
  end  

end

function FallingWallsDraw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(wallPic1, 0, leftWall1)
  love.graphics.draw(wallPic2, 0, leftWall2)
  love.graphics.draw(wallPic3, 480, rightWall1)
  love.graphics.draw(wallPic4, 480, rightWall2)
  
end