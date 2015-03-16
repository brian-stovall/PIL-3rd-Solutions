function iter(data, n)
	m = data[1] 
	step = data[2]
	n = n + step
	if n <= m then return n end
end
	

function fromto(n, m, step)
	return iter, {m, step}, n-step
end

for i in fromto(1,50,10) do print(i) end
