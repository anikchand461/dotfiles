" ───────────────────────────────────────
" 🎨 Visual & Navigation Enhancements
" ───────────────────────────────────────

" Line numbers: absolute + relative (perfect for quick jumps!)
set number
set relativenumber

" Syntax highlighting — bring on the colors! 🌈
syntax on
filetype plugin indent on    " Enable filetype detection + smart indents

" ───────────────────────────────────────
" ✨ Polish & Comfort
" ───────────────────────────────────────

set termguicolors            " Enable true color support (for modern terminals)
set background=dark          " Use dark background (works well with most themes)

" Smooth scrolling & no annoyances
set scrolloff=8              " Keep 8 lines of padding above/below cursor
set sidescrolloff=8
set hidden                   " Allow switching buffers without saving
set mouse=a                  " Enable mouse (optional; disable if you prefer pure keyboard)

" Search smarter
set ignorecase
set smartcase                " Case-sensitive only if query has uppercase

" Auto-close brackets: (), [], {}, <>
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap < <<><Left>

" Optional: Only auto-close if cursor is at end of line or before whitespace
" (prevents annoying behavior inside words)
" inoremap ( ()<Left>
" inoremap ) <C-O>:if getline('.')[col('.')-1] == ')'<Bar>normal! l<Bar>else<Bar>normal! a)<Bar>endif<CR>

" But for simplicity and reliability, stick with basic version unless you hit edge cases.
