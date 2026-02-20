" Vim color file
" Name: flexoki-dark
" Maintainer: Gemini
" Converted from https://github.com/stevearc/flexoki-neovim

set background=dark
if exists("g:colors_name")
    highlight clear
endif
let g:colors_name = "flexoki-dark"

let s:p = {
    \ "bg":     "#100F0F",
    \ "bg-2":   "#1C1B1A",
    \ "ui":     "#282726",
    \ "ui-2":   "#343331",
    \ "ui-3":   "#403E3C",
    \ "tx-3":   "#575653",
    \ "tx-2":   "#878580",
    \ "tx":     "#CECDC3",
    \ "re":     "#D14D41",
    \ "re-2":   "#AF3029",
    \ "or":     "#DA702C",
    \ "or-2":   "#BC5215",
    \ "ye":     "#D0A215",
    \ "ye-2":   "#AD8301",
    \ "gr":     "#879A39",
    \ "gr-2":   "#66800B",
    \ "cy":     "#3AA99F",
    \ "cy-2":   "#24837B",
    \ "bl":     "#4385BE",
    \ "bl-2":   "#205EA6",
    \ "pu":     "#8B7EC8",
    \ "pu-2":   "#5E409D",
    \ "ma":     "#CE5D97",
    \ "ma-2":   "#A02F6F",
\ }

function! s:hi(group, guifg, guibg, ...)
  let l:style = get(a:, 1, "NONE")
  let l:guisp = get(a:, 2, "NONE")
  execute "highlight " . a:group . " guifg=" . a:guifg . " guibg=" . a:guibg . " gui=" . l:style . " guisp=" . l:guisp
endfunction

