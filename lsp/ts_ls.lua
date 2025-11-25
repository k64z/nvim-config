return {
	init_options = {
		hostInfo = 'neovim'
	},
	cmd = {
		"typescript-language-server", "--stdio",
	},
	filetypes = {
		"javascript", "typescript"
	},
	root_markers = {
		"package.json", "tsconfig.json"
	},
}
