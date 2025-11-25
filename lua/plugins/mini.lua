return {
    "nvim-mini/mini.nvim",
    version = false,
    config = function()
        -- mini.icons - Icon provider
        require("mini.icons").setup()

        -- mini.git - Git integration
        require("mini.git").setup()

        -- mini.diff - Visualize git diff
        require("mini.diff").setup({
            view = {
                style = 'sign',
                signs = { add = '+', change = '~', delete = '-' },
            },
        })

        -- mini.pairs - Auto-pair brackets, quotes, etc.
        require("mini.pairs").setup({
            modes = { insert = true, command = false, terminal = false },
            mappings = {
                ['('] = { action = 'open', pair = '()', neigh_pattern = '[^\\].' },
                ['['] = { action = 'open', pair = '[]', neigh_pattern = '[^\\].' },
                ['{'] = { action = 'open', pair = '{}', neigh_pattern = '[^\\].' },

                [')'] = { action = 'close', pair = '()', neigh_pattern = '[^\\].' },
                [']'] = { action = 'close', pair = '[]', neigh_pattern = '[^\\].' },
                ['}'] = { action = 'close', pair = '{}', neigh_pattern = '[^\\].' },

                ['"'] = { action = 'closeopen', pair = '""', neigh_pattern = '[^\\].', register = { cr = false } },
                ["'"] = { action = 'closeopen', pair = "''", neigh_pattern = '[^%a\\].', register = { cr = false } },
                ['`'] = { action = 'closeopen', pair = '``', neigh_pattern = '[^\\].', register = { cr = false } },
            },
        })

        -- mini.statusline
        local statusline = require("mini.statusline")

        -- Custom section for LSP
        local section_lsp = function()
            local clients = vim.lsp.get_clients({ bufnr = 0 })
            if #clients == 0 then return '' end
            local names = vim.tbl_map(function(c) return c.name end, clients)
            return ' ' .. table.concat(names, ',')
        end

        statusline.setup({
            use_icons = true,
            set_vim_settings = false,
            content = {
                active = function()
                    local mode, mode_hl = statusline.section_mode({ trunc_width = 120 })
                    local git = statusline.section_git({ trunc_width = 40 })
                    local diff = statusline.section_diff({ trunc_width = 75 })
                    local diagnostics = statusline.section_diagnostics({ trunc_width = 75 })
                    local filename = statusline.section_filename({ trunc_width = 140 })
                    local fileinfo = statusline.section_fileinfo({ trunc_width = 120 })
                    local location = statusline.section_location({ trunc_width = 75 })

                    return statusline.combine_groups({
                        { hl = mode_hl, strings = { mode } },
                        { hl = 'MiniStatuslineDevinfo', strings = { git, diff, diagnostics } },
                        '%<',
                        { hl = 'MiniStatuslineFilename', strings = { filename } },
                        '%=',
                        { hl = 'MiniStatuslineFileinfo', strings = { section_lsp(), fileinfo } },
                        { hl = mode_hl, strings = { location } },
                    })
                end,
            },
        })

        -- Global statusline
        vim.opt.laststatus = 3
    end,
}
