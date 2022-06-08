require("autosave").setup({
    enabled = true
    , events = {"InsertLeave", "TextChanged"}
    , execution_message = ""
    , conditions = {
        exists = true
        , filename_is_not = {}
        , filetype_is_not = {}
        , modifiable = true
    }
    , write_all_buffers = true
    , on_off_commands = false
    , clean_command_line_interval = 0
    , debounce_delay = 135
})
