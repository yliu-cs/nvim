local lspkind = require("lspkind")
local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end
    }
    , sources = cmp.config.sources(
        {
            {name = "vsnip"}
            , {name = "nvim_lsp"}
            , {name = "path"}
            , {name = "buffer"}
            , {name = "cmdline"}
            , {name = "spell"}
            , {name = "cmp_tabnine"}
        }
    )
    , formatting = {
        format = lspkind.cmp_format({
            with_text = true
            , maxwidth = 50
            , before = function(entry, vim_item)
                vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
                return vim_item
            end
        })
    }
    , sorting = {
        comparators = {
            cmp.config.compare.offset
            , cmp.config.compare.exact
            , cmp.config.compare.score
            , cmp.config.compare.recently_used
            , require("cmp-under-comparator").under
            , require("cmp_tabnine.compare")
            , cmp.config.compare.kind
            , cmp.config.compare.sort_text
            , cmp.config.compare.length
            , cmp.config.compare.order
        }
    }
    , mapping = {
        ["<C-p>"] = cmp.mapping.select_prev_item()
        , ["<C-n>"] = cmp.mapping.select_next_item()
        , ["<CR>"] = cmp.mapping.confirm()
        , ["<C-k>"] = cmp.mapping({
            i = function()
                if cmp.visible() then
                    cmp.abort()
                else
                    cmp.complete()
                end
            end
            , c = function()
                if cmp.visible() then
                    cmp.close()
                else
                    cmp.complete()
                end
            end
        })
        , ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({behavior = cmp.SelectBehavior.Select})
                end
                cmp.confirm()
            else
                fallback()
            end
        end
        , {"i", "s", "c"}
        )
    }
})
cmp.setup.cmdline(
    "/", {
        sources = {
            {name = "buffer"}
        }
    }
)
cmp.setup.cmdline(
    ":", {
        sources = cmp.config.sources({
            {name = "path"}
        }, {
            {name = "cmdline"}
        })
    }
)
