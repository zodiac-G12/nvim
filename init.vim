"""""""""" idiom
" :call coc#util#install()
" :call dein#install()
" :call dein#update()
" :call dein#clear_state()
" :call dein#recache_runtimepath()
" :CocUpdate

"""""""""" dein.vimの設定
if &compatible
  set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  " dein.tomlで指定したプラグインをインストール
  call dein#load_toml('~/.config/nvim/dein.toml')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"""""""""" coc.nvimの設定
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-rust-analyzer',
  \ 'coc-rls',
  \ 'coc-json',
  \ 'coc-prettier',
  \ ]

"""""""""" LSP設定
" rust-analyzerの設定
let g:rust_analyzer_server_path = 'rust-analyzer'
" TypeScriptのLSP設定
autocmd FileType typescript setlocal omnifunc=coc#refresh()
" RustのLSP設定
autocmd FileType rust setlocal omnifunc=coc#refresh()

""""" 自動フォーマット
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

""""" 補完設定
" 補完ポップアップ時は Enter で候補確定、それ以外は改行
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<CR>"
" Tabで補完確定、Shift-Tabで戻る
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

""""" 定義参照
"\d で定義にジャンプ
nnoremap <leader>d :CocCommand tsserver.goToSourceDefinition<CR>
"\b で定義から元の場所にジャンプ
nnoremap <leader>b <C-o>
"\l で定義を見る
nmap <leader>l :call CocActionAsync('doHover')<CR>

"""""""""" 基本設定
set number             "行番号を表示
set fileencoding=UTF-8
set fenc=UTF-8
set noswapfile
set mouse=
set clipboard=unnamed
set autoindent         "改行時に自動でインデントする
set tabstop=1          "タブを何文字の空白に変換するか
set shiftwidth=2       "自動インデント時に入力する空白の数
set expandtab          "タブ入力を空白に変換
set splitright         "画面を縦分割する際に右に開く
set clipboard=unnamed  "yank した文字列をクリップボードにコピー
set hls                "検索した文字をハイライトする
" inoremap { {}<LEFT>
" inoremap [ []<LEFT>
" inoremap ( ()<LEFT>


"""""""""" カラースキーマなど
colorscheme gruvbox
set background=dark
set termguicolors
highlight Normal guibg=NONE
" let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=darkolivegreen ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=darkslateblue  ctermbg=3
let g:svelte_indent_script=0
let g:svelte_indent_style=0

"""""""""" コマンド
" markdownをhtmlで表示する
let g:previm_open_cmd='open -a Google\ Chrome'
