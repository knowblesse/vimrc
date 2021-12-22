@ECHO OFF
TITLE vim env setup
ECHO setting the vim env

::Make vimfiles if not exist
if not exist %userprofile%\vimfiles (
mkdir %userprofile%\vimfiles
ECHO vimfiles folder created
)

::Make vimfiles\colors if not exist
if not exist %userprofile%\vimfiles\colors (
mkdir %userprofile%\vimfiles\colors
ECHO vimfiles\colors created
)

::Copy colors
copy C:\VCF\vimrc\monokai.vim %userprofile%\vimfiles\colors\monokai.vim
ECHO monokai color added

::Copy _vimrc
copy C:\VCF\vimrc\_vimrc %userprofile%\_vimrc
PAUSE