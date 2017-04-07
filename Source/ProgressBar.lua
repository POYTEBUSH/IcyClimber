function ProgressBarLoad()
  heights = { }
  progressBar = love.graphics.newImage("Sprites/ProgressBar.png")
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
  ProgressBarCalc()
end

function ProgressBarDraw()
  love.graphics.setFont(scoreFont,20)
  love.graphics.draw(progressBar, 15, 860, 0, progressBarWidth, 1)
end

function ProgressBarCalc()
  progressBarWidth = (currentHeight - tonumber(achievedHeight)) / (tonumber(targetHeight)- tonumber(achievedHeight))
  --if(currentHeight < tonumber(targetHeight)) then
    --currentHeight = currentHeight + 0.1
  if (currentHeight > tonumber(targetHeight)) then
    reachedTargets = reachedTargets + 1
    currentTarget = currentTarget + 1
  end
  
end