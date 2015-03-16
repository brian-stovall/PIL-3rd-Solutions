function generate(arr)

	local combinations = function(first, ...)
		local rest = {...}
		if not first and not rest[1] then
			return
		end

		for _, v in ipairs(rest) do
			coroutine.yield(first, v)
		end

		return combinations(...)
	end

	local c = coroutine.create(combinations)
	return function()
		status, a, b = coroutine.resume(c, table.unpack(arr))
		if status then
			return a,b
		end
	end

end

for a,b in generate{'a', 'b', 'c', 'd'} do
	print(a..b)
end

