" Plugins '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
call plug#begin()

Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'powerline/powerline'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
"Plug 'SirVer/ultisnips'
Plug 'skanehira/preview-markdown.vim'
Plug 'terroo/vim-simple-emoji'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
Plug 'Xuyuanp/nerdtree-git-plugin'

if (has("nvim"))
    " Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'fannheyward/telescope-coc.nvim'
    Plug 'olacin/telescope-cc.nvim'
    Plug 'olacin/telescope-gitmoji.nvim'
    Plug 'smartpde/telescope-recent-files'
    Plug 'LukasPietzschmann/telescope-tabs'
    Plug 'rcarriga/nvim-notify'
    Plug 'LinArcX/telescope-ports.nvim'
    Plug 'EthanJWright/vs-tasks.nvim'
endif

call plug#end()

"let g:preview_markdown_parser = 'glow'
let g:preview_markdown_auto_update = 1

" Global Sets '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
filetype indent on   " Load the indent file for the file type, if any
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
set autoread         " Update vim after file update from outside
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
"set cmdheight=2      " Give more space for displaying messages
set encoding=utf-8   " The encoding should be utf-8 to activate the font icons
set expandtab        " On pressing tab, insert 4 spaces
set guifont=Hack:12  " Set NerdFont for dev-icons
set hidden           " Hides the current buffer when a new file is openned
set ignorecase       " Ingore case in search
set incsearch        " Incremental search
set mouse=a          " Enable mouse support
set nobackup         " No backup files
set nowritebackup    " No backup files
set nu               " Enable line numbers
set scrolloff=8      " Minimum number of lines to keep above and below the cursor
set shiftwidth=4     " When indenting with '>', use 4 spaces width
set signcolumn=yes   " Add a column on the left. Useful for linting
set smartcase        " Consider case if there is a upper case character
set smartindent      " Automatically inserts one extra level of indentation in some cases
set smarttab         " insert tabs on the start of a line according to shiftwidth
set softtabstop=4    " Show existing tab with 4 spaces width
set splitbelow       " Create the horizontal splits below
set splitright       " Create the vertical splits to the right
set tabstop=4        " Show existing tab with 4 spaces width
set updatetime=100   " Time in miliseconds to consider the changes
syntax on            " Enable syntax highlight

" Theme '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
let g:sonokai_style = 'andromeda'
let g:sonokai_enable_italic = 2
let g:sonokai_disable_italic_comment = 0
let g:sonokai_diagnostic_line_highlight = 1
let g:sonokai_current_word = 'bold'
colorscheme sonokai

" Remaps ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
map q :quit<CR>
map <C-s> :write<CR>
map <C-t> :terminal<CR>
nmap <C-a> :NERDTreeToggle<CR>

" Shortcuts for split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Navigate between buffers
nmap ty :bn<CR>
nmap tr :bp<CR>

" Delete a buffer
nmap td :bd<CR>

" Create splits
nmap th :split<CR>
nmap tv :vsplit<CR>

" Close splits and others
nmap tt :q<CR>

" Call command shortcut
nmap tc :!

" NerdTree ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:NERDTreeGitStatusUseNerdFonts = 1

" autocmd '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
function! HighlightWordUnderCursor()
    if getline(".")[col(".")-1] !~# '[[:punct:][:blank:]]'
        exec 'match' 'Search' '/\V\<'.expand('<cword>').'\>/'
    else
        match none
    endif
endfunction
autocmd! CursorHold,CursorHoldI * call HighlightWordUnderCursor()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" AirLine '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:airline_theme = 'sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols = {}
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty='⚡'

" ALE '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:ale_linters = {
\}
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}
let g:ale_fix_on_save = 1

" coc config ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:coc_global_extensions = [
\   'coc-marketplace',
\   'coc-snippets',
\   'coc-explorer',
\   'coc-pairs',
\   'coc-lightbulb',
\   'coc-git',
\   'coc-nav',
\   'coc-sh',
\   'coc-java',
\   'coc-clangd',
\   'coc-cmake',
\   'coc-tsserver',
\   'coc-docker',
\   'coc-lua',
\   'coc-yaml',
\   'coc-json',
\   'coc-html',
\   'coc-css',
\   'coc-markdownlint',
\   'coc-webview',
\   'coc-markdown-preview-enhanced'
\]

" Coc Snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"inoremap <silent><expr> <TAB>
"      \ coc#pum#visible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ CheckBackspace() ? "\<TAB>" :
"      \ coc#refresh()
inoremap <expr> <TAB> coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
inoremap <expr> <S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"
inoremap <expr> <ESC> coc#pum#visible() ? coc#pum#cancel() : "\<ESC>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc Explrorer
:nnoremap <space>e :CocCommand explorer<CR>

let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }

" Use preset argument to open it
nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets

" Nvim specific configs ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
if (has("nvim"))
    highlight Normal guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE

    " Telescope
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <Leader>ta :lua require("telescope").extensions.vstask.tasks()<CR>
    nnoremap <Leader>ti :lua require("telescope").extensions.vstask.inputs()<CR>
    nnoremap <Leader>th :lua require("telescope").extensions.vstask.history()<CR>
    nnoremap <Leader>tl :lua require('telescope').extensions.vstask.launch()<cr>
endif
