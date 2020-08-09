fun! s:DetectRscript()
    if getline(1) == '#!/usr/bin/env Rscript'
        set ft=r
    endif
endfun

autocmd BufNewFile,BufRead * call s:DetectRscript()
