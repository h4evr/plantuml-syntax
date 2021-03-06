if exists('b:loaded_plantuml_plugin')
  finish
endif
let b:loaded_plantuml_plugin = 1
let s:cpo_save = &cpo
set cpo&vim

if exists('loaded_matchit')
  let b:match_ignorecase = 0
  let b:match_words =
        \ '\(\<ref\>\|\<box\>\|\<opt\>\|\<alt\>\|\<group\>\|\<loop\>\|\<note\>\|\<legend\>\):\<else\>:\<end\>' .
        \ ',\<if\>:\<elseif\>:\<else\>:\<endif\>' .
        \ ',\<rnote\>:\<endrnote\>' .
        \ ',\<hnote\>:\<endhnote\>' .
        \ ',\<title\>:\<endtitle\>' .
        \ ',\<\while\>:\<endwhile\>'
endif

setlocal comments=s1:/',mb:',ex:'/,:' commentstring=/'%s'/ formatoptions-=t formatoptions+=croql

let b:endwise_addition = '\=index(["note","legend"], submatch(0))!=-1 ? "end " . submatch(0) : "end"'
let b:endwise_words = 'loop,group,alt,note,legend'
let b:endwise_pattern = '^\s*\zs\<\(loop\|group\|alt\|note\ze[^:]*$\|legend\)\>.*$'
let b:endwise_syngroups = 'plantumlKeyword'

let &cpo = s:cpo_save
unlet s:cpo_save
