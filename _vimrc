"Python Package Location"
set pythonthreehome=~\anaconda3\
set pythonthreedll=~\anaconda3\python38.dll
"Load .vimrc
:source C:\VCF\vimrc\vimrc.vim
"Startup function (with starting location)
autocmd VimEnter * call StartUp()
function! StartUp()
    if 0 == argc()
        NERDTree C:\VCF
    end
endfunction
"
