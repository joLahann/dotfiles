" Plugins {{{1
call plug#begin("~/.cache/nvim/vim-plug")
Plug 'junegunn/seoul256.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'chrisbra/Colorizer'
Plug 'tbastos/vim-lua'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'szw/vim-maximizer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'kassio/neoterm'
Plug 'tpope/vim-commentary'
Plug 'sbdchd/neoformat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'neovim/nvim-lspconfig'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'gruvbox-community/gruvbox'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'

" For vsnip user.
Plug 'hrsh7th/cmp-vsnip'

" For luasnip user.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips user.
" Plug 'SirVer/ultisnips'
" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
" look into telescope
call plug#end()


" Default options {{{1
set exrc " source local .vimrc
set relativenumber
set noerrorbells
set number
set nohlsearch
set hidden
set completeopt=menu,menuone,noinsert,noselect
set nowrap
set mouse=a
set splitright
set splitbelow
" Tab options
set expandtab
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set incsearch
" Backup & History
set noswapfile
set diffopt+=vertical
set foldmethod=marker
set nobackup
set nowritebackup
set undofile
set undodir=~/.vim/undodir
set scrolloff=30
set cmdheight=1
set shortmess+=c
set noshowmode
set colorcolumn=120
set signcolumn=yes
set updatetime=50
set clipboard=unnamedplus
set listchars=tab:▸\ ,trail:·
set cmdheight=2
filetype plugin indent on
let mapleader=','
if (has("termguicoloars"))
	set termguicolors
endif
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript','js=javascript','json=javascript']

colorscheme gruvbox
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE
" Plugin config {{{1

" itchyny/lightline.vim
let g:lightline = {
      \ 'colorscheme': 'codedark',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch','readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ }



" kassio/neoterm
let g:neoterm_default_mod = 'vertical'
let g:neoterm_size = 60
let g:neoterm_autoinsert =1

" junegunn/fzf.vim
let g:fzf_layout = { 'down':  '50%'}

" nvim-tree
lua require'nvim-tree'.setup{}



lua << EOF
-- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        -- vim.fn["vsnip#anonymous"](args.body)

        -- For `luasnip` user.
        -- require('luasnip').lsp_expand(args.body)

        -- For `ultisnips` user.
        -- vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },

      -- For vsnip user.
      { name = 'vsnip' },

      -- For luasnip user.
      -- { name = 'luasnip' },

      -- For ultisnips user.
      -- { name = 'ultisnips' },

      { name = 'buffer' },
    }
  })
EOF

" neovim/nvim-lspconfig

lua require'lspconfig'.pyright.setup{ capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) }
lua require'lspconfig'.tsserver.setup{}
" lua require'lspconfig'.sumneko_lua.setup{}

" Key Mappings {{{1

nn <leader>ev :e $MYVIMRC<cr>
nn <leader>sv :source $MYVIMRC<cr>
nn L $
nn H 0
nn <leader>d :bd<cr>
nn <leader>v :vnew<cr>
nn <leader>M :MaximizerToggle!<cr>
nn <space> za

nn <c-q> :Ttoggle<cr>
inoremap <c-q> <esc>:Ttoggle<cr>
tnoremap <c-q> <c-\><c-n>:Ttoggle<cr>

nn <leader>F :Neoformat prettier<cr>

nnoremap gf :FZF --query <cfile><CR>
" vnoremap P "0p
" nn P "0p
nn <leader>ff :FZF<cr>
nn <leader>fd :FZFDirs<cr>
nn <leader>fa :Ag 
nn <leader>t :TagsForWordUnderCursor<cr>
nn <leader>ft :Tags<cr>
imap <c-x><c-n> <plug>(fzf-complete-path)

" fugitive
nn <leader>gg :G<cr>

nn <silent> gd <cmd> lua vim.lsp.buf.definition()<cr>
nn <silent> gh <cmd> lua vim.lsp.buf.hover()<cr>
nn <silent> gH <cmd> lua vim.lsp.buf.code_action()<cr>
nn <silent> gD <cmd> lua vim.lsp.buf.implementation()<cr>
nn <silent> <c-k> <cmd> lua vim.lsp.buf.signature_help()<cr>
nn <silent> gr <cmd> lua vim.lsp.buf.references()<cr>
nn <silent> gR <cmd> lua vim.lsp.buf.rename()<cr>


" Nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
 
nnoremap <leader>cc <plug>Colorizer
