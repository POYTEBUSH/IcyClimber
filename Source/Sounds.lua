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
  GamePlaySound:stop()
    
  end
  
  if gameState == "death" then
    
    GamePlaySound:stop()
    if(loop == false) then
      DeathSound:play()
      loop = true
    end
    
    
  end
end
function CollectableSoundLoad()
    
    DingSound = love.audio.newSource("Sounds/Ding.mp3")
    ColletableLoop = false
  
end

function CollectableSound()
    DingSound:play()
end

