" Plugins ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
call plug#begin()

Plug 'dense-analysis/ale'
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', { 'branch' : 'release' }
Plug 'powerline/powerline'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
Plug 'skanehira/preview-markdown.vim'
Plug 'terroo/vim-simple-emoji'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wakatime/vim-wakatime'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'EdenEast/nightfox.nvim'
Plug 'uiiaoo/java-syntax.vim'
Plug 'tpope/vim-commentary'
"Plug 'jamestthompson3/nvim-remote-containers'

" Nvim specific plugins
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

" Global Sets ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
filetype indent on   " Load the indent file for the file type, if any
filetype on          " Detect and set the filetype option and trigger the FileType Event
filetype plugin on   " Load the plugin file for the file type, if any
set autoread         " Update vim after file update from outside
set colorcolumn=100  " Draws a line at the given line to keep aware of the line size
set cmdheight=2      " Give more space for displaying messages
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

" Autocmd ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Automatically enter in insert mode
"autocmd BufRead,BufNewFile * start

" Theme ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
colorscheme carbonfox

" Remaps '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
map q :quit<CR>
map <C-q> :quit<CR>
imap <C-q> <C-o>:quit<CR>
map <C-s> :write<CR>
imap <C-s> <C-o>:write<CR>
map <C-t> :terminal<CR>
nmap <C-a> :NERDTreeToggle<CR>

" Shortcuts for split navigation
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

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

" Resize horizontal split window
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+
" Resize vertical split window
nmap <C-Right> <C-W>><C-W>>
nmap <C-Left> <C-W><<C-W><

" Comment line(s)
nmap <C-c> :Commentary<CR>
xmap <C-c> :Commentary<CR>

" NerdTree '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:NERDTreeGitStatusUseNerdFonts = 1

" AirLine ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:airline_theme = 'minimalist'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
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

" ALE ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
let g:ale_linters = {
\}
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}
let g:ale_fix_on_save = 1

" Coc config '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Coc extensions
let g:coc_global_extensions = [
\   'coc-marketplace',
\   'coc-diagnostic',
\   'coc-snippets',
\   'coc-highlight',
\   'coc-symbol-line',
\   'coc-spell-checker',
\   'coc-cspell-dicts',
\   'coc-pairs',
\   'coc-lists',
\   'coc-lightbulb',
\   'coc-git',
\   'coc-nav',
\   'coc-explorer',
\   'coc-sh',
\   'coc-java',
\   'coc-clangd',
\   'coc-cmake',
\   'coc-tsserver',
\   'coc-docker',
\   'coc-lua',
\   'coc-vimlsp',
\   'coc-yaml',
\   'coc-json',
\   'coc-xml',
\   'coc-html',
\   'coc-css',
\   'coc-markdownlint',
\   'coc-webview',
\   'coc-markdown-preview-enhanced',
\   'coc-sql'
\]

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use ESC to close completion if visible
inoremap <expr> <ESC> coc#pum#visible() ? coc#pum#cancel() : "\<ESC>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying code actions to the selected code block
" Example: <`leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current))

" Remap keys for applying refactor code actions
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" Run the Code Lens action on the current line
nmap <leader>cl  <Plug>(coc-codelens-action)

" Commands
" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

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
xmap <leader>x <Plug>(coc-convert-snippet)

" Coc Explorer
nnoremap <space>x :CocCommand explorer<CR>

" Use preset argument to open it
nnoremap <space>ed :CocCommand explorer --preset .vim<CR>
nnoremap <space>ef :CocCommand explorer --preset floating<CR>
nnoremap <space>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <space>eb :CocCommand explorer --preset buffer<CR>

" List all presets
nnoremap <space>el :CocList explPresets<CR>

" Language specific configs ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
" Disable java variable highlight
highlight link javaIdentifier NONE

" Nvim specific configs ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
if (has("nvim"))
"    highlight Normal guibg=NONE ctermbg=NONE
"    highlight EndOfBuffer guibg=NONE ctermbg=NONE

    " Telescope
    nnoremap <leader>ff <cmd>Telescope find_files<cr>
    nnoremap <leader>fg <cmd>Telescope live_grep<cr>
    nnoremap <leader>fb <cmd>Telescope buffers<cr>
    nnoremap <leader>fh <cmd>Telescope help_tags<cr>
    nnoremap <Leader>ta :lua require("telescope").extensions.vstask.tasks()<CR>
    nnoremap <Leader>ti :lua require("telescope").extensions.vstask.inputs()<CR>
    nnoremap <Leader>th :lua require("telescope").extensions.vstask.history()<CR>
    nnoremap <Leader>tl :lua require('telescope').extensions.vstask.launch()<cr>

    " Lua configs
lua << EOF
  function _G.symbol_line()
      local curwin = vim.g.statusline_winid or 0
      local curbuf = vim.api.nvim_win_get_buf(curwin)
      local ok, line = pcall(vim.api.nvim_buf_get_var, curbuf, 'coc_symbol_line')
      return ok and line or ''
    end

    vim.o.tabline = '%!v:lua.symbol_line()'
    vim.o.statusline = '%!v:lua.symbol_line()'
    vim.o.winbar = '%!v:lua.symbol_line()'
EOF

endif

