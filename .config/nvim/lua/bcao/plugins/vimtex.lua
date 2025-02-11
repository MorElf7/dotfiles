return {
    "lervag/vimtex",
    -- enabled = false,
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
        vim.g.vimtex_mappings_disable = { ["n"] = { "K" } } -- disable `K` as it conflicts with LSP hover
        vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
        vim.g.vimtex_compiler_latexmk = {
            out_dir = "./latexbuild",
            aux_dir = "./latexbuild",
        }
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_compiler_method = "latexmk"
    end,
}
