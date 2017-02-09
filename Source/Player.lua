function PlayerLoad()
  
  playerSprite = love.graphics.newImage("Sprites/Player.png") 
  
  playerPosX = 25
  playerPosY = 280
  playerWidth = 60
  playerHeight = 100
  
  playerState = "onLeftWall"
  
  require "Source/FireGrapplingHook"
  LoadGrapplingHook()
  
  grappleTarget = {x = 0, y = 0}
  
end

function PlayerUpdate(dt)
  --Once player is on wall, fall at same speed as the wall
  --if playerState == "onLeftWall" or playerState == "onRightWall" then
    playerPosY = playerPosY + FallingSpeed
  --end

  UpdateGrapplingHook(dt)

end

function PlayerDraw()
  love.graphics.draw(playerSprite, playerPosX, playerPosY)
  
  DrawGrapplingHook()
  
end

function PlayerMousePressed(x, y, button)
  
  --Right side click
  if mouseRectCollide(x, y, button, 400, 0, 140, windowHeight, 1) then
    --if on left wall fire grappling hook
    if (playerState == "onLeftWall") and (y <= playerPosY) then
      playerState = "grappling"
      grappleTarget.x = x
      grappleTarget.y = y
    end
  end
  
  --Left side click
  if mouseRectCollide(x, y, button, 0, 0, 140, windowHeight, 1) then
    --if on right wall fire grappling hook
    if (playerState == "onRightWall") and (y <= playerPosY)then
      playerState = "grappling"
      grappleTarget.x = x
      grappleTarget.y = y
    end      
  end
  
end
