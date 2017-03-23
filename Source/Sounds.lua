function SoundLoad()
  
  GamePlaySound = love.audio.newSource("Sounds/GameplayMusic.mp3")
  DeathSound = love.audio.newSource("Sounds/Splat.ogg", "static")
  DeathSound:setLooping(false)
 loop = false
 
end

function UpdateSound(gameState)
  if gameState == "game" then
    GamePlaySound:play()
    
  end
  if gameState == "startScreen" then
  loop = false
    
  end
  
  if gameState == "death" then
    
    GamePlaySound:stop()
    if(loop == false) then
      DeathSound:play()
      loop = true
    end
    
    
  end




end
