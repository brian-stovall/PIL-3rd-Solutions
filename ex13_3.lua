
local t = {1,2,4, foobly = 66}

local _t = t

t = {}

local mt = {
	__index = function(t,k)
		print("*access to element " .. tostring(k))
		return _t[k]
	end,

	__newindex = function(t,k,v)
		print("*update of element " .. tostring(k) ..
				  " to " .. tostring(v))
		_t[k] = v
	end,

	__pairs = function()
		return function(_, k)
			return next(_t, k)
		end
	end,
	
	__ipairs = function()
		local i = 0
		return function()
			i = i+1
			if i > #_t or _t[i] == nil then return nil
			else
				return i, _t[i]
			end
		end
	end
}

setmetatable(t, mt)

t[1] = nil

for _, v in ipairs(t) do
	print(v)
end

