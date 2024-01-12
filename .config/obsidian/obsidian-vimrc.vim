" yank to system clipboard
set clipboard=unnamed

" next/prev heading
exmap nextHeading obcommand obsidian-editor-shortcuts:goToNextHeading
exmap prevHeading obcommand obsidian-editor-shortcuts:goToPrevHeading
nnoremap <C-j> :nextHeading
nnoremap <C-k> :prevHeading

" [g]oto definition / link (shukuchi makes it forward-seeking)
exmap followNextLink obcommand shukuchi:open-link
exmap followNextLinkInNewTab obcommand shukuchi:open-link-in-new-tab
nnoremap gx :followNextLink
nnoremap gX :followNextLinkInNewTab

" [g]oto [f]ile (= Follow Link under cursor)
exmap followLinkUnderCursor obcommand editor:follow-link
nmap gf :followLinkUnderCursor

" rename file
exmap renameFile obcommand Obsidian-VimEx:file-rename-modal
nmap gr :renameFile

" window controls
exmap wd obcommand workspace:close
exmap q obcommand workspace:close

" focus
exmap focusLeft obcommand editor:focus-left
exmap focusRight obcommand editor:focus-right
exmap focusBottom obcommand editor:focus-bottom
exmap focusTop obcommand editor:focus-top
nmap <C-h> :focusLeft
nmap <C-l> :focusRight
nmap <C-j> :focusBottom
nmap <C-k> :focusTop

" Zoom in/out
exmap zoomIn obcommand obsidian-zoom:zoom-in
exmap zoomOut obcommand obsidian-zoom:zoom-out
nmap zi :zoomIn
nmap zo :zoomOut

" <Esc> clears highlights
nnoremap <Esc> :nohl

" Obsidian builtin Search & replace
exmap searchReplace obcommand editor:open-search-replace
nnoremap ,sr :searchReplace

" increment quicker
nnoremap + <C-a>
nnoremap - <C-x>

" quicker access to [m]assive word, [q]uote, [z]ingle quote, inline cod[e],
" [r]ectangular bracket, and [c]urly braces
onoremap am aW
onoremap im iW
onoremap aq a"
onoremap iq i"
onoremap az a'
onoremap iz i'
onoremap ae a`
onoremap ie i`
onoremap ir i[
onoremap ar a[
onoremap ac a{
onoremap ic i{

nnoremap ygg ggyG
nnoremap dgg ggdG
nnoremap cgg ggcG

vnoremap am aW
vnoremap im iW
vnoremap aq a"
vnoremap iq i"
vnoremap ay a'
vnoremap iy i'
vnoremap ae a`
vnoremap ie i`
vnoremap ir i[
vnoremap ar a[
vnoremap ac a{
vnoremap ic i{

" emulate some text objects from nvim-various-textobjs
onoremap rg G
vnoremap rg G
onoremap rp }
vnoremap rp }
onoremap m t]
vnoremap m t]
onoremap w t"
vnoremap w t"
onoremap k i"
onoremap K a"

" diagnostics
exmap enableDiagnostics obcommand obsidian-languagetool-plugin:ltcheck-text
nnoremap ,uD :enableDiagnostics

exmap disableDiagnostics obcommand obsidian-languagetool-plugin:ltclear
nnoremap ,ud :disableDiagnostics
