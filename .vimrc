set nu
set t_Co=256
syntax enable
syntax on
set nocompatible              " be iMproved, required
set hlsearch                  " search highlight
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set cindent
set ignorecase                " ignore case
set ambiwidth=double
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set cursorline
set encoding=utf-8
if has('gui_running')
    set background=light
else
    set background=dark
endif

"insert mode direction key
inoremap <C-h> <Left>
inoremap <c-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <del>

"系统剪贴板
vmap <c-c> "+y<esc>
nmap <c-v> "+p<esc>
inoremap <c-v> <c-r>+

" plug.vim 配置
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
" Plug 'junegunn/vim-easy-align'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/vim-airline/vim-airline'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'plugin/BufExplorer.vim'
Plug 'rking/ag.vim'
Plug 'majutsushi/tagbar'
Plug 'jlanzarotta/bufexplorer'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'

call plug#end()

"--------------------airblade/vim-gitgutter-------------------
noremap <silent> gj :GitGutterNextHunk<CR>
noremap <silent> gk :GitGutterPrevHunk<CR>
noremap <silent> gq :GitGutterUndoHunk<CR>
noremap <silent> gv :GitGutterPreviewHunk<CR>
noremap <silent> ga :GitGutterStageHunk<CR>
noremap <silent> gc :pclose<CR>


"------------airline------------
set laststatus=2  "永远显示状态栏
set t_Co=256      "在windows中用xshell连接打开vim可以显示色彩
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '
nmap < :bp<CR>
nmap > :bn<CR>

" => majutsushi/tagbar -------------------------
if !empty("$HOME/.vim/plugged/tagbar")
    nnoremap <silent> <F8> :TagbarToggle<CR>
    let g:tagbar_right=1
    let g:tagbar_zoomwidth=1
endif

" => cscope ---------------------------
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
  " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  set cscopetag
  set csprg=/usr/bin/cscope
  set csto=0
  set cst
  set nocsverb
  " add any database in current directory
  if filereadable("cscope.out")
      cs add cscope.out
  " else add the database pointed to by environment variable
  elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
  endif
  set csverb
  " show msg when any other cscope db added
  set cscopeverbose  
endif

" To do the first type of search, hit 'CTRL-\', followed by one of the
" cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
" search will be displayed in the current window.  You can use CTRL-T to
" go back to where you were before the search.  
"

nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>  
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>  
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>  


" Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
" makes the vim window split horizontally, with search result displayed in
" the new window.
"
" (Note: earlier versions of vim may not have the :scs command, but it
" can be simulated roughly via:
"    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>  

nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR> 
nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR> 
nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>   
nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR> 


" Hitting CTRL-space *twice* before the search type does a vertical 
" split instead of a horizontal one (vim 6 and up only)
"
" (Note: you may wish to put a 'set splitright' in your .vimrc
" if you prefer the new window on the right instead of the left

nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>   
nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR> 
nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>



" c:Find functions calling this function        //查找调用本函数的函数
" d:Find functions called by this function      //查找本函数调用的函数
" e:Find this egrep pattern                     //查找egrep模式，相当于egrep功能，但查找速度快多了
" f:Find this file                              //查找并打开文件，类似vim的find功能
" g:Find this definition                        //查找函数、宏、枚举等定义的位置，类似ctags的功能
" i:Find files #including this file             //查找包含本文件的文件
" s:Find this C symbol                          //查找C语言符号，即查找函数名、宏、枚举值等出现的地方
" t:Find assignments to                         //查找指定的字符串
nmap <space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <space>f :cs find f <C-R>=expand("<cword>")<CR><CR>
nmap <space>i :cs find i ^<C-R>=expand("<cword>")<CR>$<CR>
nmap <space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <space>l :/<C-R>=expand("<cword>")<CR><CR>
nmap <F4> :cnext<CR>
nmap <F3> :cprev<CR>

" => .vimrc ag.vim 配置----------------------------
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ag searching and cope displaying
"    requires ag.vim - it's much better than vimgrep/grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you Ag after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ag and put the cursor in the right position
map <leader>g :Ag

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with Ag, display your results in cope by doing:
"   <leader>cc

" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
noremap <silent> cc :botright copen<CR>
noremap <silent> cl :cclose <CR>
"map <leader>cc :botright copen<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" => Ckien/ctrlp.vim ---------------------------
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
"use ag as the ctrlp command
let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden 
            \ --ignore .git 
            \ --ignore out 
            \ --ignore .svn 
            \ --ignore .hg 
            \ --ignore .DS_Store
            \ -g ""'

let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
" let g:ctrlp_max_files=0
let g:ctrlp_by_filename=1
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
nnoremap <f5> :!ctags -R<CR>
noremap <silent> bu :BufExplorer<CR>
"NERDTree快捷键
nmap <F2> :NERDTreeToggle  <CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1 

"默认最大化窗口打开
au GUIEnter * simalt ~

" 快捷键，快速导入git模板
nmap <F6> ggO<Esc>gg:r ~/.vim/git/default.txt<cr>

