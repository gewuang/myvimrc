" set nu
set noswapfile
set backspace=indent,eol,start
set smarttab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set t_Co=256
syntax enable
syntax on
set nocompatible              " be iMproved, required
set hlsearch                  " search highlight
set expandtab
set cindent
set ignorecase                " ignore case
" set ambiwidth=double
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileformats=unix,dos
set termencoding=utf-8
set encoding=utf-8
" set cursorline
set vb t_vb=
" highlight SignColumn guibg=dark guifg=dark
" 清除标记栏颜色
highlight VertSplit ctermbg=black ctermfg=gray
highlight clear SignColumn

set modifiable
set updatetime=50

" set fileformat=unix

set t_Co=256

set rtp+=/usr/local/opt/fzf

" =========================== map 区域begin ================================
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
map <C-q> <C-W>q
map <C-e> <C-W>o

iab xtime <c-r>=strftime("20%y-%m-%d %H:%M:%S")<cr>

vnoremap Y "+y
" set clipboard=unnamedplus

nmap < :bp<CR>
nmap > :bn<CR>

noremap <silent> gs :GoTest -v -run <C-R>=expand("<cword>")<CR><CR>

noremap <silent> cc :botright copen<CR>
noremap <silent> cl :cclose <CR>
"map <leader>cc :botright copen<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>
" 清除高亮
map <leader>c :noh<cr>  

" =========================== map 区域end ================================

" plug.vim 配置
call plug#begin('~/.vim/plugged')

" 快速搜索
Plug 'rking/ag.vim'

" 添加图片配置
Plug 'ryanoasis/vim-devicons'
Plug 'ryanoasis/vim-webdevicons'

" 格式自动化
Plug 'Chiel92/vim-autoformat'

" cscope 
Plug 'brookhong/cscope.vim'

" 快速打开文件
Plug 'kien/ctrlp.vim'

" buffer
Plug 'jlanzarotta/bufexplorer'

" git辅助工具
Plug 'https://github.com/tpope/vim-fugitive'

" 注释代码 
Plug 'scrooloose/nerdcommenter'

Plug 'skywind3000/vim-terminal-help'

Plug 'dbeniamine/cheat.sh-vim'

" 快捷操作
" 边缘操作
Plug 'https://github.com/tpope/vim-surround'
" 选择文本块
Plug 'https://github.com/gcmt/wildfire.vim'
" 多光标
Plug 'https://github.com/mg979/vim-visual-multi'

" 报警
Plug 'https://github.com/dense-analysis/ale'

" airline
Plug 'https://github.com/vim-airline/vim-airline'

" git操作
Plug 'airblade/vim-gitgutter'

" 函数列表
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

" css color preview
Plug 'https://github.com/ap/vim-css-color'

" dockerfile 高亮
" Plug 'ekalinin/Dockerfile.vim'

" 代码注释软件
Plug 'https://github.com/vim-scripts/DoxygenToolkit.vim.git'

" 标记软件
Plug 'kshenoy/vim-signature'

" go命令工具
" Plug 'https://github.com/fatih/vim-go.git'
" Plug 'fatih/vim-go', { 'tag': 'v1.22', 'for': 'go' }
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' , 'for': 'go' }

" 文件目录显示
Plug 'https://github.com/Shougo/defx.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'kristijanhusak/defx-icons'
" Plug 'kristijanhusak/defx-git'

" dash
Plug 'rizzatti/dash.vim'

" todo list
Plug 'vim-scripts/TaskList.vim'
" python库的补全
Plug 'davidhalter/jedi', { 'for': 'py' }

" unix命令行工具
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'

" 补全
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" => rizzatti/dash.vim--------------------------
nmap <silent> <leader>d <Plug>DashSearch

" => TaskList ------------------------------
" nmap <leader>td <Plug>TaskList
noremap <silent> to :TaskList<CR>
noremap <silent> tl :marks<CR>

" => scrooloose/nerdcommenter ------------------------------
let g:NERDSpaceDelims=1
" <leader> cc 注释代码
" <leader> cu 取消注释 
" <leader> cm 注释区域
" <leader> cs 优雅的注释代码

" => fzf ----------------------------
noremap <space>q :FZF<CR>

