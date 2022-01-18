" augroup markdownVimBinding
" au! markdownVimBinding
"Markdown stuff
autocmd FileType markdown nnoremap <C-Space> /<++><Enter>"_c4l
autocmd FileType markdown inoremap <C-Space> <Esc>/<++><Enter>"_c4l
autocmd FileType markdown inoremap ;bf ****<Space><++><Esc>2F*i
autocmd FileType markdown inoremap ;it __<Space><++><Esc>F_i
autocmd FileType markdown inoremap ;hr [](<++>)<Space><++><Esc>F]i
autocmd FileType markdown inoremap ;im ![](<++>)<Space><++><Esc>F]i

autocmd FileType markdown set tabstop=2
autocmd FileType markdown set shiftwidth=2
" lists
function! s:MarkdownOrderedList(rowNum) abort
    if a:rowNum > 0
        let outputTextList = []
        for i in range(1,a:rowNum,+1)
            call add(outputTextList, i .. ")")
        endfor
        call append(line("."), outputTextList)
    else
        echom "Please give numbers bigger than 0."
    endif
    return 1
endfunction
command! -buffer -nargs=1 CreateMarkdownList call <SID>MarkdownOrderedList(<args>)
autocmd FileType markdown nnoremap <buffer>;ol <Cmd>execute "CreateMarkdownList " . expand("<cword>")<CR>

"tables

function! s:MarkdownTable(columnNum, rowNum) abort
    if a:columnNum > 0 && a:rowNum > 0
        let tableItem=" <++> \|"
        let row = "|" .. repeat(tableItem, a:columnNum)
        " #row number is increased by 1 for header row and add
        " row for separating header and content cells
        let outputTextList = repeat([row], a:rowNum + 1)
        let headerSeperatingRow = '|' .. repeat(' ---- |', a:columnNum)
        call insert(outputTextList, headerSeperatingRow, 1)
        call append(line("."), outputTextList)
    else
        echom "Please give numbers bigger than 0."
    endif
    return 1
endfunction
command! -buffer -nargs=+ CreateMarkdownTable call <SID>MarkdownTable(<f-args>)
" nnoremap <buffer>;ta <Cmd>:<C-U>exe CommandCreateMarkdownTable<Space>

" Math
autocmd FileType markdown inoremap ;e $$<Space><++><Esc>2T$i
autocmd FileType markdown inoremap ;ra {\rightarrow}
autocmd FileType markdown inoremap ;la {\leftarrow}
autocmd FileType markdown inoremap ;lra {\leftrightarrow}
autocmd FileType markdown inoremap ;fa {\forall}
autocmd FileType markdown inoremap ;= &=<Space>

autocmd FileType markdown inoremap ;fr \frac{}{<++>}<++><Esc>T{;i
autocmd FileType markdown inoremap ;sup ^{}<++><Esc>T{i
autocmd FileType markdown inoremap ;sub _{}<++><Esc>T{i

" augroup end
