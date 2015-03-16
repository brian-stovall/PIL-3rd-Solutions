function integral(f, delta)
	local delta = delta or 1e-4

	return function(first, last)
		local x = first
		local sum = 0

		while x < last do
			sum = sum + f(x)
			x = x + delta
			if x > last then x = last end
		end

		return sum
	end
end

function double	(x) return x*2 end

doubleIntegrated = integral(double)
print(doubleIntegrated(1,5))
