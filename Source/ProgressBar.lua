function ProgressBarLoad()
  heights = { }
  
  for line in love.filesystem.lines("Files/Heights.txt") do
    for name, data in line:gmatch("(.-):(.*)") do
      table.insert(heights, {name = name, h = data} )
    end
  end
    
  end