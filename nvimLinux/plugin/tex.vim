autocmd FileType tex nnoremap <leader>ll :LLPStartPreview<CR>
let g:livepreview_cursorhold_recompile = 0      "prevent recompiling on cursor holds only when written to disk

"Nav
autocmd FileType tex nnoremap <C-Space> /<++><Enter>"_c4l
autocmd FileType tex inoremap <C-Space> <Esc>/<++><Enter>"_c4l

"text
autocmd FileType tex inoremap ;bf \textbf{}<++><Esc>T{i
autocmd FileType tex inoremap ;it \textit{}<++><Esc>T{i
autocmd FileType tex inoremap ;ol \begin{enumerate}<Enter><Enter>\end{enumerate}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;ul \begin{itemize}<Enter><Enter>\end{itemize}<Enter><Enter><++><Esc>3kA\item<Space>
autocmd FileType tex inoremap ;li <Enter>\item<Space>
autocmd FileType tex inoremap ;chap \chapter{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sec \section{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;ssec \subsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;sssec \subsubsection{}<Enter><Enter><++><Esc>2kf}i
autocmd FileType tex inoremap ;beg \begin{DELRN}<Enter><++><Enter>\end{DELRN}<Enter><Enter><++><Esc>4k0fR:MultipleCursorsFind<Space>DELRN<Enter>c
autocmd FileType tex inoremap ;up <Esc>/usepackage<Enter>o\usepackage{}<Esc>i
autocmd FileType tex nnoremap ;up /usepackage<Enter>o\usepackage{}<Esc>i


" Math
autocmd FileType tex inoremap ;e $$<Space><++><Esc>2T$i
autocmd FileType tex inoremap ;ra {\rightarrow}
autocmd FileType tex inoremap ;la {\leftarrow}
autocmd FileType tex inoremap ;lra {\leftrightarrow}
autocmd FileType tex inoremap ;fa {\forall}
autocmd FileType tex inoremap ;= &=<Space>

autocmd FileType tex inoremap ;fr \frac{}{<++>}<++><Esc>T{;i
autocmd FileType tex inoremap ;sup ^{}<++><Esc>T{i
autocmd FileType tex inoremap ;sub _{}<++><Esc>T{i
autocmd FileType tex inoremap ;al \begin{align*}<Enter><Enter>\end{align*}<Enter><Enter><++><Esc>3kA
autocmd FileType tex inoremap ;ma \begin{matrix*}<Enter><Enter>\end{matrix*}<Enter><Enter><++><Esc>3kA

