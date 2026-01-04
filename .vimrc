" ============================
" 基础设置（Vim9 兼容）
" ============================
set nocompatible
filetype off
syntax on

" ============================
" vim-plug 初始化
" ============================
call plug#begin('~/.vim/plugged')

" vim-plug 自身
Plug 'junegunn/vim-plug'

" 文件树
Plug 'preservim/nerdtree'

" Taglist
Plug 'vim-scripts/taglist.vim'

" 现代补全系统（方案 A）
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

filetype plugin indent on

" ============================
" NERDTree 配置
" ============================
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25
let NERDTreeDirArrows=0

" ============================
" Taglist 配置
" ============================
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=25

" ============================
" coc.nvim 基础配置
" ============================
" 使用 <tab> 选择补全项
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"

" 跳转、诊断、重构等快捷键
nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)

" 显示文档
nnoremap <silent> K :call CocActionAsync('doHover')<CR>

" 代码动作（修复、重构）
nmap <leader>a <Plug>(coc-codeaction)

" 格式化
nmap <leader>f <Plug>(coc-format)

" 保存时自动格式化
autocmd BufWritePre *.c,*.cpp,*.h,*.hpp :silent! CocCommand clangd.applyFixes
autocmd BufWritePre *.c,*.cpp,*.h,*.hpp :silent! CocCommand editor.action.formatDocument

" ============================
" coc-settings.json 自动加载
" ============================
if !isdirectory(expand("~/.vim"))
    call mkdir(expand("~/.vim"), "p")
endif

if !filereadable(expand("~/.vim/coc-settings.json"))
    call writefile([
    \ '{',
    \ '  "clangd.path": "clangd",',
    \ '  "clangd.arguments": [',
    \ '    "--background-index",',
    \ '    "--clang-tidy",',
    \ '    "--completion-style=detailed",',
    \ '    "--header-insertion=iwyu"',
    \ '  ],',
    \ '  "suggest.autoTrigger": "always",',
    \ '  "diagnostic.enable": true,',
    \ '  "coc.preferences.formatOnSaveFiletypes": ["c", "cpp", "h", "hpp"]',
    \ '}'
    \ ], expand("~/.vim/coc-settings.json"))
endif

" ============================
" C/C++ 编译命令
" ============================
set makeprg=g++\ -Wall\ %

" ============================
" 自动补全括号
" ============================
inoremap ( ()<ESC>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap [ []<ESC>i
inoremap ] <c-r>=ClosePair(']')<CR>
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

function! ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endfunction

" ============================
" 常规编辑体验优化
" ============================
set autoread
set completeopt=preview,menu,longest
set nobackup
set autowrite
set ruler
set cursorline
set cursorcolumn
set magic
set guioptions-=T
set guioptions-=m
set foldcolumn=0
set foldlevel=3
set noeb
set confirm
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set number
set history=1000
set noswapfile
set ignorecase
set hlsearch
set incsearch
set gdefault
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set laststatus=2
set cmdheight=2
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set linespace=0
set wildmenu
set backspace=2
set whichwrap+=<,>,h,l
set selection=exclusive
set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=1
set scrolloff=3
set smartindent

" ============================
" 普通 txt 文件高亮
" ============================
autocmd BufRead,BufNewFile * setfiletype txt
