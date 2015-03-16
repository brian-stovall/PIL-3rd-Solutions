local N = 8 -- board size

--check if (n,c) is free from attacks
local function isplaceok (a, n, c)
	for i = 1, n - 1 do --for the queens already placed
		if (a[i] == c) or --column
			 (a[i] - i == c - n) or --diagonal 1
			 (a[i] + i == c + n) then --diagonal 2
			return false
		end
	end
  return true
end

--printer
local function printScreen(a)
	for i = 1, N do
		for j = 1, N do
			io.write(a[i] == j and "Q" or "-"," ")
		end
		io.write("\n")
	end
	io.write("\n")
end

--closure to hold a solved flag
local function queenclose()
	local solved = false
	--add to board 'a' all queens from 'n' to 'N'
	local function addqueen (a,n)
		if n > N then
			solved = true
			printScreen(a)
		elseif solved == false then
			for c = 1, N do
				if isplaceok(a, n, c) then
					a[n] = c -- put nth queen at 'c'
					addqueen(a, n+1) --recurse
				end
			end
		end
	end
	return addqueen
end

--go 
queenclose()({},1)

