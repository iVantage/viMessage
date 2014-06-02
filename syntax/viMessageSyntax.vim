" Vim syntax file
" Language: viMessage
" Maintainer: Dimitri Wijesinghe
" Latest Revision: 22 May 2014

:execute "syn match userName '^\\(\\(.*" . g:username . ".*\\)\\@!.\\).*:'"
"syn match userName '^\(\(.*Dimitri.*\)\@!.\).*:'
syn match sessionHead '^+.*'
:execute "syn match me '" . g:username . ":'"
"syn match me 'Dimitri:'

let b:current_syntax = "viMessage"

hi def link sessionHead		Comment
hi def link userName			Statement
hi def link me						Constant

