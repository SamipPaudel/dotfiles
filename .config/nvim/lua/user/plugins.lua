-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})


return packer.startup(function(use)
	-- My plugins here


	use 'wbthomason/packer.nvim'
	use 'nvim-lua/plenary.nvim'
	use({

		'nvim-lualine/lualine.nvim',
		config = function()
			require('user.plugins.lualine')
		end,
	}) 
	use({

		"catppuccin/nvim",
		config = function()
			require('user.plugins.catppuccin')
		end,
	}) 

    use({

        "ellisonleao/gruvbox.nvim",
        config = function()
            require('user.plugins.gruvbox')
        end,
    }) 

    use({

        "neovim/nvim-lspconfig",
        config = function()
            require('user.plugins.lsp.servers')
        end,
        requires = {
            {
            'hrsh7th/cmp-nvim-lsp',
            },
        },
    })
    use({
            'kyazdani42/nvim-web-devicons',
            config = function()
                require('nvim-web-devicons').setup()
            end,
        })
    use({
            'lewis6991/gitsigns.nvim',
            event = 'BufRead',
            config = function()
                require('user.plugins.gitsigns')
            end,
        })
    use({
            'rhysd/git-messenger.vim',
            event = 'BufRead',
            config = function()
                require('user.plugins.git-messenger')
            end,
        })
    use({
            'phaazon/hop.nvim',
            event = 'BufRead',
            config = function()
                require('user.plugins.hop')
            end,
        })
    use({
            'lukas-reineke/indent-blankline.nvim',
            event = 'BufRead',
            config = function()
                require('user.plugins.indentline')
            end,
        })
    use({
            'norcalli/nvim-colorizer.lua',
            event = 'CursorHold',
            config = function()
                require('colorizer').setup()
            end,
        })
    use({
            'karb94/neoscroll.nvim',
            event = 'WinScrolled',
            config = function()
                require('neoscroll').setup({ hide_cursor = false })
            end,
        })

    use({
            'kyazdani42/nvim-tree.lua',
            event = 'CursorHold',
            config = function()
                require('user.plugins.nvim-tree')
            end,
        })
    use({
            'tpope/vim-surround',
            event = 'BufRead',
            requires = {
                {
                    'tpope/vim-repeat',
                    event = 'BufRead',
                },
            },
        })
    use({
            'numToStr/Comment.nvim',
            event = 'BufRead',
            config = function()
                require('user.plugins.comment')
            end,
        })

        use({
            'wellle/targets.vim',
            event = 'BufRead',
        })

        use({
            'AndrewRadev/splitjoin.vim',
            -- NOTE: splitjoin won't work with `BufRead` event
            event = 'CursorHold',
        })




    use({
            {
                'hrsh7th/nvim-cmp',
                event = 'InsertEnter',
                config = function()
                    require('user.plugins.lsp.nvim-cmp')
                end,
                requires = {
                    {
                        'L3MON4D3/LuaSnip',
                        event = 'InsertEnter',
                        config = function()
                            require('user.plugins.lsp.luasnip')
                        end,
                        requires = {
                            {
                                'rafamadriz/friendly-snippets',
                                event = 'CursorHold',
                            },
                        },
                    },
                },
            },
            { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
            { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
        })
    

     use({
            'windwp/nvim-autopairs',
            event = 'InsertCharPre',
            after = 'nvim-cmp',
            config = function()
                require('user.plugins.pairs')
            end,
        })

	use({
            {
                'nvim-treesitter/nvim-treesitter',
                event = 'CursorHold',
                run = ':TSUpdate',
                config = function()
                    require('user.plugins.treesitter')
                end,
            },
            { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-textobjects', after = 'nvim-treesitter' },
            { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },
            { 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' },
            { 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
        }) 

    use({
            {
                'nvim-telescope/telescope.nvim',
                event = 'CursorHold',
                config = function()
                    require('user.plugins.telescope')
                end,
            },
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                after = 'telescope.nvim',
                run = 'make',
                config = function()
                    require('telescope').load_extension('fzf')
                end,
            },
            {
                'nvim-telescope/telescope-symbols.nvim',
                after = 'telescope.nvim',
            },
        })



end
)