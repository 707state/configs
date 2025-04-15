call plug#begin()

" List your plugins here
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'

Plug 'kana/vim-textobj-syntax' " key: y

Plug 'kana/vim-textobj-function', { 'for':[ 'c', 'cpp', 'vim', 'java' ] } " key: f/F, dont work with cpp
Plug 'sgur/vim-textobj-parameter' " key: ,
Plug 'easymotion/vim-easymotion'

Plug 'ghifarit53/tokyonight-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()


syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" for LeaderF

let g:Lf_GtagsAutoGenerate=0
let g:Lf_GtagsGutentags=1
let g:Lf_CacheDirectory=expand('~')

nmap <leader>fp :Leaderf file --popup
nmap <leader>rp :Leaderf rg --popup
nmap <leader>fn :Leaderf function<CR>
nmap <leader>fg :Leaderf rg <C-R>=expand("<cword>")<CR>
nmap <leader>fe :Leaderf rg -F <C-R>=expand("<cword>")<CR>
noremap <leader>gr :<C-U><C-R>=printf("Leaderf gtags -r %s --auto-jump",expand("<cword>"))<CR>
noremap <leader>gd :<C-U><C-R>=printf("Leaderf gtags -d %s --auto-jump",expand("<cword>"))<CR>
noremap <leader>go :<C-U><C-R>=printf("Leaderf gtags --recall %s","")<CR>
noremap <leader>gn :<C-U><C-R>=printf("Leaderf gtags --next %s","")<CR>
noremap <leader>gp :<C-U><C-R>=printf("Leaderf gtags --previous %s","")<CR>

" for gutentags
let g:gutentags_modules=['ctags', 'gtags_cscope'] " Let gutentags autogenerate ctags and gtags indexing file.
let g:gutentags_project_root=['.root'] " gutentags把有.root文件的目录当成是项目的根目录，来自动管理索引文件
let g:gutentags_cache_dir=expand(g:Lf_CacheDirectory.'/LeaderF/gtags')

" for gtags.vim
set cscopeprg='gtags-cscope' " 使用gtags-cscope代替cscope，这就能够启用旧的cscope命令
let Gtags_Close_When_Single=1 "如果搜索只有一个，就不打开搜索结果直接跳转

map <C-\><C-]> :GtagsCursor<CR>
nmap <C-\>d :Gtags -d <C-R>=expand("<cword>")<CR>
nmap <C-\>r :Gtags -r <C-R>=expand("<cword>")<CR>
nmap <C-\>g :Gtags -g <C-R>=expand("<cword>")<CR>
nmap <C-\>f :Gtags -f <C-R>=expand("<cword>")<CR>

" for vim-easymotion
map f <Plug>(easymotion-bd-f)
nmap f <Plug>(easymotion-overwin-f)
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
