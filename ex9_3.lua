
local coList = {}

function coDispatcher(...)
	local args = {...}
	for v,co in pairs(args) do
		coList[co] = coroutine.create(co)
		if v == 1 then first = co end
	end
	local routine = first
  while routine do		
		_, routine = coroutine.resume(coList[routine])
	end
end

function transfer(co)
	coroutine.yield(co)
end

function tom()
	print("hey frank.")
	transfer(dick)
	print('sorry dick, hey hairy')
	transfer(harry)
end

function dick()
  print('my name is dick, dick')
	transfer(tom)
end

function harry()
	print("i've had enough of this")
end

coDispatcher(tom, dick, harry)
