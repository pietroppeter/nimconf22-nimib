import std / strutils
import nimib
import nimiSlides
import custom_blocks

template slidesNbPython* =
  when not defined(skipPython):
    slide:
      nimConfSlide(slideOptions(autoAnimate=true)):
        nbText: hlMd"""
## nbPython
"""

      nimConfSlide(slideOptions(autoAnimate=true)):
        nbText: hlMd"""
## nbPython
"""
        nbCodeDontRun:
          nbPython: hlPy"""
print("Hello World") 
"""

      nimConfSlide(slideOptions(autoAnimate=true)):
        nbText: hlMd"""
## nbPython
"""
        nbPython: hlPy"""
import matplotlib.pyplot as plt
import numpy as np
x = np.linspace(-5, 5)
y = np.sin(x)
plt.plot(x, y)
plt.title("nbPython Plot")
plt.savefig("matplotlib_example.png", dpi=60)
  """
        fragmentFadeIn:
          nbImage("matplotlib_example.png")








template slidesNimibInteractive* =
  slide:
    nimConfSlide:
      nbText: hlMd"""
## Nimib goes interactive!
Create interactive elements in Nimib using Nim!
"""

    nimConfSlide:
      nbText: hlMd"""
### Why? 
"""
      fadeInText: "Engaging content"
      fadeInText: "Comfortable - Nim all the way"
      fadeInText: "Runs locally"
      fadeInText: "Fun!"

    nimConfSlide:
      nbText: "### How?"
      fadeInText: "Nim → JS"
      fadeInText: "Capture variables"


    nimConfSlide:
      nbText: hlMd"""
### API
- `nbJsFromCode` - compiles code to JS
- `nbKaraxCode` - sugar for Karax
"""

    nimConfSlide:
      nbText: "nbJsFromCode"
      nimibCodeAnimate(1..2, 4, 5..8, 10, 12, 13, 14):
        nbRawHtml: """<p id="text-id">You have clicked 0 times!</p>
<button id="btn-id">Click me!</button>"""

        nbJsFromCode:
          import std / dom

          let btn = getElementById("btn-id")
          let paragraph = getElementById("text-id")

          var counter: int

          btn.addEventListener("click", proc (event: Event) =
            counter += 1
            paragraph.innerHtml = "You have clicked " & $counter & " times!"
          )

    nimConfSlide:
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
          import std / dom

          let btn = getElementById("btn2-id")
          let paragraph = getElementById("text2-id")

          btn.addEventListener("click", proc (event: Event) =
            paragraph.innerHtml = name & "'s favourite food is " & food
          )

    nimConfSlide:
      nbText: "nbJsFromCode + Karax"
      nbCodeDontRunAnimate(@[1..2, 4..4, 6..7, 15..15], @[5..5, 8..13]): #nimibCodeAnimate(@[1..2, 4..4, 6..7, 15..15], @[5..5, 8..13]):
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

    nimConfSlide:
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

    nimConfSlide:
      nbText: "postRender"
      nimibCodeAnimate(1..2, 25..26, 4, 5..7, 8..14, 15..23):
        nbKaraxCode:
          import jscanvas, dom, colors, math, random

          postRender:
            var c = getElementById("canvas-id").CanvasElement
            # canvas will be nil if it hasn't
            # been created by Karax yet
            c.width = 500
            c.height = 100
            var ctx = c.getContext2d()

            # Fill background
            ctx.fillStyle = $colBlack
            ctx.fillRect(0,0, c.width, c.height)
            # Draw ball
            var x = rand(0..c.width)
            var y = rand(0..c.height)
            var ballRadius = 10
            ctx.beginPath()
            ctx.arc(x, y, ballRadius, 0, Pi*2)
            ctx.fillStyle = $colBlue
            ctx.fill()
            ctx.closePath()

          karaxHtml:
            canvas(id="canvas-id")
                





template slidesNimiBoost* =
  slide:
    nimConfSlide:
      nbText: hlMd"""
## Nimiboost
VS Codium/VS Code extension
"""

    nimConfSlide:
      nbText: "### Features"
      unorderedList:
        listItem: nbText: "Syntax highlighting"
        listItem: nbText: "Preview"
      fadeInText: "Let's head over to VSCodium!"

when isMainModule:
  myInit("hugos_slides.nim")
  slidesNbPython
  slidesNimibInteractive
  slidesNimiBoost
  nbSave