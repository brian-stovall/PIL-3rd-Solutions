function isPowTwo(n)
	print(n)
	if n == 0 then return false end
	local result = math.log(n,2)
	return result == math.floor(result)
end

print(isPowTwo(2))
print(isPowTwo(0))
print(isPowTwo(3))
print(isPowTwo(1))
print(isPowTwo(4))
print(isPowTwo(16))
print(isPowTwo(36))
print(isPowTwo(64))

