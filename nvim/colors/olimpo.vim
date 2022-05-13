" Vim colorscheme template file
" Author: Albenis Olmos  <gerardo.galindez@gmail.com>
" Maintainer: Albenis Olmos <gerardo.galindez@gmail.com>
" Notes: To check the meaning of the highlight groups, :help 'highlight'

" --------------------------------
set background=dark
" - or ---------------------------
set background=light
" --------------------------------

highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name="olimpo"
let s:bold = "bold,"
let s:underline = "underline,"

if !exists("g:olimpo_bold")
  let g:olimpo_bold = 1
elseif g:olimpo_bold == 0
  let s:bold = ""
endif

if ! get(g:, "olimpo_underline", 1)
  let s:underline = "NONE,"
endif

let s:gui_bg = '#292929'
let s:gui_bg2 = '#303030'
let s:gui_normal = "#a89984"
let s:gui_weak = "#626262"
let s:gui_very_weak = "#454545"
let s:gui_weak_hi = "#909090"
let s:gui_red = "#D65E5F"
let s:gui_red2 = "#d64344"
let s:gui_red3 = "#af5f5f"
let s:gui_orange = "#D7875F"
let s:gui_cyan = "#689984"
let s:gui_cyan2 = "#6A8379"
let s:gui_violet = '#B16286'
let s:gui_yellow = '#ffad57'
let s:gui_green = "#98971a"

let g:olmos_statusline_fg = s:gui_weak
let g:olmos_statusline_bg = s:gui_bg2

function! s:hi(group, guifg, guibg, ctermfg, ctermbg, attr, guisp)
  if a:guifg != ""
    exec "hi " . a:group . " guifg=" . a:guifg
  endif
  if a:guibg != ""
    exec "hi " . a:group . " guibg=" . a:guibg
  endif
  if a:ctermfg != ""
    exec "hi " . a:group . " ctermfg=" . a:ctermfg
  endif
  if a:ctermbg != ""
    exec "hi " . a:group . " ctermbg=" . a:ctermbg
  endif
  if a:attr != ""
    exec "hi " . a:group . " gui=" . a:attr . " cterm=" . substitute(a:attr, "undercurl", s:underline, "")
  endif
  if a:guisp != ""
    exec "hi " . a:group . " guisp=" . a:guisp
  endif
endfunction

" --------------------------------
" Editor settings
" --------------------------------
"call s:hi("Normal", s:gui_normal, s:gui_bg, "", 0, "", "")
"call s:hi("Cursor", "NONE", "NONE", "NONE", "NONE", "", "")
call s:hi("CursorLine", "NONE", "NONE", "NONE", "NONE", "NONE", "")
call s:hi("LineNr", s:gui_very_weak, "", "", "", "", "")
call s:hi("CursorLineNR", s:gui_weak, "", "", "", "", "")

" -----------------
" - Number column -
" -----------------
hi CursorColumn    ctermfg=217    ctermbg=none    cterm=none
call s:hi("Folded", s:gui_very_weak, s:gui_bg, "NONE", "", "NONE", "")
call s:hi("FoldColumn", s:gui_weak, s:gui_bg, "", "", "", "")
call s:hi("SignColumn", s:gui_weak, s:gui_bg, "", "", "", "")
call s:hi("SignatureMarkText", s:gui_weak, s:gui_bg, "", "", "", "")

" -------------------------
" - Window/Tab delimiters - 
" -------------------------
call s:hi("VertSplit", s:gui_bg, s:gui_bg2, "", "", "", "")
call s:hi("ColorColumn", "", "#303030", "", "", "", "")
call s:hi("TabLine", s:gui_weak, s:gui_bg, "", "", "NONE", "")
call s:hi("TabLineSel", s:gui_weak, s:gui_bg, "", "", "NONE", "")
call s:hi("TabLineFill", s:gui_bg, s:gui_bg, "", "", "", "")
call s:hi("TabLineSel", s:gui_bg, s:gui_weak, "", "", "", "")

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
call s:hi("Directory", s:gui_yellow, "", "", "", "", "")
call s:hi("Search", "", "NONE", "", "", "reverse", "")
call s:hi("IncSearch", s:gui_weak_hi, s:gui_weak, "", "", "NONE", "")

" -----------------
" - Prompt/Status -
" -----------------
call s:hi("StatusLine", s:gui_weak, s:gui_bg2, "", "", "NONE", "")
call s:hi("StatusLineNc", s:gui_very_weak, s:gui_bg2, "", "", "NONE", "")
call s:hi("StatusLineTerm", s:gui_weak_hi, s:gui_bg2, "", "", "", "")
call s:hi("StatusLineTermNc", s:gui_weak_hi, s:gui_bg2, "", "", "", "")
call s:hi("WildMenu", s:gui_bg, s:gui_violet, "", "", "", "")
hi Question         ctermfg=none    ctermbg=none    cterm=none
hi Title            ctermfg=none    ctermbg=none    cterm=none
hi ModeMsg          ctermfg=none    ctermbg=none    cterm=none
hi MoreMsg          ctermfg=none    ctermbg=none    cterm=none
" --------------
" - Visual aid -
" --------------
call s:hi("DoMatchParen", s:gui_red, s:gui_violet, "NONE", "", "", "")
call s:hi("MatchParen", s:gui_red, "NONE", "NONE", "", "", "")
hi Visual          ctermfg=none    ctermbg=237    cterm=none
call s:hi("Visual", "", "#353535", "NONE", "", "", "")
hi VisualNOS       ctermfg=none    ctermbg=none    cterm=none
call s:hi("NonText", s:gui_bg2, "", "", "", "", "")

