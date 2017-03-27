function LoadGrapplingHook()
  
  --playerArmSprite = love.graphics.newImage("Sprites/PlayerArm.png")
  armWidth = 20
  armHeight = 50
  armPosX = playerPosX + (playerWidth / 2) - (armWidth / 2)
  armPosY = playerPosY + (playerHeight / 2) - (armHeight / 2)
  armAngle = math.rad(0)
  
  hookPosX = playerPosX + (playerWidth / 2)
  hookPosY = playerPosY + (playerHeight / 2) + 30
  hookWidth = 20
  hookHeight = 30
  hookSprite = love.graphics.newImage("Sprites/GrapplingHook.png")
  hookTiePoint = {x = 0, y = 0}
  hookState = "notInUse"
  
  fireVector = {x = 0, y = 0}  
  grapplingFireSpeed = 4
  pullSpeed = 40
  acceleration = 40
  angle = 0
end

function UpdateGrapplingHook(dt)

  if (hookState == "notInUse") then
    angle = math.rad(180)
    armAngle = math.rad(0)
    acceleration = 40
    pullSpeed = 40
  end
  
  if (playerState == "onLeftWall" or playerState == "onRightWall") then
    hookPosX = playerPosX + (playerWidth / 2)
    hookPosY = playerPosY + (playerHeight / 2) + 30
    hookState = "notInUse"
    
    fireVector.x = 0
    fireVector.y = 0
  end
  
  if ((playerState == "grapplingLeft" or playerState == "grapplingRight") and hookState == "notInUse") then
    --Calculate target vector
    fireVector.x = grappleTarget.x - hookPosX
    fireVector.y = grappleTarget.y - hookPosY
    hookState = "firing"
  end
  
  if(hookState == "firing") then
    hookPosX = hookPosX + (fireVector.x * (grapplingFireSpeed * dt))
    hookPosY = hookPosY + (fireVector.y * (grapplingFireSpeed * dt))
    
    --rotation angle for grapple
    angle = math.atan2((grappleTarget.y - playerPosY) , (grappleTarget.x - playerPosX)) + 1.5708
    
    --hook reaches right wall
    if(playerPosX < 270 and hookPosX > 475)then
      hookState = "hooked"
      hookPosX = 490
    end
    
    --hook reaches left wall
    if(playerPosX > 270 and hookPosX < 45)then
      hookState = "hooked"
      hookPosX = 45
    end
    
  end
  
  if(hookState == "hooked")then
    hookPosY = hookPosY + fallingSpeed
    
    --Normalize vector
    vecLength = math.sqrt((fireVector.x * fireVector.x) + (fireVector.y * fireVector.y))
    fireVector.x = fireVector.x / vecLength 
    fireVector.y = fireVector.y / vecLength
    
    --Move player along vector
    playerPosX = playerPosX + (fireVector.x * pullSpeed * dt)
    playerPosY = playerPosY + (fireVector.y * pullSpeed * dt)
  
    --check if player as reached right wall
    if (hookPosX > 270 and playerPosX >= 455) then
      playerState = "onRightWall"
      hookState = "notInUse"
      playerPosX = 430
    end
    
    --check if player as reached left wall
    if (hookPosX < 270 and playerPosX <= 25) then
      playerState = "onLeftWall"
      hookState = "notInUse"
      playerPosX = 25
    end
    
    acceleration = acceleration + 0.15
    pullSpeed = pullSpeed + (acceleration)
    
  end
  
  --line between player and hook
  rope = 
  {
    playerPosX + (playerWidth / 2), 
    playerPosY + (playerHeight / 2), 
    hookPosX, 
    hookPosY
  }
  
  --Update firing arm position
  armPosX = playerPosX + (playerWidth / 2) - (armWidth / 2)
  armPosY = playerPosY + (playerHeight / 2) - (armHeight / 2)
  
end

function DrawGrapplingHook()
    -- only draw line when using it
  if (hookState ~= "notInUse") then
    love.graphics.setColor(0, 0, 0)
    love.graphics.line(rope)
    love.graphics.setColor(255, 255, 255)
  end
  
  love.graphics.draw(hookSprite, hookPosX, hookPosY, angle, 1, 1, hookWidth / 2, hookHeight / 2)
  --love.graphics.draw(playerArmSprite, armPosX, armPosY)
end