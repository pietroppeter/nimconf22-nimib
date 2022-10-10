import nimib, nimiSlides
import nimib / blocks
import std / [strutils, strformat]

# titles
let
  title_source* = "🪞`CodeAsInSource`"
  title_block* = "make your own `NbBlock`👷"
  title_howto* = "Fancy blocks 🖼️"
  title_python* = "🐍`nbPython`"
  title_js* = "🤯 `nbJsFromCode`, `nbKaraxCode`"
  title_plant* = "A mathy plant app 🌱"
  title_contribute* = "Contributing🤲"
  title_roadmap* = "Roadmap🗺️"


# custom init
template myInit*(sourceFileRel = "") =
  when defined(noReveal):
    nbInit(thisFileRel=sourceFileRel)
  else:
    nbInit(theme = revealTheme, thisFileRel=sourceFileRel)
    when not defined(useNimConfSlide):
      setSlidesTheme(Moon)
    else:
      nimConfTheme()
  addStuff

template addStuff* =
  addNbTextSmall
  addNbCodeDontRun
  addNewAnimateCodeBlocks
  addNimibCodeBlocks

# nim conf slides
template nimConfSlide*(body: untyped) =
  slide:
    cornerImage("https://github.com/nim-lang/assets/raw/master/Art/logo-crown.png", UpperRight, size=100, animate=false)
    body

template nimConfSlide*(options: SlideOptions, body: untyped) =
  slide(options):
    cornerImage("https://github.com/nim-lang/assets/raw/master/Art/logo-crown.png", UpperRight, size=100, animate=false)
    body

# nimconf theme
template nimConfTheme*() =
  setSlidesTheme(Black)
  let nimYellow = "#FFE953"
  nb.addStyle: """
:root {
  --r-background-color: #181922;
  --r-heading-color: $1;
  --r-link-color: $1;
  --r-selection-color: $1;
  --r-link-color-dark: darken($1 , 15%)
}

.reveal ul, .reveal ol {
  display: block;
  text-align: left;
}

li::marker {
  color: $1;
  content: "»";
}

li {
  padding-left: 12px;
}
""" % [nimYellow]


# mySlide: pick between nimconf or other
template mySlide*(body: untyped) =
  when defined(useNimConfSlide):
    nimConfSlide:
      body
  else:
    slide:
      body

template mySlide*(options: SlideOptions, body: untyped) =
  when defined(useNimConfSlide):
    nimConfSlide(options):
      body
  else:
    slide(options):
      body

# slides that use mySlide
template slideText*(text: string) =
  mySlide:
    nbText: text

template slideAutoAnimate*(body: untyped) =
  mySlide(slideOptions(autoAnimate=true)):
    body

# small text
template addNbTextSmall* =
  nb.partials["nbTextSmall"] = "<small>" & nb.partials["nbText"] & "</small>"
  nb.renderPlans["nbTextSmall"] = nb.renderPlans["nbText"]

template nbTextSmall*(text: string) =
  nbText: text
  nb.blk.command = "nbTextSmall"

# modified code blocks
template nbCodeDontRun*(body: untyped) = # from hugos_slides
  newNbCodeBlock("nbCodeDontRun", body):
    discard

template addNbCodeDontRun* =
  nb.partials["nbCodeDontRun"] = nb.partials["nbCode"]
  nb.renderPlans["nbCodeDontRun"] = nb.renderPlans["nbCode"]

template nbCodeDontRunAnimateImpl*(body: untyped) =
  discard

template nbCodeBeforeImpl*(body: untyped) = # use to show how CodeFromAst would have looked like
  nb.blk.code = toStr(body)

template addNewAnimateCodeBlocks* =
  newAnimateCodeBlock(nbCodeDontRunAnimate, nbCodeDontRunAnimateImpl)
  newAnimateCodeBlock(nbCodeBeforeAnimate, nbCodeBeforeImpl)

template nbCodeDontRunBefore*(body: untyped) = # from hugos_slides
  newNbCodeBlock("nbCodeDontRun", body):
    discard
  nb.blk.code = toStr(body)

template nimibCode*(body: untyped) =
  newNbCodeBlock("nimibCode", body):
    discard
  fragmentFadeIn:
    nbRawHtml: "<hr/>"
    body

