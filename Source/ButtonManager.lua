button = {}

function button_spawn(x, y, text, id)
  table.insert(button, {x = x, y= y, text = text, id = id})
end

function button_draw()
  for i, v in ipairs(button) do    
    love.graphics.print(v.text, v.x, v.y)
  end
end

function button_click(x, y)
  for i, v in ipairs(button) do
    if x > v.x and
      x < v.x + font.normal:getWidth(v.text) and
      y > v.y and 
      y < v.y + font.normal:getHeight() then
        if v.id == "quit" then
          love.event.push("quit")
        elseif v.id == "start" then
          gameState = "game"  
        elseif v.id == "options" then
          gameState = "options"
        elseif v.id == "back" then 
          gameState = "startScreen"
        end
    end  
  end
end

function button_check(x, y)
  for i, v in ipairs(button) do
    if x > v.x and
      x < v.x + font.normal:getWidth(v.text) and
      y > v.y and 
      y < v.y + font.normal:getHeight() then
        v.mouseover = true
      else 
        v.mouseover = false
    end
  end
end