call s:hi("Normal", s:p.tx, s:p.bg)
call s:hi("NormalNC", "NONE", "NONE")
call s:hi("Underlined", "NONE", "NONE", "underline")
call s:hi("Bold", "NONE", "NONE", "bold")
call s:hi("Italic", "NONE", "NONE", "italic")
call s:hi("SpellBad", s:p['re-2'], "NONE", "underline")
call s:hi("SpellCap", s:p.ye, "NONE", "underline")
call s:hi("SpellLocal", s:p.gr, "NONE", "underline")
call s:hi("SpellRare", s:p.pu, "NONE", "underline")
call s:hi("NonText", s:p['tx-3'], "NONE")
call s:hi("EndOfBuffer", "NONE", "NONE")
call s:hi("Search", s:p.tx, s:p.ye)
call s:hi("IncSearch", s:p.tx, s:p.ye)
call s:hi("CurSearch", s:p.tx, s:p['ye-2'])
call s:hi("Substitute", s:p.tx, s:p.gr)
call s:hi("DiffAdd", s:p.bg, s:p.gr)
call s:hi("DiffChange", s:p['bg-2'], s:p.pu)
call s:hi("DiffDelete", s:p['bg-2'], s:p.re)
call s:hi("DiffText", s:p.bg, s:p['bl-2'])
call s:hi("Comment", s:p['tx-3'], "NONE", "italic")
call s:hi("Constant", s:p.ye, "NONE")
call s:hi("String", s:p.cy, "NONE")
call s:hi("Character", s:p.cy, "NONE")
call s:hi("Number", s:p.pu, "NONE")
call s:hi("Boolean", s:p.ma, "NONE")
call s:hi("Float", s:p.pu, "NONE")
call s:hi("Identifier", s:p.bl, "NONE")
call s:hi("Function", s:p.or, "NONE")
call s:hi("Keyword", s:p.gr, "NONE")
call s:hi("Statement", "NONE", "NONE")
highlight link Conditional Keyword
highlight link Repeat Keyword
highlight link Label Keyword
call s:hi("Operator", s:p['tx-2'], "NONE")
highlight link Exception Keyword
call s:hi("PreProc", s:p.ma, "NONE")
call s:hi("Include", s:p.re, "NONE")
call s:hi("Define", s:p.ma, "NONE")
call s:hi("Macro", s:p.ma, "NONE")
call s:hi("PreCondit", s:p.ma, "NONE")
call s:hi("Type", s:p.gr, "NONE")
call s:hi("StorageClass", s:p.or, "NONE")
call s:hi("Structure", s:p.or, "NONE")
call s:hi("Typedef", s:p.or, "NONE")
call s:hi("SpecialComment", s:p.tx, "NONE")
call s:hi("Special", s:p['tx-2'], "NONE")
call s:hi("SpecialChar", s:p.ma, "NONE")
call s:hi("Tag", s:p.cy, "NONE")
call s:hi("Debug", s:p.ma, "NONE")
highlight link Delimiter Special
call s:hi("Error", s:p.re, s:p.bg, "bold")
call s:hi("Todo", s:p.ma, "NONE", "bold")
call s:hi("SignColumn", "NONE", "NONE")
call s:hi("MsgArea", "NONE", s:p['bg-2'])
call s:hi("ModeMsg", "NONE", s:p['bg-2'])
call s:hi("MsgSeparator", "NONE", s:p['bg-2'])
call s:hi("Pmenu", s:p['tx-2'], s:p['bg-2'])
call s:hi("PmenuSel", s:p.tx, s:p['cy-2'])
call s:hi("PmenuSbar", "NONE", s:p.ui)
call s:hi("PmenuThumb", "NONE", s:p['ui-3'])
call s:hi("TabLine", s:p['tx-2'], s:p.ui)
call s:hi("TabLineSel", s:p.tx, s:p['ui-3'])
call s:hi("TabLineFill", "NONE", s:p.ui)
call s:hi("StatusLine", s:p.tx, s:p['ui-3'])
call s:hi("StatusLineNC", s:p['tx-2'], s:p.ui)
call s:hi("StatusLineTerm", s:p['tx-2'], s:p['ui-3'])
call s:hi("StatusLineTermNC", s:p['tx-2'], s:p['ui-3'])
call s:hi("WinBar", s:p.tx, s:p['ui-3'])
call s:hi("WinBarNC", s:p['tx-2'], s:p.ui)
call s:hi("NormalFloat", s:p['tx-2'], s:p.bg)
call s:hi("FloatBorder", s:p['tx-3'], s:p.bg)
call s:hi("WildMenu", "NONE", s:p['cy-2'])
call s:hi("Folded", s:p['ui-2'], "NONE")
call s:hi("FoldColumn", s:p['ui-2'], "NONE")
call s:hi("LineNr", s:p['tx-3'], "NONE")
call s:hi("Whitespace", s:p['tx-3'], "NONE")
call s:hi("WinSeparator", s:p['bg-2'], s:p['bg-2'])
call s:hi("WinSeparatorNC", s:p['ui-3'], s:p['ui-3'])
call s:hi("WarningMsg", s:p.re, s:p.bg)
call s:hi("QuickFixLine", "NONE", "NONE")
call s:hi("MatchWord", "NONE", s:p.ui)
call s:hi("MatchParen", "NONE", s:p.ui)
call s:hi("MatchWordCur", "NONE", "NONE")
call s:hi("MatchParenCur", "NONE", "NONE")
call s:hi("Conceal", "NONE", "NONE")
call s:hi("Directory", s:p.bl, "NONE")
call s:hi("SpecialKey", s:p.bl, "NONE", "bold")
call s:hi("Title", s:p.bl, "NONE", "bold")
call s:hi("ErrorMsg", s:p['re-2'], "NONE", "bold")
call s:hi("MoreMsg", s:p.or, "NONE")
call s:hi("Question", s:p.or, "NONE")
call s:hi("Cursor", s:p.bg, s:p.tx)
call s:hi("lCursor", s:p.bg, s:p.tx)
call s:hi("CursorLine", "NONE", s:p.ui)
call s:hi("CursorLineNr", s:p.tx, "NONE", "bold")
call s:hi("CursorColumn", "NONE", s:p['bg-2'])
call s:hi("ColorColumn", "NONE", s:p.ui)
call s:hi("CursorIM", s:p.bg, s:p.tx)
call s:hi("TermCursor", s:p.bg, s:p.tx)
call s:hi("TermCursorNC", s:p.bg, s:p['tx-3'])
call s:hi("Visual", "NONE", s:p['ui-2'])
call s:hi("VisualNOS", "NONE", s:p['ui-3'])
call s:hi("DiagnosticError", s:p.re, "NONE")
call s:hi("DiagnosticWarn", s:p.ye, "NONE")
call s:hi("DiagnosticInfo", s:p.cy, "NONE")
call s:hi("DiagnosticHint", s:p.bl, "NONE")
call s:hi("DiagnosticOk", s:p.gr, "NONE")
call s:hi("Added", s:p.gr, "NONE")
call s:hi("Removed", s:p.re, "NONE")
call s:hi("Changed", s:p.or, "NONE")

delfunction s:hi

