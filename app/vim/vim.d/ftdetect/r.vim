" Detect an R script.
" Updated 2021-05-12.

fun! s:DetectRscript()
    if (getline(1) == '#!/usr/bin/env Rscript') || 
     \ (getline(1) == '#!/usr/bin/env R')
        set ft=r
    endif
endfun

autocmd BufNewFile,BufRead * call s:DetectRscript()
