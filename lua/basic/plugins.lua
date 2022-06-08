vim.cmd [[packadd packer.nvim]]
require('packer').startup({
    function(use)
        use "wbthomason/packer.nvim"
        use "yianwillis/vimcdoc"
        use {
            "kyazdani42/nvim-tree.lua"
            , requires = {
                "kyazdani42/nvim-web-devicons"
            }
            , config = function()
                require("conf.nvim-tree")
            end
        }
        use {
            "catppuccin/nvim"
            , as = "catppuccin"
            , config = function()
                require("conf.catppuccin")
            end
        }
        use {
            "windwp/windline.nvim"
            , config = function()
                require("conf.windline")
            end
        }
        use {
            "lewis6991/gitsigns.nvim"
            , requires = {
                "nvim-lua/plenary.nvim"
            }
            , config = function()
                require("conf.gitsigns")
            end
        }
        use {
            "akinsho/bufferline.nvim"
            , requires = {
                "famiu/bufdelete.nvim"
            }
            , config = function()
                require("conf.bufferline")
            end
        }
        use {
            "kevinhwang91/nvim-hlslens"
            , config = function()
                require("conf.nvim-hlslens")
            end
        }
        use {
            "lukas-reineke/indent-blankline.nvim"
            , config = function()
                require("conf.indent-blankline")
            end
        }
        use {
            "windwp/nvim-autopairs"
            , config = function()
                require("conf.nvim-autopairs")
            end
        }
        use {
            "RRethy/vim-illuminate"
            , config = function()
                require("conf.vim-illuminate")
            end
        }
        use {
            "lewis6991/spellsitter.nvim"
            , config = function()
                require("conf.spellsitter")
            end
        }
        use {
            "Pocco81/AutoSave.nvim"
            , config = function()
                require("conf.auto-save")
            end
        }
        use {
            "petertriho/nvim-scrollbar"
            , config = function()
                require("conf.nvim-scrollbar")
            end
        }
        use {
            "akinsho/toggleterm.nvim"
            , config = function()
                require("conf.toggleterm")
            end
        }
        use {
            "mbbill/undotree"
            , config = function()
                require("conf.undotree")
            end
        }
        use {
            "folke/which-key.nvim"
            , config = function()
                require("conf.which-key")
            end
        }
        use {
            "rcarriga/nvim-notify"
            , config = function()
                require("conf.nvim-notify")
            end
        }
        use {
            "folke/todo-comments.nvim"
            , config = function()
                require("conf.todo-comments")
            end
        }
        use {
            "neovim/nvim-lspconfig"
            , config = function()
                require("conf.nvim-lspconfig")
            end
        }
        use {
            "williamboman/nvim-lsp-installer"
            , config = function()
                require("conf.nvim-lsp-installer")
            end
        }
        use {
            "tami5/lspsaga.nvim"
            , config = function()
                require("conf.lspsaga")
            end
        }
        use {
            "j-hui/fidget.nvim"
            , config = function()
                require("conf.fidget")
            end
        }
        use {
            "ray-x/lsp_signature.nvim"
            , config = function()
                require("conf.lsp-signature")
            end
        }
        use {
            "kosayoda/nvim-lightbulb"
            , config = function()
                require("conf.nvim-lightbulb")
            end
        }
        use {
            "hrsh7th/nvim-cmp"
            , requires = {
                {"onsails/lspkind-nvim"}
                , {"hrsh7th/vim-vsnip"}
                , {"hrsh7th/cmp-vsnip"}
                , {"hrsh7th/cmp-nvim-lsp"}
                , {"hrsh7th/cmp-path"}
                , {"hrsh7th/cmp-buffer"}
                , {"hrsh7th/cmp-cmdline"}
                , {"f3fora/cmp-spell"}
                , {"rafamadriz/friendly-snippets"}
                , {"lukas-reineke/cmp-under-comparator"}
                , {"tzachar/cmp-tabnine", run = "./install.sh"}
            }
            , config = function()
                require("conf.nvim-cmp")
            end
        }
        use {
            "nvim-treesitter/nvim-treesitter"
            , run = {":TSupdate"}
            , requires = {
                "p00f/nvim-ts-rainbow"
            }
            , config = function()
                require("conf.nvim-treesitter")
            end
        }
        use {
            "numToStr/Comment.nvim"
            , requires = {
                "JoosepAlviste/nvim-ts-context-commentstring"
            }
            , config = function()
                require("conf.comment")
            end
        }
    end
    , config = {
        display = {
            open_fn = require("packer.util").float
        }
    }
})
vim.cmd([[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerCompile
    augroup end
]])
