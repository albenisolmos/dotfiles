" Vim colorscheme template file
" Author: Gerardo Galindez <gerardo.galindez@gmail.com>
" Maintainer: Gerardo Galindez <gerardo.galindez@gmail.com>
" Notes: To check the meaning of the highlight groups, :help 'highlight'

" --------------------------------
"set background=dark
" - or ---------------------------
"set background=light
" --------------------------------

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="evening"

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------
" --------------------------------
" Editor settings
" --------------------------------
hi Normal          ctermfg=7    ctermbg=232  cterm=none
hi Cursor          ctermfg=none ctermbg=none cterm=none
hi CursorLine      ctermfg=none ctermbg=none cterm=none
hi LineNr          ctermfg=240  ctermbg=none cterm=none
hi CursorLineNR    ctermfg=248  ctermbg=none cterm=none

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=217    ctermbg=none    cterm=none
hi FoldColumn      ctermfg=217    ctermbg=none    cterm=none
hi SignColumn      ctermfg=217    ctermbg=none    cterm=none
hi Folded          ctermfg=240    ctermbg=none    cterm=none

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
hi VertSplit       ctermfg=236    ctermbg=none    cterm=none
hi ColorColumn     ctermfg=none    ctermbg=none    cterm=none
hi TabLine         ctermfg=239    ctermbg=none    cterm=none
hi TabLineFill     ctermfg=none   ctermbg=none    cterm=none
hi TabLineSel      ctermfg=245    ctermbg=236    cterm=none

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
hi Directory       ctermfg=none   ctermbg=none    cterm=none
hi Search          ctermbg=238    cterm=none
hi IncSearch       ctermfg=143    ctermbg=none    cterm=bold

" -----------------
" - Prompt/Status -
" -----------------
hi StatusLine       ctermfg=240    ctermbg=236    cterm=none
hi StatusLineNC     ctermfg=239    ctermbg=236    cterm=none
hi StatusLineTerm   ctermfg=240    ctermbg=236    cterm=none
hi StatusLineTermNC ctermfg=239    ctermbg=236    cterm=none
hi WildMenu         ctermfg=0    ctermbg=104    cterm=none
hi Question         ctermfg=none    ctermbg=none    cterm=none
hi Title            ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg          ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg          ctermfg=none    ctermbg=none    cterm=none

" --------------
" - Visual aid -
" --------------
hi MatchParen      ctermfg=131    ctermbg=none    cterm=none
hi DoMatchParen      ctermfg=203    ctermbg=none    cterm=none
hi Visual          ctermfg=none    ctermbg=237    cterm=none
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
hi NonText         ctermfg=237    ctermbg=none    cterm=none

hi Todo            ctermfg=7    ctermbg=none    cterm=bold
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=9       ctermbg=none    cterm=none
hi ErrorMsg        ctermfg=9    ctermbg=none    cterm=none
hi WarningMsg      ctermfg=0    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
hi SpecialKey      ctermfg=237    ctermbg=none    cterm=none

" --------------------------------
" Variable types
" --------------------------------
hi Constant        ctermfg=167   ctermbg=none    cterm=none
hi String          ctermfg=2    ctermbg=none    cterm=none
hi StringDelimiter ctermfg=10   ctermbg=none    cterm=none
hi Character       ctermfg=11   ctermbg=none    cterm=none
hi Number          ctermfg=5    ctermbg=none    cterm=none
hi Boolean         ctermfg=5    ctermbg=none    cterm=none
hi Float           ctermfg=5    ctermbg=none    cterm=none
hi Identifier      ctermfg=1    ctermbg=none    cterm=none
hi Function        ctermfg=33   ctermbg=none    cterm=none

" --------------------------------
" Language constructs
" --------------------------------
hi Statement       ctermfg=33    ctermbg=none    cterm=none
hi Conditional     ctermfg=33    ctermbg=none    cterm=none
hi Repeat          ctermfg=203    ctermbg=none    cterm=none
hi Label           ctermfg=203    ctermbg=none    cterm=none
hi Operator        ctermfg=131    ctermbg=none    cterm=none
hi Keyword         ctermfg=131    ctermbg=none    cterm=none
hi Exception       ctermfg=203    ctermbg=none    cterm=none
hi Comment         ctermfg=241    ctermbg=none    cterm=none

hi Special         ctermfg=131    ctermbg=none    cterm=none
hi SpecialChar     ctermfg=101    ctermbg=none    cterm=none
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=131    ctermbg=none    cterm=none
hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
hi PreProc         ctermfg=8    ctermbg=none    cterm=none
hi Include         ctermfg=167    ctermbg=none    cterm=none
hi Define          ctermfg=51    ctermbg=none    cterm=none
hi Macro           ctermfg=167    ctermbg=none    cterm=none
hi PreCondit       ctermfg=167    ctermbg=none    cterm=none

hi Type            ctermfg=173    ctermbg=none    cterm=none
hi StorageClass    ctermfg=173    ctermbg=none    cterm=none
hi Structure       ctermfg=209    ctermbg=none    cterm=none
hi Typedef         ctermfg=51    ctermbg=none    cterm=none

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=none    ctermbg=none    cterm=none
hi DiffChange      ctermfg=none    ctermbg=none    cterm=none
hi DiffDelete      ctermfg=none    ctermbg=none    cterm=none
hi DiffText        ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Completion menu
" --------------------------------
hi Pmenu           ctermfg=none    ctermbg=236    cterm=none
hi PmenuSel        ctermfg=236    ctermbg=104    cterm=none
hi PmenuSbar       ctermfg=none    ctermbg=240    cterm=none
hi PmenuThumb      ctermfg=none    ctermbg=none    cterm=none

" --------------------------------
" Spelling
" --------------------------------
hi SpellBad        ctermfg=none    ctermbg=none    cterm=none
hi SpellCap        ctermfg=none    ctermbg=none    cterm=none
hi SpellLocal      ctermfg=none    ctermbg=none    cterm=none
hi SpellRare       ctermfg=none    ctermbg=none    cterm=none

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
hi netrwDir     ctermfg=215 ctermbg=none cterm=none
hi rustFuncName ctermfg=215 cterm=bold
hi jsFuncName   ctermfg=215 cterm=bold
hi jsNoise      ctermfg=8 ctermbg=none cterm=none
hi cssColor     ctermfg=5 ctermbg=none cterm=none
"hi cssProp ctermfg=215 ctermbg=none cterm=none
hi cssAttr      ctermfg=5 ctermbg=none cterm=none
hi cssUnitDecorators ctermfg=96 ctermbg=none cterm=none

" ---------------------------------
" Custom Group Highlight
" ---------------------------------
hi cssAtKeyWord ctermfg=203 ctermbg=none cterm=none
