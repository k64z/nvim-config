return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    opts = {
        formatters_by_ft = {
            go = { "goimports" },
            sql = { "pg_format" },
        },
        formatters = {
            pg_format = {
                command = "pg_format",
                args = { "-" },
            },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        }
    },
}
