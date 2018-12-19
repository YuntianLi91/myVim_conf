set nocompatible              " be iMproved, required
filetype off                  " required
filetype plugin on 			  "开启剪贴板 "

"=================================================="
"===============General settings==================="
"=================================================="
color molokai "配色方案"

syntax on "开启语法高亮"
syntax enable
set number "显示行号"
set tabstop=4 "tab缩进4字符"
set shiftwidth=4 "统一缩进4字符"
set softtabstop=4
set noexpandtab "禁止使用空格替换tab"
set smarttab ""

set showmatch "显示括号的匹配项"

set autoindent "设置继承前一行缩进方式"
set cindent "c格式缩进"
set smartindent "C代码自动缩进"

set mouse=a "启用鼠标"
set hlsearch "高亮搜索项"
set incsearch "逐字符高亮"
set cursorline "高亮当前航"
set cursorcolumn "高亮当前列"
set ruler "状态栏标尺"
set noeb "禁止错误提示音"

set confirm "未保存突出时提供确认提示"
set nobackup "禁止保存临时文件，下同"
set noswapfile

set iskeyword+=_,$,@,%,#,- "含有上述符号时禁止换行"
set linespace=0
set cmdheight=2 "命令行高度"
set backspace=indent,eol,start "退格正常处理缩进"
"===================================================="
"=================Plugin Seetings===================="
"====================================================""
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"	对于不需要的插件，注释掉对应的Plugin并进入Vim重载PluginInstall
"	Vim插件管理器（必备）
Plugin 'VundleVim/Vundle.vim'
"	自动补全插件
Plugin 'Valloric/YouCompleteMe'
"	文件目录树插件
Plugin 'scrooloose/nerdtree'
"	自动缩进
Plugin 'Yggdroot/indentLine'
"	括号自动配对
Plugin 'jiangmiao/auto-pairs'
"	自动pep8格式
Plugin 'tell-k/vim-autopep8'
"	注释插件
Plugin 'scrooloose/nerdcommenter'
"	彩色多重括号
"	Plugin 'luochen1990/rainbow'
Plugin 'kien/rainbow_parentheses.vim'
"	语法检查
Plugin 'w0rp/ale'
"	状态栏优化
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"	C++代码折叠
Plugin 'LucHermitte/VimFold4C'
"	快速定位插件
Plugin 'ctrlpvim/ctrlp.vim'
"	显示tags (TagbarToggle)
Plugin 'majutsushi/tagbar'
"	C++ IDE模式
Plugin 'chxuan/cpp-mode'
"	文本搜索插件
Plugin 'mileszs/ack.vim'

call vundle#end()            " required
filetype plugin indent on    " required

"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/bin/python3'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关机预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:rbpt_colorpairs = [ ['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'],['darkcyan', 'RoyalBlue3'],['darkred', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['brown', 'firebrick3'],['gray', 'RoyalBlue3'],['black',       'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['Darkblue',  'firebrick3'],['darkgreen', 'RoyalBlue3'],['darkcyan', 'SeaGreen3'],['darkred', 'DarkOrchid3'],['red', 'firebrick3']]
let g:rbpt_max = 16
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"F2开启和关闭树"
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
"显示书签"
let NERDTreeShowBookmarks=1
"设置忽略文件类型"
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
"窗口大小"
let NERDTreeWinSize=25

"映射tagbar
map <F3> :TagbarToggle<CR>

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

map <F4> <leader>ci <CR>

" C++ IDE模式快捷键映射
nnoremap <leader>y :CopyCode<cr>
nnoremap <leader>p :PasteCode<cr>
nnoremap <leader>U :GoToFunImpl<cr>

""""""""""""""""""""""""""""""""""""""""C语言的编译运行"""""""""""""""""""""""""""""""""""""""""
" <F5>编译C/py语言，<F6>运行
augroup ccompile
    autocmd Filetype c map <F5> <Esc>:w<CR>:!gcc % -std=c99 -g -o %< -lm <CR>
    autocmd Filetype cpp map <F5> <Esc>:w<CR>:!g++ % -std=c++11 -g -o %< -lm <CR>
    autocmd Filetype python map <F5> <Esc>:w<CR>:!python % <CR>
augroup END

augroup crun
    autocmd Filetype c map <F6> <Esc>:! ./%< <CR>
    autocmd Filetype cpp map <F6> <Esc>:! ./%< <CR>
augroup END

" 整行注释
augroup comment
    autocmd Filetype c noremap <buffer> <localleader>/ I//<Esc>
    autocmd Filetype cpp noremap <buffer> <localleader>/ I//<Esc>
    autocmd Filetype h noremap <buffer> <localleader>/ I//<Esc>
augroup ENDkien/rainbow_parentheses.vim

augroup nocomment
    autocmd Filetype c noremap <buffer> <localleader>. ^xx
    autocmd Filetype cpp noremap <buffer> <localleader>. ^xx
    autocmd Filetype h noremap <buffer> <localleader>. ^xx
augroup END

