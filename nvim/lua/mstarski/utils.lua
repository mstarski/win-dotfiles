local Utils = {}

function Utils.file_exists(name)
	return os.execute("test -f " .. os.getenv("HOME") .. name)
end

return Utils
