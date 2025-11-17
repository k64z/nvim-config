local function lsp_clients()
    local clients = vim.lsp.get_clients({ bufnr = 0 })
    if #clients == 0 then
        return ' No LSP'
    end

    local names = {}
    for _, client in ipairs(clients) do
        table.insert(names, client.name)
    end

    return '  ' .. table.concat(names, ', ')
end

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = 'kanagawa',
            component_separators = { left = '|', right = '|' },
            section_separators = { left = '', right = '' },
            icons_enabled = true,
            globalstatus = true,
        },
        sections = {
            lualine_a = { 'mode' },
            lualine_b = { 'branch', 'diff', 'diagnostics' },
            lualine_c = { 'filename' },
            lualine_x = {
                { lsp_clients, coloer = { gui = 'bold' } },
                'encoding',
                'fileformat',
                'filetype'
            },
            lualine_y = { 'progress' },
            lualine_z = { 'location' }
        },
    },
}
