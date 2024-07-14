
"> the list of wikis
let wiki_1 = {}
let wiki_1.path = '~/Documents/notes/WEBDEV_notes'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'

let wiki_2 = {}
let wiki_2.path = '~/Documents/notes/gesundheit_vimwiki'
let wiki_2.syntax = 'markdown'
let wiki_2.ext = '.md'

let wiki_3 = {}
let wiki_3.path = '~/Documents/notes/archmadness_vimwiki'
let wiki_3.syntax = 'markdown'
let wiki_3.ext = '.md'

let g:vimwiki_list = [wiki_1, wiki_2, wiki_3]
let g:vimwiki_listsyms = '✗○◐●✓'
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_global_ext = 0
