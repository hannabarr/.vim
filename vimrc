syntax enable		"enable syntax processing
set tabstop=4		"number of visual spaces per TAB
set softtabstop=4	"number of spaces in tab
set expandtab		"tabs are spaces (TAB is shortcut for Insert 4 Spaces)
set shiftwidth=4
set number		"show line number
set showcmd		"show command in bottom bar
set cursorline		"highlight current line
set wildmenu		"visual autocomplete for command menu
set showmatch		"highligh matching braces

set incsearch		"search as characters are entered
set hlsearch		"highlight matches
set ignorecase 		"ignore case

"jk is escape
inoremap kj <esc>

"Change the 'insert linebreak here' to <C-c> because that
"doesn't do anything right now, and it leaves j open for movement
inoremap <C-c> <C-j>

"Allow movement in insert mode
inoremap <C-k> <C-o>gk
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <C-o>gj

"move up/down editor lines
noremap j gj
noremap k gk

set hidden "allow hidden buffers
set history=1000
set undolevels=1000

filetype plugin indent on
set ttymouse=xterm2
set mouse=a

":colorscheme molokai
":let g:molokai_original = 1

:colorscheme tequila-sunrise

"can use ; instead of :
:nmap ; : 

" For my own sake, switch the J functionality to K,
" and give the opposite functionality to J (add a new line underneath, move curser back)
:nnoremap K J
:nnoremap J o<Esc>k 

"Lets test out this string selection"

"Move vim windows with ctrl-[hjkl] in normal mode
:nmap <C-j> <C-w>j
:nmap <C-k> <C-w>k
:nmap <C-h> <C-w>h
:nmap <C-l> <C-w>l

"Only fold top two layers, internal statements arent folded
set foldnestmax=2

"Map the folding/unfolding commands to <space bar>
nnoremap <space> za
vnoremap <space> zf

"Make Tab and Shift-Tab indent and unindent
nnoremap > >>_
nnoremap < <<_
vnoremap > >gv
vnoremap < <gv

" use Pathogen as a package manager for vim
execute pathogen#infect()

"start NERDTree
"autocmd vimenter * NERDTree  

"Open NERDTree with Ctrl-f
map <C-f> :NERDTreeToggle<CR>

"Close vim if the only window left opoen is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('pyc', 'DarkGray', 'none', 'DarkGray', '#151515')
call NERDTreeHighlightFile('py', 'LightBlue', 'none', 'LightBlue', '#151515')

" Status line modification

" [buffer number] followed by filename:
set statusline=[%n]\ %t

" Syntastic options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" show line#:column# on the right hand side (play well with nerdtree plugin)
set statusline+=%=%l:%c


" Syntastic is not enabled by defualt
" To enable:
"   :SyntasticToggleMode
" To check once:
"   :SyntasticCheck
let g:syntastic_check_on_open = 0
let g:syntastic_mode_map = {
    \ "mode": "passive" }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Configure syntastic with CAMO pylintrc
:let g:syntastic_python_pylint_rcfile='/home/hcb/Documents/camo/camo_backend/.pylintrc'

" Airline functions
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'
let g:airline_filetype_overrides = {
    \ 'defx':  ['defx', '%{b:defx.paths[0]}'],
    \ 'gundo': [ 'Gundo', '' ],
    \ 'help':  [ 'Help', '%f' ],
    \ 'minibufexpl': [ 'MiniBufExplorer', '' ],
    \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', 'NERD'), '' ],
    \ 'startify': [ 'startify', '' ],
    \ 'vim-plug': [ 'Plugins', '' ],
    \ 'vimfiler': [ 'vimfiler', '%{vimfiler#get_status_string()}' ],
    \ 'vimshell': ['vimshell','%{vimshell#get_status_string()}'],
    \ }
  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " unicode symbols
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

" fugitive, open Gdiff in vertical window
:set diffopt+=vertical

" Git gutter colorscheme
highlight GitGutterAdd    guifg=#87D7AF guibg=#121212 ctermfg=114 ctermbg=233
highlight GitGutterChange guifg=#F3E430 guibg=#121212 ctermfg=11 ctermbg=233
highlight GitGutterDelete guifg=#E32791 guibg=#121212 ctermfg=202 ctermbg=233
