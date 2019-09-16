" Settings to deal with groff

function! GroffCompile()
  execute "silent! !groff -Tps -dpaper=a4 -P-pa4 -Rept -%:e % \<bar> ps2pdf - %:r.pdf"
  execute "redraw!"
endfunction

noremap <silent> <f1> :call GroffCompile()<cr>

