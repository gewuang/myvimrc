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
    " set term=screen-256color
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
inoremap <C-u> <Left>
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

Plug 'https://github.com/dense-analysis/ale'

" rst
Plug 'https://github.com/nvie/vim-rst-tables'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" vimprocbang $cmd
Plug 'Shougo/vimproc.vim', {'do': 'yes\|make'}
" 美化工具
Plug 'Chiel92/vim-autoformat'
" 补全
" Plug 'https://github.com/maralla/completor.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 快速打开文件
Plug 'https://github.com/kien/ctrlp.vim'
" 快速打开文件
Plug 'https://github.com/tpope/vim-fugitive'
" git辅助工具
Plug 'https://github.com/vim-airline/vim-airline'
" 补全工具
" Plug 'https://github.com/vim-scripts/AutoComplPop.git'
" Plug 'https://github.com/vim-scripts/OmniCppComplete.git'
" 代码注释软件
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'
" go命令工具
" Plug 'https://github.com/fatih/vim-go.git'
" go补全工具
" Plug 'https://github.com/nsf/gocode.git'
" js的补全工具（暂时没怎么用）
Plug 'https://github.com/ternjs/tern_for_vim.git'
" markdown预览
Plug 'https://github.com/suan/vim-instant-markdown'
" 匹配符号
" Plug 'https://github.com/jiangmiao/auto-pairs'

" Plugin outside ~/.vim/plugged with post-update hook
" unix命令行工具
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" HTML, CSS, JavaScript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'hail2u/vim-css3-syntax'
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'gko/vim-coloresque', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript', { 'for' :['javascript', 'vim-plug'] }

" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-path'
" Plug 'ncm2/ncm2-jedi'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-match-highlight'
" Plug 'ncm2/ncm2-markdown-subscope'
" Plug 'roxma/ncm-clang'
" " Plug 'roxma/clang_complete'
" " Language Server
" Plug 'autozimu/LanguageClient-neovim', {
" \ 'branch': 'next',
" \ 'do': 'bash install.sh',
" \ }
" " (Optional) Multi-entry selection UI.
" js 美化
Plug 'maksimr/vim-jsbeautify'
" 显示修改列表
Plug 'mbbill/undotree'
" 快速搜索
Plug 'rking/ag.vim'
" 标记软件
Plug 'kshenoy/vim-signature'
" 函数列表
Plug 'majutsushi/tagbar'
" buffer
Plug 'jlanzarotta/bufexplorer'
" git操作
Plug 'airblade/vim-gitgutter'
" 快捷操作转换为命令，看起来很厉害
Plug 'scrooloose/nerdcommenter'
" 开始欢迎界面，暂不需要
" Plug 'mhinz/vim-startify'

" 整理格式:Tab /*
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-scripts/TaskList.vim'
" python库的补全
Plug 'davidhalter/jedi'

call plug#end()

"--------------------auto-pairs-------------------
" let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"'}

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
set updatetime=50

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

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('sh', 'cyan', 'none', 'cyan', '#151515')
" call NERDTreeHighlightFile('*', 'cyan', 'none', 'cyan', '#151515')
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
call NERDTreeHighlightFile('js', 'red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


"默认最大化窗口打开
" au GUIEnter * simalt ~

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

" => vim-javascript --------------------------
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
" augroup javascript_folding
" au!
" au FileType javascript setlocal foldmethod=syntax
" augroup END

" => vim-markdown --------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_toc_autofit = 1

" filetype plugin on
"Uncomment to override defaults:
" let g:instant_markdown_slow = 1
" let g:instant_markdown_autostart = 0
let g:instant_markdown_open_to_the_world = 1
" let g:instant_markdown_allow_unsafe_content = 1
" let g:instant_markdown_allow_external_content = 0
let g:instant_markdown_mathjax = 1

" => ale --------------------------
let g:ale_sign_column_always = 0
let g:ale_set_highlights = 0
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
" nmap sp <Plug>(ale_previous_wrap)
" nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>d :ALEDetail<CR>
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
            \   'c++': ['clang'],
            \   'c': ['clang'],
            \   'python': ['pylint'],
            \}
" let g:airline#extensions#ale#enabled = 0
" highlight clear ALEErrorSign
" highlight clear ALEWarningSign

" => coc --------------------------
" if hidden is not set, TextEdit might fail.
set hidden
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup
" Better display for messages
" set cmdheight=2
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
" set signcolumn=yes

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')


function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

cmap Fi VimProcBang flow init

function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
                \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
                \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')
" set suggest.enablePreview:true
" let g:airline#extensions#coc#enabled = 0
"coc.preferences.diagnostic.displayByAle": true,
let g:markdown_fenced_languages = ['css', 'js=javascript']

" let g:coc_status = 0
nmap <leader>i   <Plug>(coc-diagnostic-info)
nmap <leader>j   <Plug>(coc-diagnostic-next)
nmap <leader>k   <Plug>(coc-diagnostic-prev)

" source "~/.vim/ftplugin/rst_tables.vim"


