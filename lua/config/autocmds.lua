-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local osname = vim.loop.os_uname().sysname
local i, j = string.find(osname, "Windows")
if i then
    LazyVim.terminal.setup("pwsh")

    local aug = vim.api.nvim_create_augroup("Powershell", { clear = true })
    vim.api.nvim_create_autocmd({ "BufWinEnter", "WinEnter", "TermOpen" }, {
    group = aug,
    pattern = "term://*",
    callback = function()
        vim.cmd.startinsert()
    end,
    })
end