hi Todo            ctermfg=7    ctermbg=none    cterm=bold
hi Underlined      ctermfg=none    ctermbg=none    cterm=none
hi Error           ctermfg=9       ctermbg=none    cterm=none
call s:hi("Error", s:gui_red2, s:gui_bg, "", "", "underline", "")
hi ErrorMsg        ctermfg=9    ctermbg=none    cterm=none
hi WarningMsg      ctermfg=0    ctermbg=none    cterm=none
hi Ignore          ctermfg=none    ctermbg=none    cterm=none
call s:hi("SpecialKey", s:gui_bg2, "", "", "", "", "")

" Variable types
call s:hi("Constant", s:gui_cyan2, "", "", "", "", "")
call s:hi("String", s:gui_green, "", "", "", "", "")
call s:hi("StringDelimiter", "#228ae7", "", "", "", "", "")
call s:hi("Character", "#77961a", "", "", "", "", "")
call s:hi("Number", s:gui_violet, "", "", "", "", "")
call s:hi("Boolean", s:gui_violet, "", "", "", "", "")
call s:hi("Float", s:gui_violet, "", "", "", "", "")
call s:hi("Identifier", s:gui_yellow, "", "", "", "", "")
call s:hi("Function", s:gui_yellow, "", "", "", "", "")

" Language constructs
call s:hi('Statement', s:gui_red, "", "", "", "NONE", "")
call s:hi('Conditional', s:gui_red, "", "", "", "", "")
call s:hi('Repeat', s:gui_red, "", "", "", "", "")
call s:hi("Label", s:gui_cyan, "", "", "", "", "")
call s:hi('Operator', s:gui_red3, "", "", "", "", "")
call s:hi('Keyword', s:gui_red2, "", "", "", "", "")
call s:hi("Exception", s:gui_red, "", "", "", "", "")
call s:hi("Comment", s:gui_weak, "", "", "", "", "")
call s:hi("Special", s:gui_red, "", "", "", "", "")
call s:hi("SpecialChar", "#228ae7", "", "", "", "", "")
hi Tag             ctermfg=none    ctermbg=none    cterm=none
hi Delimiter       ctermfg=131    ctermbg=none    cterm=none
hi SpecialComment  ctermfg=none    ctermbg=none    cterm=none
hi Debug           ctermfg=none    ctermbg=none    cterm=none

" ----------
" - C like -
" ----------
call s:hi("PreProc", s:gui_red2, "", "", "", "", "")
call s:hi("Include", s:gui_red2, "", "", "", "", "")
call s:hi("Define", s:gui_bg2, "", "", "", "", "")
call s:hi("Macro", s:gui_red2, "", "", "", "", "")
call s:hi("PreCondit", s:gui_red2, "", "", "", "", "")

call s:hi("Type", s:gui_orange, "", "", "", "NONE", "")
call s:hi("StorageClass", s:gui_red2, "", "", "", "", "")
call s:hi("Structure", s:gui_red, "", "", "", "", "")
call s:hi("Typedef", s:gui_bg2, "", "", "", "", "")

" --------------------------------
" Diff
" --------------------------------
hi DiffAdd         ctermfg=none    ctermbg=none    cterm=none
call s:hi("DiffAdd", "#228ae7", s:gui_bg, "", "", "", "")
hi DiffChange      ctermfg=none    ctermbg=none    cterm=none
call s:hi("DiffChange", "#228ae7", "#645711", "", "", "", "")
hi DiffDelete      ctermfg=none    ctermbg=none    cterm=none
call s:hi("DiffDelete", "", "#3d2929", "", "", "", "")
hi DiffText        ctermfg=none    ctermbg=none    cterm=none
call s:hi("DiffText", "#ffffff", "#3d2929", "", "", "", "")

" --------------------------------
" Completion menu
" --------------------------------
call s:hi("Pmenu", "NONE", s:gui_bg2, "", "", "", "")
call s:hi("PmenuSel", s:gui_bg, s:gui_violet, "", "", "", "")
call s:hi("PmenuSBar", s:gui_red, s:gui_bg2, "", "", "", "")
call s:hi("PmenuBar", s:gui_red, s:gui_red, "", "", "", "")
call s:hi("PmenuThumb", s:gui_red, s:gui_very_weak, "", "", "", "")

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
call s:hi("netrwDir", s:gui_yellow, "", "", "", "bold", "")
"hi! link netrwMarkFile Search
call s:hi("netrwMarkFile", "", "NONE", "", "", "bold", "")
hi rustFuncName ctermfg=215 cterm=bold
"hi jsFuncName   ctermfg=215 cterm=bold
"call s:hi("jsFuncName", s:gui_yellow, "", "", "", "", "")
hi jsNoise      ctermfg=8 ctermbg=none cterm=none
hi cssColor     ctermfg=5 ctermbg=none cterm=none
"hi cssProp ctermfg=215 ctermbg=none cterm=none
hi cssAttr      ctermfg=5 ctermbg=none cterm=none
hi cssUnitDecorators ctermfg=96 ctermbg=none cterm=none
call s:hi('luaFuncCall', s:gui_yellow, "", "", "", "", "")
hi cssAtKeyWord ctermfg=203 ctermbg=none cterm=none
" Netrw
call s:hi('netrwTreeBar', s:gui_bg2, "", "", "", "", "")
call s:hi('netrwClassify', s:gui_bg, "", "", "", "", "")
