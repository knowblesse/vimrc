"Python Package Location"
"set pythonthreehome=~\anaconda3\
"set pythonthreedll=~\anaconda3\python38.dll
"Load .vimrc
if has('unix')
    :source ~/VCF/vimrc/vimrc.vim
else
    :source C:\VCF\vimrc\vimrc.vim
endif
"Startup function (with starting location)
autocmd VimEnter * call StartUp()
function! StartUp()
    if 0 == argc()
        if has('unix')
            NERDTree ~/VCF
	else
	    C:\VCF
        end
    end
endfunction
"
