rooms = { 
		--initial room
		{["east"] = 2, ["south"] = 3},
		--two
		{["south"] = 4, ["west"] = 1},
		--three
		{["north"] = 1, ['east'] = 4}
	}

local position = 1 --initial position
while position ~= 4 do
	print("What direction do you want to go? Exits: ")
	for k, _ in pairs(rooms[position]) do print(k) end

	--insure good input
	local move = io.read()
	local choice = rooms[position][move]
	while choice == nil do
		print("Please choose one of: ")
		for k, _ in pairs(rooms[position]) do print(k) end
		move = io.read()
		choice = rooms[position][move]
	end

	position = choice
end

print("You found the exit!")


	

--[[
goto room1      -- initial room
::room1:: do
  local move = io.read()
  if move == "south" then goto room3
  elseif move == "east" then goto room2
  else
    print("invalid move")
    goto room1     -- stay in the same room
  end
end
::room2:: do
  local move = io.read()
  if move == "south" then goto room4
  elseif move == "west" then goto room1
  else
    print("invalid move")
    goto room2
  end
end
::room3:: do
  local move = io.read()
  if move == "north" then goto room1
  elseif move == "east" then goto room4
  else
    print("invalid move")
    goto room3
  end
end
::room4:: do
  print("Congratulations, you won!")
end
]]--
