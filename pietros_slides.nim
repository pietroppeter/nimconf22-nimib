import nimib
import nimib / [blocks]
import nimiSlides
import std / strformat
import std / [strutils]

nbInit(theme = revealTheme)
setSlidesTheme(Moon)

when not defined(skipPython):
  when defined(hugo):
    import nimpy/py_lib
    pyInitLibPath("/usr/lib/x86_64-linux-gnu/libpython3.10.so.1.0")
  nbInitPython()

# CUSTOM blocks and templates ------------------------------------------------------------------------------------------
when defined(confTheme):
  template nimConfSlide(body: untyped) =
    slide:
      cornerImage("https://github.com/nim-lang/assets/raw/master/Art/logo-crown.png", UpperRight, size=100, animate=false)
      body

  template nimConfSlide(options: SlideOptions, body: untyped) =
    slide(options):
      cornerImage("https://github.com/nim-lang/assets/raw/master/Art/logo-crown.png", UpperRight, size=100, animate=false)
      body

  template slideConfText(text: string) =
    nimConfSlide:
      nbText: text

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

  nimConfTheme()


template slideText(text: string) =
  slide:
    nbText: text

nb.partials["nbTextSmall"] = "<small>" & nb.partials["nbText"] & "</small>"
nb.renderPlans["nbTextSmall"] = nb.renderPlans["nbText"]
template nbTextSmall(text: string) =
  nbText: text
  nb.blk.command = "nbTextSmall"

template slideAutoAnimate(body: untyped) =
  slide(slideOptions(autoAnimate=true)):
    body

template nbCodeDontRun*(body: untyped) = # from hugos_slides
  newNbCodeBlock("nbCodeDontRun", body):
    discard
nb.partials["nbCodeDontRun"] = nb.partials["nbCode"]
nb.renderPlans["nbCodeDontRun"] = nb.renderPlans["nbCode"]

template nbCodeDontRunAnimateImpl(body: untyped) =
  discard

newAnimateCodeBlock(nbCodeDontRunAnimate, nbCodeDontRunAnimateImpl)

template nbCodeBeforeImpl*(body: untyped) = # use to show how CodeFromAst would have looked like
  nb.blk.code = toStr(body)

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

nb.partials["nimibCode"] = nb.partials["nbCode"]
nb.renderPlans["nimibCode"] = nb.renderPlans["nbCode"]
nb.partials["nimibCodeAnimate"] = nb.partials["animateCode"]
nb.renderPlans["nimibCodeAnimate"] = nb.renderPlans["animateCode"]


template fadeInText(text: string) =
  fragment(fadeInThenSemiOut):
    nbText: text

# this embed worked in nimconf2021 nimib slides, it does not work anymore
template nbEmbed(url: string) =
  nbRawHtml: "<iframe src=\"" & url & "\" class=\"fullframe\"></iframe>"

template nbEmbedFromNblog(filename: string) =
  nbEmbed("https://pietroppeter.github.io/nblog/drafts/" & filename & ".html")

# instead I will use full interactive iframes
template slideIframe(url: string) =
  nbRawHtml: "<section data-background-iframe=\"" & url & "\" data-background-interactive></section>"

template slideIframeFromNblog(filename: string) =
  slideIframe("https://pietroppeter.github.io/nblog/drafts/" & filename & ".html")

# Nim logo in top right corner ------------------------------------------------------------------------------------------

nb.context["nimLogo"] = true # does not work

# INTRO together ------------------------------------------------------------------------------------------

let
  title_source = "🪞`CodeAsInSource`"
  title_block = "make your own `NbBlock`👷"
  title_howto = "Fancy blocks 🖼️"
  title_python = "🐍`nbPython`"
  title_js = "🤯 `nbJsFromCode`, `nbKaraxCode`"
  title_plant = "A mathy plant app 🌱"
  title_contribute = "Contributing🤲"
  title_roadmap = "Roadmap🗺️"

slide:
  nbText: "## A livecoding👨‍💻 intro to Nimib🐳"
  speakerNote: "here I need to add the video" 

# RELEASE - Part 1 - Pietro ------------------------------------------------------------------------------------------


