local proxInd = {}

local mt = {

		__index = function(a, k)
			return(a[proxInd][k])
		end,

		__newindex = function()
			error("table is read only!", 2)
		end
	}


function readOnly(t)
	local proxy = {}
	proxy[proxInd] = t 
		setmetatable(proxy, mt)
	return(proxy)
end

days = readOnly{"sun", 'mon', 'tue', 'wed' , 'thu', 'fri', 'sat'}

print(days[2])
days[3] = 'flarglesday'
