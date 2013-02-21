" Vim syntax file
" Maintainer:   OrgaChem <https://github.com/OrgaChem>
" Credits:      Jose Elera Campana, Zhao Yi, Claudio Fleiner, Scott Shattuck
"               (This file is based on their hard work), gumnos (From the #vim
"               IRC Channel in Freenode)

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'javascript'
endif

" Drop fold if it set but vim doesn't support it.
if version < 600 && exists("javaScript_fold")
  unlet javaScript_fold
endif

"" dollar sign is permitted anywhere in an identifier
setlocal iskeyword+=$

syntax sync fromstart

"" syntax coloring for Node.js shebang line
syn match shebang "^#!.*/bin/env\s\+node\>"
hi link shebang Comment

"" JavaScript comments"{{{
syn keyword javaScriptCommentTodo      TODO FIXME XXX TBD contained
syn match   javaScriptLineComment      "\/\/.*" contains=@Spell,javaScriptCommentTodo
syn match   javaScriptCommentSkip      "^[ \t]*\*\($\|[ \t]\+\)"
syn region  javaScriptComment	       start="/\*"  end="\*/" contains=@Spell,javaScriptCommentTodo
"}}}

syntax case match

"" Syntax in the JavaScript code"{{{
syn match   javaScriptSpecial	       "\\\d\d\d\|\\."
syn region  javaScriptStringD	       start=+"+  skip=+\\\\\|\\"+  end=+"\|$+	contains=javaScriptSpecial,@htmlPreproc
syn region  javaScriptStringS	       start=+'+  skip=+\\\\\|\\'+  end=+'\|$+	contains=javaScriptSpecial,@htmlPreproc

