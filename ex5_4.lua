--find all combinations available by binary numbering
function combos(arr)
	local result = {}
	local max = 2^(#arr)-1
	for i = 0, max do
		local combo = {}
		for v,bin in pairs(makeBin(i,#arr)) do
			if bin == 1 then
				table.insert(combo, arr[v])
			end
		end
		table.insert(result, combo)
	end
	return result
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

--test and pretty printing code
for _,item in pairs(combos({1,2,3,4,5})) do
	io.write('{ ')
	for _, value in pairs(item) do
		io.write(value, ' ')
	end
	io.write('} \n')
end

