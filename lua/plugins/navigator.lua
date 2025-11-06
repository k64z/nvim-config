return {
	"numToStr/Navigator.nvim",
	config = function()
		require("Navigator").setup({
			-- Disable the default mappings to avoid conflicts
			auto_save = "current",
			disable_on_zoom = false,
		})

		-- Set up keybindings for navigation
		vim.keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>", { desc = "Navigate Left" })
		vim.keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>", { desc = "Navigate Right" })
		vim.keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>", { desc = "Navigate Up" })
		vim.keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>", { desc = "Navigate Down" })
		vim.keymap.set({ "n", "t" }, "<C-p>", "<CMD>NavigatorPrevious<CR>", { desc = "Navigate Previous" })
	end,
}
