" Vim syntax file
" Language: Olmos Syntax
" Maintainer: Albenis Olmos
" Latest Revision: 3 August 2021

if exists("b:current_syntax")
  finish
endif

syn keyword olmosConditional if else match
syn keyword olmosRepeat while for
syn keyword olmosStatement do end return priv pub global export import from in as class
syn keyword olmosType str int int32 int64 uint uint32 uint64 array
syn keyword olmosFunction fn
syn keyword olmosKeyword fn nextgroup=olmosFuncName skipwhite skipempty

syn match olmosFunctionTest "\<fn\>"
syn match olmosDefault /\<default\ze\_s\+\(impl\|fn\|type\|const\)\>/
syn match olmosFuncName "\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*" display contained
syn region olmosComment matchgroup=olmosCommentStart start="/\*" end="\*/" fold extend
syn region olmosCommentL start="//" skip="\\$" end="$" keepend 
syn match olmosCommentSkip contained "^\s*\*\($\|\s\+\)"

let b:current_syntax = "olmos"
hi def link olmosConditional Conditional
hi def link olmosRepeat Repeat 
hi def link olmosType Type
hi def link olmosStatement Statement
hi def link olmosFunctionTest StorageClass 
hi def link olmosDefault Function
hi def link olmosCommentStart Comment 
hi def link olmosCommentL Comment 
hi def link olmosCommentSkip Comment 
