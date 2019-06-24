set nocompatible              " be iMproved, required
filetype off                  " required

"=================================================="
"===============General settings==================="
"=================================================="
"设置编码格式"
set langmenu=zh_CN.UTF-8
set helplang=cn
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

" 配色方案
colorscheme molokai 
set t_Co=256

"语法高亮"
syntax on 
syntax enable
set number "显示行号"
set tabstop=4 "tab缩进4字符"
set shiftwidth=4 "统一缩进4字符"
set softtabstop=4
set noexpandtab "禁止使用空格替换tab"
set smarttab "行首段首使用制表符"

set showmatch "显示括号的匹配项"

set autoindent "设置继承前一行缩进方式"
set cindent "c格式缩进"
set smartindent "C代码自动缩进"
filetype indent on

set mouse=a "启用鼠标"
set hlsearch "高亮搜索项"
set incsearch "逐字符高亮"
set cursorline "高亮当前航"
set cursorcolumn "高亮当前列"
set ruler "状态栏标尺"
set noerrorbells "禁止错误提示音"

set confirm "未保存突出时提供确认提示"
set nobackup "禁止保存临时文件，下同"
set noswapfile

set iskeyword+=_,$,@,%,#,- "含有上述符号时禁止换行"
set linespace=0
set cmdheight=2 "命令行高度"
set backspace=indent,eol,start "退格正常处理缩进"

set wildmenu             " vim自身命名行模式智能补全
set completeopt-=preview " 补全时不显示窗口，只显示补全列表
set wildmode=longest:full,full " Display Vim command mode autocompletion list

" 更改光标移动键位
nnoremap j h
nnoremap k j
nnoremap i k

"===================================================="
"=================Plugin Seetings===================="
"====================================================""
" set the runtime path to include Vundle and initialize
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"	对于不需要的插件，注释掉对应的Plugin并进入Vim重载PluginInstall
"	Vim插件管理器（必备）
Plugin 'VundleVim/Vundle.vim'
"	YCM自动补全插件
Plugin 'Valloric/YouCompleteMe'
" 函数自动补全if-endif
Plugin 'tpope/vim-endwise'
" 快速注释插件
Plugin 'tpope/vim-commentary'
" 自动替换插件
Plugin 'tpope/vim-surround'
" 文本对其插件
Plugin 'godlygeek/tabular'
"	文件目录树插件
Plugin 'scrooloose/nerdtree'
" NerdTree 文件类型高亮
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
" 与上一个插件搭配使用的
Plugin 'ryanoasis/vim-devicons'
"用户名emoji等补全
Plugin 'rhysd/github-complete.vim'
" NerdTree显示git状态
Plugin 'Xuyuanp/nerdtree-git-plugin'
"	自动缩进
Plugin 'Yggdroot/indentLine'
"	括号自动配对
Plugin 'jiangmiao/auto-pairs'
"	自动pep8格式
Plugin 'tell-k/vim-autopep8'
"	注释插件
Plugin 'scrooloose/nerdcommenter'
"	彩色多重括号
" Plugin 'luochen1990/rainbow'
Plugin 'kien/rainbow_parentheses.vim'
"	语法检查
Plugin 'w0rp/ale'
"	状态栏优化
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"	C++代码折叠
"Plugin 'LucHermitte/VimFold4C'
"	快速定位插件
Plugin 'ctrlpvim/ctrlp.vim'
"	显示tags (TagbarToggle)
Plugin 'majutsushi/tagbar'
"	C++ IDE模式
Plugin 'chxuan/cpp-mode'
"	文本搜索插件
Plugin 'mileszs/ack.vim'
"	ROS插件
Plugin 'taketwo/vim-ros'
"	python支持
Plugin 'ohmystack/python-vim'
"	cpp高亮增强
Plugin 'octol/vim-cpp-enhanced-highlight'
"	vim C家族语言格式
Plugin 'rhysd/vim-clang-format'
"	调用Cmake命令
Plugin 'jalcine/cmake.vim'
"	Cmake语法高亮
Plugin 'nickhutchinson/vim-cmake-syntax'
call vundle#end()            " required
filetype plugin indent on    " required

