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
