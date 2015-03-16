function printall(...)
	local tabl = table.pack(...) 
	for i = 1, tabl.n do	
		print(tabl[i])
	end
end

function printalldumb(...)
	for _,v in pairs{...} do
		print(v)
	end
end

print("smart n slow")
printall(1,2, nil, 4, 5)
print("dumb n fast")
printalldumb(1,2, nil, 4, 5)
