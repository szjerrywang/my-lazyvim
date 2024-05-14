return {
    {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        }
    },
    config = function(_, opts)
        require 'nvim-treesitter.install'.compilers = { "cl", "clang", "gcc" }
        if type(opts.ensure_installed) == "table" then
          ---@type table<string, boolean>
          local added = {}
          opts.ensure_installed = vim.tbl_filter(function(lang)
            if added[lang] then
              return false
            end
            added[lang] = true
            return true
          end, opts.ensure_installed)
        end
        for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
            config.install_info.url = config.install_info.url:gsub("https://github.com/", "https://gh.idayer.com/https://github.com/")
        end
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
}