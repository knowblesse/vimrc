if (Test-Path("C:\Program Files\Vim\vim82\"))
{
  Write-Output "vim path exist\n Inserting ctag.exe in it"
  copy "C:\VCF\vimrc\ctags.exe" "C:\Program Files\Vim\vim82\"
}
else
{
  Write-Output "vim path not exist\n Manually insert ctag.exe"
}

copy C:\VCF\vimrc\_vimrc %userprofile%\_vimrc
xcopy C:\VCF\vimrc\colors %userprofile%\vimfiles\colors

Read-Host -Prompt "Press Enter to exist"