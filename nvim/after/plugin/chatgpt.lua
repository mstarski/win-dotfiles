require("chatgpt").setup({
	api_key_cmd = "gpg -d " .. os.getenv("HOME") .. "/.config/nvim/apikeys/openapi-key.txt.asc",
})