slide:
  slideAutoAnimate:
    nbText: hlMdF"""## ✨Nimib 0.3 - BlockMaker🧱
- {title_block}
- {title_js}
"""

  slideAutoAnimate:
    nbText: hlMdF"""## ✨Nimib 0.3 - BlockMaker🧱
- {title_source}
- {title_block}
- {title_python}
- {title_js}
"""

  slideAutoAnimate:
    nbText: hlMdF"""## ✨Nimib 0.3 - BlockMaker🧱
- {title_source}
- {title_block}
  - {title_howto}
- {title_python}
- {title_js}
  - {title_plant}
"""

  slideAutoAnimate:
    nbText: hlMdF"""## ✨Nimib 0.3 - BlockMaker🧱
- {title_source}
- {title_block}
  - {title_howto}
- {title_python}
- {title_js}
  - {title_plant}

more stuff and details in [0.3.0](https://github.com/pietroppeter/nimib/releases/tag/v0.3.0)
and [0.3.1](https://github.com/pietroppeter/nimib/releases/tag/v0.3.1) release notes
"""

slide:
  slide:
    nbText: hlMdF"### {title_source}"
  slideAutoAnimate:
    nbText: "#### Before (`CodeFromAst`)"
    columns:
      column:
        nbText: "Code in source file:"
        nbCodeDontRun:
          import math, strformat
          let
            n = 1
          echo n + 1 # 2
          ## documentation comment
          struct(http):
            s: _ = "HTTP/"
            *header: {headers}

      column: # had to do this to have some padding space between code columns
        nbText: ""
      fragmentFadeIn:
        column:
          nbText: "Code as shown in html:"
          # it would be nice to animate 1..2, 3, 4, 5, 6, 8..9, 10
          # also it would be nice to have this code block appear with a different background
          nbCodeBeforeAnimate([1..2, 3..4, 5..5, 6..6, 8..9, 10..10]): 
            import math, strformat
            let
              n = 1
            echo n + 1 # 2
            ## documentation comment
            struct(http):
              s: _ = "HTTP/"
              *header: {headers}
    speakerNote: """
- It was very nice, since it was very easy to implement with a simple `macro toStr(body) = body.toStrLit`
- it inherited bugs from Nim, see:
  - https://github.com/pietroppeter/nimib/issues/20
  - https://github.com/nim-lang/Nim/issues/17292
"""
  # I used autoAnimate to have last two fades come after code Animation (still not smooth)
  slideAutoAnimate:
    nbText: "#### Before (`CodeFromAst`)"
    columns:
      column:
        nbText: "Code in source file:"
        nbCodeDontRun:
          import math, strformat
          let
            n = 1
          echo n + 1 # 2
          ## documentation comment
          struct(http):
            s: _ = "HTTP/"
            *header: {headers}

      column: # had to do this to have some padding space between code columns
        nbText: ""
      column:
        nbText: "Code as shown in html:"
        # it would be nice to animate 1..2, 3, 4, 5, 6, 8..9, 10
        # also it would be nice to have this code block appear with a different background
        nbCodeDontRunBefore: 
          import math, strformat
          let
            n = 1
          echo n + 1 # 2
          ## documentation comment
          struct(http):
            s: _ = "HTTP/"
            *header: {headers}
    fragment(fadeLeft):
      nbText: "Uses `macro toStr(body) = body.toStrLit`"
    fragment(fadeRight):
      nbText: "Still available with `-d:nimibCodeFromAst`"
  slide:
    nbText: "#### Now (`CodeAsInSource`)"
    columns:
      column:
        nbText: "Code in source file:"
        nbCodeDontRun:
          import math, strformat
          let
            n = 1
          echo n + 1 # 2
          ## documentation comment
          struct(http):
            s: _ = "HTTP/"
            *header: {headers}

      column:
        nbText: ""
      fragmentFadeIn:
        column:
          nbText: "**Same** as shown in html:"
        nbCodeDontRun:
          import math, strformat
          let
            n = 1
          echo n + 1 # 2
          ## documentation comment
          struct(http):
            s: _ = "HTTP/"
            *header: {headers}
    fragment(fadeLeft):
      nbText: "This is what you expect!"
    fragment(fadeRight):
      nbText: "Does not compose well ([134](https://github.com/pietroppeter/nimib/issues/134)), there might still be 🐞s"
    speakerNote: """"""

