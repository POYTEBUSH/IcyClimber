function ProgressBarLoad()
  heights = { }
  progressBar = love.graphics.newImage("Sprites/ProgressBar.png")
  progressBarX = 0
  achievedHeight = 0
  targetHeight = 0
  currentTarget = 2
  currentHeight = 0
  for line in love.filesystem.lines("Files/Heights.txt") do
    for name, data in line:gmatch("(.-):(.*)") do
      table.insert(heights, {name = name, h = data} )
    end
  end    
end

function ProgressBarUpdate()
  achievedHeight = heights[currentTarget-1].h
  targetHeight = heights[currentTarget].h
  
  ProgressBarCalc(achievedHeight, targetHeight)
end

function ProgressBarDraw()
  love.graphics.setFont(scoreFont,20)
  love.graphics.draw(progressBar, 15, 860, 0, achievedFactor, 1)
end

function ProgressBarCalc(loc1, loc2)
  achievedFactor = (currentHeight - tonumber(loc1)) / (tonumber(loc2)- tonumber(loc1))
  --scaleFactor = 510 / tonumber(loc2)
  if(currentHeight < tonumber(loc2)) then
    currentHeight = currentHeight + 0.1
  else
    currentTarget = currentTarget + 1
  end
  
end