" => .vimrc ag.vim 配置----------------------------
set runtimepath^=~/.vim/plugged/ag.vim

" => vim-devicons --------------------------
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
" required if using https://github.com/bling/vim-airline
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable = 1
let g:airline_powerline_fonts=1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

set guifont=MesloLGL_Nerd_Font:h15

" change the default character when no match found
" let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
let g:WebDevIconsUnicodeByteOrderMarkerDefaultSymbol = ''
" enable folder/directory glyph flag (disabled by default with 0)
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

" 自动格式化代码
" => Chiel92/vim-autoformat --------------------------------------
noremap <space>m :Autoformat<CR>
let g:autoformat_verbosemode=1

" => Ckien/ctrlp.vim ---------------------------
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|ccls-cache)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
            \ }
"use ag as the ctrlp command
let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden
            \ --ignore .git
            \ --ignore out
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .ccls-cache
            \ --ignore .DS_Store
            \ -g ""'
" let g:ctrlp_working_path_mode=0
" let g:ctrlp_match_window_bottom=1
" let g:ctrlp_max_height=15
" " let g:ctrlp_max_files=0
" let g:ctrlp_by_filename=1
" let g:ctrlp_match_window_reversed=0
" let g:ctrlp_mruf_max=500
" let g:ctrlp_follow_symlinks=1

" => jlanzarotta/bufexplorer ---------------------------
noremap <silent> bu :BufExplorer<CR>

" => airline------------------------
set laststatus=2  "永远显示状态栏
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#left_sep = ' '

" => majutsushi/tagbar -------------------------
if !empty("$HOME/.vim/plugged/tagbar")
    noremap <space>b :TagbarToggle<CR>
    let g:tagbar_right=1
    let g:tagbar_zoomwidth=1
    let g:tagbar_width = 30
endif
let g:tagbar_type_markdown = {
      \ 'ctagstype' : 'markdown',
      \ 'kinds' : [
      \ 'h:Heading_L1',
      \ 'i:Heading_L2',
      \ 'k:Heading_L3'
      \ ]
      \ }
let g:tagbar_type_javascript = {
      \ 'ctagsbin' : 'jsctags'
      \ }
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

"  => DoxygenToolkit.vim ------------------------------

" let g:DoxygenToolkit_authorName="gewuang:751702112@qq.com"
" let s:licenseTag = "\<enter>function: \<enter>"
" let s:licenseTag = s:licenseTag . "author:gewuang\<enter>"
" let s:licenseTag = s:licenseTag . "return: "
" let g:DoxygenToolkit_licenseTag = s:licenseTag
" let g:DoxygenToolkit_briefTag_funcName="yes"
" let g:doxygen_enhanced_color=1
if !exists("g:DoxygenToolkit_briefTag_lic_pre")
    let g:DoxygenToolkit_briefTag_lic_pre = "@brief: "
endif
if !exists("g:DoxygenToolkit_briefTag_pre")
    let g:DoxygenToolkit_briefTag_pre = "@brief:   "
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
    " mark d

    " Get file name
    let l:fileName = expand('%:t')
    let l:year = strftime("%Y")
    let l:copyright = "Copyright (c) "
    exec "normal O".s:startCommentBlock
    exec "normal o".s:interCommentTag.l:copyright."\<enter>".s:interCommentTag
    exec "normal o".s:interCommentTag.l:license
    exec "normal o".s:interCommentTag.g:DoxygenToolkit_fileTag.l:fileName
    exec "normal o".s:interCommentTag.g:DoxygenToolkit_briefTag_lic_pre
    " mark d
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


