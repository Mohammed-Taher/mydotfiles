set nocompatible              						"We want the latest Vim settings/options.

set encoding=utf-8

syntax enable
set number
set backspace=indent,eol,start                                          "Make backspace behave like every other editor.
let mapleader = ',' 						    	"The default is \, but a comma is much better.
set noerrorbells visualbell t_vb=               			"No damn bells!
set autowriteall                                                        "Automatically write the file when switching buffers.
set complete=.,w,b,u 							"Set our desired autocompletion matching.
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
set lazyredraw
filetype plugin indent on
set mouse=a
set macmeta

set autoread                                                            "Set to auto read when a file is changed from the outside.
"-------------------Vim-Plug----------------------"
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'gosukiwi/vim-atom-dark'
"Plug 'honza/vim-snippets',
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'posva/vim-vue'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'mattn/emmet-vim'
Plug 'vim-airline/vim-airline'
Plug 'moll/vim-bbye'
Plug 'StanAngeloff/php.vim'
Plug 'tpope/vim-commentary'
Plug 'jwalton512/vim-blade'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'adoy/vim-php-refactoring-toolbox'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'chrisbra/Colorizer'
Plug 'othree/html5.vim'
Plug 'phpactor/phpactor', {'for': 'php', 'do': 'composer install --no-dev -o'}
Plug 'janko/vim-test'
Plug 'afternoon/vim-phpunit'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'sonph/onehalf'
Plug 'challenger-deep-theme/vim'
Plug 'hzchirs/vim-material'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
Plug 'vim-python/python-syntax'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

"-------------Visuals--------------"

"colorscheme for vim on terminal
let g:gruvbox_italic=1
set background=dark
"colorscheme atom-dark
colorscheme atom-dark-256
"let g:airline_theme="dracula"
set termguicolors

"colorscheme for gvim
if has("gui_running")
    set background=dark
    let g:material_style='oceanic'
    let g:airline_theme='material'
    colorscheme vim-material 
    set t_Co=256							"Use 256 colors. This is useful for Terminal Vim.
    set guifont=IBM_Plex_Mono:h16			        "Set the default font family and size.
    "set guifont=Operator_Mono_Lig_Book:h14
    "set guifont=InconsolataN-Medium:h16
    "set guifont=Fira_Code_Retina:h16
    set linespace=16
    set guioptions-=e							"We don't want Gui tabs.
    set lines=999

    set guioptions-=l                                                   "Disable Gui scrollbars.
    set guioptions-=L
    set guioptions-=r
    set guioptions-=R
    set guioptions-=T
    set guioptions-=m

    "We'll fake a custom left padding for each window.
    hi LineNr guibg=bg
    set foldcolumn=2
    hi foldcolumn guibg=bg

    "Get rid of ugly split borders.
    hi vertsplit guifg=bg guibg=bg
endif



"-------------Search--------------"
set hlsearch								"Highlight all matched terms.
set incsearch								"Incrementally highlight, as we type.


"-------------Split Management--------------"
set splitbelow 								"Make splits default to below...
set splitright								"And to the right. This feels more natural.

"We'll set simpler mappings to switch between splits.
nmap <c-J> <C-W><C-J>
nmap <c-K> <C-W><C-K>
nmap <c-H> <C-W><C-H>
nmap <c-L> <C-W><C-L>




"-------------Mappings--------------"
execute "set <M-t>=\et"
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR>


"Make it easy to edit the Vimrc file.
nmap <Leader>ev :edit $MYVIMRC<cr>
nmap <Leader>eg :edit ~/.gvimrc<cr>

"map jj to Esc
imap jj <Esc>

"Add simple highlight removal.
nmap <Leader><space> :nohlsearch<cr>

"Quickly browse to any tag/symbol in the project.
"Tip: run ctags -R to regenerated the index.
nmap <Leader>f :tag<space>

"Sort PHP use statements
"http://stackoverflow.com/questions/11531073/how-do-you-sort-a-range-of-lines-by-length
vmap <Leader>su ! awk '{ print length(), $0 \| "sort -n \| cut -d\\  -f2-" }'<cr>

"PHP Unit testing mappings

nmap <M-t> :!clear && vendor/bin/phpunit<cr>
nmap <C-t> yiw:!clear && vendor/bin/phpunit --filter "