syn match   javaScriptSpecialCharacter "'\\.'"
syn match   javaScriptNumber	       "-\=\<\d\+L\=\>\|0[xX][0-9a-fA-F]\+\>"
syn region  javaScriptRegexpString     start=+/[^/*]+me=e-1 skip=+\\\\\|\\/+ end=+/[gi]\{0,2\}\s*$+ end=+/[gi]\{0,2\}\s*[;.,)\]}]+me=e-1 contains=@htmlPreproc oneline
" syntax match   javaScriptSpecial        "\\\d\d\d\|\\x\x\{2\}\|\\u\x\{4\}\|\\."
" syntax region  javaScriptStringD        start=+"+  skip=+\\\\\|\\$"+  end=+"+  contains=javaScriptSpecial,@htmlPreproc
" syntax region  javaScriptStringS        start=+'+  skip=+\\\\\|\\$'+  end=+'+  contains=javaScriptSpecial,@htmlPreproc
" syntax region  javaScriptRegexpString   start=+/\(\*\|/\)\@!+ skip=+\\\\\|\\/+ end=+/[gim]\{,3}+ contains=javaScriptSpecial,@htmlPreproc oneline
" syntax match   javaScriptNumber         /\<-\=\d\+L\=\>\|\<0[xX]\x\+\>/
syntax match   javaScriptFloat          /\<-\=\%(\d\+\.\d\+\|\d\+\.\|\.\d\+\)\%([eE][+-]\=\d\+\)\=\>/
" syntax match   javaScriptLabel          /\(?\s*\)\@<!\<\w\+\(\s*:\)\@=/
"}}}
"" JavaScript Prototype"{{{
syntax keyword javaScriptPrototype      prototype
"}}}
"  Dom, Browser and Ajax Support   {{{
""""""""""""""""""""""""
syntax keyword javaScriptBrowserObjects           window navigator screen history location document event

syntax keyword javaScriptDomObjects               HTMLElement Anchor Area Base Body Button Form Frame Frameset Image Link Meta Option Select Style Table TableCell TableRow Textarea
syntax keyword javaScriptDomMethods               createTextNode createElement insertBefore replaceChild removeChild appendChild  hasChildNodes  cloneNode  normalize  isSupported  hasAttributes  getAttribute  setAttribute  removeAttribute  getAttributeNode  setAttributeNode  removeAttributeNode  getElementsByTagName  hasAttribute  getElementById adoptNode close compareDocumentPosition createAttribute createCDATASection createComment createDocumentFragment createElementNS createEvent createExpression createNSResolver createProcessingInstruction createRange createTreeWalker elementFromPoint evaluate getBoxObjectFor getElementsByClassName getSelection getUserData hasFocus importNode
syntax keyword javaScriptDomProperties            nodeName  nodeValue  nodeType  parentNode  childNodes  firstChild  lastChild  previousSibling  nextSibling  attributes  ownerDocument  namespaceURI  prefix  localName  tagName

syntax keyword javaScriptAjaxObjects              XMLHttpRequest
syntax keyword javaScriptAjaxProperties           readyState responseText responseXML statusText
syntax keyword javaScriptAjaxMethods              onreadystatechange abort getAllResponseHeaders getResponseHeader open send setRequestHeader

syntax keyword javaScriptPropietaryObjects        ActiveXObject
syntax keyword javaScriptPropietaryMethods        attachEvent detachEvent cancelBubble returnValue

syntax keyword javaScriptHtmlElemProperties       className  clientHeight  clientLeft  clientTop  clientWidth  dir  href  id  innerHTML  lang  length  offsetHeight  offsetLeft  offsetParent  offsetTop  offsetWidth  scrollHeight  scrollLeft  scrollTop  scrollWidth  style  tabIndex  target  title

syntax keyword javaScriptEventListenerKeywords    blur click focus mouseover mouseout load item

syntax keyword javaScriptEventListenerMethods     scrollIntoView  addEventListener  dispatchEvent  removeEventListener preventDefault stopPropagation
" }}}
"" Programm Keywords"{{{
syntax keyword javaScriptSource         import export
syntax keyword javaScriptIdentifier     arguments this let var void yield
syntax keyword javaScriptOperator       delete new instanceof typeof
syntax keyword javaScriptBoolean        true false
syntax keyword javaScriptNull           null undefined
syntax keyword javaScriptMessage		alert confirm prompt status
syntax keyword javaScriptGlobal         self top parent
syntax keyword javaScriptDeprecated     escape unescape all applets alinkColor bgColor fgColor linkColor vlinkColor xmlEncoding
"}}}
"" Statement Keywords"{{{
syntax keyword javaScriptConditional    if else switch
syntax keyword javaScriptRepeat         do while for in
syntax keyword javaScriptBranch         break continue
syntax keyword javaScriptLabel          case default
syntax keyword javaScriptStatement      return with

syntax keyword javaScriptGlobalObjects    Array Boolean Date Function Infinity Math Number NaN Object Packages RegExp String netscape
syntax keyword javaScriptExceptions       try catch throw finally
syntax keyword javaScriptExceptionObjects Error EvalError RangeError ReferenceError SyntaxError TypeError URIError
syntax keyword javaScriptReserved         abstract enum int short boolean export interface static byte extends long super char final native synchronized class float package throws const goto private transient debugger implements protected volatile double import public
"}}}
"" Dom/HTML/CSS specified things"{{{

  " Dom2 Objects"{{{
  syntax keyword javaScriptType                 DomImplementation DocumentFragment Node NodeList NamedNodeMap CharacterData Attr Element Text Comment CDATASection DocumentType Notation Entity EntityReference ProcessingInstruction
  syntax keyword javaScriptDomExceptionObjects  DomException
"}}}
  " Dom2 CONSTANT"{{{
  syntax keyword javaScriptDomErrNo       INDEX_SIZE_ERR DomSTRING_SIZE_ERR HIERARCHY_REQUEST_ERR WRONG_DOCUMENT_ERR INVALID_CHARACTER_ERR NO_DATA_ALLOWED_ERR NO_MODIFICATION_ALLOWED_ERR NOT_FOUND_ERR NOT_SUPPORTED_ERR INUSE_ATTRIBUTE_ERR INVALID_STATE_ERR SYNTAX_ERR INVALID_MODIFICATION_ERR NAMESPACE_ERR INVALID_ACCESS_ERR
  syntax keyword javaScriptDomNodeConsts  ELEMENT_NODE ATTRIBUTE_NODE TEXT_NODE CDATA_SECTION_NODE ENTITY_REFERENCE_NODE ENTITY_NODE PROCESSING_INSTRUCTION_NODE COMMENT_NODE DOCUMENT_NODE DOCUMENT_TYPE_NODE DOCUMENT_FRAGMENT_NODE NOTATION_NODE
"}}}
  " HTML events and internal variables"{{{
  syntax case ignore
  syntax keyword javaScriptHtmlEvents     onblur onclick oncontextmenu ondblclick onfocus onkeydown onkeypress onkeyup onmousedown onmousemove onmouseout onmouseover onmouseup onresize onload onsubmit
  syntax case match
"}}}

" Follow stuff should be highligh within a special context
" While it can't be handled with context depended with Regex based highlight
" So, turn it off by default
if exists("javascript_enable_domhtmlcss")

    " Dom2 things"{{{
    syntax match javaScriptDomElemAttrs     contained /\%(nodeName\|nodeValue\|nodeType\|parentNode\|childNodes\|firstChild\|lastChild\|previousSibling\|nextSibling\|attributes\|ownerDocument\|namespaceURI\|prefix\|localName\|tagName\)\>/
    syntax match javaScriptDomElemFuncs     contained /\%(insertBefore\|replaceChild\|removeChild\|appendChild\|hasChildNodes\|cloneNode\|normalize\|isSupported\|hasAttributes\|getAttribute\|setAttribute\|removeAttribute\|getAttributeNode\|setAttributeNode\|removeAttributeNode\|getElementsByTagName\|getAttributeNS\|setAttributeNS\|removeAttributeNS\|getAttributeNodeNS\|setAttributeNodeNS\|getElementsByTagNameNS\|hasAttribute\|hasAttributeNS\)\>/ nextgroup=javaScriptParen skipwhite
	"}}}
    " HTML things"{{{
    syntax match javaScriptHtmlElemAttrs    contained /\%(className\|clientHeight\|clientLeft\|clientTop\|clientWidth\|dir\|id\|innerHTML\|lang\|length\|offsetHeight\|offsetLeft\|offsetParent\|offsetTop\|offsetWidth\|scrollHeight\|scrollLeft\|scrollTop\|scrollWidth\|style\|tabIndex\|title\)\>/
    syntax match javaScriptHtmlElemFuncs    contained /\%(blur\|click\|focus\|scrollIntoView\|addEventListener\|dispatchEvent\|removeEventListener\|item\)\>/ nextgroup=javaScriptParen skipwhite
"}}}
    " CSS Styles in JavaScript"{{{
    syntax keyword javaScriptCssStyles      contained color font fontFamily fontSize fontSizeAdjust fontStretch fontStyle fontVariant fontWeight letterSpacing lineBreak lineHeight quotes rubyAlign rubyOverhang rubyPosition
    syntax keyword javaScriptCssStyles      contained textAlign textAlignLast textAutospace textDecoration textIndent textJustify textJustifyTrim textKashidaSpace textOverflowW6 textShadow textTransform textUnderlinePosition
    syntax keyword javaScriptCssStyles      contained unicodeBidi whiteSpace wordBreak wordSpacing wordWrap writingMode
    syntax keyword javaScriptCssStyles      contained bottom height left position right top width zIndex
    syntax keyword javaScriptCssStyles      contained border borderBottom borderLeft borderRight borderTop borderBottomColor borderLeftColor borderTopColor borderBottomStyle borderLeftStyle borderRightStyle borderTopStyle borderBottomWidth borderLeftWidth borderRightWidth borderTopWidth borderColor borderStyle borderWidth borderCollapse borderSpacing captionSide emptyCells tableLayout
    syntax keyword javaScriptCssStyles      contained margin marginBottom marginLeft marginRight marginTop outline outlineColor outlineStyle outlineWidth padding paddingBottom paddingLeft paddingRight paddingTop
    syntax keyword javaScriptCssStyles      contained listStyle listStyleImage listStylePosition listStyleType
    syntax keyword javaScriptCssStyles      contained background backgroundAttachment backgroundColor backgroundImage gackgroundPosition backgroundPositionX backgroundPositionY backgroundRepeat
    syntax keyword javaScriptCssStyles      contained clear clip clipBottom clipLeft clipRight clipTop content counterIncrement counterReset cssFloat cursor direction display filter layoutGrid layoutGridChar layoutGridLine layoutGridMode layoutGridType
    syntax keyword javaScriptCssStyles      contained marks maxHeight maxWidth minHeight minWidth opacity MozOpacity overflow overflowX overflowY verticalAlign visibility zoom cssText
    syntax keyword javaScriptCssStyles      contained scrollbar3dLightColor scrollbarArrowColor scrollbarBaseColor scrollbarDarkShadowColor scrollbarFaceColor scrollbarHighlightColor scrollbarShadowColor scrollbarTrackColor
"}}}
    " Highlight ways"{{{
    syntax match javaScriptDotNotation      "\." nextgroup=javaScriptPrototype,javaScriptDomElemAttrs,javaScriptDomElemFuncs,javaScriptHtmlElemAttrs,javaScriptHtmlElemFuncs
    syntax match javaScriptDotNotation      "\.style\." nextgroup=javaScriptCssStyles
"}}}
endif "Dom/HTML/CSS

"" end Dom/HTML/CSS specified things""}}}


"" Code blocks
syntax cluster javaScriptAll       contains=javaScriptComment,javaScriptLineComment,javaScriptDoclet,javaScriptStringD,javaScriptStringS,javaScriptRegexpString,javaScriptNumber,javaScriptFloat,javaScriptLabel,javaScriptSource,javaScriptType,javaScriptOperator,javaScriptBoolean,javaScriptNull,javaScriptFuncKeyword,javaScriptConditional,javaScriptGlobal,javaScriptRepeat,javaScriptBranch,javaScriptStatement,javaScriptGlobalObjects,javaScriptMessage,javaScriptIdentifier,javaScriptExceptions,javaScriptReserved,javaScriptDeprecated,javaScriptDomErrNo,javaScriptDomNodeConsts,javaScriptHtmlEvents,javaScriptDotNotation,javaScriptBrowserObjects,javaScriptDomObjects,javaScriptAjaxObjects,javaScriptPropietaryObjects,javaScriptDomMethods,javaScriptHtmlElemProperties,javaScriptDomProperties,javaScriptEventListenerKeywords,javaScriptEventListenerMethods,javaScriptAjaxProperties,javaScriptAjaxMethods,javaScriptFuncArg

if main_syntax == "javascript"
  syntax sync clear
  syntax sync ccomment javaScriptComment minlines=200
  " syntax sync match javaScriptHighlight grouphere javaScriptBlock /{/
endif

syntax keyword   javaScriptFuncKeyword function contained
syntax region  javaScriptFuncDef start="function" end="\([^)]*\)" contains=javaScriptFuncKeyword,javaScriptFuncArg keepend
syntax match  javaScriptFuncArg "\((\([^()]\|\n\)*)\)" contains=javaScriptParens,javaScriptFuncComma contained
syntax match  javaScriptFuncComma /,/ contained
" syntax region  javaScriptFuncBlock      contained matchgroup=javaScriptFuncBlock start="{" end="}" contains=@javaScriptAll,javaScriptParensErrA,javaScriptParensErrB,javaScriptParen,javaScriptBracket,javaScriptBlock fold

syn match	javaScriptBraces	   "[{}\[\]]"
syn match	javaScriptParens	   "[()]"
syn match	javaScriptOpSymbols	   "=\{1,3}\|!==\|!=\|<\|>\|>=\|<=\|++\|+=\|--\|-="
syn match   javaScriptEndColons    "[;,]"
syn match   javaScriptLogicSymbols "\(&&\)\|\(||\)"

" JSDoc support start {{{
if !exists("javascript_ignore_javaScriptdoc")
  syntax case ignore

" syntax coloring for Closure Compiler anntations
  "unlet b:current_syntax

  syntax cluster javaScriptDocObjects contains=javaScriptType,javaScriptExceptionObjects,javaScriptDomObjects,javaScriptGlobalObjects
  syntax region javaScriptDoclet matchgroup=javaScriptComment start="/\*\*\n"  end="\*/" contains=javaScriptDocTag,javaScriptDocInlineTag,@javaScriptHtml,@Spell skipwhite skipnl
  syntax region javaScriptOneLinerDoclet matchgroup=javaScriptComment start="/\*\*\s"  end="\s\*/" contains=javaScriptDocTag,javaScriptDocInlineTag,@javaScriptHtml,@Spell skipwhite skipnl
  syntax match  javaScriptDocTag contained "@" nextgroup=javaScriptDocTypeParamDescTagNames,javaScriptDocTypeDescTagNames,javaScriptDocTypeTagNames,javaScriptDocDescTagNames,javaScriptDocMarkerTagNames,javaScriptDocSuppressTagNames,javaScriptDocAuthorTagNames

  " Type param desc tag as: @param {type} param desc
  " Type desc tag as: @return {type} desc
  " Type tag as: @type {type}
  " Desc tag as: @deprecated desc
  " Tag as: @constructor
  " Inline tag: @link
  syntax keyword javaScriptDocTypeParamDescTagNames   contained param nextgroup=javaScriptDocTypeParamDescTagType skipwhite skipnl
  syntax keyword javaScriptDocTypeDescTagNames        contained define enum return nextgroup=javaScriptDocTypeDesc skipwhite skipnl
  syntax keyword javaScriptDocTypeTagNames            contained extends implements this type typedef nextgroup=javaScriptDocType skipwhite skipnl
  syntax keyword javaScriptDocDescTagNames            contained see deprecated fileoverview license preserve nextgroup=javaScriptDocDesc skipwhite skipnl
  syntax keyword javaScriptDocMarkerTagNames          contained const constructor interface inheritDoc expose dict private protected struct nosideeffects override inheritDoc nextgroup=javaScriptDocInvaliedDesc skipwhite
  syntax keyword javaScriptDocInlineTagNames          contained code link nextgroup=javaScriptDocInlineTagContent skipwhite skipnl
  syntax keyword javaScriptDocAuthorTagNames          contained author nextgroup=javaScriptDocAuthorContent skipwhite skipnl
  syntax keyword javaScriptDocSuppressTagNames        contained suppress nextgroup=javaScriptDocSuppressFlag skipwhite skipnl

  syntax match   javaScriptDocNameContent             contained "\%(\w\|_\|\$\)\(\%(\w\|\d\|_\|\$\|\.\)*\%(\w\|_\|\$\)\)\?"
  syntax match   javaScriptDocTypeContent             contained "\%(|\|=\|!\|?\|\*\)\+"
  syntax match   javaScriptDocInlineTagContent        contained "[^}]\+"
  
  syntax match   javaScriptDocAuthorContent           contained "[^@]\+@\S\+\s([^)]\+)"
  syntax region  javaScriptDocSymbolName              contained start="{" end="}" contains=javaScriptDocNameContent,@javaScriptDocObjects
  syntax region  javaScriptDocGenerics                contained matchgroup=javaScriptDocOperator start="\.<" end=">" contains=javaScriptDocNameContent,javaScriptDocTypeContent,javaScriptDocGenerics
  syntax region  javaScriptDocType                    contained matchgroup=javaScriptDocOperator start="{" end="}" contains=javaScriptDocNameContent,javaScriptDocTypeContent,javaScriptDocGenerics
  syntax region  javaScriptDocTypeDesc                contained matchgroup=javaScriptDocOperator start="{" end="}" contains=javaScriptDocNameContent,javaScriptDocTypeContent,javaScriptDocGenerics nextgroup=javaScriptDocDesc
  syntax region  javaScriptDocTypeParamDescTagType    contained matchgroup=javaScriptDocOperator start="{" end="}" contains=javaScriptDocNameContent,javaScriptDocTypeContent,javaScriptDocGenerics nextgroup=javaScriptDocTypeParamDescTagParam skipwhite skipnl
  syntax match   javaScriptDocTypeParamDescTagParam   contained "\%(\w\|_\|\$\)\%(\w\|\d\|_\|\$\)*" nextgroup=javaScriptDocDesc skipwhite skipnl
  syntax match   javaScriptDocDesc                    contained ".*\(\s\|\n\)" contains=javaScriptDocInlineTag
  syntax match   javaScriptDocInvaliedDesc            contained ".*"

  syntax region  javaScriptDocSuppressFlag            contained matchgroup=javaScriptDocOperator start="{" end="}" contains=javaScriptDocSuppressFlagContent
  syntax keyword javaScriptDocSuppressFlagContent     contained accessControls ambiguousFunctionDecl checkDebuggerStatement checkRegExp checkTypes checkVars const constantProperty deprecated duplicate es5Strict externsValidation fileoverviewTags globalThis internetExplorerChecks invalidCasts missingProperties nonStandardJsDocs strictModuleDepCheck suspiciousCode undefinedNames undefinedVars unknownDefines uselessCode visibility

  syntax region javaScriptDocInlineTag                contained matchgroup=javaScriptDocOperator start="{" end="}" contains=javaScriptDocInlineTagNames

  syntax case match
endif   "" JSDoc end
"}}}

" JavaScriptFold Function {{{

function! JavaScriptFold()
	setl foldmethod=syntax
	setl foldlevelstart=1
	syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

	setl foldtext=FoldText()
endfunction

au FileType javascript call JavaScriptFold()

" }}}

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_javascript_syn_inits")
  if version < 508
    let did_javascript_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink javaScriptEndColons            Exception
  HiLink javaScriptOpSymbols            Operator
  HiLink javaScriptLogicSymbols         Boolean
  HiLink javaScriptBraces	        	Function
  HiLink javaScriptParens	        	Operator
  HiLink javaScriptComment              Comment
  HiLink javaScriptLineComment          Comment
  HiLink javaScriptDoclet               Comment
  HiLink javaScriptCommentTodo          Todo

  HiLink javaScriptDocTag                   Special
  HiLink javaScriptDocInlineTag             Special
  HiLink javaScriptDocTypeParamDescTagNames Special
  HiLink javaScriptDocTypeDescTagNames      Special
  HiLink javaScriptDocTypeTagNames          Special
  HiLink javaScriptDocDescTagNames          Special
  HiLink javaScriptDocMarkerTagNames        Special
  HiLink javaScriptDocInlineTagNames        Special
  HiLink javaScriptDocAuthorTagNames        Special
  HiLink javaScriptDocSuppressTagNames      Special
  HiLink javaScriptDocSuppressFlagContent   Type
  HiLink javaScriptDocNameContent           Function
  HiLink javaScriptDocOperator              Operator
  HiLink javaScriptDocTypeContent           Operator
  HiLink javaScriptDocTypeParamDescTagParam Normal
  HiLink javaScriptDocAuthorContent         Normal
  HiLink javaScriptDocSuppressFlagContent   Function
  HiLink javaScriptDocDesc                  Comment
  HiLink javaScriptDocInlineTagContent      Normal
  HiLink javaScriptDocType                  Error
  HiLink javaScriptDocSuppressFlag          Error
  HiLink javaScriptDocInvaliedDesc          Error

  HiLink javaScriptStringS              String
  HiLink javaScriptStringD              String
  HiLink javaScriptRegexpString         String
  HiLink javaScriptGlobal               Constant
  HiLink javaScriptCharacter            Character
  HiLink javaScriptPrototype            Type
  HiLink javaScriptConditional          Conditional
  HiLink javaScriptBranch               Conditional
  HiLink javaScriptIdentifier           Identifier
  HiLink javaScriptRepeat               Repeat
  HiLink javaScriptStatement            Statement
  HiLink javaScriptFuncKeyword          Function
  HiLink javaScriptMessage              Keyword
  HiLink javaScriptDeprecated           Exception
  HiLink javaScriptError                Error
  HiLink javaScriptParensError          Error
  HiLink javaScriptParensErrA           Error
  HiLink javaScriptParensErrB           Error
  HiLink javaScriptParensErrC           Error
  HiLink javaScriptReserved             Keyword
  HiLink javaScriptOperator             Operator
  HiLink javaScriptType                 Type
  HiLink javaScriptNull                 Type
  HiLink javaScriptNumber               Number
  HiLink javaScriptFloat                Number
  HiLink javaScriptBoolean              Boolean
  HiLink javaScriptLabel                Label
  HiLink javaScriptSpecial              Special
  HiLink javaScriptSource               Special
  HiLink javaScriptGlobalObjects        Special
  HiLink javaScriptExceptions           Special
  HiLink javaScriptExceptionObjects     Special

  HiLink javaScriptDomErrNo             Constant
  HiLink javaScriptDomNodeConsts        Constant
  HiLink javaScriptDomElemAttrs         Label
  HiLink javaScriptDomElemFuncs         PreProc

  HiLink javaScriptHtmlElemAttrs        Label
  HiLink javaScriptHtmlElemFuncs        PreProc

  HiLink javaScriptCssStyles            Label

  " Ajax Highlighting
	HiLink javaScriptBrowserObjects     Constant

	HiLink javaScriptDomObjects         Constant
	HiLink javaScriptDomMethods         Exception
	HiLink javaScriptDomProperties      Type

	HiLink javaScriptAjaxObjects        htmlH1
	HiLink javaScriptAjaxMethods        Exception
	HiLink javaScriptAjaxProperties     Type

	HiLink javaScriptFuncDef            Normal
    HiLink javaScriptFuncArg            Special
    HiLink javaScriptFuncComma          Operator  

	HiLink javaScriptHtmlEvents         Special
	HiLink javaScriptHtmlElemProperties Type

	HiLink javaScriptEventListenerKeywords Keyword

	HiLink javaScriptNumber            Number
	HiLink javaScriptPropietaryObjects Constant



  delcommand HiLink
endif

" Define the htmlJavaScript for HTML syntax html.vim
"syntax clear htmlJavaScript
"syntax clear javaScriptExpression
syntax cluster  htmlJavaScript contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError
syntax cluster  javaScriptExpression contains=@javaScriptAll,javaScriptBracket,javaScriptParen,javaScriptBlock,javaScriptParenError,@htmlPreproc

let b:current_syntax = "javascript"
if main_syntax == 'javascript'
  unlet main_syntax
endif

" vim: ts=4
