function MainGameLoad()
  wallPic1 = love.graphics.newImage("Sprites/WallPic1.png") 
  wallPic2 = love.graphics.newImage("Sprites/WallPic2.png") 
  wallPic3 = love.graphics.newImage("Sprites/WallPic3.png") 
  wallPic4 = love.graphics.newImage("Sprites/WallPic4.png") 
  
  leftWall1 = 0
  leftWall2 = -960
  rightWall1 = 480
  rightWall2 = -480
  
  clicks = 0
  posX = 0
  posY = 0
  
  dragging = false
end

function MainGameUpdate(dt)
  leftWall1 = leftWall1 + 2.0
  leftWall2 = leftWall2+ 2.0
  rightWall1 = rightWall1 + 2.0
  rightWall2 = rightWall2+ 2.0
  
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

function MainGameDraw()
  love.graphics.draw(wallPic1, 0, leftWall1)
  love.graphics.draw(wallPic2, 0, leftWall2)
  love.graphics.draw(wallPic3, 480, rightWall1)
  love.graphics.draw(wallPic4, 480, rightWall2)

  love.graphics.rectangle("fill", posX, posY, 10, 10)
end

function MainGameMousePressed(x, y, button)
  -- Check if left mouse button pressed, if it is, set dragging to true
  if mouseRectCollide(x, y, button, 0, 0, windowWidth, windowHeight, 1) then
    dragging = true
    
    clicks = clicks + 1
    
    if clicks >= 10 then
      gameState = "death"
    end
    
    posX = x
    posY = y
    
  end
end

function MainGameMouseReleased(x, y, button)
  -- resets dragging once mouse released
  if button == 1 then 
    dragging = false
  end
end