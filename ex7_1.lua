function iter(m, n)
	n = n + 1
	if n <= m then return n end
end
	

function fromto(n, m)
	return iter, m, n-1
end

for i in fromto(1,50) do print(i/3) end
