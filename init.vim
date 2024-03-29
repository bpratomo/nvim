syntax on
set so=999
set cursorline
set nocompatible            " disable compatibility to old-time vi
set clipboard+=unnamedplus 
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
filetype plugin indent on   " allows auto-indenting depending on file type
set tabstop=4               " number of columns occupied by a tab character
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set cmdheight=1
set updatetime=300
set splitright 
set splitbelow

let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim','dart']

call plug#begin('~/.config/nvim/plugged')
"Themes
Plug 'sainnhe/everforest'            "Theme"
Plug 'morhetz/gruvbox'
Plug 'rose-pine/neovim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'savq/melange'
Plug 'eddyekofo94/gruvbox-flat.nvim'
"Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-live-grep-args.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

"LSP & Completions
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'williamboman/mason.nvim'        "LSP Installer'"
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dart-lang/dart-vim-plugin'
Plug 'akinsho/flutter-tools.nvim'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'
Plug 'j-hui/fidget.nvim'

" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'

"  Snippets
Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'VonHeikemen/lsp-zero.nvim'

"Utilities
Plug 'ggandor/leap.nvim'
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}
Plug 'renerocksai/telekasten.nvim'   "Note taking addon"
Plug 'renerocksai/calendar-vim'      "goes with telekasten"
Plug 'mhinz/vim-startify'
Plug 'lewis6991/gitsigns.nvim'
Plug 'crispgm/nvim-tabline'
Plug 'pwntester/octo.nvim'
Plug 'ellisonleao/glow.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"
"Editing
Plug 'windwp/nvim-autopairs' "Add new row automatically when new line in brackets"
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'

"Visual addons
Plug 'lukas-reineke/indent-blankline.nvim' 
Plug 'TaDaa/vimade'                   "Highlight active window"
Plug 'nvim-lualine/lualine.nvim'
Plug 'danilamihailov/beacon.nvim'   "Add visibility when cursor moves"

call plug#end()

"==============================================================================
" THEMES
"==============================================================================
" set bg=light
" colorscheme melange
colorscheme gruvbox
" colorscheme everforest
" colorscheme rose-pine
" colorscheme gruvbox-flat


"==============================================================================
" GENERAL KEY BINDINGS (No plugins )
"==============================================================================

"keybindings for editing
inoremap jk <ESC>
let mapleader=" "
"switch tabs 
nnoremap H gT
nnoremap L gt
" use alt+hjkl to move between split/vsplit panels
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap no :nohl<CR>

"==============================================================================
" LSP KEY BINDINGS
"==============================================================================

" Show hover
nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <leader>rn <Cmd>lua vim.lsp.buf.rename()<CR>
nnoremap gD <Cmd>lua vim.lsp.buf.declaration()<CR>
" Open code actions using the default lsp UI, if you want to change this please see the plugins above
nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
" Open code actions for the selected visual range
xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
nnoremap <leader>fo <Cmd>lua vim.lsp.buf.formatting()<CR>
" Diagnostics

nnoremap ]d <Cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap [d <Cmd>lua vim.diagnostic.goto_prev()<CR>

"==============================================================================
" TELESCOPE KEY BINDINGS
"==============================================================================
"Pickers
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fG <cmd>lua require('telescope.builtin').grep_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>fs <cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>
nnoremap <leader>fb <Cmd>lua require('telescope.builtin').buffers()<CR>

" LSP pickers
nnoremap gd <Cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap gr <Cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap ge <Cmd>lua require('telescope.builtin').diagnostics({bufnr=0})<CR>
nnoremap gE <Cmd>lua require('telescope.builtin').diagnostics()<CR>
nnoremap gim <Cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap go <Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>
nnoremap gO <Cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>


lua <<EOF
--=============================================================================
--INITIALIZATIONS
--=============================================================================
require('glow').setup({
})
require('fidget').setup{}
require('octo').setup{}
require('gitsigns').setup{
current_line_blame=true
}
--require('tabline').setup({})
require("nvim-autopairs").setup {}
require('leap').add_default_mappings()

require('tabline').setup({})
require('lualine').setup{
options={
theme= "gruvbox",
}
}
require("toggleterm").setup{
-- size=60,
open_mapping= [[<c-t>]],
direction='float'
}

--=============================================================================
-- FLUTTER TOOLS
--=============================================================================

require('flutter-tools').setup{
outline = {
    auto_open=true
    },
widget_guides = {
    enabled = true,
  },

lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
}
    
}
--=============================================================================
--INDENT BLANKLINE
--=============================================================================
vim.opt.termguicolors = true
--IndentBlankLine configs
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}
--=============================================================================
-- TREESITTER
--=============================================================================

 require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "lua", "rust" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
--=============================================================================
-- LSP 
--=============================================================================
local lsp = require('lsp-zero')
lsp.preset('recommended')
lsp.setup()

--=============================================================================
-- TELESCOPE
--=============================================================================
local present, telescope = pcall(require, "telescope")

if not present then
   return
end
local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.90,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },
extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
["ui-select"] = {
    require("telescope.themes").get_cursor{}
},},
  extensions_list = { "themes", "terms" },
}
   if override_flag then
      default = require("core.utils").tbl_override_req("telescope", default)
   end

   telescope.setup(options)

   local extensions = { "themes", "terms", "fzf"}

   pcall(function()
      for _, ext in ipairs(extensions) do
         telescope.load_extension(ext)
      end
   end)
