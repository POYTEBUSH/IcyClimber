mouse = {}

function shopload()    
  
  money = 500
  
  upgrade1Bought = false
  upgrade2Bought = false
  
  buyButton2 = love.graphics.newImage("sprites/blankLongButton.png") -- change to buy button image + placeholder button image
    
  boughtButton1 = love.graphics.newImage("sprites/upgradeBoughtButton.png") -- placeholder button image  
    
  buyButton1 = love.graphics.newImage("sprites/blankLongButton.png") -- change to buy button image + placeholder button image
    
  boughtButton2 = love.graphics.newImage("sprites/upgradeBoughtButton.png") -- placeholder button image
 
  
  buyButton1PosX = 222/2
  buyButton1PosY = 600/2  
  buyButton2PosX = 222/2
  buyButton2PosY = 800/2
  boughtButton1PosX = 222/2
  boughtButton1PosY = 600/2           -- Problem! Can only click one button! Fix!
  boughtButton2PosX = 222/2
  boughtButton2PosY = 800/2
  
  end

function shopupdate ()
  mouseX = love.mouse.getX()
  mouseY = love.mouse.getY()
  
    checkBuy1 = CheckCollision(mouseX, mouseY, 1, 1, buyButton1PosX, buyButton1PosY, 144, 64)  
    checkBuy2 = CheckCollision(mouseX, mouseY, 1, 1, buyButton2PosX, buyButton2PosY, 144, 64)    
end

function shopdraw()
  --game_screen()
   if main == false then        
    love.graphics.draw(buyButton1, buyButton1PosX, buyButton1PosY)
    love.graphics.draw(buyButton2, buyButton2PosX, buyButton2PosY)
    if upgrade1Bought == true then
      love.graphics.draw(boughtButton1, boughtButton1PosX, boughtButton1PosY)
    end
    if upgrade2Bought == true then
      love.graphics.draw(boughtButton2, boughtButton2PosX, boughtButton2PosY)
    end
  end
end

function Mousepressed(mx, my, button)
  if (button == 1 and checkBuy1 and money >= 500 and upgrade1Bought == false) then  
    upgrade1Bought = true
    money = money - 500      
  end
  if (button == 1 and checkBuy2 and money >= 250 and upgrade2Bought == false) then    
    upgrade2Bought = true
    money = money - 250
  end 
end

function game_screen() 

end

function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1                 
end

