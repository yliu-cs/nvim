return {
    root_dir = function()
        return vim.fn.getcwd()
    end
    , handlers = {
        ["textDocument/publishDiagnostics"] = function(...)
        end
    }
    , settings = {
        python = {
            analysis = {
                typeCheckingMode = "off"
            }
        }
    }
}
