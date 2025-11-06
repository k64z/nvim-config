vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = false
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.winborder = "solid" -- https://neovim.io/doc/user/options.html#'winborder'


-- Basic indentation settings
vim.opt.tabstop = 4        -- Number of spaces a tab displays as
vim.opt.shiftwidth = 4     -- Spaces for indentation
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.autoindent = true  -- Copy indent from current line
vim.opt.smartindent = true -- Smart autoindenting

-- Optional
vim.opt.softtabstop = 4 -- Spaces inserted when pressing Tab
