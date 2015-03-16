local Set = {}

function Set.new(arr)
	local result = {}
	if arr then
		for _,v in pairs(arr) do
			result[v] = true
		end
	end
	return result
end

function Set.isMem(set, value)
	if set[value] == true then
		return true
	else
		return false
	end
end

local function allwords()
	local auxwords = function ()
		for line in io.lines(arg[1] or nil) do
			for word in string.gmatch(line, "%w+") do
				coroutine.yield(word)
			end
		end
	end
	return coroutine.wrap(auxwords)
end

local reservedWords = Set.new({"don't", "take", "any", "of", "these"})
local counter = {}
for w in allwords() do
	if not Set.isMem(reservedWords, w) then
		counter[w] = (counter[w] or 0) + 1
	end
end

local words = {}
for w in pairs(counter) do
	table.insert(words, w)
end

table.sort(words, function(w1, w2)
	return counter[w1] > counter[w2] or
			   counter[w1] == counter[w2] and w1 < w2
end)

for i = 1, (tonumber(arg[2]) or 10) do
	print(words[i], counter[words[i]])
end


