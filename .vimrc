set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'
Plugin 'ap/vim-buftabline'
Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'altercation/solarized'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'

set rtp+=~/.fzf
Plugin 'junegunn/fzf.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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

source $LOCAL_ADMIN_SCRIPTS/master.vimrc

let mapleader=','
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" airline
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline_theme='base16'
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" ctrlp.vim
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'
let g:ctrlp_working_path_mode = 'ra'
" https://coderwall.com/p/5xv7sq/ctrlp-root-markers
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_match_window = 'results:30'
nmap <Leader>p :CtrlPBuffer<CR>

" vim-buftabline. Points to TabLine* in vim
hi TabLineFill cterm=none ctermfg=none ctermbg=none
hi TabLine     cterm=none ctermfg=none ctermbg=none
hi TabLineSel  cterm=bold ctermfg=green ctermbg=none
hi PmenuSel    cterm=bold ctermfg=red ctermbg=none
let g:buftabline_numbers = 1

" nnoremap <tab>   :bnext<CR>
nnoremap <Leader>-.   :bnext<CR>
nnoremap <Leader>-,   :bprev<CR>

source ~/biggrep.vim
nnoremap <Leader>s   :FBGS<SPACE>

" YCM must use the same Python version it's linked against
" let g:ycm_path_to_python_interpreter = '/data/users/ritun/fbsource/fbcode/third-party-buck/gcc-5-glibc-2.23/build/python/2.7/bin/python2.7'
" Default ycm_extra_conf.py for fbcode
" let g:ycm_global_ycm_extra_conf = '/home/ritun/.vim/bundle/YouCompleteMe/ycm_extra_conf_fbcode.py'
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_show_diagnostics_ui = 0
" nnoremap <Leader>d   :YcmCompleter GoTo<CR>

" tagbar
nmap <F2> :TagbarOpen f<CR>
nmap <F3> :TagbarToggle<CR>

imap jj <ESC>

" fzf
nmap <Leader>t :Files<CR>
