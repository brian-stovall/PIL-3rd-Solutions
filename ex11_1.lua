
local List = {}

function List.new()
	return {first = 1, last = 0}
end

function List.pushFirst(list, value)
	list.first = list.first - 1
	list[list.first] = value
end

function List.pushLast(list, value)
	list.last = list.last + 1
	list[list.last] = value
end

function List.popFirst(list)
	if list.first > list.last then 
		error('empty list')
	else
		local value = list[list.first]
		list[list.first] = nil
		list.first = list.first + 1
		List.reset(list)
		return value
	end
end

function List.reset(list)
	if list.first > list.last then
		list.first, list.last = 1, 0
	end
end

function List.popLast(list)
	if list.first > list.last then 
		error('empty list')
	else
		local value = list[list.last]
		list[list.last] = nil
		list.last = list.last - 1
		List.reset(list)
		return value

	end
end

function List.prettyPrint(list)
	if list.first > list.last then
		print('{}')
	else
		io.write('{ ')
		for i = list.first, list.last do
			if i ~= 0 then
				io.write(list[i], ' ')
			end
		end
		io.write('}\n')
	end
	print ('first = ', list.first, ' last = ', list.last)
end

--test code
lst = List.new()
List.prettyPrint(lst)
List.pushFirst(lst, 'a')
List.pushLast(lst, 'b')
List.pushLast(lst, 'b')
List.prettyPrint(lst)
print('pop!', List.popLast(lst))
List.prettyPrint(lst)
print('pop!', List.popLast(lst))
print('pop!', List.popLast(lst))
List.prettyPrint(lst)
print('pop!', List.popLast(lst))
print('pop!', List.popLast(lst))
