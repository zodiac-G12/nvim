" :call coc#util#install()
" :call dein#install()
" :call dein#update()
" :call dein#clear_state()
" :CocUpdate

" dein.vimの設定
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

" coc.nvimの設定
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-rls',
  \ ]

" TypeScriptのLSP設定
autocmd FileType typescript setlocal omnifunc=coc#refresh()

" RustのLSP設定
autocmd FileType rust setlocal omnifunc=coc#refresh()

" キーマッピングの設定など

" set number             "行番号を表示
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
colorscheme gruvbox
set termguicolors
let g:indent_guides_auto_colors=1
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

"\d で定義にジャンプ
nnoremap <leader>d :CocCommand tsserver.goToSourceDefinition<CR>
"\g で定義から元の場所にジャンプ
nnoremap <leader>g <C-o>
