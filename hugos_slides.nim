import nimib
import nimib/capture
import nimiSlides


nbInit(theme = revealTheme)
setSlidesTheme(Moon)

when not defined(skipPython):
  import nimpy/py_lib
  pyInitLibPath("/usr/lib/x86_64-linux-gnu/libpython3.10.so.1.0")
  nbInitPython()

template nbCodeDontRun*(body: untyped) =
  newNbCodeBlock("nbCodeDontRun", body):
    discard

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

nb.partials["nbCodeDontRun"] = nb.partials["nbCode"]
nb.renderPlans["nbCodeDontRun"] = nb.renderPlans["nbCode"]
nb.partials["nimibCode"] = nb.partials["nbCode"]
nb.renderPlans["nimibCode"] = nb.renderPlans["nbCode"]
nb.partials["nimibCodeAnimate"] = nb.partials["animateCode"]
nb.renderPlans["nimibCodeAnimate"] = nb.renderPlans["animateCode"]


template fadeInText(text: string) =
  fragment(fadeInThenSemiOut):
    nbText: text

slide:
  nbText: "### Who am I 🙋‍♂️"
  unorderedList:
    listItem: nbText: "Engineering Physics student"
    listItem: nbText: "Nimib maintainer - since July 2022"
    unorderedList:
      listItem: nbText: "nimiSlides"
    listItem: nbText: "SciNim member - since the start 2020"
    unorderedList:
      listItem: nbText: "NumericalNim"
      listItem: nbText: "Scinim/getting-started (uses nimiBook)"

slide:
  nbKaraxCode:
    import karax / vstyles
    import std / [strutils]
    import QRgen
    var currentData = "https://github.com/aruZeta/QRgen"
    var ar = 0.0
    var mr = 0.0

    proc updateQR(data: string, ar, mr: float) =
      getElementById("svg-container").innerHtml = newQR(currentData).printSvg(alRad = ar, moRad = mr)

    postRender:
      updateQR(currentData, ar, mr)
      setForeignNodeId("svg-container")

    karaxHtml:
      tdiv(id = "svg-container", style = toCss("max-height: 50%; max-width: 50%; margin: 0 auto"))
      textarea(id = "data-field", placeholder = "https://github.com/aruZeta/QRgen"):
        proc onChange() =
          currentData = $(getElementById("data-field").value)
          updateQR(currentData, ar, mr)
      br()
      label:
        text "Radius1"
      input(`type` = "range", min = "0", max = "100", value = "0", step = "1", id = "ar-slider"):
        proc oninput() =
          echo getVNodeById("ar-slider").isNil
          ar = ($getElementById("ar-slider").value).parseFloat
          updateQR(currentData, ar, mr)
      br()
      label:
        text "Radius2"
      input(`type` = "range", min = "0", max = "100", value = "0", step = "1", id = "mr-slider"):
        proc oninput() =
          echo getVNodeById("mr-slider").isNil
          mr = ($getElementById("mr-slider").value).parseFloat
          updateQR(currentData, ar, mr)
      br()
      button:
        text "Refresh"
        proc onclick() =
          updateQR(currentData, ar, mr)
    




when not defined(skipPython):
  slide:
    nbText: hlMd"""
## nbPython
"""
    nbPython: hlPy"""
print("Hello world")
"""

slide:
  slide:
    nbText: hlMd"""
## Nimib goes interactive!
Create interactive elements in Nimib using Nim!
"""

  slide:
    nbText: hlMd"""
### Why?
"""
    fadeInText: "Fun!"
    fadeInText: "Rich content"

  slide:
    nbText: "### How?"
    fadeInText: "Nim → JS"
    fadeInText: "Capture variables"


  slide:
    nbText: hlMd"""
### API
- `nbJsFromCode` - compiles code to JS
- `nbKaraxCode` - sugar for Karax
"""

  slide:
    nbText: "nbJsFromCode"
    nimibCodeAnimate(1..4, 6, 7..10, 12, 14, 15, 16):
      nbRawHtml: """
<p id="text-id">You have clicked 0 times!</p>
<button id="btn-id">Click me!</button>
"""

      nbJsFromCode:
        import std / [dom]

        let btn = getElementById("btn-id")
        let p = getElementById("text-id")

        var counter: int

        btn.addEventListener("click", proc (event: Event) =
          counter += 1
          p.innerHtml = "You have clicked " & $counter & " times!"
        )

  slide:
    nbText: "Capture variables"
    speakerNote: "Must capture variables in C-land to use their values in JS-land"
    nimibCodeAnimate(1..2, 3..6, 7, 8..11, 12..15):
      let name = "Hugo"
      let food = "hot dogs"
      nbRawHtml: """
<p id="text2-id">...</p>
<button id="btn2-id">Click me!</button>
"""
      nbJsFromCode(name, food):
        import std / [dom]

        let btn = getElementById("btn2-id")
        let p = getElementById("text2-id")

        btn.addEventListener("click", proc (event: Event) =
          p.innerHtml = name & "'s favourite food is " & food
        )

  slide:
    nbText: "nbJsFromCode + Karax"
    nbCodeDontRun: #nimibCodeAnimate(@[1..2, 4..4, 6..7, 15..15], @[5..5, 8..13]):
      let rootId = "karax-" & $nb.newId()
      nbRawHtml: "<div id=\"" & rootId & "\"></div>"
      nbJsFromCode:
        include karax / prelude
        var counter: int
        proc createDom(): VNode =
          result = buildHtml(tdiv):
            p:
              text "You have clicked " & $counter & " times!"
            button:
              text "Click me!"
              proc onClick() =
                counter += 1

        setRenderer(createDom, root = rootId.cstring)

  slide:
    nbText: "nbKaraxCode"
    nimibCodeAnimate(1, 2, 3, 4..5, 6..9):
      nbKaraxCode:
        var counter: int
        karaxHtml:
          p:
            text "You have clicked " & $counter & " times!"
          button:
            text "Click me!"
            proc onClick() =
              counter += 1

  slide:
    nbText: "postRender"
    nimibCodeAnimate(7..9, 2, 2..5):
      nbKaraxCode:
        postRender:
          let btn = getElementById("btn3-id")
          # btn will be nil if the button hasn't
          # been created by Karax yet

        karaxHtml:
          button(id="btn3-id"):
            text "Click me"



slide:
  slide:
    nbText: hlMd"""
## Nimiboost
VS Codium/VS Code extension
  """

  slide:
    fadeInText: "Syntax highlighting"
    fadeInText: "Preview"
    fadeInText: "Let's head over to VSCodium!"


nbSave