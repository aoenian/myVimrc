" update:2016/5/12
" update:2016/7/11 与mac中的vimrc文件融合

""""""""""""""""""""""""""""""""""""""""""""""""""
" => 全局配置
""""""""""""""""""""""""""""""""""""""""""""""""""

" 不兼容vi
set nocompatible

" 显示此时的模式
set showmode

" 保存100个标记、所有的全局标记以及500行寄存器
set viminfo='1000,f1,<500 

" 启用鼠标
set mouse=a


""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件编辑配置
""""""""""""""""""""""""""""""""""""""""""""""""""

" 显示行号
set number

" mac 访问剪切板
set clipboard=unnamed

"" 配色方案
if(has('win32') || has('win64'))
    colorscheme desert
else
    colorscheme solarized
endif

" 打开自动缩进
set autoindent

" 智能对齐 注释掉为了 让注释行也自动缩进
""set smartindent

" 高亮显示对应的括号
set showmatch

" 对应括号高亮的时间（单位是十分之一秒）
set matchtime=5

" 突出显示当前行
set cursorline

" 突出显示当前列
set cursorcolumn

" 设置文本宽度为80 并高亮显示
set textwidth=80
set cc=+1

" 突出显示80列
set cc=80

" 一个Tab键所占的列数
set tabstop=4

" 敲入Tab键时实际占有的列数
set softtabstop=4

" 输入Tab时自动转换为空格
set expandtab

" reindent 操作（normal模式下 >>和<< 缩进的列数）一列为一个空格
set shiftwidth=4

" 退格键增强
set bs=indent,eol,start

" 定义一个word里面包含哪些字符，使word包括 "-" 符号
set iskeyword+=-

" normal,insert 模式跨行移动命令能够直接移动到下一行或上一行,左右箭头也可以
set whichwrap=b,s,<,>,[,]

" h, l 也可以跨行
set whichwrap+=l,h

" 打开语法高亮显示，前提系统支持彩色显示
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" 让python语法高亮
let python_highlight_all=1

" 禁止vim换行时自动添加注释符号
augroup Format-Options
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

    " This can be done as well instead of the previous line, for setting formatoptions as you choose:
"    autocmd BufEnter * setlocal formatoptions=crqn2l1j
augroup END

" 用vsplit新建窗口，让新的放右边 
set splitright    

" 用split新建窗口，让新的放下面 
set splitbelow    

" 显示制表符和尾部空格,并用相应的符号显示
"set list
"set listchars=tab:>-,trail:-


""""""""""""""""""""""""""""""""""""""""""""""""""
" => 代码编辑配置
""""""""""""""""""""""""""""""""""""""""""""""""""

" ============ 代码折叠=============
set foldenable              " 开始折叠
set foldmethod=syntax       " 设置语法折叠
autocmd Filetype python setlocal foldmethod=indent  
set foldcolumn=0            " 设置折叠区域的宽度
setlocal foldlevel=1        " 设置折叠层数为
set foldlevelstart=99       " 打开文件是默认不折叠代码
"set foldclose=all          " 设置为自动关闭折叠                

" 用空格键来开关折叠
nnoremap <space> za

" 自动补全成对的括号和引号
" http://blog.hotoo.me/post/vim-autocomplete-pairs.html
""inoremap ' ''<ESC>i
""inoremap " ""<ESC>i
""inoremap ( ()<ESC>i
""inoremap ) <c-r>=ClosePair(')')<CR>
""inoremap { {}<ESC>i
""inoremap } <c-r>=ClosePair('}')<CR>
""inoremap [ []<ESC>i
""inoremap ] <c-r>=ClosePair(']')<CR>
""inoremap < <><ESC>i
""inoremap > <c-r>=ClosePair('>')<CR>
""function ClosePair(char)
""    if getline('.')[col('.') - 1] == a:char
""        return "\<Right>"
""    else
""        return a:char
""    endif
""endf

" js html css 缩进改变
au BufNewFile,BufRead *.js, *.html, *.css
\ set tabstop=2
\ set softtabstop=2
\ set shiftwidth=2


""""""""""""""""""""""""""""""""""""""""""""""""""
" => 自定义按键映射
""""""""""""""""""""""""""""""""""""""""""""""""""

"C语言<F2>插入时间和作者
autocmd FileType c,cpp nmap <F2> :call TitleC()<ESC>i
"TitleC()函数
function TitleC()
	call append(0, "/*")
	call append(1, " *Date		: ".strftime("%Y-%m-%d %H:%M"))
	call append(2, " *Filename	: ".expand("%:t"))
	call append(3, " *Author	: aoenian")
	call append(4, " */")
	call append(5,"")
endfunction

"python<F2>插入时间和作者
autocmd FileType python nmap <F2> :call TitlePy()<ESC>i
"TitlePy()函数
function TitlePy()
	call append(0, "# -*- coding=utf-8 -*-")
	call append(1, "'''")
	call append(2, "  Date		: ".strftime("%Y-%m-%d %H:%M"))
	call append(3, "  Filename	: ".expand("%:t"))
	call append(4, "  Author	: aoenian")
	call append(5,"'''")
	call append(6,"")
