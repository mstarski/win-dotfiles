function ColorMyPencils(color)
	color = color or "rose-pine"

	if color == "codedark" then
		vim.g.codedark_term256 = 1
	end

	if color == "astrotheme" then
		require("astrotheme").setup()

		vim.g.t_Co = 256
		vim.g.term = "screen-256color"
		vim.g.t_ut = nil
		vim.opt.termguicolors = true
		vim.cmd.colorscheme("astrotheme")
	end

	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

ColorMyPencils("rose-pine")
