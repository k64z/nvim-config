vim.lsp.enable({
    "bashls",
    "cssls",
    "gopls",
    "lua_ls",
    "ts_ls",
    "angularls",
    "html",
})

vim.diagnostic.config({
    -- virtual_lines = true,
    virtual_text = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "ErrorMsg",
            [vim.diagnostic.severity.WARN] = "WarningMsg",
        },
    },
})

vim.api.nvim_create_user_command('LspStats', function()
    local clients = vim.lsp.get_clients()

    local lines = { '# LSP Status', '' }

    for _, client in ipairs(clients) do
        table.insert(lines, string.format('## %s (ID: %d)', client.name, client.id))
        table.insert(lines, string.format('  Root dir: %s', client.root_dir or 'N/A'))

        local attached_bufs = {}
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
            if vim.lsp.buf_is_attached(bufnr, client.id) then
                local bufname = vim.api.nvim_buf_get_name(bufnr)
                if bufname ~= '' then
                    table.insert(attached_bufs, vim.fn.fnamemodify(bufname, ':t'))
                end
            end
        end

        if #attached_bufs > 0 then
            table.insert(lines, string.format('  Attached buffers: %s', table.concat(attached_bufs, ', ')))
        else
            table.insert(lines, '  Attached buffers: none')
        end

        if client.server_capabilities then
            table.insert(lines, '  Capabilities: ' ..
                (client.server_capabilities.documentFormattingProvider and 'format ' or '') ..
                (client.server_capabilities.hoverProvider and 'hover ' or '') ..
                (client.server_capabilities.completionProvider and 'completion ' or '') ..
                (client.server_capabilities.definitionProvider and 'definition' or ''))
        end

        table.insert(lines, '')
    end

    -- Display in a floating window
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].filetype = 'markdown'

    local width = 80
    local height = math.min(#lines + 2, 40)
    vim.api.nvim_open_win(buf, true, {
        relative = 'editor',
        width = width,
        height = height,
        col = (vim.o.columns - width) / 2,
        row = (vim.o.lines - height) / 2,
        border = 'rounded',
        style = 'minimal',
    })

    -- vim.keymap.set('n', 'q', '<cmd>close<cr>', { buffer = buf })
end, {})
