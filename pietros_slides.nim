import nimib
import nimiSlides
import custom_blocks
import std / [strformat, strutils]


template slideLiveCoding* =
  mySlide:
    nbText: "## A livecoding👨‍💻 intro to Nimib🐳"
    speakerNote: "here I need to add the video" 

template slideBlockMaker* =
  mySlide:
    slideAutoAnimate:
      nbText: fmt"""
## ✨Nimib 0.3 - BlockMaker🧱
- {title_block}
- {title_js}
"""
    slideAutoAnimate:
      nbText: fmt"""
## ✨Nimib 0.3 - BlockMaker🧱
- {title_source}
- {title_block}
- {title_python}
- {title_js}
"""
    slideAutoAnimate:
      nbText: fmt"""
## ✨Nimib 0.3 - BlockMaker🧱
- {title_source}
- {title_block}
  - {title_howto}
- {title_python}
- {title_js}
  - {title_plant}
"""

    slideAutoAnimate:
      nbText: fmt"""
## ✨Nimib 0.3 - BlockMaker🧱
- {title_source}
- {title_block}
  - {title_howto}
- {title_python}
- {title_js}
  - {title_plant}

more stuff and details in [0.3.0](https://github.com/pietroppeter/nimib/releases/tag/v0.3.0)
and [0.3.1](https://github.com/pietroppeter/nimib/releases/tag/v0.3.1) release notes
"""

template slidesCodeAsInsource* =
  mySlide:
    mySlide:
      nbText: hlMdF"### {title_source}"
    slideCodeBefore
    slideCodeNow

template slideCodeBefore* =
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
          nbCleanupGensym
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
        nbCleanupGensym
    fragment(fadeLeft):
      nbText: "Uses `macro toStr(body) = body.toStrLit`"
    fragment(fadeRight):
      nbText: "Still available with `-d:nimibCodeFromAst`"

template slideCodeNow* =
  mySlide:
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

template slideWhatAreBlocks* =
  mySlide:
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

template slideWhatIsABlock* =
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

template slideNimibTypes* =
  mySlide:
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

template slideBlockRender* =
  mySlide:
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

template slideCreateBlockNative* =
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

template slideOtherBlocks* =
  mySlide:
    nbText: "#### Other blocks"
    unorderedList:
      listItem: nbText: "`nbCodeInBlock`: a `nbCode` in a `block:`"
      listItem: nbText: "`nbTextWithCode`: a `nbText` that saves code source"
      listItem: nbText: "`nbFile`: writes a file with content (there is an untyped version for nim code)"
      listItem: nbText: "`nbRawHtml`: used to output raw html"

template slideYouCreateBlocks* =
  slideAutoAnimate:
    nbText: "#### How can **you** create blocks?"
    fragmentFadeIn:
      nbText: "##### natively"
      nbCode:
        template newNbCodeBlock*(cmd: string, body, blockImpl: untyped) = discard
        template newNbSlimBlock*(cmd: string, blockImpl: untyped) = discard
      fadeInText("<small>(a slim block is a block without body)</small>")
    fragmentFadeIn:
      nbText: "##### creatively"
  slideAutoAnimate:
    nbText: "#### How can **you** create blocks?"
    nbText: "##### creatively"
    nbText: "Copying and customizing blocks"
    fragmentFadeIn:
      nimibCode:
        template nbCodeHtmlOutput(body: untyped) =
          nbCode:
            body
          nb.blk.command = "nbCodeHtmlOutput"
        nb.partials["nbCodeHtmlOutput"] =
          nb.partials["nbCode"].replace("{{>nbCodeOutput}}", "{{&output}}")

        nbCodeHtmlOutput:
          for color in ["blue", "green", "yellow"]:
            echo "<span style=\"color:" & color & "\">" & color & "</span>"
  slideAutoAnimate:
    nbText: "#### How can **you** create blocks?"
    nbText: "##### creatively"
    nbText: "Composing other blocks"
    fragmentFadeIn:
      nimibCode:
        template nbTextRepeat(text: string, repeat: int) =
          for i in 1 .. repeat:
            nbText: text
        
        nbTextRepeat("All work and no play makes Jack a dull boy", 3)
  slideAutoAnimate:
    nbText: "#### How can **you** create blocks?"
    nbText: "##### creatively"
    nbText: "Composing other blocks"
    nbText: "`nbRawHtml` is particularly powerful"
    fragmentFadeIn:
      nimibCode:
        template nbDetails(summary: string, body: untyped) =
          nbRawHtml: "<details><summary>" & summary & "</summary>"
          body
          nbRawHtml: "</details>"

        nbDetails("click to reveal details"):
          nbText: "some text"
          nbCode:
            echo "and code".replace("code", "output")
  slideAutoAnimate:
    nbText: "#### How can **you** create blocks?"
    nbText: "##### creatively"
    nbText: "Composing other blocks"
    nbText: "`nbRawHtml` is particularly powerful"
    nbText: "(nimislides uses it for `slide` template)"
    fadeInText: "##### but"
    fadeInText: "limited to html backend"
    fadeInText: "cannot be customized"
    fadeInText: ("a better solution will come with the " & nimibIssue(117)).replace("[#117]", "[container block!]")

template slideExplainMustache* =
  discard

template slidesFancyBlocks* =
  mySlide:
    mySlide:
      nbText: fmt"## {title_howto}"
      fadeInText: "blocks with interactivity given by external js functionalities"
    slideExplainAddJsAndStyle
    slideIframeFromNblog("before_after_image_slider")
    slideIframeFromNblog("mermaid_diagram") # fix document using main instead of right (as in image slider)
    slideIframeFromNblog("show_plotly") # fix to show plotly's code

template slideExplainAddJsAndStyle* =
  mySlide:
    nbText: "#### How to add a line at the end of `<head>` section"
    fragmentFadeIn:
      nbCodeDontRun:
        nb.partials["head"] &= "<style>..."
    fadeInText: "#### How to add a line at the end of `<body>` section"
    fragmentFadeIn:
      nbCodeDontRun:
        nb.partials["main"] &= "<script>..."

template slidesPlantApp* =
  # plant app
  mySlide:
    mySlide:
      nbText: hlMdF"## {title_plant}"
      unorderedList:
        listItem: nbText: "example of a more complex nbKarax app"
        listItem: nbText: "based on [a plot function built with js canvas](https://pietroppeter.github.io/nblog/drafts/plant_js.html)"
        listItem: nbText: "preliminary api for [karax widgets](https://pietroppeter.github.io/nblog/drafts/karax_widgets_demo.html)"
    slideIframeFromNblog("plant_app")

template slidesBlocks* =
  mySlide:
    slideText: hlMdF"### {title_block}"
    when false:
      slideWhatAreBlocks
      slideWhatIsABlock
      slideNimibTypes
      slideExplainMustache
      slideBlockRender
      slideCreateBlockNative
      slideOtherBlocks
    slideYouCreateBlocks

when isMainModule:
  myInit("pietros_slides.nim")
  when false:
    slideLiveCoding
    slideBlockMaker
    slidesCodeAsInsource
  slidesBlocks
  slidesFancyBlocks
  slidesPlantApp
  nbSave