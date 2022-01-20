" augroup markdownVimBinding
" au! markdownVimBinding
"Markdown stuff
autocmd FileType markdown nnoremap <buffer> <C-Space> /<++><Enter>"_c4l
autocmd FileType markdown inoremap <buffer> <C-Space> <Esc>/<++><Enter>"_c4l
autocmd FileType markdown inoremap <buffer> ;bf ****<Space><++><Esc>2F*i
autocmd FileType markdown inoremap <buffer> ;it __<Space><++><Esc>F_i
autocmd FileType markdown inoremap <buffer> ;hr [](<++>)<Space><++><Esc>F]i
autocmd FileType markdown inoremap <buffer> ;im ![](<++>)<Space><++><Esc>F]i

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
autocmd FileType markdown inoremap <buffer> ;e $$<Space><++><Esc>2T$i
autocmd FileType markdown inoremap <buffer> ;ra {\rightarrow}
autocmd FileType markdown inoremap <buffer> ;la {\leftarrow}
autocmd FileType markdown inoremap <buffer> ;lra {\leftrightarrow}
autocmd FileType markdown inoremap <buffer> ;fa {\forall}
autocmd FileType markdown inoremap <buffer> ;= &=<Space>

autocmd FileType markdown inoremap <buffer> ;fr \frac{}{<++>}<++><Esc>T{;i
autocmd FileType markdown inoremap <buffer> ;sup ^{}<++><Esc>T{i
autocmd FileType markdown inoremap <buffer> ;sub _{}<++><Esc>T{i

" augroup end
