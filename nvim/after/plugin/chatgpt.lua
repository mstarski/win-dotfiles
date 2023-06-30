require("chatgpt").setup({
	api_key_cmd = "gpg -d " .. os.getenv("HOME") .. "/.config/openapi-key.txt.asc",
})