endfunction

" 单键<F7>控制 syntax on/off
map <F7> : SyntaxOnOff()
" SyntaxOnOff()函数
function SyntaxOnOff()
    if exists("syntax_on")
        syntax off
    else
        syntax enable
    endif
endfunction

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H> 


""""""""""""""""""""""""""""""""""""""""""""""""""
" => 编码、字体配置
""""""""""""""""""""""""""""""""""""""""""""""""""

" 解决gvim菜单出现乱码
set langmenu=zh_CN
let $LANG='zh_CN.UTF-8'

" vim内部使用的字符编码方式
set encoding=utf-8

" vim中打开文件时使用的字符编码方式
set fileencodings=utf-8,gb2312,gbk,gb18030,cp936

" vim中保存文件时的编码格式
set fileencoding=utf-8

" 终端打开文件的方式
set termencoding=utf-8

" vim默认保存文件格式
set ff=unix

" 设置英文字体，终端中vim无法设置字体，跟随终端的设置
set guifont=Monaco:h12:cANSI

" 设置中文字体
set guifontwide=幼圆:h12


""""""""""""""""""""""""""""""""""""""""""""""""""
" => 搜索配置
""""""""""""""""""""""""""""""""""""""""""""""""""

" 忽略搜索时的大小写
set ignorecase

" 高亮搜索结果 取消高亮 :nohl 
set hlsearch

" 键入字符即开始搜索
set incsearch

" 搜索随文档结束而结束
"set nowrapscan

" 冒号命令和搜索命令历史列表为50
set history=50


""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  窗口信息显示区配置
""""""""""""""""""""""""""""""""""""""""""""""""""

" 隐藏gvim的菜单栏
if has("gui_running")
    " gvim-only stuff
    set guioptions-=m
    set guioptions-=T
endif

" 右下角显示光标位置
set ruler

" 在窗口右下角显示一个完整的命令已经完成的部分
set showcmd

" 信息显示区高度控制
set laststatus=2

" 配置状态栏显示文件绝对路径
" set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F\ [%{&ff}]\ [POS=%l,%v][%p%%]\ [LEN=%L]

" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3

" 是命令候选项以类似菜单的形式出现
set wildmenu

"设置Vim 打开时窗口大小
"set lines=25 columns=80


""""""""""""""""""""""""""""""""""""""""""""""""""
" => 文件配置
""""""""""""""""""""""""""""""""""""""""""""""""""
" 备份文件，当文件正常保存后删除
set nobackup 
set writebackup 

" 保证文件在win和unix都可以使用，不过是vim中
set sessionoptions+=unix,slash

" 自动保存,失去焦点、却换buffer时自动保存
au FocusLost * silent! up
au BufLeave * silent! up

" 正在编辑的文件在打开后被其他程序更新，则自动加载
set autoread

" 在处理未保存或只读文件的时候，弹出确认
set confirm

" 保留一份原始的文档后缀名为 .orig
" set patchmode=.orig

" 自动识别文件类型 使用相应的plugin 使用相应的缩进
filetype plugin indent on

" vim识别text文件超过78个字符自动断行
"autocmd FileType text setlocal textwidth=78

" 打开文件使光标回到退出前的位置 就是 '"
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g'\"" |
    \ endif



""""""""""""""""""""""""""""""""""""""""""""""""""
" => 插件配置
""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree 配置 F3开启和关闭树
map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=15

"缩进指示线"
autocmd VimEnter * :IndentGuidesEnable
let g:indent_guides_guide_size=1
let g:indent_guides_start_level=2
hi IndentGuideOdd ctermbg=black
hi IndentGuideEven ctermbg=darkgrey
 
"autopep8设置"
let g:autopep8_disable_show_diff=1


""""""""""""""""""""""""""""""""""""""""""""""""""
" => 插件管理vundle配置
""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" 设置包括vundle和初始化相关的runtime path
" 判断操作系统类型
if(has('win32') || has('win64'))
    set rtp+=$HOME/vimfiles/bundle/Vundle.vim/
    call vundle#begin('$USERPROFILE/vimfiles/bundle/')
else
    set rtp+=~/.vim/bundle/Vundle.vim
    let path='~/.vim/bundle'
endif
call vundle#begin(path)
" 另一种选择, 指定一个vundle安装插件的路径
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" 安装markdown插件
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" 语法检查插件
Plugin 'scrooloose/syntastic'

" PEP8代码风格检查
Plugin 'nvie/vim-flake8'

" 配色方案
Plugin 'altercation/vim-colors-solarized'

" 树形文件浏览
Plugin 'scrooloose/nerdtree'

" 缩进指示线
Plugin 'nathanaelkane/vim-indent-guides'

" 括号自动补全
Plugin 'jiangmiao/auto-pairs'

" 自动格式化pep8格式
Plugin 'tell-k/vim-autopep8'



" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



