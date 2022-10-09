import nimib, nimiSlides
from custom_blocks import
  myInit, mySlide, slideText, title_contribute, title_roadmap, textSwitcher, slideAutoAnimate, addNbTextSmall, nbTextSmall

template contributeSlides* =
  mySlide:
    slideText: hlMdF"## {title_contribute}"
    slideAutoAnimate:
      nbText: " ### 👩‍💻Improved Dev Experience"
      unorderedList:
        listItem: nbText: "docs are now built in CI"
        listItem: nbText: "deploy preview!"
        listItem: nbText: "we added tests (and removed ptest)"
        listItem: nbText: "updated docs and added a separate changelog"
        listItem: nbText: "a new [CONTRIBUTE.md]()!"
        listItem: nbText: "some issues marked as good-first-issue"
    slideAutoAnimate:
      nbText: " ### 👩‍💻Improved Dev Experience"
      nbText: " #### Deploy preview"
      nbImage("deploy_preview.png")
    mySlide:
      nbText: " ### 🎪Nimib Speaking Hours!"
      unorderedList:
        listItem: nbText: "me and Hugo have been meeting regularly"
        listItem: nbText: "thinking of keeping this up (once a month)"
        listItem: nbText: "open to anyone using nimib or contributing"
        listItem: nbText: "will announce somewhere (nimib discussions?)"
      fragmentfadeIn: nbTextSmall "(inspired by [Simon Willson](https://simonwillison.net/2021/Feb/19/office-hours/))"
  # @hugo: an idea I had in mind, first time I am proposing it...
  # see https://simonwillison.net/2021/Feb/19/office-hours/
  # I remember some tweet that mentioned a better name for office hours
  # ah "speaking hours"! yes, better. see https://twitter.com/simonw/status/1578410543014035457?s=20&t=y6ONp5McTq38bmwRAO2jPw

template roadmapSlides* =
  mySlide:
    slideText: hlMdF"## {title_roadmap}"
    slideText: """
  ### priorities
  - first goal: produce stuff with nimib 0.3.x!
    - more scinim/getting-started tutorials!
    - advent of code!
  - next 0.4 target: backend maker
  - side projects:
    - (Pietro) a blog theme / jekyll clone
  """
    slideText: """
  ### 0.3.x
  - more blocks (nbAudio, nbVideo, nbPlotly, nbShell, ...)
  - container block
  - `NbBlock.data: JsonNode`
  - improve default theme
    - better code output
    - anchors for headers
  - table of contents
  - html outputs from code blocks (nbShow?):
    - html table for a dataframe
  - shared data between documents
    - site index
  """
  #[
    slideText: """
  ### side projects
  - feedo
  - nog
  - nex
  - github powered CMS
  - nimetta / the algorithms
  - ...
  """
  ]#
    slideText: """
  ### further down the road
  - (after 0.4) new backends
    - latex
    - twitter?
  - serving a (real) backend that interacts with the page ([streamlit] style? [jester]? [htmx]?)
  - can I use nimib to build a library directly from documentation (like in [nbdev])?
  - nimib executable for scaffolding and to support different publishing workflows
  - possibility of editing document in the browser (similar to jupyter UI, not necessarily taking advantage of hot code reloading)
  - ...

  [streamlit]: https://streamlit.io/
  [jester]: https://streamlit.io/
  [htmx]: https://streamlit.io/
  [nbdev]: https://streamlit.io/
  """

template thankyouSlide* =
  mySlide:
    nbText: "Thank you for listening!"
    let thankyous = @["Thanks", "Danke", "Tack", "Grazie", "Takk"]
    textSwitcher(thankyous)


when isMainModule:
  myInit()
  #contributeSlides()
  roadmapSlides()
  #thankyouSlide()
  nbSave