" vim:tw=80:fo+=m
" ===================================插件加载器================================
" Vundle initialization
" Avoid modify this section, unless you are very sure of what you are doing

set nocompatible    " no vi-compatible, required
filetype off        " required

" Setting up Vundle - the best vim plugin manager
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle..."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Plugins
Plugin 'VundleVim/Vundle.vim'

" ===================================插件=====================================
Plugin 'scrooloose/nerdtree'      " 文件浏览器
Plugin 'kien/ctrlp.vim' " 文件查找跳转
Plugin 'scrooloose/nerdcommenter' " 代码注释
Plugin 'tpope/vim-fugitive' " Git
Plugin 'jiangmiao/auto-pairs' " Insert or delete brackets, parens, quotes in pair
Plugin 'majutsushi/tagbar' " Tag. Need 'Exuberant ctags 5.5'
Plugin 'mattn/emmet-vim' " Fast HTML
Plugin 'godlygeek/tabular' " 对齐
Plugin 'tpope/vim-surround'
Plugin 'nanotech/jellybeans.vim' " 主题
Plugin 'delek.vim' "备用主题
Plugin 'shawncplus/phpcomplete.vim'  " PHP自动补全
Plugin 'mattn/calendar-vim' " 日历
Plugin 'vimwiki/vimwiki' " 个人wiki
Plugin 'vim-scripts/VOoM'
Plugin 'kannokanno/previm' 
Plugin 'MarcWeber/vim-addon-mw-utils' " for snipmate
Plugin 'tomtom/tlib_vim' " for snipmate
Plugin 'garbas/vim-snipmate' " snipmate
Plugin 'aperezdc/vim-template'
Plugin 'itchyny/lightline.vim'


" ===================================安装插件=================================
" install plugins the first time vim runs
if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif
" ============================================================================

" ===================================用户配置=================================
let mapleader=','
set guifont=monaco:h13
colorscheme jellybeans
set fenc=utf-8
set encoding=utf-8
set fileencodings=utf-8,gbk,cp936,latin-1
set clipboard=unnamed
set laststatus=2
set nu
syntax enable
syntax on
set autoread 
set incsearch 
set hlsearch 
set backspace=2 

set tabstop=4          " 设置Tab键的宽度
set shiftwidth=4
set expandtab          " 使用空格代替Tab
set cindent

set foldmethod=syntax  " 选择代码折叠类型
set foldlevel=99       " 禁止自动折叠

" 设置无文件备份和交换文件
set nobackup
set noswapfile
set hidden                   " 允许在有未保存的修改时切换缓冲区

set listchars=tab:▸\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set list

nnoremap ,i :set list!<CR>
inoremap jj <ESC>
nmap <leader>, :w<CR>

" disable Ex mode
noremap Q <NOP>

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" 方便在窗口之间进行切换
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

nnoremap ,cd :cd %:p:h<cr>:pwd<cr>

" for Plugin 'itchyny/lightline.vim'
if !has('gui_running')
    set t_Co=256
endif


filetype on
filetype plugin on
filetype indent on

" 自动补全
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd filetype php setlocal dictionary+=~/.vim/dict/php.dict
autocmd filetype python setlocal dictionary+=~/.vim/dict/python.dict
autocmd filetype javascript setlocal dictionary+=~/.vim/dict/node.dict
set completeopt=longest,menuone
" set completeopt=preview,menuone

" file type specific settings
if has('autocmd') && !exists('autocommands_loaded')
    let autocommands_loaded = 1
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
    autocmd FileType html setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType xml setlocal ts=4 sts=4 sw=4 noexpandtab
    autocmd FileType jade setlocal ts=2 sts=2 sw=2 noexpandtab
    autocmd FileType javascript setlocal ts=2 sts=2 sw=2 noexpandtab

    autocmd BufWritePost .vimrc source %
    autocmd BufWritePost .vimrc.local source %

    autocmd BufNewFile,BufRead *.ejs set filetype=html
    autocmd BufNewFile,BufRead *.ino set filetype=c
    autocmd BufNewFile,BufRead *.svg set filetype=xml
    autocmd! BufEnter * call CheckForCustomConfiguration()

    autocmd BufRead,BufNewFile *.html set fdm=indent 
    autocmd BufRead,BufNewFile Gruntfile set ft=javascript
    autocmd BufRead,BufNewFile *.md set ft=markdown
