function allwords ()
  local readwords = {} -- list of already read words, with words as keys

  local line = io.read() -- current line
  local pos = 1           -- current position in the line
  return function ()      -- iterator function
    while line do         -- repeat while there are lines
      local s, e = string.find(line, "%w+", pos)

      if s then -- found a word?
	local word = string.sub(line, s, e)
        pos = e + 1       -- next position is after this word
	
	if not readwords[word] then
		readwords[word] = true
	        return word     -- return the word
	end

      else
        line = io.read() -- word not found; try next line
        pos = 1           -- restart from first position
      end
    end
    return nil            -- no more lines: end of traversal
  end
end

for word in allwords() do 
	print(word)
end
