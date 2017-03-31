function ProgressBarLoad()
  heights = { }
  
  for line in love.filesystem.lines("Files/Heights.txt") do
    for name, data in line:gmatch("(.-):(.*)") do
      table.insert(heights, {name = name, h = data} )
      love.filesystem.write('logfile.txt', 'initiating log')
      love.filesystem.append('logfile.txt', "\nhello i am logging an event!")
    end
  end

end