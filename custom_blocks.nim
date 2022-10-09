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
  addNbTextSmall
  

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

template addNbTextSmall* =
  nb.partials["nbTextSmall"] = "<small>" & nb.partials["nbText"] & "</small>"
  nb.renderPlans["nbTextSmall"] = nb.renderPlans["nbText"]

template nbTextSmall*(text: string) =
  nbText: text
  nb.blk.command = "nbTextSmall"


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


proc nimibIssue*(num: int): string =
  return fmt"[#{$num}](https://github.com/pietroppeter/nimib/issues/{$num})"