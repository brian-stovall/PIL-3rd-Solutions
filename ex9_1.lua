--find all combinations available by binary numbering
function combos(arr)
	local max = 2^(#arr)-1
	for i = 0, max do
		local combo = {}
		for v,bin in pairs(makeBin(i,#arr)) do
			if bin == 1 then
				table.insert(combo, arr[v])
			end
		end
		coroutine.yield(combo)
	end
end

--returns a binary number in list form
function makeBin(num, places) 	
	local result = {}
	for i = places, 1, -1 do
		local placeVal = (2^(i-1))
		if num >= placeVal  then
			result[i] = 1
			num = num - placeVal
		else
			result[i] = 0
		end
	end
	return result
end

function comboGen(arr)
	return coroutine.wrap(function() combos(arr) end)
end

--test and pretty printing code
for item in comboGen({1,2,3,4,5}) do
	io.write('{ ')
	for _, v in pairs(item) do
		io.write(v, ' ')
	end
	io.write('} \n')
end