"========= General Mappings ================"
nnoremap <S-j> 5j
nnoremap <S-k> 5k
nnoremap <S-l> $
nnoremap <S-h> ^
" map <C-[> :bn<cr>
" map <C-]> :bp<cr>
nmap <Leader>` :sh<cr>

nnoremap <D-n> :NERDTreeToggle<CR>
"-------------Plugins--------------"

"/
"/ FZF
"/ 
nmap <D-p> :FZF --reverse<cr>

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0

nmap <C-N> :NERDTreeToggle<cr>

"/
"/ Greplace.vim
"/
set grepprg=ag								"We want to use Ag for the search.

let g:grep_cmd_opts = '--line-numbers --noheading'

"/
"/ vim-php-cs-fixer.vim
"/
let g:php_cs_fixer_level = "psr2"  

nnoremap <silent><leader>pf :call PhpCsFixerFixFile()<CR>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"

nnoremap <leader>d :call pdv#DocumentWithSnip()<CR>




"-------------Laravel-Specific--------------"
nmap <Leader>lr :e app/Http/routes.php<cr>
nmap <Leader>lm :!php artisan make:
nmap <Leader><Leader>c :e app/Http/Controllers/<cr>
nmap <Leader><Leader>m :CtrlP<cr>app/
nmap <Leader><Leader>v :e resources/views/<cr>




"-------------Auto-Commands--------------"
"Automatically source the Vimrc file on save.

augroup autosourcing
	autocmd!
	autocmd BufWritePost $MYVIMRC source % | AirlineRefresh
augroup END




"-------------Functions--------------"
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>n :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>nf <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>nf :call PhpExpandClass()<CR>




"-------------Tips and Reminders--------------"
" - Press 'zz' to instantly center the line where the cursor is located.



"------------- FZF config --------------"

" let g:fzf_layout = { 'up': '40%' }

"------------- vim-airline config --------------"
let g:airline#extensions#tabline#enabled = 1


"=======================MISC================="
nmap <leader>/ gcc
let g:user_emmet_mode='a'


function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


" cycle through completion entries with tab/shift+tab
" inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
" inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"


let g:python3_host_prog='/c/Users/moham/AppData/Local/Microsoft/WindowsApps/python3'


"================== PHP ACTOR PLUGIN MAPPINGS =======================
 augroup PhpactorMappings
    au!
    au FileType php nmap <buffer> <Leader>u :PhpactorImportClass<CR>
    au FileType php nmap <buffer> <Leader>e :PhpactorClassExpand<CR>
    au FileType php nmap <buffer> <Leader>ua :PhpactorImportMissingClasses<CR>
    au FileType php nmap <buffer> <Leader>mm :PhpactorContextMenu<CR>
    au FileType php nmap <buffer> <Leader>nn :PhpactorNavigate<CR>
    au FileType php,cucumber nmap <buffer> <Leader>o
        \ :PhpactorGotoDefinition<CR>
    au FileType php,cucumber nmap <buffer> <Leader>Oh
        \ :PhpactorGotoDefinitionHsplit<CR>
    au FileType php,cucumber nmap <buffer> <Leader>Ov
        \ :PhpactorGotoDefinitionVsplit<CR>
    au FileType php,cucumber nmap <buffer> <Leader>Ot
        \ :PhpactorGotoDefinitionTab<CR>
    au FileType php nmap <buffer> <Leader>K :PhpactorHover<CR>
    au FileType php nmap <buffer> <Leader>tt :PhpactorTransform<CR>
    au FileType php nmap <buffer> <Leader>cc :PhpactorClassNew<CR>
    au FileType php nmap <buffer> <Leader>ci :PhpactorClassInflect<CR>
    au FileType php nmap <buffer> <Leader>fr :PhpactorFindReferences<CR>
    au FileType php nmap <buffer> <Leader>mf :PhpactorMoveFile<CR>
    au FileType php nmap <buffer> <Leader>cf :PhpactorCopyFile<CR>
    au FileType php nmap <buffer> <silent> <Leader>ee
        \ :PhpactorExtractExpression<CR>
    au FileType php vmap <buffer> <silent> <Leader>ee
        \ :<C-u>PhpactorExtractExpression<CR>
    au FileType php vmap <buffer> <silent> <Leader>em
        \ :<C-u>PhpactorExtractMethod<CR>
  augroup END



"Fix php files on save using php-cs-fixer plugin
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"



"============Vimtext================
let g:tex_flavor='latex'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'



"===========PythonSyntax=================
let g:python_highlight_all = 1