" => airblade/vim-gitgutter -------------------------------
noremap <silent> gj :GitGutterNextHunk<CR>
noremap <silent> gk :GitGutterPrevHunk<CR>
noremap <silent> gq :GitGutterUndoHunk<CR>
noremap <silent> gv :GitGutterPreviewHunk<CR>
noremap <silent> ga :GitGutterStageHunk<CR>
noremap <silent> gc :pclose<CR>
let g:gitgutter_max_signs = 500  " default value
let g:gitgutter_grep = 'ag'
let g:gitgutter_terminal_reports_focus=0
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" " => fatih/vim-go --------------------------
let g:go_fmt_command = "goimports" " 格式化将默认的 gofmt 替换
let g:go_implements_mode = 'gopls'
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_list_type_commands = {"GoTest": "quickfix", "GoBuild": "quickfix"}
let g:go_version_warning = 1
let g:go_highlight_generate_tags = 1
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_gopls_enabled = 1
let g:go_def_mapping_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
" autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
" let g:go_debug=['shell-commands']
let g:go_term_enabled = 1
let g:go_term_close_on_exit = 0
let g:go_term_mode = 'split'
let g:go_term_height = 10
highlight link goBuiltins Keyword
let $GINKGO_EDITOR_INTEGRATION = "true"

" => Ckien/ctrlp.vim ---------------------------
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm|ccls-cache)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
            \ }
"use ag as the ctrlp command
let g:ctrlp_user_command = 'ag %s -l --nocolor --nogroup --hidden
            \ --ignore .git
            \ --ignore out
            \ --ignore .svn
            \ --ignore .hg
            \ --ignore .ccls-cache
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


" => coc ---------------------------
autocmd FileType json syntax match Comment +\/\/.\+$+
noremap <space>q :CocList -N files<CR>
" autocmd CursorHold * silent call CocActionAsync('highlight')
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

let g:coc_global_extensions = ['coc-json', 'coc-vimlsp', 'coc-snippets', 'coc-lists', 'coc-pairs', 'coc-yank', 'coc-clangd', 'coc-python', 'coc-sh', 'coc-json', 'coc-tsserver', 'coc-xml', 'coc-html']

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
nnoremap <silent> P :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

function! SetupCommandAbbrs(from, to)
    exec 'cnoreabbrev <expr> '.a:from
                \ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
                \ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" lightline
let g:lightline = {
            \ 'active': {
            \   'left': [
            \     [ 'mode', 'paste' ],
            \     [ 'ctrlpmark', 'git', 'diagnostic', 'cocstatus', 'filename', 'method' ]
            \   ],
            \   'right':[
            \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent' ],
            \     [ 'blame' ]
            \   ],
            \ },
            \ 'component_function': {
            \   'blame': 'LightlineGitBlame',
            \ }
            \ }

function! LightlineGitBlame() abort
    let blame = get(b:, 'coc_git_blame', '')
    " return blame
    return winwidth(0) > 120 ? blame : ''
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

" noremap <space>q :CocCommand explorer --toggle <CR>
" nnoremap <silent> <C-n>  :<C-u>CocList -A --normal yank<cr>

" => defx ---------------------------
noremap <space>a :Defx -columns=mark:indent:icons:filename:type<CR>
call defx#custom#option('_', {
      \ 'winwidth': 30,
      \ 'split': 'vertical',
      \ 'direction': 'topleft',
      \ 'show_ignored_files': 0,
      \ 'buffer_name': '',
      \ 'toggle': 2,
      \ 'resume': 1
      \ })

" Avoid the white space highting issue
" autocmd FileType defx match ExtraWhitespace /^^/
" Keymap in defx
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " IndentLinesDisable
  setl nospell
  setl signcolumn=no
  setl nonumber
  nnoremap <silent><buffer><expr> <CR>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nmap <silent><buffer><expr> <2-LeftMouse>
  \ defx#is_directory() ?
  \ defx#do_action('open_or_close_tree') :
  \ defx#do_action('drop',)
  nnoremap <silent><buffer><expr> s defx#do_action('drop', 'split')
  nnoremap <silent><buffer><expr> v defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t defx#do_action('drop', 'tabe')
  nnoremap <silent><buffer><expr> l defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> O defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> h defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> C defx#do_action('copy')
  nnoremap <silent><buffer><expr> P defx#do_action('paste')
  nnoremap <silent><buffer><expr> M defx#do_action('rename')
  nnoremap <silent><buffer><expr> D defx#do_action('remove')
  nnoremap <silent><buffer><expr> A defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> H defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
endfunction

function! s:defx_toggle_tree() abort
    " Open current file, or toggle directory expand/collapse
    if defx#is_directory()
        return defx#do_action('open_or_close_tree')
    endif
    return defx#do_action('multi', ['drop'])
