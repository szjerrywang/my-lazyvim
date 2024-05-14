
return {
    'E-ricus/lsp_codelens_extensions.nvim',
    -- version = false,
    -- lazy = false,
    dependencies = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap" },
    config = function ()
      require("codelens_extensions").setup()
    end,
}