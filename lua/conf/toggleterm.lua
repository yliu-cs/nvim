local Toggleterm = require("toggleterm")
Toggleterm.setup({
    start_in_insert = true
    , size = 6
    , on_open = function()
        vim.cmd("setlocal nospell")
    end
})
local Terminal = require("toggleterm.terminal").Terminal
local function inInsert()
    vim.keybinds.dgmap("t", "<Esc>")
end
local floatTerm = Terminal:new({
    hidden = true
    , direction = "float"
    , float_opts = {
        border = "double"
    }
    , on_open = function(term)
        inInsert()
        vim.keybinds.bmap(term.bufnr, "t", "<Esc>", "<C-\\><C-n>:close<CR>", vim.keybinds.opts)
    end
    , on_close = function()
        vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
    end
})
local lazyGit = Terminal:new({
    cmd = "lazygit"
    , hidden = true
    , direction = "float"
    , float_opts = {
        border = "double"
    }
    , on_open = function(term)
        inInsert()
        vim.keybinds.bmap(term.bufnr, "i", "q", "<cmd>close<CR>", vim.keybinds.opts)
    end
    , on_close = function()
        vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
    end
})
Toggleterm.float_toggle = function()
    floatTerm:toggle()
end
Toggleterm.lazygit_toggle = function()
    lazyGit:toggle()
end
vim.keybinds.gmap("t", "<Esc>", "<C-\\><C-n>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>tt", "<cmd>exe v:count.'ToggleTerm'<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>tf", "<cmd>lua require('toggleterm').float_toggle()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>tg", "<cmd>lua require('toggleterm').lazygit_toggle()<CR>", vim.keybinds.opts)
vim.keybinds.gmap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", vim.keybinds.opts)
