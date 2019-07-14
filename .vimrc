" set nu
set noswapfile
set backspace=indent,eol,start
set smarttab
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
set fileformats=unix,dos
set termencoding=utf-8
set encoding=utf-8
set cursorline
" set encoding=utf-8
set vb t_vb=
" 使用gf跳转到对应定义文件
set path+=/usr/local/include/ 
set path+=/usr/local/lib/node_modules
" /usr/local/lib/node_modules
" set tags+=~/.vim/systags

if !has("gui_running")
    set t_Co=256
    set term=screen-256color
endif
set t_Co=256

" colorscheme solarized
" fix cursor display in cygwin
" if has("win32unix")
    " let &t_ti.="\e[1 q"
    " let &t_SI.="\e[5 q"
    " let &t_EI.="\e[1 q"
    " let &t_te.="\e[0 q"
" endif

" if $COLORTERM == 'truecolor'
    " set termguicolors
    " set term=xterm
    " set t_Co=256
    " colorscheme solarized
    " " colorscheme s
" else
    " set term=xterm
    " set t_Co=256
" endif

set background=dark

"insert mode direction key
inoremap <C-h> <Left>
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
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Plug 'chemzqm/macnote.vim'
Plug 'Shougo/vimproc.vim', {'do': 'yes\|make'}


Plug 'Chiel92/vim-autoformat'

" Using git URL
Plug 'https://github.com/kien/ctrlp.vim'
Plug 'https://github.com/tpope/vim-fugitive'
Plug 'https://github.com/vim-airline/vim-airline'
" Plug 'https://github.com/vim-scripts/AutoComplPop.git'
" Plug 'https://github.com/vim-scripts/OmniCppComplete.git'
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'
" Plug 'https://github.com/fatih/vim-go.git'
Plug 'https://github.com/nsf/gocode.git'
Plug 'https://github.com/ternjs/tern_for_vim.git'
Plug 'https://github.com/Valloric/YouCompleteMe'
" Plug 'suan/vim-instant-markdown'
" Plug 'Valloric/YouCompleteMe'
Plug 'https://github.com/boydos/emmet-vim.git'
Plug 'https://github.com/jiangmiao/auto-pairs'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'go.weekly.2012-03-13', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

Plug 'maksimr/vim-jsbeautify'
Plug 'mbbill/undotree'
Plug 'rking/ag.vim'
"Plug 'Mark'
Plug 'kshenoy/vim-signature'
Plug 'majutsushi/tagbar'
Plug 'jlanzarotta/bufexplorer'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
"Plug 'mhinz/vim-startify'

Plug 'godlygeek/tabular'
" Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/TaskList.vim'
Plug 'davidhalter/jedi'

call plug#end()

"--------------------auto-pairs-------------------
let g:AutoPairs = {'(':')', '<':'>', '[':']', '{':'}',"'":"'",'"':'"'}

nnoremap <silent> <F5> :call JsBeautify()<CR>

"--------------------mbbill/undotree-------------------
nnoremap <F9> :UndotreeToggle<cr>
if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

"--------------------airblade/vim-gitgutter-------------------
noremap <silent> gj :GitGutterNextHunk<CR>
noremap <silent> gk :GitGutterPrevHunk<CR>
noremap <silent> gq :GitGutterUndoHunk<CR>
noremap <silent> gv :GitGutterPreviewHunk<CR>
noremap <silent> ga :GitGutterStageHunk<CR>
noremap <silent> gc :pclose<CR>
let g:gitgutter_max_signs = 500  " default value
let g:gitgutter_grep = 'ag'
let g:gitgutter_terminal_reports_focus=0
set updatetime=100
" let g:gitgutter_highlight_lines = 1

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
    noremap <space>b :TagbarToggle<CR>
    let g:tagbar_right=1
    let g:tagbar_zoomwidth=1
endif

" => cscope ---------------------------
set cscopequickfix=s-,c-,d-,i-,t-,e-
if has("cscope")
  " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
  set cscopetag
  " set csprg=/usr/bin/cscope
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
nmap <space>n :cnext<CR>
nmap <space>p :cprev<CR>

" nmap <leader>td <Plug>TaskList
noremap <silent> to :TaskList<CR>

noremap <silent> tl :marks<CR>

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
" set completeopt=menu,menuone
" let OmniCpp_MayCompleteDot=1        " 打开  . 操作符
" let OmniCpp_MayCompleteArrow=1      " 打开 -> 操作符
" let OmniCpp_MayCompleteScope=1      " 打开 :: 操作符
" let OmniCpp_NamespaceSearch=1       " 打开命名空间
" let OmniCpp_GlobalScopeSearch=1
" let OmniCpp_DefaultNamespace=["std"]
" let OmniCpp_ShowPrototypeInAbbr=1  " 打开显示函数原型
" let OmniCpp_SelectFirstItem = 2    " 自动弹出时自动跳至第一个

" " => DoxygenToolkit.vim ------------------------------

" let g:DoxygenToolkit_authorName="gewuang:751702112@qq.com"
" let s:licenseTag = "\<enter>function: \<enter>"
" let s:licenseTag = s:licenseTag . "author:gewuang\<enter>"
" let s:licenseTag = s:licenseTag . "return: "
" let g:DoxygenToolkit_licenseTag = s:licenseTag
" let g:DoxygenToolkit_briefTag_funcName="yes"
" let g:doxygen_enhanced_color=1


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
" command! -nargs=0 Pk :call <SID>Printdebugmsg()
noremap <space>k :call <SID>Printdebugmsg()<CR>

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
" nmap <F2> :NERDTreeToggle  <CR>
noremap <space>a :NERDTreeToggle<CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
" let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1 
let g:NERDChristmasTree=1
let g:NERDTreeAutoCenter=1
" let NERDTreeBookmarksFile=$VIM.'\Data\NerdBookmarks.txt'
let g:NERDTreeMouseMode=2
let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowFiles=1
let g:NERDTreeShowHidden=1

"默认最大化窗口打开
" au GUIEnter * simalt ~

" => YouCompleteMe ---------------------------
" 方法跳转 "
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>

" let g:ycm_key_invoke_completion = '<space>z'
" let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'       " 配置全局路径
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_confirm_extra_conf=0   " 每次直接加载该文件，不提示是否要加载
let g:ycm_add_preview_to_completeopt = 0
" 使用ctags生成的tags文件
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_auto_trigger = 1

" let g:ycm_cache_omnifunc = 0

" 输入第一个字符就开始补全
let g:ycm_min_num_of_chars_for_completion=1

" 关闭诊断显示功能(已经使用了ale进行异步语法检查)
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_echo_current_diagnostic = 0
" let g:ycm_key_list_select_completion = ['<Down>']
set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
let g:ycm_seed_identifiers_with_syntax=1    " 语法关键字补全
" 在注释输入中也能补全
let g:ycm_complete_in_comments = 1
" 在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'js' : ['.'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

" 快捷键，快速导入git模板
" nmap <F6> ggO<Esc>gg:r ~/.vim/git/default.txt<cr>
noremap <space>v ggO<Esc>gg:r ~/.vim/git/default.txt<cr>

" => vim-go ---------------------------
" let g:go_highlight_functions = 1
" let g:go_highlight_methods = 1
" let g:go_highlight_structs = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_build_constraints = 1
" let g:go_disable_autoinstall = 0

inoremap \gitf  [feature][][]<CR><CR>[what]<CR>[why]<CR>[how]<CR><UP><END><UP><UP><UP><UP><Left><Left><Left>
inoremap \gitb  [bugfix][][]<CR><CR>[what]<CR>[why]<CR>[how]<CR><UP><END><UP><UP><UP><UP><Left><Left><Left>

"F3自动格式化代码
" noremap <F12> :Autoformat<CR>
noremap <space>m :Autoformat<CR>
let g:autoformat_verbosemode=1

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

