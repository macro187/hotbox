#
# .SYNOPSIS
# Configure Git, Vim, and Cygwin on Windows how I like it
#
# .NOTES
#
# Required:
# - Git for Windows <https://git-scm.com/download/win>
#
# Optional:
# - Vim for Windows <http://www.vim.org/download.php>
# - Cygwin <https://www.cygwin.com/>
#


param (
    $CygwinSetupDir = "C:\cygwin-setup",
    $CygwinDir = "C:\cygwin64",
    $VimFilesDir = "C:\vimfiles"
)


function ToMsysPath($p)
{
    $p.Replace("\", "/")
}


function ToCygwinPath($p)
{
    $p.Replace("\", "/").Replace("C:", "/cygdrive/c")
}


function WriteUnixFile($path, $s)
{
    [System.IO.File]::WriteAllText($path, $s.Replace("`r`n", "`n"))
}


""
"==> $PSCommandPath"
$DebugPreference = "Continue"
$VerbosePreference = "Continue"
$InformationPreference = "Continue"
$WarningPreference = "Continue"
$ErrorActionPreference = "Stop"


$GIT_DOWNLOAD = "https://git-scm.com/download/win"
$VIM_BUNDLES =
    "https://github.com/tpope/vim-pathogen.git",
    "https://github.com/macro187/vim-macrobsidian.git",
    "https://github.com/PProvost/vim-ps1.git",
    "https://github.com/vim-scripts/PreserveNoEOL.git"


$configDir = $PSScriptRoot
$username = $env:USERNAME
$profileDir = $env:USERPROFILE
$cygwinHome = "$CygwinDir\home\$username"
$vimBundleDir = "$VimFilesDir\bundle"
$configDirMsys = ToMsysPath $configDir
$profileDirMsys = ToMsysPath $profileDir
$vimFilesDirMsys = ToMsysPath $VimFilesDir
$configDirCygwin = ToCygwinPath $configDir
$profileDirCygwin = ToCygwinPath $profileDir
$vimFilesDirCygwin = ToCygwinPath $VimFilesDir


""
"CygwinSetupDir:    $CygwinSetupDir"
"CygwinDir:         $CygwinDir"
"VimFilesDir:       $VimFilesDir"
"configDir:         $configDir"
"username:          $username"
"profileDir:        $profileDir"
"cygwinHome:        $cygwinHome"
"vimBundleDir:      $vimBundleDir"
"configDirMsys:     $configDirMsys"
"profileDirMsys:    $profileDirMsys"
"vimFilesDirMsys:   $vimFilesDirMsys"
"configDirCygwin:   $configDirCygwin"
"profileDirCygwin:  $profileDirCygwin"
"vimFilesDirCygwin: $vimFilesDirCygwin"



#
# Git
#

""
"==> Checking for Git"
& git --version
if ($LASTEXITCODE -ne 0) {
    throw "Git for Windows not found, install it from $GIT_DOWNLOAD"
}


if (-not (Test-Path "$profileDir\.gitconfig.local")) {
    ""
    "==> Building $profileDir\.gitconfig.local"
    $s = @"
# vim: set ft=gitconfig:
#
# Config for all Gits
#
"@
    WriteUnixFile "$profileDir\.gitconfig.local" $s
}


""
"==> Building $profileDir\.gitconfig"
$s = @"
[include]
    path = $configDirMsys/gitconfig
[include]
    path = $profileDirMsys/.gitconfig.local
"@
WriteUnixFile "$profileDir\.gitconfig" $s


""
"==> Building $cygwinHome\.gitconfig"
& "$cygwinDir\bin\bash.exe" --login -c "echo '[include]' > ~/.gitconfig"
& "$cygwinDir\bin\bash.exe" --login -c "echo '    path = $configDirCygwin/gitconfig' >> ~/.gitconfig"
& "$cygwinDir\bin\bash.exe" --login -c "echo '[include]' >> ~/.gitconfig"
& "$cygwinDir\bin\bash.exe" --login -c "echo '    path = $configDirMsys/.gitconfig.local' >> ~/.gitconfig"



#
# Vim
#

if (-not (Test-Path $VimFilesDir)) {
    ""
    "==> Creating $VimFilesDir"
    mkdir $VimFilesDir | Out-Null
}
if (-not (Test-Path $vimBundleDir)) {
    ""
    "==> Creating $vimBundleDir"
    mkdir $vimBundleDir | Out-Null
}


foreach ($bundle in $VIM_BUNDLES) {
    $name = [IO.Path]::GetFilenameWithoutExtension($bundle)
    if (Test-Path "$vimBundleDir\$name") { continue }
    ""
    "==> Cloning Vim bundle $name"
    pushd $vimBundleDir
    & git clone $bundle
    popd
    if ($LASTEXITCODE -ne 0) {
        throw "Git clone failed"
    }
}


if (-not (Test-Path "$profileDir\.vimrc.local")) {
    ""
    "==> Building $profileDir\.vimrc.local"
    $s = @"
" vim: set ft=vim:
"
" Config for all Vims
"
"@
    WriteUnixFile "$profileDir\.vimrc.local" $s
}


if (-not (Test-Path "$profileDir\.vimrc.windows")) {
    ""
    "==> Building $profileDir\.vimrc.windows"
    $s = @"
" vim: set ft=vim:
"
" Config for Windows Vim only
"
"@
    WriteUnixFile "$profileDir\.vimrc.windows" $s
}


if (-not (Test-Path "$profileDir\.vimrc.msys")) {
    ""
    "==> Building $profileDir\.vimrc.msys"
    $s = @"
" vim: set ft=vim:
"
" Config for msys Vim only
"
"@
    WriteUnixFile "$profileDir\.vimrc.msys" $s
}


if (-not (Test-Path "$profileDir\.vimrc.cygwin")) {
    ""
    "==> Building $profileDir\.vimrc.cygwin"
    $s = @"
" vim: set ft=vim:
"
" Config for cygwin Vim only
"
"@
    WriteUnixFile "$profileDir\.vimrc.cygwin" $s
}


""
"==> Building $profileDir\_vimrc"
$s = @"
"
" Do not edit this, edit $profileDir\.vimrc.windows
"
set runtimepath^=$vimFilesDir
runtime bundle\vim-pathogen\autoload\pathogen.vim
execute pathogen#infect()
source $configDir\vimrc
colo macrobsidian
let g:PreserveNoEOL = 1
let g:PreserveNoEOL_Function = function('PreserveNoEOL#Internal#Preserve')
set fileformats=dos,unix
if has("gui_running")
    set guifont=Consolas:h14:cDEFAULT
    set columns=120
    set colorcolumn=121
    winpos 375 0
endif
source $profileDir\.vimrc.local
source $profileDir\.vimrc.windows
"@
WriteUnixFile "$profileDir\_vimrc" $s


""
"==> Building $profileDir\.vimrc"
$s = @"
"
" Do not edit this, edit $profileDir\.vimrc.msys
"
set runtimepath^=$vimFilesDirMsys
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
source $configDirMsys/vimrc
colo macrobsidian
let g:PreserveNoEOL = 1
let g:PreserveNoEOL_Function = function('PreserveNoEOL#Internal#Preserve')
set fileformats=dos,unix
source $profileDirMsys/.vimrc.local
source $profileDirMsys/.vimrc.msys
"@
WriteUnixFile "$profileDir\.vimrc" $s


""
"==> Building $cygwinHome\.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo '\`"' > ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo '\`" Do not edit this edit $profileDir\.vimrc.cygwin' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo '\`"' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'set runtimepath^=$vimFilesDirCygwin' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'runtime bundle/vim-pathogen/autoload/pathogen.vim' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'execute pathogen#infect()' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'source $configDirCygwin/vimrc' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'colo macrobsidian' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'let g:PreserveNoEOL = 1' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'let g:PreserveNoEOL_Function = function('\''PreserveNoEOL#Internal#Preserve'\'')' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'set fileformats=dos,unix' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'source $profileDirCygwin/.vimrc.local' >> ~/.vimrc"
& "$cygwinDir\bin\bash.exe" --login -c "echo 'source $profileDirCygwin/.vimrc.cygwin' >> ~/.vimrc"