template nimibCodeAnimate*(lines: varargs[seq[HSlice[int, int]]], body: untyped) =
  ## Shows code and its output just like nbCode, but highlights different lines of the code in the order specified in `lines`.
  ## lines: Specify which lines to highlight and in which order. (Must be specified as a seq[HSlice])
  ## Ex: 
  ## ```nim
  ## animateCode(@[1..1], @[3..4, 6..6]): body
  ## ```
  ## This will first highlight line 1, then lines 3, 4 and 6.
  newNbCodeBlock("nimibCodeAnimate", body):
    var linesString: string
    if lines.len > 0:
      linesString &= "|"
    for lineBundle in lines:
      for line in lineBundle:
        linesString &= $line.a & "-" & $line.b & ","
      linesString &= "|"
    if lines.len > 0:
      linesString = linesString[0 .. ^3]
    nb.blk.context["highlightLines"] = linesString
  fragmentFadeIn:
    nbRawHtml: "<hr/>"
    body

template nimibCodeAnimate*(lines: varargs[HSlice[int, int], toHSlice], body: untyped) =
  ## Shows code and its output just like nbCode, but highlights different lines of the code in the order specified in `lines`.
  ## lines: Specify which lines to highlight and in which order. (Must be specified as a HSlice)
  ## Ex: 
  ## ```nim
  ## animateCode(1..1, 2..3, 5..5, 4..4): body
  ## ```
  ## This will first highlight line 1, then lines 2 and 3, then line 5 and last line 4.
  var s: seq[seq[HSlice[int, int]]]
  for line in lines:
    s.add @[line]
  nimibCodeAnimate(s):
    body

template addNimibCodeBlocks* =
  nb.partials["nimibCode"] = nb.partials["nbCode"]
  nb.renderPlans["nimibCode"] = nb.renderPlans["nbCode"]
  nb.partials["nimibCodeAnimate"] = nb.partials["animateCode"]
  nb.renderPlans["nimibCodeAnimate"] = nb.renderPlans["animateCode"]

# needed only for python section, allows to be skipped
template optionalInitPython* =
  when not defined(skipPython):
    when defined(hugo):
      import nimpy/py_lib
      pyInitLibPath("/usr/lib/x86_64-linux-gnu/libpython3.10.so.1.0")
    nbInitPython()

# used in thank you slide
template textSwitcher*(texts: seq[string], duration: float = 2) =
    var cssString = "<style>\n"
    for i, phrase in texts:
      let id = "textSwitcher-" & $nb.newId()
      let animationName = "animation-" & id
      nbRawHtml: """<div id="$1" style="position: absolute; width: 100%; opacity: 0; text-align: center;">$2</div>""" % [id, phrase]
      cssString.add "#$1 { animation: $2 $3s infinite }\n" % [id, animationName, $(texts.len.float * duration)]
      let middlePercent = 100 * (1 / (2 * texts.len) + i * 1 / texts.len)
      let lowerPercent = middlePercent - 100 * (1 / (2 * texts.len))
      let upperPercent = middlePercent + 100 * (1 / (2 * texts.len))
      cssString.add """
@keyframes $1 {
  $2% {
    opacity: 0;
  }
  $3% {
    opacity: 1;
  }
  $4% {
    opacity: 0;
  }
}
""" % [animationName, $lowerPercent, $middlePercent, $upperPercent]
    cssString.add "\n</style>"
    nbRawHtml: cssString

# slide stuff
template fadeInText*(text: string) =
  fragment(fadeInThenSemiOut):
    nbText: text

#[ this embed worked in nimconf2021 nimib slides, it does not work anymore
template nbEmbed(url: string) =
  nbRawHtml: "<iframe src=\"" & url & "\" class=\"fullframe\"></iframe>"
]#

template nbEmbedFromNblog*(filename: string) =
  nbEmbed("https://pietroppeter.github.io/nblog/drafts/" & filename & ".html")

# instead I will use full interactive iframes
template slideIframe*(url: string) =
  nbRawHtml: "<section data-background-iframe=\"" & url & "\" data-background-interactive></section>"

template slideIframeFromNblog*(filename: string) =
  slideIframe("https://pietroppeter.github.io/nblog/drafts/" & filename & ".html")

proc nimibIssue*(num: int): string =
  return fmt"[#{$num}](https://github.com/pietroppeter/nimib/issues/{$num})"

proc findNextGenSym(code: string): string =
  var i = find(code, "`gensym")
  if i < 0:
    return ""
  result = "`gensym"
  i += len(result)
  while i < len(code) and code[i].isDigit:
    result &= code[i]
    inc i

proc cleanupGensym*(code: string): string =
  result = code
  var gensym = findNextGenSym(result)
  while len(gensym) > 0:
    result = result.replace(gensym, "")
    gensym = findNextGenSym(result)

template nbCleanupGensym* =
  nb.blk.code = cleanupGensym(nb.blk.code)