endfunction

let g:defx_icons_enable_syntax_highlight = 1
let g:defx_icons_column_length = 1
let g:defx_icons_directory_icon = ''
let g:defx_icons_mark_icon = '*'
let g:defx_icons_copy_icon = ''
let g:defx_icons_move_icon = ''
let g:defx_icons_parent_icon = ''
let g:defx_icons_default_icon = ''
let g:defx_icons_directory_symlink_icon = ''
" Options below are applicable only when using "tree" feature
let g:defx_icons_root_opened_tree_icon = ''
let g:defx_icons_nested_opened_tree_icon = ''
let g:defx_icons_nested_closed_tree_icon = ''

" 修改打开目录的颜色
hi DefxIconsOpenedTreeIcon guifg=#FF0000
" hi link DefxIconsOpenedTreeIcon Error

" 同理可修改如下颜色
" hi default link DefxIconsMarkIcon Statement
" hi default link DefxIconsCopyIcon WarningMsg
" hi default link DefxIconsMoveIcon ErrorMsg
" hi default link DefxIconsDirectory Directory
" hi default link DefxIconsParentDirectory Directory
" hi default link DefxIconsSymlinkDirectory Directory
" hi default link DefxIconsOpenedTreeIcon Directory
" hi default link DefxIconsNestedTreeIcon Directory
" hi default link DefxIconsClosedTreeIcon Directory

" 控制全屏显示
function! Zoom ()
    " check if is the zoomed state (tabnumber > 1 && window == 1)
    if tabpagenr('$') > 1 && tabpagewinnr(tabpagenr(), '$') == 1
        let l:cur_winview = winsaveview()
        let l:cur_bufname = bufname('')
        tabclose

        " restore the view
        if l:cur_bufname == bufname('')
            call winrestview(cur_winview)
        endif
    else
        tab split
    endif
endfunction

nmap <leader>z :call Zoom()<CR>

" => vim-terminal-help ---------------------------
let g:terminal_key = '<C-a>'
let g:terminal_kill = 'term'
let g:terminal_close = 1 


" => cheat.sh ---------------------------
" Vim command used to open new buffer
let g:CheatSheetReaderCmd='new"'

" Cheat sheet file type
let g:CheatSheetFt='markdown'

" Program used to retrieve cheat sheet with its arguments
let g:CheatSheetUrlGetter='curl --silent'

" Flag to add cookie file to the query
let g:CheatSheetUrlGetterIdFlag='-b'

" cheat sheet base url
let g:CheatSheetBaseUrl='https://cht.sh'

" cheat sheet settings do not include style settings neiter comments, 
" see other options below
let g:CheatSheetUrlSettings='q'

" cheat sheet pager
let g:CheatPager='less -R'

" pygmentize theme used for pager output, see :CheatPager :styles-demo
" let g:CheatSheetPagerStyle=rrt

" Show comments in answers by default
" (setting this to 0 means giving ?Q to the server)
let g:CheatSheetShowCommentsByDefault=1

" cheat sheet buffer name
let g:CheatSheetBufferName="_cheat"

" Default selection in normal mode (line for whole line, word for word under cursor)
let g:CheatSheetDefaultSelection="line"

" Default query mode
" 0 => buffer
" 1 => replace (do not use or you might loose some lines of code)
" 2 => pager
" 3 => paste after query
" 4 => paste before query
let g:CheatSheetDefaultMode=0

" Path to cheat sheet cookie
let g:CheatSheetIdPath=expand('~/.cht.sh/id')

" Make plugin silent by  setting bellow variable to 1
let g:CheatSheetSilent=0

" => vim-visual-multi
" let g:VM_map['Remove Region'] = 'q'

" => vim-visual-multi
"始终开启标志列
" let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
"在vim自带的状态栏中整合ale
let g:ale_statusline_format = ['✗ %d', '⚡ %d', '✔ OK']
"显示Linter名称,出错或警告等相关信息
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
nmap <Leader>s :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
nmap <Leader>w :ALEDetail<CR>
"文件内容发生变化时不进行检查
let g:ale_lint_on_text_changed = 'never'
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
