vim.cmd([[
    if has("persistent_undo")
        let target_path = expand(undotree_dir)
        if !isdirectory(target_path)
            call mkdir(target_path, "p", 0700)
        endif
        let &undodir = target_path
        set undofile
]])
vim.keybinds.gmap("n", "<leader>3", ":UndotreeToggle<CR>", vim.keybinds.opts)
