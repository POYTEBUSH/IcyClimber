local armAngle = 0
local offsetX = 0
local offsetY = 0

function PlayerLoad()
  
  playerArmR = love.graphics.newImage("Sprites/PlayerMainArmR.png")
  playerArmL = love.graphics.newImage("Sprites/PlayerMainArmL.png") 
  playerLeft = love.graphics.newImage("Sprites/PlayerMainL.png") 
  playerRight = love.graphics.newImage("Sprites/PlayerMainR.png")   
  
  ControlLock = false
  
  playerPosX = 25
  playerPosY = 280
  playerWidth = 75
  playerHeight = 95
  
  playerArmPosX = playerPosX + playerWidth
  playerArmPosY = playerPosY + 20
  
  playerState = "onLeftWall"
  
  require "Source/FireGrapplingHook"
  LoadGrapplingHook()
  
  grappleTarget = {x = 0, y = 0}
  
end

function PlayerUpdate(dt)
  
  UpdateGrapplingHook(dt)
  
  if (playerState == "onLeftWall") then
      playerArmPosX = playerPosX + playerWidth
      playerArmPosY = playerPosY + 55
  elseif (playerState == "grapplingRight") then    
      playerArmPosX = playerPosX + playerWidth + 50
      playerArmPosY = playerPosY + 55
  end
  
  if (playerState == "onRightWall") then
      playerArmPosX = playerPosX - 3
      playerArmPosY = playerPosY + 55
  elseif (playerState == "grapplingLeft") then    
      playerArmPosX = playerPosX + 10
      playerArmPosY = playerPosY - 5
  end
  
  --Once player is on wall, fall at same speed as the wall
  --if playerState == "onLeftWall" or playerState == "onRightWall" then
    playerPosY = playerPosY + (fallingSpeed * speedModifier)
    
  --end
  
  if playerPosY > windowHeight - 86 then
    gameState = "death"
  end
  
  if (playerState == "onRightWall" or playerState == "onLeftWall") then
    armAngle = 0
    offsetX = 12
    offsetY = 32
  elseif (playerState == "grapplingLeft") then
    armAngle = 2.3
    offsetX = -15
    offsetY = 20
  elseif (playerState == "grapplingRight") then
    armAngle = 4.6
    offsetX = -30
    offsetY = 60
  end
end

function PlayerDraw()
  DrawGrapplingHook()
  
  if(playerState == "onRightWall" or playerState == "grapplingLeft" )then
  love.graphics.draw(playerLeft, playerPosX, playerPosY)
  love.graphics.draw(playerArmL, playerArmPosX, playerArmPosY, armAngle, 1, 1, offsetX, offsetY)
  end
  if (playerState == "onLeftWall" or playerState == "grapplingRight") then
  love.graphics.draw(playerRight, playerPosX, playerPosY)
  love.graphics.draw(playerArmR, playerArmPosX, playerArmPosY, armAngle, 1, 1, offsetX, offsetY)
  end
end

function PlayerMousePressed(x, y, button)
  
  --Right side click
  if mouseRectCollide(x, y, button, 400, 0, 140, windowHeight, 1) then
    --if on left wall fire grappling hook
    if (playerState == "onLeftWall") and (y <= playerPosY) then
      playerState = "grapplingRight"
      grappleTarget.x = x
      grappleTarget.y = y
      
      currentHeight = currentHeight + math.ceil((playerPosY - y) / 10)
    end
  end
  
  --Left side click
  if mouseRectCollide(x, y, button, 0, 0, 140, windowHeight, 1) then
    --if on right wall fire grappling hook
    if (playerState == "onRightWall") and (y <= playerPosY)then
      playerState = "grapplingLeft" 
      grappleTarget.x = x
      grappleTarget.y = y
      
      currentHeight = currentHeight + math.ceil((playerPosY - y) / 10)
    end      
  end
  
end
