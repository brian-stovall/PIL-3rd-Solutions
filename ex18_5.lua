
local function shuffle(lst)
	for i = #lst, 1, -1 do
		swap = math.random(i)
		lst[i], lst[swap] = lst[swap], lst[i]
	end
end

math.randomseed(os.time())
local crap ={1,2,3}-- {1,2,3,4,5,6,7,8,9,10}
for i = 1, 15 do	
	shuffle(crap)
	print(table.concat(crap, ','))
end