"" 定义leader建
let mapleader=","

"---------------------YCM Configuration---------------------------"
"默认配置文件路径"
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"打开vim时不再询问是否加载ycm_extra_conf.py配置"
let g:ycm_confirm_extra_conf=0
set completeopt=longest,menu
"python解释器路径"
let g:ycm_path_to_python_interpreter='/usr/bin/python2.7'
"是否开启语义补全"
let g:ycm_seed_identifiers_with_syntax=1
"ycm符号
"是否在注释中也开启补全"
let g:ycm_complete_in_comments=1
let g:ycm_collect_identifiers_from_comments_and_strings = 0
"开始补全的字符数"
let g:ycm_min_num_of_chars_for_completion=2
"补全后自动关闭预览窗口"
let g:ycm_autoclose_preview_window_after_completion=1
" 禁止缓存匹配项,每次都重新生成匹配项"
let g:ycm_cache_omnifunc=0
"字符串中也开启补全"
let g:ycm_complete_in_strings = 1
"离开插入模式后自动关闭预览窗口"
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
nnoremap <leader>u :YcmCompleter GoToDeclaration<cr>
" 已经使用cpp-mode插件提供的转到函数实现的功能
nnoremap <leader>i :YcmCompleter GoToDefinition<cr> 
nnoremap <leader>o :YcmCompleter GoToInclude<cr>
nnoremap <leader>ff :YcmCompleter FixIt<cr>
nmap <F5> :YcmDiags<cr>
" ---------------------ranbow pair---------------------------------"
" 多色括号
let g:rbpt_colorpairs = [ ['brown', 'RoyalBlue3'], ['Darkblue', 'SeaGreen3'], ['darkgray', 'DarkOrchid3'], ['darkgreen', 'firebrick3'],['darkcyan', 'RoyalBlue3'],['darkred', 'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['brown', 'firebrick3'],['gray', 'RoyalBlue3'],['black',       'SeaGreen3'],['darkmagenta', 'DarkOrchid3'],['Darkblue',  'firebrick3'],['darkgreen', 'RoyalBlue3'],['darkcyan', 'SeaGreen3'],['darkred', 'DarkOrchid3'],['red', 'firebrick3']]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
" -----------------------airline-----------------------------------""
let g:airline_theme="molokai"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"----------------------- Ale配置----------------------------------"
"始终开启标志列
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"使用clang对c和c++进行语法检查，对python使用pylint进行语法检查
let g:ale_linters = {
\   'c++': ['clang'],
\   'c': ['clang'],
\   'python': ['pylint'],
\}
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '✹'



" ctags
set tags+=/usr/include/tags
set tags+=~/.vim/systags
set tags+=~/.vim/x86_64-linux-gnu-systags
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&',']']
"------------------------映射tagbar-------------------------------"
let g:tagbar_width = 30
nnoremap <silent> <leader>t :TagbarToggle<cr>
inoremap <silent> <leader>t <esc> :TagbarToggle<cr>

"缩进指示线"
let g:indentLine_char='┆'
let g:indentLine_enabled = 1

"autopep8设置"
let g:autopep8_disable_show_diff=1

" C++ IDE模式快捷键映射
nnoremap <leader>y :CopyCode<cr>
nnoremap <leader>p :PasteCode<cr>
nnoremap <leader>U :GoToFunImpl<cr>
nnoremap <silent> <leader>a :Switch<cr>
nnoremap <leader><leader>fp :FormatFunParam<cr>
nnoremap <leader><leader>if :FormatIf<cr>

" NERDTree 
nnoremap <silent> <leader>n :NERDTreeToggle<cr>
inoremap <silent> <leader>n <esc> :NERDTreeToggle<cr>
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1         
let g:NERDTreeHighlightFoldersFullName = 1 
let g:NERDTreeDirArrowExpandable='▷'
let g:NERDTreeDirArrowCollapsible='▼'

" nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" tabular
nnoremap <leader>l :Tab /\|<cr>
nnoremap <leader>= :Tab /=<cr>
