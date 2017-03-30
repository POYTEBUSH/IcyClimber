mouse = {}

function ShopLoad()    
  
  money = 500
  
  shopTitle = love.graphics.newImage("sprites/ShopTitle.png")
  
  backButton = love.graphics.newImage("sprites/BackButton.png")
  
  buyButton = love.graphics.newImage("sprites/ShopItem.png")     
  boughtButton = love.graphics.newImage("sprites/ShopItemOwned.png")
  
  shopItemImageList = {}
  for i, file in ipairs(love.filesystem.getDirectoryItems("Sprites/ShopItems")) do
    image = love.graphics.newImage("Sprites/ShopItems/" .. file)
    table.insert(shopItemImageList, image)
  end
  
  buttonW = 175
  buttonH = 225
  
  items = {}
  table.insert(items,{ bought = false, x = 100, y = 150})
  table.insert(items,{ bought = false, x = 275, y = 150})
  table.insert(items,{ bought = false, x = 100, y = 375})
  table.insert(items,{ bought = false, x = 275, y = 375})
  table.insert(items,{ bought = false, x = 100, y = 600})
  table.insert(items,{ bought = false, x = 275, y = 600})
    
end

function ShopUpdate ()
  
  mouseX = love.mouse.getX()
  mouseY = love.mouse.getY()
end

function ShopDraw()
  love.graphics.draw(backButton, 25, 25)
  love.graphics.draw(shopTitle, 190, 35)
  
  for i,item in ipairs(items) do
    if(item.bought == false) then 
      love.graphics.draw(buyButton, item.x, item.y) 
      love.graphics.draw(shopItemImageList[i], item.x + 20, item.y + 25, 0, 1.5, 1.5)
    else 
      love.graphics.draw(boughtButton, item.x, item.y) 
      love.graphics.draw(shopItemImageList[i], item.x + 20, item.y + 25, 0, 1.5, 1.5)
    end
  end
  
  
end

function ShopMousePressed(x, y, button)  
  
  for i,item in ipairs(items) do
    if mouseRectCollide(x,y,button,item.x,item.y,buttonW,buttonH,1) and (item.bought == false) then
      item.bought = not item.bought
    end
  end

  if mouseRectCollide(x,y,button,25,24,100,100,1) then
    MenuLoad()
    gameState = "startScreen"
  end
end
