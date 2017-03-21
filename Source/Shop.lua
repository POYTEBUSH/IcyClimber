mouse = {}

function ShopLoad()    
  
  money = 500
  
  backButton = love.graphics.newImage("sprites/backbutton.png")
  
  buyButton = love.graphics.newImage("sprites/shopitem.png")   
  boughtButton = love.graphics.newImage("sprites/shopitemowned.png")
  buttonW = 175
  buttonH = 225
  
  item1 = {}
  item1.upgradeBought = false
  item1.x = 100
  item1.y = 150
  
  item2 = {}
  item2.upgradeBought = false
  item2.x = 275
  item2.y = 150
  
  item3 = {}
  item3.upgradeBought = false
  item3.x = 100
  item3.y = 375
  
  item4 = {}
  item4.upgradeBought = false
  item4.x = 275
  item4.y = 375
  
  item5 = {}
  item5.upgradeBought = false
  item5.x = 100
  item5.y = 600
  
  item6 = {}
  item6.upgradeBought = false
  item6.x = 275
  item6.y = 600
end

function ShopUpdate ()
  
  mouseX = love.mouse.getX()
  mouseY = love.mouse.getY()
end

function ShopDraw()
  love.graphics.draw(backButton, 25, 25)
  
  if(item1.upgradeBought == false) then love.graphics.draw(buyButton, item1.x, item1.y) else love.graphics.draw(boughtButton, item1.x, item1.y) end
  if(item2.upgradeBought == false) then love.graphics.draw(buyButton, item2.x, item2.y) else love.graphics.draw(boughtButton, item2.x, item2.y) end
  if(item3.upgradeBought == false) then love.graphics.draw(buyButton, item3.x, item3.y) else love.graphics.draw(boughtButton, item3.x, item3.y) end
  if(item4.upgradeBought == false) then love.graphics.draw(buyButton, item4.x, item4.y) else love.graphics.draw(boughtButton, item4.x, item4.y) end 
  if(item5.upgradeBought == false) then love.graphics.draw(buyButton, item5.x, item5.y) else love.graphics.draw(boughtButton, item5.x, item5.y) end
  if(item6.upgradeBought == false) then love.graphics.draw(buyButton, item6.x, item6.y) else love.graphics.draw(boughtButton, item6.x, item6.y) end  
end

function ShopMousePressed(x, y, button)  
  if mouseRectCollide(x,y,button,item1.x,item1.y,buttonW,buttonH,1) then
    item1.upgradeBought = not item1.upgradeBought
  end
  if mouseRectCollide(x,y,button,item2.x,item2.y,buttonW,buttonH,1) then
    item2.upgradeBought = not item2.upgradeBought
  end
  if mouseRectCollide(x,y,button,item3.x,item3.y,buttonW,buttonH,1) then
    item3.upgradeBought = not item3.upgradeBought
  end
  if mouseRectCollide(x,y,button,item4.x,item4.y,buttonW,buttonH,1) then
    item4.upgradeBought = not item4.upgradeBought
  end
  if mouseRectCollide(x,y,button,item5.x,item5.y,buttonW,buttonH,1) then
    item5.upgradeBought = not item5.upgradeBought
  end
  if mouseRectCollide(x,y,button,item6.x,item6.y,buttonW,buttonH,1) then
    item6.upgradeBought = not item6.upgradeBought
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

