-- use this for mouse/touch clicks
function mouseRectCollide(mouseX, mouseY, button, rectX, rectY, rectWidth, rectHeight, reqButton)
  if reqButton == button
  and mouseX > rectX and mouseX < rectX + rectWidth
  and mouseY > rectY and mouseY < rectY + rectHeight
  then
    return true
  end
end

-- use this for bounding box collisions
function BoxCollision(x1, y1, w1, h1, x2, y2, w2, h2)
  
  if (y1 + h1) < y2 then
    return false
  end
  if y1 > (y2 + h2) then
    return false
  end
  if (x1 + w1) < x2 then
    return false
  end
  if x1 > (x2 + w2) then
    return false
  end
  
  return true
  
end