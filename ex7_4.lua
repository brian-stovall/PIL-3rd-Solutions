function allsubs(text)
	local s = 1
	local e = #text

	return function()
		if s > e+1 then return (nil) 
		else 
		
			word = string.sub(text, s, e)
			s = s+1
		
			if s > e then
				s = 1
				e = e-1
			end

			if #word > 0 then return(word) end
		end
	end
end

for word in allsubs("how's it going freak") do print (word) end		
