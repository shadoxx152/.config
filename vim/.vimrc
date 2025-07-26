call plug#begin()

Plug 'catppuccin/vim', { 'as': 'catppuccin' }
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'

call plug#end()

set termguicolors

let g:lightline = {'colorscheme': 'catppuccin_frappe'}
let g:airline_theme = 'catppuccin_frappe'

colorscheme catppuccin_frappe

" 启用语法高亮和文件类型插件
syntax on
filetype plugin indent on

" 行号显示
set number
set relativenumber " 可选，显示相对行号，适合跳转

" 缩进设置
set tabstop=4       " Tab 显示为 4 个空格
set shiftwidth=4    " >> << 缩进级别
set expandtab       " Tab 转为空格
set smartindent     " 自动缩进

" 搜索

set ignorecase      " 忽略大小写
set smartcase       " 有大写就大小写敏感
set incsearch       " 增量搜索
set hlsearch        " 高亮搜索结果

" 状态栏增强
set laststatus=2
set showmode        " 显示当前模式
set ruler           " 显示光标位置

" 鼠标支持
set mouse=a

" 剪贴板（适用于非终端 Vim）
set clipboard=unnamedplus

" 启动优化
set noswapfile
set nobackup
set nowritebackup

" 斜体 {
" 斜体需要终端支持, 如果不支持, 使用斜体部分可能显示异常
" 禁用选项 g:enableItalic 让异常显示恢复正常
if exists('g:enableItalic') && g:enableItalic
  set t_ZH=[3m
  set t_ZR=[23m
  " 注释以斜体显示
  hi Comment cterm=italic
endif
" }

set foldmethod=indent      " 折叠方式
set nofoldenable           " 不自动折叠
set foldcolumn=1           " 在行号前空出一列的宽度

set textwidth=80          " 一行显示 80 字符
if exists('g:noWrapLine') && g:noWrapLine
  set nowrap
  set sidescroll=6        " 当光标达到水平极端时 移动的列数
else
  set wrap                " 设置自动折行, 超过 textwidth, 则折行
endif
set linebreak             " 不在单词中间断行
set fo+=mB                " 断行对汉字的支持
set whichwrap+=<,>,h,l    " 允许Normal 或 Visual 模式下左右移动跨越行边界

set scrolloff=10

" 完整的光标形状配置
if has('nvim')
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
else
    " 进入 Insert 模式时
    let &t_SI = "\<Esc>[6 q"
    " 退出 Insert 模式时
    let &t_EI = "\<Esc>[2 q"
    " 进入 Replace 模式时
    let &t_SR = "\<Esc>[4 q"
endif
