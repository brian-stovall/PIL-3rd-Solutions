function polyCalc (poly)
	return function (x)
		local result = 0
		for k, v in pairs(poly) do
			result = result + (v*x^(#poly - k))
		end
		return result
	end
end


