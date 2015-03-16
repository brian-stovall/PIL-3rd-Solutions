function concat_er (...)
	local retstr = ""
	for _, v in ipairs{...} do
		retstr = retstr .. v
	end
	return(retstr)
end

