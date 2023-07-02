-- Check if ~/.secrets/openapi file exists
local home = vim.fn.expand("$HOME")

if vim.fn.filereadable(home .. "/.secrets/openapi") == 0 then
	return
end

require("chatgpt").setup({
	api_key_cmd = "gpg -d " .. os.getenv("HOME") .. "/.secrets/openapi",
})
