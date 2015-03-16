local Stack = {}

function Stack:new(lst)
	local stack = lst or {}
	self.__index = self
	setmetatable(stack, self)
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

local QueueStack = Stack:new({bottom = 1})

function QueueStack:pushBot(val)
	self.bottom = self.bottom - 1
	self[self.bottom] = val
end

function QueueStack:popBot()
	local res = self[self.bottom]
	self.bottom = self.bottom + 1
	if self.bottom > #self then 
		self.bottom = #self + 1 end
	return res
end

function QueueStack:isEmpty()
	return (self.bottom >= #self)
end

a = QueueStack:new{1,2,3}
a:print()
print('popping bottom: ', a:popBot())
a:pushBot(42)
a:print()

print('popping bottom: ', a:popBot())
print('popping bottom: ', a:popBot())
print('popping bottom: ', a:popBot())
print('popping bottom: ', a:popBot())
print(a.bottom, #a)
print('popping bottom: ', a:popBot())
print(a.bottom)
print('popping bottom: ', a:popBot())
print(' is empty? ', a:isEmpty())
