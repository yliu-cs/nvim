require("nvim-tree").setup({
    view = {
        width = 40
        , height = 30
        , number = true
        , hide_root_folder = false
        , auto_resize = true
    }
    , diagnostics = {
        enable = true
        , icons = {
            hint = ""
        ,     info = ""
        ,     warning = ""
        ,     error = ""
        }
    }
    , git = {
        enable = true
        , ignore = true
        , timeout = 500
    }
})
vim.g.nvim_tree_icons = {
    default = " "
    , symlink = " "
    , git = {
        unstaged = ""
        , staged = "✓"
        , unmerged = ""
        , renamed = "➜"
        , untracked = ""
        , deleted = ""
        , ignored = ""
    }
    , folder = {
        arrow_open = ""
        , arrow_closed = ""
        , default = ""
        , open = ""
        , empty = ""
        , empty_open = ""
        , symlink = ""
        , symlink_open = ""
    }
}
vim.g.nvim_tree_add_trailing = 1
vim.keybinds.gmap("n", "<leader>1", "<cmd>NvimTreeToggle<CR>", vim.keybinds.opts)
