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
set vb t_vb=
set tags+=~/.vim/systags

if has('gui_running')
    set background=light
else
    set background=dark
endif

"insert mode direction key
inoremap <C-y> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <C-d> <del>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-h> <C-W>h
map <C-k> <C-W>k
map <C-l> <C-W>l

"系统剪贴板
"vmap <c-c> "+y<esc>
"nmap <c-v> "+p<esc>
"inoremap <c-v> <c-r>+

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
Plug 'https://github.com/vim-scripts/AutoComplPop.git'
Plug 'https://github.com/vim-scripts/OmniCppComplete.git'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'rking/ag.vim'
"Plug 'Mark'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'jlanzarotta/bufexplorer'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
"Plug 'mhinz/vim-startify'

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
"map <leader>g :Ag

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

" => OmniCppComplete.git ---------------------------
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot=1        " 打开  . 操作符
let OmniCpp_MayCompleteArrow=1      " 打开 -> 操作符
let OmniCpp_MayCompleteScope=1      " 打开 :: 操作符
let OmniCpp_NamespaceSearch=1       " 打开命名空间
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DefaultNamespace=["std"]
let OmniCpp_ShowPrototypeInAbbr=1  " 打开显示函数原型
let OmniCpp_SelectFirstItem = 2    " 自动弹出时自动跳至第一个

" => DoxygenToolkit.vim ------------------------------

let g:DoxygenToolkit_authorName="gewuang:751702112@qq.com"
let s:licenseTag = "\<enter>function: \<enter>"
let s:licenseTag = s:licenseTag . "author:gewuang\<enter>"
let s:licenseTag = s:licenseTag . "return: "
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1


if !exists("g:DoxygenToolkit_briefTag_lic_pre")
    let g:DoxygenToolkit_briefTag_lic_pre = "@brief:   "
endif
if !exists("g:DoxygenToolkit_briefTag_pre")
    let g:DoxygenToolkit_briefTag_pre = "@brief: "
endif
if !exists("g:DoxygenToolkit_fileTag")
    let g:DoxygenToolkit_fileTag = "@file:    "
endif
if !exists("g:DoxygenToolkit_authorTag")
    let g:DoxygenToolkit_authorTag = "@author:  "
endif
if !exists("g:DoxygenToolkit_dateTag")
    let g:DoxygenToolkit_dateTag = "@date:    "
endif
if !exists("g:DoxygenToolkit_versionTag")
    let g:DoxygenToolkit_versionTag = "@version: "
endif


""""""""""""""""""""""""""
" Doxygen license comment
""""""""""""""""""""""""""
function! <SID>DoxygenLicenseFunc()
  call s:InitializeParameters()
  " Test authorName variable
  if !exists("g:DoxygenToolkit_authorName")
    let g:DoxygenToolkit_authorName = input("Enter name of the author (generally yours...) : ")
  endif
  mark d
 
  " Get file name
  let l:fileName = expand('%:t')
  let l:year = strftime("%Y")
  let l:copyright = "Copyright (c) "
  exec "normal O".s:startCommentBlock
  exec "normal o".s:interCommentTag.l:copyright."\<enter>".s:interCommentTag
  exec "normal o".s:interCommentTag.l:license
  exec "normal o".s:interCommentTag.g:DoxygenToolkit_fileTag.l:fileName
  exec "normal o".s:interCommentTag.g:DoxygenToolkit_briefTag_lic_pre
  mark d
  exec "normal o".s:interCommentTag.g:DoxygenToolkit_authorTag.g:DoxygenToolkit_authorName
  exec "normal o".s:interCommentTag.g:DoxygenToolkit_versionTag."1.0"
  let l:date = strftime("%Y-%m-%d")
  exec "normal o".s:interCommentTag.g:DoxygenToolkit_dateTag.l:date
  if( s:endCommentBlock != "" )
    exec "normal o".s:endCommentBlock
  endif
  exec "normal `d"
  call s:RestoreParameters()
  startinsert!
endfunction


noremap <silent> fl :DoxAuthor <CR>
noremap <silent> ff :Dox <CR>

" => scrooloose/nerdcommenter ------------------------------
let g:NERDSpaceDelims=1

function! s:Printdebugmsg()
    let l:print_msg='printf("#DEBUG:[%s]:%d----\n", __FUNCTION__, __LINE__);'
    exec "normal o".l:print_msg
    startinsert!
endfunction
command! -nargs=0 Pk :call <SID>Printdebugmsg()

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

