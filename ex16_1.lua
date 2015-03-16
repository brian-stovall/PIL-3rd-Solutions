local Stack = {}

function Stack:new(lst)
	local stack = {}
	self.__index = self
	setmetatable(stack, self)
	for _, v in pairs(lst) do
		table.insert(stack, v)
	end
	return stack
end

function Stack:push(val)
	self[#self + 1] = val
end

function Stack:pop()
	local result = self[#self]
	self[#self] = nil
	return result
end

function Stack:print()
	print("{ " .. table.concat(self, ', ') .. " }")
end

function Stack:isEmpty()
	return (#self == 0)
end

a = Stack:new{1,2,3}
print(a:pop())
a:print()
a:push(42)
a:print()
a:pop()
a:pop()
a:pop()
a:pop()
print(a:isEmpty())