slide:
  slideText: hlMdF"""### {title_block}
"""
  slide:
    nbText: "#### What are blocks?"
    nbCodeDontRunAnimate([3..3, 4..4, 6..6, 8..8, 10..10, 12..12, 14..14]): # should higlight lines line by one
      import nimib

      nbInit # creates a nb: NbDoc object
      # it has attribute nb.blocks: seq[NbBlock] = []

      nbText: "hi" # add new NbBlock to nb.blocks = [🟩]

      nbCode: echo "hi" # add new NbBlock to nb.blocks = [⬛, 🟩]

      nbImage("hi.png") # add new NbBlock to nb.blocks = [⬛, ⬛, 🟩]

      myBlock: discard # add new NbBlock to nb.blocks = [⬛, ⬛, ⬛, 🟩]

      nbSave # renders each block in nb.blocks (+theme stuff +save file)

  slideAutoAnimate:
    nbText: "#### What is a block?"
    columns:
      column:
        nbText: "##### DATA"
      column:
        nbText: "##### RENDER"
  slideAutoAnimate:
    nbText: "#### What is a block?"
    columns:
      column:
        nbText: "##### DATA"
      column:
        nbText: "##### RENDER"
        nbText: "###### html backend\n###### md backend\n<small>other backends</small>"
  slideAutoAnimate:
    nbText: "#### What is a block?"
    nbCodeDontRun: nbCode: echo "hi"
    columns:
      column:
        nbText: "##### DATA"
        nbTextSmall: """
- code source: `echo "hi"`
- code output: `hi`
"""
      column:
        nbText: "##### RENDER"
        nbText: "###### html backend"
        nbTextSmall: """
* preprocess:
  - highlight code
* render:
  - wrap highlighted code source in
    `<pre><code class="nim">`
  - wrap code output in
    `<pre><samp>`
"""
  slideAutoAnimate:
    nbText: "#### What is a block?"
    nbCodeDontRun: nbCode: echo "hi"
    columns:
      column:
        nbText: "##### DATA"
        nbTextSmall: """
- code source: `echo "hi"`
- code output: `hi`
"""
      column:
        nbText: "##### RENDER"
        nbText: "###### md backend"
        nbTextSmall: """
- no preprocess
- render:
  - wrap code source in ```` ```nim ... ``` ````
  - wrap code output in ```` ``` ... ``` ````
"""
  slideAutoAnimate:
    nbText: "#### What is a block?"
    nbCodeDontRun: nbText: "hi"
    columns:
      column:
        nbText: "##### DATA"
        nbTextSmall: """
- text: `"hi"`
"""
      column:
        nbText: "##### RENDER"
        nbText: "###### html backend"
        nbTextSmall: """
- convert md to html
- render:
  - use directly converted html
"""
        nbText: "###### md backend"
        nbTextSmall: """
- no preprocess
- render:
  - use directly original md text
"""
  slideAutoAnimate:
    nbText: "#### What is a block?"
    nbCodeDontRun: nbImage("hi.png")
    columns:
      column:
        nbText: "##### DATA"
        nbTextSmall: """
- image url (or relative local path)
- (optional) caption
"""
      column:
        nbText: "##### RENDER"
        nbText: "###### html backend"
        nbTextSmall: """
- no preprocess
- render:
  - wrap using `<figure>`, `<img>`, `<figcaption>` elements
"""
        nbText: "###### md backend"
        nbTextSmall: """
- no preprocess
- render:
  - `![{{caption}}]({{url}})`
"""

  slide:
    nbText: "#### Yeah, but what is a `NbBlock`?"
    nbCodeDontRunAnimate([2..10, 11..18, 3..7, 4..4, 5..7, 8..10, 10..10, 12..13, 14..15, 16..18]):
      type
        ## DATA 👇
        NbBlock = ref object
          command*: string ## (NbCode, NbText, ...) used for render
          code*: string  ## nbCode source
          output*: string  ## nbCode output / nbText text
          context*: Context ## think of this as a JsonNode           
        NbDoc* = object
          blocks*: seq[NbBlock]
          blk*: NbBlock  ## current block being processed
        ## RENDER 👇
          partials*: Table[string,  string]
            ## key is command, value is a mustache template                              
          renderPlans*: Table[string, seq[string]]
            ## key is command, value is a seq of proc names
          renderProcs*: Table[string, NbRenderProc]
            ## key is proc name, value is implementation
        NbRenderProc* = proc (doc: var NbDoc, blk: var NbBlock) {.nimcall.}
    speakerNote("until 0.2 blocks were variant kind with 3 kinds: Code, Text, Image")
  slide:
    nbText: "#### Block render function"
    nbCodeDontRunAnimate([3..6, 7..8]):
      proc render*(nb: var NbDoc, blk: var NbBlock): string =
        # adapted from src/nimib/renders.nim
        if blk.command in nb.renderPlans: # "preprocess"
          for step in nb.renderPlans[blk.command]:
            if step in nb.renderProcs:
              nb.renderProcs[step](nb, blk)
        blk.context.searchTable(nb.partials) # apply templates
        result = nb.partials[blk.command].render(blk.context)

  slideAutoAnimate:
    nbText: "#### How do I create a block?"
    nbText: "##### DATA generation"
    nbCodeDontRun:
      template nbCode*(body: untyped) =
        newNbCodeBlock("nbCode", body): # create block and save source in .code
          captureStdout(nb.blk.output): # run, capture output and save in .output
            body
    nbText: "##### RENDER (HTML)"
    nbCodeDontRun:
      nb.renderPlans["nbCode"] = @["highlightCode"]
      nb.renderProcs["highlightCode"] =  highlightCode
      nb.partials["nbCode"] = """
{{>nbCodeSource}}
{{>nbCodeOutput}}"""
      nb.partials["nbCodeSource"] = "<pre><code class=\"nim hljs\">{{&codeHighlighted}}</code></pre>"
      nb.partials["nbCodeOutput"] = """{{#output}}<pre class="nb-output"><samp>{{output}}</samp></pre>{{/output}}"""
  slideAutoAnimate:
    nbText: "#### How do I create a block?"
    nbText: "##### DATA generation"
    nbCodeDontRun:
      template nbText*(text: string) =
        newNbSlimBlock("nbText"):
          nb.blk.output = text
    nbText: "##### RENDER (HTML)"
    nbCodeDontRun:
      nb.renderPlans["nbText"] = @["mdOutputToHtml"]
      nb.renderProcs["mdOutputToHtml"] =  mdOutputToHtml
      nb.partials["nbText"] = "{{&outputToHtml}}"
  slideAutoAnimate:
    nbText: "#### How do I create a block?"
    nbText: "##### DATA generation"
    nbCodeDontRun:
      template nbImage*(url: string, caption = "") =
        newNbSlimBlock("nbImage"):
          nb.blk.context["url"] = url # *special handling for relative paths
          nb.blk.context["caption"] = caption
    nbText: "##### RENDER (HTML)"
    nbCodeDontRun:
      nb.partials["nbImage"] = """<figure>
<img src="{{url}}" alt="{{caption}}">
<figcaption>{{caption}}</figcaption>
</figure>"""

  slide:
    nbText: "#### Other blocks"
    unorderedList:
      listItem: nbText: "`nbCodeInBlock`: a `nbCode` in a `block:`"
      listItem: nbText: "`nbTextWithCode`: a `nbText` that saves code source"
      listItem: nbText: "`nbFile`: writes a file with content (there is an untyped version for nim code)"
      listItem: nbText: "`nbRawHtml`: used to output raw html"

  slide:
    nbText: "#### How can **you** create blocks?"
    fragmentFadeIn:
      nbText: "##### natively"
      nbCode:
        template newNbCodeBlock*(cmd: string, body, blockImpl: untyped) = discard
        template newNbSlimBlock*(cmd: string, blockImpl: untyped) = discard
      fadeInText("<small>(a slim block is a block without body)</small>")
    fragmentFadeIn:
      nbText: "##### creatively"
      unorderedList:
        listItem: nbText: "copying and customizing (change partials, ...) existing blocks "
        listItem: nbText: "composing other blocks (in particular `nbRawHtml`)"