endif

"设置tag为当前工作目录下的tags
set tags=tags

" NERDTree
nnoremap tr :NERDTreeToggle<CR>
nmap <silent> <leader>y :NERDTreeFind<CR>
let NERDTreeHijackNetrw=1
let NERDTreeMouseMode=1
let NERDTreeQuitOnOpen=0


nnoremap tl :TagbarToggle<CR>
let g:tagbar_ctags_bin = "/usr/local/bin/ctags"

" VimWiki
let g:vimwiki_menu = ''
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_w32_dir_enc = 'utf-8'
let g:vimwiki_use_mouse = 1
let g:vimwiki_camel_case = 0
let g:vimwiki_valid_html_tags='font,b,i,s,u,sub,sup,kbd,br,hr,div,del,code,red,center,left,right,pre'

let wiki_main = {}
let wiki_root = '~/Documents/vimwiki/'
let wiki_main.path = wiki_root . 'wiki/'
let wiki_main.path_html = wiki_root . 'html/'
let wiki_main.template_path = wiki_root . 'template/'
let wiki_main.template_default = 'tpl'
let wiki_main.template_ext = '.html'
let wiki_main.auto_export = 0
" vimwiki在vim中代码高亮显示 
" 'js':'javascript' js是别名,用在 calss='brush: js' , javascript是vim的语法
" 着色文件 配合SyntaxHighlighter
" http://alexgorbatchev.com/SyntaxHighlighter/manual/brushes/ 非常完美，既能在
" vim中代码高亮，也能再html中代码高亮
let wiki_main.nested_syntaxes = {'sql': 'sql', 'html': 'html', 'css': 'css', 'js': 'javascript', 'vim' : 'vim', 'py':'python'}

let g:vimwiki_list = [wiki_main]

" NERD_Commenter
let NERDSpaceDelims = 1

let g:python_version_2 = 1

" 使用~/.vim/syntas/php.vim,关闭分号错误显示
let php_show_semicolon_error = 0

" php case,default缩进
let g:PHP_vintage_case_default_indent = 1

" 使HTML可以正确缩进
" http://askubuntu.com/questions/392573/how-do-i-get-vim-to-indent-all-html-tags
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc" 
let g:html_indent_style1 = "inc" 

" template
let g:email = 'hellowangit@gmail.com'
let g:templates_no_autocmd = 1 " 不要自动插入模板

" 增加JSON的可读性
" :JsonTool 格式化当前行
" :'<,'>JsonTool 格式化选中行
" :10,25JsonTool 格式化10-15行
" :%JsonTool 格式化整个文件
" 有个问题，有时格式化会将中文变成utf-8编码 如\u3321
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool


" 插入时间
" 格式 2015-10-12 10:12
command! -nargs=0 InsertDate r!date "+\%Y-\%m-\%d \%H:\%M"

augroup filetype_json 
    autocmd!
    autocmd BufRead,BufNewFile *.json setlocal foldmethod=marker
    autocmd BufRead,BufNewFile *.json setlocal foldmarker={,}
augroup END

" 不要自动插入一个空格，影响到了书写vimwiki的todoList ［］
let g:AutoPairsMapSpace=0

" ctrlp
" TODO: 自定义底部状态栏
let g:ctrlp_by_filename = 1                   " 默认搜索文件
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp' " 设置缓存目录
let g:ctrlp_working_path_mode = 'ra'          " 以版本文件作为搜索点
nnoremap <leader>h :CtrlPMRUFiles<cr>         " 搜索历史文件
nnoremap <leader>b :CtrlPBuffer<cr>           " 搜索Buffer
nnoremap <leader>f :CtrlP getpwd()<cr>        " 搜索当前工作目录

" BufExplorer
let g:bufExplorerDisableDefaultKeyMapping=1    " Disable mapping.

" for acl in tmux
set shellpipe=>

au BufNewFile,BufRead *.c call CheckForCustomConfiguration()

" 加载当前项目下的指定配置
function! CheckForCustomConfiguration()
    " Check for .vim.custom in the directory containing the newly opened file
    let custom_config_file = expand('%:p:h') . '/.vim.custom'
    if filereadable(custom_config_file)
        exe 'source' custom_config_file
    endif
endfunction
