local comment_string = require("ts_context_commentstring")
require("Comment").setup({
    toggler = {
        line = "gcc"
        , block = "gCC"
    }
    , opleader = {
        line = "gc"
        , block = "gC"
    }
    , extra = {
        above = "gcO"
        , below = "gco"
        , eol = "gcA"
    }
    , pre_hook = function(ctx)
        if vim.bo.filetype == "typescriptreact" then
            local U = require("Comment.utils")
            local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"
            local location = nil
            if ctx.ctype == U.ctype.block then
                location = comment_string.utils.get_cursor_location()
            elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
                location = comment_string.utils.get_visual_start_location()
            end
            return comment_string.calculate_commentstring(
                {
                    key = type
                    , location = location
                }
            )
        end
    end
})