slide:
  slideText: hlMdF"## {title_howto}"
  slideIframeFromNblog("before_after_image_slider")
  slideIframeFromNblog("mermaid_diagram") # fix document using main instead of right (as in image slider)
  slideIframeFromNblog("show_plotly") # fix to show plotly's code

# RELEASE - Part 2 + Nimiboost - Hugo ------------------------------------------------------------------------------------------

# plant app
when defined(confTheme):
  nimConfSlide:
    nimConfSlide:
      nbText: hlMdF"## {title_plant}"
      fadeInText: "- example of a more complex nbKarax app"
      fadeInText: "- based on [a plot function](https://pietroppeter.github.io/nblog/drafts/plant_js.html) built with [planetis-m/jscanvas](https://github.com/planetis-m/jscanvas)"
      fadeInText: "- preliminary api for [karax widgets](https://pietroppeter.github.io/nblog/drafts/karax_widgets_demo.html)"
    slideIframeFromNblog("plant_app")
else:
  slide:
    slide:
      nbText: hlMdF"## {title_plant}"
      fadeInText: "- example of a more complex nbKarax app"
      fadeInText: "- based on [a plot function built with js canvas](https://pietroppeter.github.io/nblog/drafts/plant_js.html)"
      fadeInText: "- preliminary api for [karax widgets](https://pietroppeter.github.io/nblog/drafts/karax_widgets_demo.html)"
    slideIframeFromNblog("plant_app")


# CONCLUSIONS (Contributing + Roadmap + thanks) together ----------------------------------------------------------


nbSave