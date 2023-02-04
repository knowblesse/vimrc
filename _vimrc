"Python Package Location"
let g:condaPath = 'C:\Users\knowb\Anaconda3'
set pythonthreehome=g:condaPath
set pythonthreedll=glob(g:condaPath.'\python3?.dll')
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
	    NERDTree C:\VCF
        end
    end
    CondaEnv('base')
endfunction
"
