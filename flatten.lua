--writes nested tables to screen nicely
function printMagick(a)
  io.write("{ ")
  for _, item in pairs(a) do

		--write non-tabular elements, recurse on tabular ones
		if type(item) == "table" then
			printMagick(item)
		else
		  io.write(item)
		end

		--check if a comma is needed
		if _ ~= #a then
			io.write(",")
		end

		--give every entry a trailing space
		io.write(" ")
  end
  io.write("}")
end

function getLast(arr) --gets the last inner nontable element of a nested arr
	while type(arr[#arr]) == 'table' do
		if #(arr[#arr]) == 0 then arr[#arr] = nil 
		else
		  return(getLast(arr[#arr]))
		end
	end
	local result = arr[#arr]
	arr[#arr] = nil
	return result
end

function flatten(arr)
	local result = {}
	while #arr ~= 0 do
		table.insert(result, getLast(arr))
	end
	return reverse(result)
end

function reverse(arr)
	local result = {}
	for i = #arr, 1, -1 do
		table.insert(result, arr[i])
	end
	return result
end


arr = {1,{2,3,{4,5,{}}}}
printMagick(flatten(arr))
