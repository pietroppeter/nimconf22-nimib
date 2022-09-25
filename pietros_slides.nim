import nimib
import nimib / [blocks]
import nimiSlides


nbInit(theme = revealTheme)
setSlidesTheme(Moon)

template slideText(text: string) =
  slide:
    nbText: text

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

slideText: hlMd"""### 👨‍👩‍👧 ME AND NIM
- Pietro Peterlongo, [Milan, Italy 🇮🇹](https://goo.gl/maps/ceG6UsLEGqmx5Kpa7)
- Python Data Scientist working on a [Supply Chain Planning Software](https://www.toolsgroup.com)
- talked previously about nimib at [NimConf2021](https://pietroppeter.github.io/nimconf2021/revealjs/index.html)
- helped organize [Nim Devroom at FOSDEM 2022](https://archive.fosdem.org/2022/schedule/track/nim_programming_language/)
- let's organize again the Nim Devroom and meet at [FOSDEM 2023](https://fosdem.org/2023/)!
"""

slide:
  nbText: "### Previously at NimConf 2021"
  nbRawHtml: """<iframe width="560" height="315" src="https://www.youtube.com/embed/sWA58Wtk6L8" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>"""

let
  title_block = "make your own `NbBlock`👷"
  title_js = "🤯 `nbJsFromCode`, `nbKaraxCode`"
  title_source = "🪞`CodeAsInSource`"
  title_python = "🐍`nbPython`"

slideText: hlMdF"""## Content of presentation
- A livecoding👨‍💻 intro to Nimib🐳
- ✨Release of Nimib 0.3 - BlockMaker🧱
  - {title_block}
  - {title_js}
- Nimiboost🚀 and Nimibook📚 0.3
- Nimib Gallery
- Contributing🤲 and Roadmap🗺️
"""

slide:
  nbText: "## A livecoding👨‍💻 intro to Nimib🐳"
  speakerNote: "here I need to add the video" 

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
- {title_python}
- {title_js}

more stuff and details in [0.3.0](https://github.com/pietroppeter/nimib/releases/tag/v0.3.0)
and [0.3.1](https://github.com/pietroppeter/nimib/releases/tag/v0.3.1) release notes
"""

slide:
  slideText: hlMdF"""### {title_source}
"""
  slide:
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
    fragmentFadeIn:
      nbText: "Still available with `-d:nimibCodeFromAst`"
    speakerNote: """
- It was very nice, since it was very easy to implement with a simple `macro toStr(body) = body.toStrLit`
- it inherited bugs from Nim, see:
  - https://github.com/pietroppeter/nimib/issues/20
  - https://github.com/nim-lang/Nim/issues/17292
"""
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
        nbCodeDontRunAnimate([1..2, 3..4, 5..5, 6..6, 8..9, 10..10]):
          import math, strformat
          let
            n = 1
          echo n + 1 # 2
          ## documentation comment
          struct(http):
            s: _ = "HTTP/"
            *header: {headers}
    fragmentFadeIn:
      nbText: "Does not compose well ([134](https://github.com/pietroppeter/nimib/issues/134)), there might still be 🐞s"
    speakerNote: """"""


slide:
  slideText: hlMdF"""### {title_block}
"""
  slide:
    nbCodeDontRun: # should higlight lines line by one
      import nimib

      nbInit # creates a nb: NbDoc object
      # it has attribute nb.blocks: seq[NbBlock]

      nbText: "hi" # new NbBlock added to nb.blocks

      nbCode: echo "hi" # new NbBlock added to nb.blocks

      nbImage("hi.png") # new NbBlock added to nb.blocks

      myCustomBlock: discard # new NbBlock added to nb.blocks

      nbSave # renders each block in nb.blocks (+theme stuff +save file)
  
  slide:
    nbText: "#### Nimib types" # essentials for rendering blocks
    nbCodeDontRun:
      type
        NbBlock = ref object
          command*: string
          code*: string
          output*: string
          context*: Context # think of this as a JsonNode           
        NbDoc* = object
          blocks*: seq[NbBlock]
          blk*: NbBlock  ## current block being processed
          # in these table NbBlock.command is the key
          partials*: Table[string, string]
          renderPlans*: Table[string, seq[string]]
          renderProcs*: Table[string, NbRenderProc]
          # ... and other fields
        NbRenderProc* = proc (doc: var NbDoc, blk: var NbBlock) {.nimcall.}
  slide:
    nbText: "#### Block render function"
    nbCodeDontRun:
      proc render*(nb: var NbDoc, blk: var NbBlock): string =
        # adapted from src/nimib/renders.nim
        if blk.command in nb.renderPlans:
          for step in nb.renderPlans[blk.command]:
            if step in nb.renderProcs:
              nb.renderProcs[step](nb, blk)
        blk.context.searchTable(nb.partials)
        result = nb.partials[blk.command].render(blk.context)

nbSave