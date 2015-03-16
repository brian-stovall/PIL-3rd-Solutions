Set = {}
local mt = {}

function Set.new(lst) 
	local set = {}
	setmetatable(set, mt)
	for _, v in pairs(lst) do set[v] = true end
	return set
end

function Set.tostring(set)
	local result = {}
	result[1] = '[ '
	for k in pairs(set) do 
		table.insert(result, k .. ' ')
	end
	table.insert(result, ']')
	return table.concat(result)
end

function Set.sub(a, b)
	local result = Set.new({})
	for k in pairs(a) do
		result[k] = true
	end
	for k in pairs(b) do
		result[k] = nil
	end
	return result
end

function Set.len(set)
	local result = 0
	for k in pairs(set) do
		result = result + 1
	end
	return result
end

mt.__tostring = Set.tostring
mt.__sub = Set.sub
mt.__len = Set.len

local a = Set.new({1,2,3,4,5,6})
local b = Set.new({2,4,6,7})

io.write(Set.tostring(a), " - ", Set.tostring(b), " = ", Set.tostring(a-b), '\n')
print(#b)
print(#(a-b))

