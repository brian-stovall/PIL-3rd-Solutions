local Set = {}
local setMt = {}
function Set.new(tab)
	local set = {}
	setmetatable(set, setMt)
	for _, v in pairs(tab) do
		set[v] = true
	end
	return set
end

function Set.union(a, b)
	local res = Set.new{}
	for k in pairs(a) do res[k] = true end
	for k in pairs(b) do res[k] = true end
	return res
end

function Set.intersection(a,b)
	local res = Set.new{}
	for k in pairs(a) do
		res[k] = b[k]
	end
	return res
end

function Set.tostring(set)
	local l = {}
	for e in pairs(set) do
		table.insert(l, e)
	end
	return "{" .. table.concat(l) .. "}"
end

function Set.print(set)
	print(Set.tostring(s))
end

setMt.__add = Set.union
setMt.__pow = Set.intersection
setMt.__tostring = Set.tostring
return Set
